@implementation MRGetVolumeControlCapabilitiesResultMessage

- (MRGetVolumeControlCapabilitiesResultMessage)initWithCapabilities:(unsigned int)a3
{
  uint64_t v3;
  MRGetVolumeControlCapabilitiesResultMessage *v4;
  _MRGetVolumeControlCapabilitiesResultMessageProtobuf *v5;
  void *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeControlCapabilitiesResultMessage;
  v4 = -[MRProtocolMessage init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeControlCapabilitiesResultMessageProtobuf);
    MRCapabilitiesToProtobuf(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf setCapabilities:](v5, "setCapabilities:", v6);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);
  }
  return v4;
}

- (unsigned)capabilities
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MRCapabilitiesFromProtobuf(v3);

  return v4;
}

- (unint64_t)type
{
  return 63;
}

@end
