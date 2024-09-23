@implementation WFEvernoteAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.evernote.iPhone.Evernote");
}

- (WFEvernoteAccessResource)initWithDefinition:(id)a3
{
  WFEvernoteAccessResource *v3;
  void *v4;
  WFEvernoteAccessResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFEvernoteAccessResource;
  v3 = -[WFAccessResource initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_refreshAvailabilityWithNotification, CFSTR("ENSessionDidUnauthenticateNotification"), 0);

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ENSessionDidUnauthenticateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)WFEvernoteAccessResource;
  -[WFAccessResource dealloc](&v4, sel_dealloc);
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Evernote account"), CFSTR("your Evernote account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  unint64_t v3;

  objc_msgSend((id)objc_opt_class(), "evernoteSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isAuthenticated"))
    v3 = 4;
  else
    v3 = 1;

  return v3;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WFEvernoteAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "authorizeWithCompletionHandler:", v8);

}

- (id)resourceName
{
  return CFSTR("Evernote");
}

- (id)username
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "evernoteSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canLogOut
{
  return 1;
}

- (void)logOut
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "evernoteSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unauthenticate");

}

void __79__WFEvernoteAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "refreshAvailabilityWithForcedNotification");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (ENSession)evernoteSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__WFEvernoteAccessResource_evernoteSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (evernoteSession_onceToken != -1)
    dispatch_once(&evernoteSession_onceToken, block);
  return (ENSession *)(id)evernoteSession_evernoteSession;
}

+ (id)evernoteCallbackScheme
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("en-%@"), CFSTR("team146"));
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFCC40;
}

+ (id)userInterfaceClasses
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE19938];
  v4[0] = *MEMORY[0x24BE19950];
  v4[1] = v2;
  v5[0] = CFSTR("WFEvernoteAccessResourceUserInterface");
  v5[1] = CFSTR("WFEvernoteAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__WFEvernoteAccessResource_evernoteSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  +[ENSession setSharedSessionConsumerKey:consumerSecret:optionalHost:](ENSession, "setSharedSessionConsumerKey:consumerSecret:optionalHost:", CFSTR("team146"), CFSTR("893f90c98d2a27dd"), 0);
  +[ENSession sharedSession](ENSession, "sharedSession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)evernoteSession_evernoteSession;
  evernoteSession_evernoteSession = v2;

  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__WFEvernoteAccessResource_evernoteSession__block_invoke_2;
  v6[3] = &__block_descriptor_40_e23_v16__0___ICURLRequest_8l;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v7, "evernoteCallbackScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forIncomingRequestsWithAction:scheme:", v6, 0, v5);

}

void __43__WFEvernoteAccessResource_evernoteSession__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "evernoteSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "handleOpenURL:", v4);
}

@end
