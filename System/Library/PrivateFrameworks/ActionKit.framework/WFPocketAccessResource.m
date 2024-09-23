@implementation WFPocketAccessResource

- (PocketAPI)pocket
{
  PocketAPI *pocket;
  void *v4;
  PocketAPI *v5;
  PocketAPI *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  pocket = self->_pocket;
  if (!pocket)
  {
    +[PocketAPI sharedAPI](PocketAPI, "sharedAPI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConsumerKey:", CFSTR("36486-fbcaffd4ccb4dcdcce449a20"));

    +[PocketAPI sharedAPI](PocketAPI, "sharedAPI");
    v5 = (PocketAPI *)objc_claimAutoreleasedReturnValue();
    v6 = self->_pocket;
    self->_pocket = v5;

    objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __32__WFPocketAccessResource_pocket__block_invoke;
    v10[3] = &unk_24F8B0598;
    v10[4] = self;
    -[WFPocketAccessResource pocketCallbackScheme](self, "pocketCallbackScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerHandler:forIncomingRequestsWithAction:scheme:", v10, 0, v8);

    pocket = self->_pocket;
  }
  return pocket;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.ideashower.ReadItLaterPro");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Pocket account"), CFSTR("your Pocket account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pocketCallbackScheme
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(CFSTR("36486-fbcaffd4ccb4dcdcce449a20"), "componentsSeparatedByString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("pocketapp%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  unint64_t v3;

  -[WFPocketAccessResource pocket](self, "pocket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isLoggedIn"))
    v3 = 4;
  else
    v3 = 1;

  return v3;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);

  v11 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(a3, "userInterfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE19958]);

  if (v7
    || (objc_msgSend(MEMORY[0x24BE193A0], "sharedContext"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "applicationOrNil"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v10);
  }
  else
  {
    -[WFPocketAccessResource setLoginHandler:](self, "setLoginHandler:", v11);
    -[WFPocketAccessResource pocket](self, "pocket");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loginWithDelegate:", self);
  }

}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  objc_super v3;

  if (a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)WFPocketAccessResource;
    -[WFAccessResource refreshAvailabilityWithNotification:](&v3, sel_refreshAvailabilityWithNotification_, 1);
  }
}

- (void)pocketAPILoggedIn:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  -[WFPocketAccessResource loginHandler](self, "loginHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFPocketAccessResource loginHandler](self, "loginHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1, 0);

    -[WFPocketAccessResource setLoginHandler:](self, "setLoginHandler:", 0);
    -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
  }
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  id v8;

  v8 = a4;
  -[WFPocketAccessResource loginHandler](self, "loginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFPocketAccessResource loginHandler](self, "loginHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "code") == 158)
      v7 = 0;
    else
      v7 = v8;
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v7);

    -[WFPocketAccessResource setLoginHandler:](self, "setLoginHandler:", 0);
    -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
  }

}

- (void)pocketAPI:(id)a3 requestedOpenURL:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v7 = (void *)MEMORY[0x24BE193A0];
  v8 = a4;
  objc_msgSend(v7, "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__WFPocketAccessResource_pocketAPI_requestedOpenURL_completionHandler___block_invoke;
  v11[3] = &unk_24F8B4CD0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "openURL:completionHandler:", v8, v11);

}

- (id)resourceName
{
  return CFSTR("Pocket");
}

- (id)username
{
  void *v2;
  void *v3;

  -[WFPocketAccessResource pocket](self, "pocket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canLogOut
{
  return 1;
}

- (void)logOut
{
  void *v3;

  -[WFPocketAccessResource pocket](self, "pocket");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logout");

  -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
}

- (void)setPocket:(id)a3
{
  objc_storeStrong((id *)&self->_pocket, a3);
}

- (id)loginHandler
{
  return self->_loginHandler;
}

- (void)setLoginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loginHandler, 0);
  objc_storeStrong((id *)&self->_pocket, 0);
}

uint64_t __71__WFPocketAccessResource_pocketAPI_requestedOpenURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __32__WFPocketAccessResource_pocket__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pocket");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "handleOpenURL:", v4);
}

@end
