@implementation PHASEExternalOutputStreamDefinition

- (PHASEExternalOutputStreamDefinition)init
{
  -[PHASEExternalOutputStreamDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEExternalOutputStreamDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5
{
  return -[PHASEExternalOutputStreamDefinition initWithStreamType:format:maximumFramesToRender:audioSessionToken:](self, "initWithStreamType:format:maximumFramesToRender:audioSessionToken:", a3, a4, *(_QWORD *)&a5, 0);
}

- (PHASEExternalOutputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFramesToRender:(unsigned int)a5 audioSessionToken:(unsigned int)a6
{
  id v11;
  PHASEExternalOutputStreamDefinition *v12;
  PHASEExternalOutputStreamDefinition *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHASEExternalOutputStreamDefinition;
  v12 = -[PHASEExternalOutputStreamDefinition init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_streamType = a3;
    objc_storeStrong((id *)&v12->_format, a4);
    v13->_maximumFramesToRender = a5;
    v13->_audioSessionToken = a6;
    if (!a6)
      v13->_audioSessionToken = sDefaultAudioSessionToken();
  }

  return v13;
}

- (PHASEExternalOutputStreamDefinition)initWithStreamCollection:(id)a3 index:(unint64_t)a4 format:(id)a5 maximumFramesToRender:(unsigned int)a6 audioSessionToken:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v13;
  id v14;
  Phase::Logger *v15;
  PHASEExternalOutputStreamDefinition *v16;
  PHASEExternalOutputStreamDefinition *v17;
  PHASEExternalOutputStreamDefinition *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v29 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = (Phase::Logger *)objc_msgSend(v13, "streamCount");
  if ((unint64_t)v15 <= a4)
  {
    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "PHASEExternalStream.mm";
      v23 = 1024;
      v24 = 302;
      v25 = 2048;
      v26 = a4;
      v27 = 2048;
      v28 = objc_msgSend(v13, "streamCount");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream index %lu for stream count %lu", (uint8_t *)&v21, 0x26u);
    }

    v18 = 0;
  }
  else
  {
    v16 = -[PHASEExternalOutputStreamDefinition initWithStreamType:format:maximumFramesToRender:audioSessionToken:](self, "initWithStreamType:format:maximumFramesToRender:audioSessionToken:", objc_msgSend(v13, "streamType"), v14, v8, v7);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_streamCollection, a3);
      v17->_streamIndex = a4;
    }
    self = v17;
    v18 = self;
  }

  return v18;
}

- (id)description
{
  void *v2;
  void *v4;
  uint64_t streamType_low;
  PHASEExternalStreamCollection *streamCollection;
  __CFString *v7;
  unint64_t streamIndex;
  uint64_t audioSessionToken;
  id v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  streamType_low = LODWORD(self->_streamType);
  streamCollection = self->_streamCollection;
  if (streamCollection)
  {
    -[PHASEExternalStreamCollection uuid](self->_streamCollection, "uuid");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUIDString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("-");
  }
  streamIndex = self->_streamIndex;
  audioSessionToken = self->_audioSessionToken;
  -[AVAudioFormat description](self->_format, "description");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<ExternalOutputStreamDefinition@%p, type %d, collection [%@, %lu], audioSession 0x%x, format %s, max frames %d>"), self, streamType_low, v7, streamIndex, audioSessionToken, objc_msgSend(v10, "UTF8String"), self->_maximumFramesToRender);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (streamCollection)
  {

  }
  return v11;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void)setMaximumFramesToRender:(unsigned int)a3
{
  self->_maximumFramesToRender = a3;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (unsigned)maximumFramesToRender
{
  return self->_maximumFramesToRender;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (PHASEExternalStreamCollection)streamCollection
{
  return self->_streamCollection;
}

- (unint64_t)streamIndex
{
  return self->_streamIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamCollection, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
