@implementation MRSendCommandMessage

- (MRSendCommandMessage)initWithCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5
{
  uint64_t v7;
  id v9;
  id v10;
  MRSendCommandMessage *v11;
  MRSendCommandMessage *v12;
  _MRSendCommandMessageProtobuf *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRSendCommandMessage;
  v11 = -[MRProtocolMessage init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_options, a4);
    v13 = objc_alloc_init(_MRSendCommandMessageProtobuf);
    -[_MRSendCommandMessageProtobuf setCommand:](v13, "setCommand:", MRMediaRemoteCommandToProtobuf(v7));
    MRMediaRemoteCommandOptionsToProtobuf(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSendCommandMessageProtobuf setOptions:](v13, "setOptions:", v14);

    objc_msgSend(v10, "protobuf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSendCommandMessageProtobuf setPlayerPath:](v13, "setPlayerPath:", v15);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v12, "setUnderlyingCodableMessage:", v13);
  }

  return v12;
}

- (unint64_t)type
{
  return 1;
}

- (unsigned)command
{
  void *v2;
  unsigned int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MRMediaRemoteCommandFromProtobuf(objc_msgSend(v2, "command"));

  return v3;
}

- (NSDictionary)options
{
  NSDictionary *options;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;

  options = self->_options;
  if (!options)
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteCommandOptionsFromProtobuf(v5);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_options;
    self->_options = v6;

    options = self->_options;
  }
  return options;
}

- (MRPlayerPath)playerPath
{
  MRPlayerPath *v3;
  void *v4;
  void *v5;
  MRPlayerPath *v6;

  v3 = [MRPlayerPath alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unsigned)appOptions
{
  void *v2;
  unsigned int v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("kMRMediaRemoteOptionSendOptionsNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (NSDate)serializationDate
{
  return self->_serializationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationDate, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
