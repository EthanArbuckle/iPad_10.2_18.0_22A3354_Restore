@implementation MSXPCEndpoint

void __57__MSXPCEndpoint_connectionForProtocol_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  xdict = a2;
  v5 = a3;
  if (xdict)
  {
    xpc_dictionary_get_value(xdict, "endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDD19A0]);
      objc_msgSend(v7, "_setEndpoint:", v6);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (MSXPCEndpoint)init
{
  MSXPCEndpoint *v2;
  MSXPCEndpoint *v3;
  MSXPCEndpoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSXPCEndpoint;
  v2 = -[MSMailDefaultService init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSMailDefaultService setShouldLaunchMobileMail:](v2, "setShouldLaunchMobileMail:", 1);
    v4 = v3;
  }

  return v3;
}

- (void)connectionForProtocol:(id)a3 completionHandler:(id)a4
{
  Protocol *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = (Protocol *)a3;
  v7 = a4;
  v13 = CFSTR("protocol");
  NSStringFromProtocol(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__MSXPCEndpoint_connectionForProtocol_completionHandler___block_invoke;
  v11[3] = &unk_24C385898;
  v10 = v7;
  v12 = v10;
  -[MSService _callServicesMethod:arguments:replyHandler:](self, "_callServicesMethod:arguments:replyHandler:", CFSTR("xpc-endpoint"), v9, v11);

}

@end
