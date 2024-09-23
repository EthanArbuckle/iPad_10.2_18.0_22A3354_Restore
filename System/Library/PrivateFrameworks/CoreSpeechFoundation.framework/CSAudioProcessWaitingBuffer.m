@implementation CSAudioProcessWaitingBuffer

- (CSAudioProcessWaitingBuffer)initWithUUID:(id)a3 waitingBufferMaxLengthInSec:(float)a4
{
  id v7;
  CSAudioProcessWaitingBuffer *v8;
  uint64_t v9;
  NSMutableArray *buffer;
  float v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioProcessWaitingBuffer;
  v8 = -[CSAudioProcessWaitingBuffer init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    buffer = v8->_buffer;
    v8->_buffer = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_uuid, a3);
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    v8->_maxWaitingBufferSizeInSampleCount = (unint64_t)(float)(v11 * a4);
    v8->_bufferedSampleCount = 0;
    v12 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSAudioProcessWaitingBuffer initWithUUID:waitingBufferMaxLengthInSec:]";
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s uuid = %{public}@", buf, 0x16u);
    }
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAudioProcessWaitingBuffer dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioProcessWaitingBuffer deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioProcessWaitingBuffer;
  -[CSAudioProcessWaitingBuffer dealloc](&v4, sel_dealloc);
}

- (void)addAudioChunk:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithUnsignedLongLong:", 0);
  -[CSAudioProcessWaitingBuffer addAudioChunk:withBufferedTimestamp:](self, "addAudioChunk:withBufferedTimestamp:", v5, v6);

}

- (void)addAudioChunk:(id)a3 withBufferedTimestamp:(id)a4
{
  id v6;
  unint64_t bufferedSampleCount;
  NSMutableArray *buffer;
  CSAudioChunkWithBufferedTimestamp *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    bufferedSampleCount = self->_bufferedSampleCount;
    if (objc_msgSend(v10, "numSamples") + bufferedSampleCount <= self->_maxWaitingBufferSizeInSampleCount)
    {
      buffer = self->_buffer;
      v9 = -[CSAudioChunkWithBufferedTimestamp initWithAudioChunk:bufferedTimestamp:]([CSAudioChunkWithBufferedTimestamp alloc], "initWithAudioChunk:bufferedTimestamp:", v10, v6);
      -[NSMutableArray addObject:](buffer, "addObject:", v9);

      self->_bufferedSampleCount += objc_msgSend(v10, "numSamples");
    }
  }

}

- (id)fetchAudioChunksFromBuffer
{
  return self->_buffer;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (unint64_t)maxWaitingBufferSizeInSampleCount
{
  return self->_maxWaitingBufferSizeInSampleCount;
}

- (void)setMaxWaitingBufferSizeInSampleCount:(unint64_t)a3
{
  self->_maxWaitingBufferSizeInSampleCount = a3;
}

- (unint64_t)bufferedSampleCount
{
  return self->_bufferedSampleCount;
}

- (void)setBufferedSampleCount:(unint64_t)a3
{
  self->_bufferedSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
