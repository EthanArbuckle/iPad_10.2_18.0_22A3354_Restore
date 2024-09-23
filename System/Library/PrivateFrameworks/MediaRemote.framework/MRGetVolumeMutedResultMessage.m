@implementation MRGetVolumeMutedResultMessage

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (unint64_t)type
{
  return 127;
}

- (MRGetVolumeMutedResultMessage)initWithMuted:(BOOL)a3
{
  _BOOL8 v3;
  MRGetVolumeMutedResultMessage *v4;
  _MRGetVolumeMutedResultMessageProtobuf *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRGetVolumeMutedResultMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeMutedResultMessageProtobuf);
    -[_MRGetVolumeMutedResultMessageProtobuf setIsMuted:](v5, "setIsMuted:", v3);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

@end
