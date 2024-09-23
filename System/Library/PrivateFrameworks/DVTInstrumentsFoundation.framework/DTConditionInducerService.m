@implementation DTConditionInducerService

- (DTConditionInducerService)initWithChannel:(id)a3
{
  id v4;
  DTConditionInducerService *v5;
  uint64_t v6;
  NSXPCConnection *connectionToService;
  void *v8;
  void *v9;
  _QWORD v11[4];
  DTConditionInducerService *v12;
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTConditionInducerService;
  v5 = -[DTXService initWithChannel:](&v15, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.dt.DTConditionInducerSupportService"));
    connectionToService = v5->_connectionToService;
    v5->_connectionToService = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2557860A8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connectionToService, "setRemoteObjectInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25577AB20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connectionToService, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](v5->_connectionToService, "setExportedObject:", v5);
    -[NSXPCConnection resume](v5->_connectionToService, "resume");
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_222B5F034;
    v11[3] = &unk_24EB29D08;
    v12 = v5;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "registerDisconnectHandler:", v11);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[DTConditionInducerService _disconnectServiceConnection](self, "_disconnectServiceConnection");
  v3.receiver = self;
  v3.super_class = (Class)DTConditionInducerService;
  -[DTConditionInducerService dealloc](&v3, sel_dealloc);
}

- (void)_disconnectServiceConnection
{
  NSXPCConnection *connectionToService;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  connectionToService = self->_connectionToService;
  self->_connectionToService = 0;

}

+ (void)registerCapabilities:(id)a3
{
  id v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Registering service %@", v6, 0xCu);

  }
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.ConditionInducer"), 1, a1, *(_OWORD *)v6);

}

- (id)availableConditionInducers
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B5F2E8;
  v8[3] = &unk_24EB29D30;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[DTConditionInducerService _requestAvailableConditionInducersWithCompletion:](self, "_requestAvailableConditionInducersWithCompletion:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)disableActiveCondition
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = (id)objc_opt_class();
    v3 = v12;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: disable active condition", buf, 0xCu);

  }
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_222B5F584;
  v9[3] = &unk_24EB29D58;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  -[DTConditionInducerService _requestDisableActiveConditionInducerWithCompletion:](self, "_requestDisableActiveConditionInducerWithCompletion:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)disableConditionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v16 = (id)objc_opt_class();
    v17 = 2112;
    v18 = v4;
    v5 = v16;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: disable condition with identifier: %@", buf, 0x16u);

  }
  v6 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B5F8CC;
  v12[3] = &unk_24EB29D80;
  v12[4] = self;
  v13 = v4;
  v7 = v6;
  v14 = v7;
  v8 = v4;
  -[DTConditionInducerService _requestDisableConditionInducerWithIdentifier:completion:](self, "_requestDisableConditionInducerWithIdentifier:completion:", v8, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)enableConditionWithIdentifier:(id)a3 profileIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v8 = v21;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: enable condition with identifier '%@' profile '%@'", buf, 0x20u);

  }
  v9 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_222B5FC70;
  v16[3] = &unk_24EB29DA8;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v9;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  -[DTConditionInducerService _requestEnableConditionInducerWithIdentifier:profileIdentifier:completion:](self, "_requestEnableConditionInducerWithIdentifier:profileIdentifier:completion:", v12, v11, v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (void)_requestAvailableConditionInducersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DTConditionInducerService connectionToService](self, "connectionToService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DTConditionInducerService connectionToService](self, "connectionToService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_222B5FFFC;
    v11[3] = &unk_24EB29DD0;
    v12 = v4;
    objc_msgSend(v7, "listAvailableConditionInducersWithReply:", v11);

    v8 = v12;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("The Condition Inducer service is not available.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DTConditionInducerService"), 2, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
  }

}

- (void)_requestEnableConditionInducerWithIdentifier:(id)a3 profileIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DTConditionInducerService connectionToService](self, "connectionToService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DTConditionInducerService connectionToService](self, "connectionToService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_222B601A4;
    v17[3] = &unk_24EB29DF8;
    v18 = v10;
    objc_msgSend(v13, "enableConditionInducerWithIdentifier:profileIdentifier:reply:", v8, v9, v17);

    v14 = v18;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("The Condition Inducer service is not available.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DTConditionInducerService"), 2, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

- (void)_requestDisableConditionInducerWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DTConditionInducerService connectionToService](self, "connectionToService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DTConditionInducerService connectionToService](self, "connectionToService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_222B60408;
    v14[3] = &unk_24EB29DF8;
    v15 = v7;
    objc_msgSend(v10, "disableConditionInducerWithIdentifier:reply:", v6, v14);

    v11 = v15;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("The Condition Inducer service is not available.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DTConditionInducerService"), 2, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (void)_requestDisableActiveConditionInducerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DTConditionInducerService connectionToService](self, "connectionToService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DTConditionInducerService connectionToService](self, "connectionToService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_222B60658;
    v11[3] = &unk_24EB29DF8;
    v12 = v4;
    objc_msgSend(v7, "disableActiveConditionInducerWithReply:", v11);

    v8 = v12;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("The Condition Inducer service is not available.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DTConditionInducerService"), 2, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
  }

}

- (void)activeConditionsWillStop
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE2A960], "message");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forMessageKey:", 1, CFSTR("ActiveConditionsWillStop"));
  -[DTXService channel](self, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendControlAsync:replyHandler:", v4, 0);

}

- (void)activeConditionsDidStop
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE2A960], "message");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forMessageKey:", 1, CFSTR("ActiveConditionsDidStop"));
  -[DTXService channel](self, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendControlAsync:replyHandler:", v4, 0);

}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
