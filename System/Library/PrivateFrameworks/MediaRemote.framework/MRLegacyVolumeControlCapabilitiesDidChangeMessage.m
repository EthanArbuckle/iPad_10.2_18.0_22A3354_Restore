@implementation MRLegacyVolumeControlCapabilitiesDidChangeMessage

- (MRLegacyVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3
{
  uint64_t v3;
  MRLegacyVolumeControlCapabilitiesDidChangeMessage *v4;
  void *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)MRLegacyVolumeControlCapabilitiesDidChangeMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    MRCapabilitiesToProtobuf(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (unsigned)capabilities
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRCapabilitiesFromProtobuf(v2);

  return v3;
}

- (unint64_t)type
{
  return 17;
}

@end
