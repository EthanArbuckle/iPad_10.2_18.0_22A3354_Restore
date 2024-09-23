@implementation AXBannerServices

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken != -1)
    dispatch_once(&sharedInstance_sOnceToken, &__block_literal_global_15);
  return (id)sharedInstance__SharedInstance;
}

void __34__AXBannerServices_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXBannerServices _init]([AXBannerServices alloc], "_init");
  v1 = (void *)sharedInstance__SharedInstance;
  sharedInstance__SharedInstance = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXBannerServices;
  return -[AXBannerServices init](&v3, sel_init);
}

- (AXUIClient)serverClient
{
  AXUIClient *serverClient;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  AXUIClient *v11;
  AXUIClient *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  serverClient = self->_serverClient;
  if (!serverClient)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("AXBannerServicesClient-%@-%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v9 = (void *)getAXUIClientClass_softClass_0;
    v18 = getAXUIClientClass_softClass_0;
    if (!getAXUIClientClass_softClass_0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __getAXUIClientClass_block_invoke_0;
      v14[3] = &unk_1E24C4AE0;
      v14[4] = &v15;
      __getAXUIClientClass_block_invoke_0((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v15, 8);
    v11 = (AXUIClient *)objc_msgSend([v10 alloc], "initWithIdentifier:serviceBundleName:", v8, CFSTR("AXBannerUIServer"));
    v12 = self->_serverClient;
    self->_serverClient = v11;

    -[AXUIClient setDelegate:](self->_serverClient, "setDelegate:", self);
    serverClient = self->_serverClient;
  }
  return serverClient;
}

- (void)presentBannerWithTitle:(id)a3 message:(id)a4 duration:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("title"));
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("message"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  -[AXBannerServices serverClient](self, "serverClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, 1000, 0, 0);

}

- (void)dismissBanner
{
  id v2;

  -[AXBannerServices serverClient](self, "serverClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x1E0C9AA70], 1001, 0, 0);

}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v4;
  id v5;
  AXUIClient *serverClient;

  v4 = a3;
  -[AXBannerServices serverClient](self, "serverClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    serverClient = self->_serverClient;
    self->_serverClient = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverClient, 0);
}

@end
