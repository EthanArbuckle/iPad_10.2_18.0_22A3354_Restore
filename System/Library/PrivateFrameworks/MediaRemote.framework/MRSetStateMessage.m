@implementation MRSetStateMessage

- (MRSetStateMessage)initWithNowPlayingState:(id)a3 encoding:(int64_t)a4
{
  id v6;
  MRSetStateMessage *v7;
  uint64_t v8;
  MRNowPlayingState *state;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = -[MRProtocolMessage init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    state = v7->_state;
    v7->_state = (MRNowPlayingState *)v8;

    objc_msgSend(v6, "playerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "skeleton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingState setPlayerPath:](v7->_state, "setPlayerPath:", v11);

    -[MRNowPlayingState protobufWithEncoding:](v7->_state, "protobufWithEncoding:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v12);

  }
  return v7;
}

- (MRSetStateMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRSetStateMessage *v7;
  MRNowPlayingState *v8;
  MRNowPlayingState *state;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRSetStateMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v11, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    v8 = -[MRNowPlayingState initWithProtobuf:]([MRNowPlayingState alloc], "initWithProtobuf:", v6);
    state = v7->_state;
    v7->_state = v8;

  }
  return v7;
}

- (MRNowPlayingState)state
{
  return self->_state;
}

- (unint64_t)type
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
