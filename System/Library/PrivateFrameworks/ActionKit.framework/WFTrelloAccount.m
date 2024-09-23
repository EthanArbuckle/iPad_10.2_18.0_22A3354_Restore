@implementation WFTrelloAccount

+ (id)accountWithToken:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setToken:", v3);

  return v4;
}

+ (id)serviceID
{
  return CFSTR("is.workflow.my.app.trello");
}

+ (id)serviceName
{
  return CFSTR("Trello");
}

+ (id)localizedServiceName
{
  return WFLocalizedString(CFSTR("Trello"));
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[WFTrelloAccount token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4;
  WFTrelloSessionManager *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init(WFTrelloSessionManager);
  -[WFTrelloAccount token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTrelloSessionManager setToken:](v5, "setToken:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFTrelloAccount_refreshWithCompletionHandler___block_invoke;
  v8[3] = &unk_24F8B0BC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[WFTrelloSessionManager getUserWithCompletionHandler:](v5, "getUserWithCompletionHandler:", v8);

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

void __48__WFTrelloAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "email");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "email");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v11, "email");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEmail:", v9);

      +[WFAccount saveAccount:](WFAccount, "saveAccount:", *(_QWORD *)(a1 + 32));
    }
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);

}

@end
