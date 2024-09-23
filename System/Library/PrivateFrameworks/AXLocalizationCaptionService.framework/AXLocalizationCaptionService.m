uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

(void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("AXLocalizationCaptionService-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AXUIClient)client
{
  AXUIClient *client;
  void *v4;
  AXUIClient *v5;
  AXUIClient *v6;

  client = self->_client;
  if (!client)
  {
    -[AXLocalizationCaptionService _clientIdentifier](self, "_clientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (AXUIClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", v4, CFSTR("AXLocalizationCaptionServer"));
    v6 = self->_client;
    self->_client = v5;

    -[AXUIClient setDelegate:](self->_client, "setDelegate:", self);
    client = self->_client;
  }
  return client;
}

+ (void)_sendMessage:(id)a3 withIdentifier:(unint64_t)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00580], "mainAccessQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__AXLocalizationCaptionService__sendMessage_withIdentifier_errorHandler___block_invoke;
  v14[3] = &unk_24DBD4898;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, a4, v12, v14);

}

void __73__AXLocalizationCaptionService__sendMessage_withIdentifier_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
    _AXLogWithFacility();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizationQACaptionMode");

  if (v4)
    objc_msgSend((id)objc_opt_class(), "startService");
}

+ (void)startService
{
  objc_msgSend(a1, "_sendMessage:withIdentifier:errorHandler:", 0, 1, 0);
}

+ (void)stopService
{
  objc_msgSend(a1, "_sendMessage:withIdentifier:errorHandler:", 0, 2, 0);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
