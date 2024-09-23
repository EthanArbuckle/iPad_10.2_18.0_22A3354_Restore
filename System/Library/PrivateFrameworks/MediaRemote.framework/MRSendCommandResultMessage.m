@implementation MRSendCommandResultMessage

- (MRSendCommandResultMessage)initWithCommandID:(id)a3 commandResult:(id)a4
{
  id v6;
  id v7;
  MRSendCommandResultMessage *v8;
  _MRSendCommandResultMessageProtobuf *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MRSendCommandResultMessage;
  v8 = -[MRProtocolMessage init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_MRSendCommandResultMessageProtobuf);
    -[_MRSendCommandResultMessageProtobuf setCommandID:](v9, "setCommandID:", v6);
    -[_MRSendCommandResultMessageProtobuf setSendError:](v9, "setSendError:", -[MRCommandResult sendError](v8->_commandResult, "sendError"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "handlerReturnStatuses", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatus:](v9, "addHandlerReturnStatus:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "unsignedIntValue"));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v7, "protobuf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSendCommandResultMessageProtobuf setCommandResult:](v9, "setCommandResult:", v15);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);
  }

  return v8;
}

- (unint64_t)type
{
  return 2;
}

- (unsigned)sendError
{
  void *v2;
  unsigned int v3;

  -[MRSendCommandResultMessage commandResult](self, "commandResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sendError");

  return v3;
}

- (MRCommandResult)commandResult
{
  MRSendCommandResultMessage *v2;
  void *v3;
  int v4;
  MRCommandResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MRCommandResult *v17;
  MRCommandResult *commandResult;
  MRCommandResult *v19;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_commandResult)
  {
    -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasCommandResult");

    if (v4)
    {
      v5 = [MRCommandResult alloc];
      -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "commandResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MRCommandResult initWithProtobuf:](v5, "initWithProtobuf:", v7);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "handlerReturnStatusCount"));

      for (i = 0; ; ++i)
      {
        -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "handlerReturnStatusCount");

        if (v13 <= i)
          break;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "handlerReturnStatusAtIndex:", i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

      }
      v17 = [MRCommandResult alloc];
      -[MRProtocolMessage underlyingCodableMessage](v2, "underlyingCodableMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MRCommandResult initWithHandlerStatuses:sendError:](v17, "initWithHandlerStatuses:sendError:", v6, objc_msgSend(v7, "sendError"));
    }
    commandResult = v2->_commandResult;
    v2->_commandResult = (MRCommandResult *)v8;

  }
  v19 = v2->_commandResult;
  objc_sync_exit(v2);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandResult, 0);
}

@end
