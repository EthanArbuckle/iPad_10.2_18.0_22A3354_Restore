@implementation MRSetRecordingStateMessage

- (MRSetRecordingStateMessage)initWithRecordingState:(unsigned int)a3
{
  MRSetRecordingStateMessage *v4;
  _MRSetRecordingStateMessageProtobuf *v5;
  _MRSetRecordingStateMessageProtobuf *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRSetRecordingStateMessage;
  v4 = -[MRProtocolMessage init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRSetRecordingStateMessageProtobuf);
    v6 = v5;
    if (a3 == 1)
      v7 = 1;
    else
      v7 = 2;
    -[_MRSetRecordingStateMessageProtobuf setState:](v5, "setState:", v7);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v6);

  }
  return v4;
}

- (unint64_t)type
{
  return 30;
}

- (unsigned)state
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "state") == 1)
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

@end
