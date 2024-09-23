@implementation MRSetConnectionStateMessage

- (MRSetConnectionStateMessage)initWithConnectionState:(unsigned int)a3
{
  uint64_t v3;
  MRSetConnectionStateMessage *v4;
  _MRSetConnectionStateMessageProtobuf *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)MRSetConnectionStateMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRSetConnectionStateMessageProtobuf);
    -[_MRSetConnectionStateMessageProtobuf setState:](v5, "setState:", MRProtobufFromConnectionState(v3));
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (unsigned)state
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRConnectionStateFromProtobuf(objc_msgSend(v2, "state"));

  return v3;
}

- (unint64_t)type
{
  return 38;
}

- (unint64_t)encryptionType
{
  return 2;
}

@end
