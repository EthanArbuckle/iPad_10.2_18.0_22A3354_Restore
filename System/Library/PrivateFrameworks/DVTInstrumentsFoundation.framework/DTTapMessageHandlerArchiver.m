@implementation DTTapMessageHandlerArchiver

- (DTTapMessageHandlerArchiver)initWithConfig:(id)a3 archiveURL:(id)a4
{
  id v6;
  id v7;
  DTTapMessageHandlerArchiver *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  DTXConnection *v14;
  DTXConnection *v15;
  DTXConnection *helperConnection;
  _QWORD v18[4];
  id v19;
  id location;
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DTTapMessageHandlerArchiver;
  v8 = -[DTTapMessageHandler initWithConfig:](&v22, sel_initWithConfig_, v6);
  if (v8)
  {
    if (!v7)
      sub_222BC7620();
    v9 = objc_alloc(MEMORY[0x24BE2A950]);
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = (void *)objc_msgSend(v9, "initWithIncomingFilePath:outgoingFilePath:error:", 0, v10, &v21);
    v12 = v21;

    if (v11
      && !v12
      && (v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE2A948]), "initWithTransport:", v11),
          v14 = v8->_helperConnection,
          v8->_helperConnection = (DTXConnection *)v13,
          v14,
          (v15 = v8->_helperConnection) != 0))
    {
      -[DTXConnection setDispatchTarget:](v15, "setDispatchTarget:", v8);
      -[DTXConnection setCompressionHint:forChannel:](v8->_helperConnection, "setCompressionHint:forChannel:", 4, 0);
      objc_initWeak(&location, v8);
      helperConnection = v8->_helperConnection;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = sub_222B8EA08;
      v18[3] = &unk_24EB2A258;
      objc_copyWeak(&v19, &location);
      -[DTXConnection setMessageHandler:](helperConnection, "setMessageHandler:", v18);
      -[DTXConnection setMaximumEnqueueSize:](v8->_helperConnection, "setMaximumEnqueueSize:", 0x800000);
      -[DTXConnection resume](v8->_helperConnection, "resume");
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      v12 = v11;
    }
    else
    {

      v8 = 0;
    }

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[DTXConnection sendMessageSync:replyHandler:](self->_helperConnection, "sendMessageSync:replyHandler:", *MEMORY[0x24BE2A980], &unk_24EB279F0);
  v3.receiver = self;
  v3.super_class = (Class)DTTapMessageHandlerArchiver;
  -[DTTapMessageHandlerArchiver dealloc](&v3, sel_dealloc);
}

- (id)messageReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[DTTapMessageHandler config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectWithAllowedClasses:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DTTapMessageHandler config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "statusHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "status");
      v12 = objc_msgSend(v8, "timestamp");
      objc_msgSend(v8, "notice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, uint64_t, void *, void *))v10)[2](v10, v11, v12, v13, v14);

    }
  }
  if (!objc_msgSend(v4, "errorStatus"))
    -[DTXConnection sendMessage:replyHandler:](self->_helperConnection, "sendMessage:replyHandler:", v4, 0);

  return 0;
}

- (void)_helperConnectionError
{
  DTXConnection *helperConnection;

  -[DTXConnection cancel](self->_helperConnection, "cancel");
  helperConnection = self->_helperConnection;
  self->_helperConnection = 0;

  NSLog(CFSTR("An unexpected error occurred with the message handler archiving connection helper."));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperConnection, 0);
}

@end
