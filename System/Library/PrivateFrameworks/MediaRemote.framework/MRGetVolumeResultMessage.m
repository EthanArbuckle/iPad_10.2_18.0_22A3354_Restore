@implementation MRGetVolumeResultMessage

- (MRGetVolumeResultMessage)initWithVolume:(float)a3
{
  MRGetVolumeResultMessage *v4;
  _MRGetVolumeResultMessageProtobuf *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeResultMessage;
  v4 = -[MRProtocolMessage init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeResultMessageProtobuf);
    *(float *)&v6 = a3;
    -[_MRGetVolumeResultMessageProtobuf setVolume:](v5, "setVolume:", v6);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (unint64_t)type
{
  return 50;
}

@end
