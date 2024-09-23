@implementation PHASEExternalInputStreamDefinition

- (PHASEExternalInputStreamDefinition)init
{
  -[PHASEExternalInputStreamDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEExternalInputStreamDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5
{
  return -[PHASEExternalInputStreamDefinition initWithStreamType:format:maximumFrames:audioSessionToken:](self, "initWithStreamType:format:maximumFrames:audioSessionToken:", a3, a4, *(_QWORD *)&a5, 0);
}

- (PHASEExternalInputStreamDefinition)initWithStreamType:(int64_t)a3 format:(id)a4 maximumFrames:(unsigned int)a5 audioSessionToken:(unsigned int)a6
{
  id v11;
  PHASEExternalInputStreamDefinition *v12;
  PHASEExternalInputStreamDefinition *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PHASEExternalInputStreamDefinition;
  v12 = -[PHASEExternalInputStreamDefinition init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_streamType = a3;
    objc_storeStrong((id *)&v12->_format, a4);
    v13->_maximumFrames = a5;
    v13->_audioSessionToken = a6;
    if (!a6)
      v13->_audioSessionToken = sDefaultAudioSessionToken();
  }

  return v13;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void)setMaximumFrames:(unsigned int)a3
{
  self->_maximumFrames = a3;
}

- (id)description
{
  void *v3;
  uint64_t audioSessionToken;
  int64_t streamType;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  audioSessionToken = self->_audioSessionToken;
  streamType = self->_streamType;
  -[AVAudioFormat description](self->_format, "description");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ExternalInputStreamDefinition@%p, type %d, audioSession 0x%x, format %s, max frames %d>"), self, streamType, audioSessionToken, objc_msgSend(v6, "UTF8String"), self->_maximumFrames);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (unsigned)maximumFrames
{
  return self->_maximumFrames;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

@end
