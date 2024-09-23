@implementation MRSendVoiceInputMessage

- (MRSendVoiceInputMessage)initWithBuffer:(id)a3 time:(id)a4 gain:(float)a5
{
  double var1;
  double var0;
  id v9;
  MRSendVoiceInputMessage *v10;
  MRMutableAudioDataBlock *v11;
  double v12;
  MRAudioDataBlock *dataBlock;
  MRMutableAudioDataBlock *v14;
  _MRSendVoiceInputMessageProtobuf *v15;
  void *v16;
  objc_super v18;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRSendVoiceInputMessage;
  v10 = -[MRProtocolMessage init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(MRMutableAudioDataBlock);
    -[MRMutableAudioDataBlock setBuffer:](v11, "setBuffer:", v9);
    -[MRMutableAudioDataBlock setTime:](v11, "setTime:", var0, var1);
    *(float *)&v12 = a5;
    -[MRMutableAudioDataBlock setGain:](v11, "setGain:", v12);
    dataBlock = v10->_dataBlock;
    v10->_dataBlock = &v11->super;
    v14 = v11;

    v15 = objc_alloc_init(_MRSendVoiceInputMessageProtobuf);
    -[MRAudioDataBlock protobuf](v10->_dataBlock, "protobuf");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MRSendVoiceInputMessageProtobuf setDataBlock:](v15, "setDataBlock:", v16);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v15);

  }
  return v10;
}

- (unint64_t)type
{
  return 31;
}

- (MRAudioBuffer)buffer
{
  -[MRSendVoiceInputMessage _initializeDataIfNecessary](self, "_initializeDataIfNecessary");
  return -[MRAudioDataBlock buffer](self->_dataBlock, "buffer");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)time
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[MRSendVoiceInputMessage _initializeDataIfNecessary](self, "_initializeDataIfNecessary");
  -[MRAudioDataBlock time](self->_dataBlock, "time");
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (float)gain
{
  float result;

  -[MRSendVoiceInputMessage _initializeDataIfNecessary](self, "_initializeDataIfNecessary");
  -[MRAudioDataBlock gain](self->_dataBlock, "gain");
  return result;
}

- (void)_initializeDataIfNecessary
{
  MRAudioDataBlock *v3;
  void *v4;
  MRAudioDataBlock *v5;
  MRAudioDataBlock *dataBlock;
  id v7;

  if (!self->_dataBlock)
  {
    v3 = [MRAudioDataBlock alloc];
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRAudioDataBlock initWithProtobuf:](v3, "initWithProtobuf:", v4);
    dataBlock = self->_dataBlock;
    self->_dataBlock = v5;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBlock, 0);
}

@end
