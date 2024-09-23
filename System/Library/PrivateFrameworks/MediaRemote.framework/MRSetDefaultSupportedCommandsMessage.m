@implementation MRSetDefaultSupportedCommandsMessage

- (MRSetDefaultSupportedCommandsMessage)initWithDefaultSupportedCommands:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5
{
  id v8;
  id v9;
  MRSetDefaultSupportedCommandsMessage *v10;
  MRNowPlayingState *v11;
  MRNowPlayingState *state;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MRSetDefaultSupportedCommandsMessage;
  v10 = -[MRProtocolMessage init](&v17, sel_init);
  if (v10)
  {
    v11 = -[MRNowPlayingState initWithPlayerPath:]([MRNowPlayingState alloc], "initWithPlayerPath:", v9);
    state = v10->_state;
    v10->_state = v11;

    -[MRNowPlayingState setSupportedCommands:](v10->_state, "setSupportedCommands:", v8);
    objc_msgSend(v9, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingState setDisplayID:](v10->_state, "setDisplayID:", v14);

    -[MRNowPlayingState protobufWithEncoding:](v10->_state, "protobufWithEncoding:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v15);

  }
  return v10;
}

- (MRSetDefaultSupportedCommandsMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRSetDefaultSupportedCommandsMessage *v7;
  MRNowPlayingState *v8;
  MRNowPlayingState *state;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRSetDefaultSupportedCommandsMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v11, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    v8 = -[MRNowPlayingState initWithProtobuf:]([MRNowPlayingState alloc], "initWithProtobuf:", v6);
    state = v7->_state;
    v7->_state = v8;

  }
  return v7;
}

- (NSArray)supportedCommands
{
  return -[MRNowPlayingState supportedCommands](self->_state, "supportedCommands");
}

- (NSString)bundleID
{
  return -[MRNowPlayingState displayID](self->_state, "displayID");
}

- (unint64_t)type
{
  return 72;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
