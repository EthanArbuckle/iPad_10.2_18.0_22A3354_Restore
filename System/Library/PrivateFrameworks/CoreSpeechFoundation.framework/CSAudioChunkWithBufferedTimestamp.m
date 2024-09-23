@implementation CSAudioChunkWithBufferedTimestamp

- (CSAudioChunkWithBufferedTimestamp)initWithAudioChunk:(id)a3 bufferedTimestamp:(id)a4
{
  id v7;
  id v8;
  CSAudioChunkWithBufferedTimestamp *v9;
  CSAudioChunkWithBufferedTimestamp *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAudioChunkWithBufferedTimestamp;
  v9 = -[CSAudioChunkWithBufferedTimestamp init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_audioChunk, a3);
    objc_storeStrong((id *)&v10->_bufferedTimestamp, a4);
  }

  return v10;
}

- (CSAudioChunk)audioChunk
{
  return self->_audioChunk;
}

- (void)setAudioChunk:(id)a3
{
  objc_storeStrong((id *)&self->_audioChunk, a3);
}

- (NSNumber)bufferedTimestamp
{
  return self->_bufferedTimestamp;
}

- (void)setBufferedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_bufferedTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedTimestamp, 0);
  objc_storeStrong((id *)&self->_audioChunk, 0);
}

@end
