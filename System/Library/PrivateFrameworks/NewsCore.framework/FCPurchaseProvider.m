@implementation FCPurchaseProvider

- (NSSet)purchasedTagIDs
{
  void *v3;
  FCPurchaseController *purchaseController;
  FCPurchaseController *v5;
  void *v6;
  FCPrivateChannelMembershipController *privateChannelMembershipController;
  FCPrivateChannelMembershipController *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  if (self)
    purchaseController = self->_purchaseController;
  else
    purchaseController = 0;
  v5 = purchaseController;
  -[FCPurchaseController purchasedTagIDs](v5, "purchasedTagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  if (self)
    privateChannelMembershipController = self->_privateChannelMembershipController;
  else
    privateChannelMembershipController = 0;
  v8 = privateChannelMembershipController;
  -[FCPrivateChannelMembershipController membershipChannelIDs](v8, "membershipChannelIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_unionOfSetsInArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v11;
}

- (id)initWithPurchaseController:(void *)a3 privateChannelMembershipController:
{
  id v6;
  id v7;
  id *v8;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_9;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "purchaseController");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]";
    v15 = 2080;
    v16 = "FCPurchaseProvider.m";
    v17 = 1024;
    v18 = 32;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v7)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateChannelMembershipController");
        *(_DWORD *)buf = 136315906;
        v14 = "-[FCPurchaseProvider initWithPurchaseController:privateChannelMembershipController:]";
        v15 = 2080;
        v16 = "FCPurchaseProvider.m";
        v17 = 1024;
        v18 = 33;
        v19 = 2114;
        v20 = v11;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v7)
  {
    goto LABEL_5;
  }
  v12.receiver = a1;
  v12.super_class = (Class)FCPurchaseProvider;
  v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
  a1 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
  }
LABEL_9:

  return a1;
}

- (FCPurchaseProvider)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPurchaseProvider init]";
    v9 = 2080;
    v10 = "FCPurchaseProvider.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPurchaseProvider init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
}

@end
