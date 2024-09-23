@implementation AMSAccountCachedServerData

- (id)cancelUpdatesForToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSAccountCachedServerData core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelUpdateBlockFor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_75 != -1)
    dispatch_once(&_MergedGlobals_75, &__block_literal_global_2);
  return (id)qword_1ECEACE88;
}

- (id)stringForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[AMSAccountCachedServerData core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForKey:accountID:updateBlock:", a3, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (AMSAccountCachedServerDataCore)core
{
  return self->_core;
}

void __44__AMSAccountCachedServerData_sharedInstance__block_invoke()
{
  AMSAccountCachedServerData *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AMSAccountCachedServerData alloc];
  +[AMSAccountCachedServerDataCore sharedInstance](AMSAccountCachedServerDataCore, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AMSAccountCachedServerData initWithWrappedInstance:](v0, "initWithWrappedInstance:", v3);
  v2 = (void *)qword_1ECEACE88;
  qword_1ECEACE88 = v1;

}

- (AMSAccountCachedServerData)initWithWrappedInstance:(id)a3
{
  id v6;
  AMSAccountCachedServerData *v7;
  AMSAccountCachedServerData *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSAccountCachedServerData.m"), 43, CFSTR("Unexpected nil reference: %s"), "core");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSAccountCachedServerData.m"), 44, CFSTR("Invalid parameter not satisfying: %s"), "[core isKindOfClass:AMSAccountCachedServerDataCore.class]");

  }
  v12.receiver = self;
  v12.super_class = (Class)AMSAccountCachedServerData;
  v7 = -[AMSAccountCachedServerData init](&v12, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_core, a3);

  return v8;
}

- (id)BOOLForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[AMSAccountCachedServerData core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "BOOLForKey:accountID:updateBlock:", a3, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)intForKey:(unint64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[AMSAccountCachedServerData core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intForKey:accountID:updateBlock:", a3, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accountFlagsForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[AMSAccountCachedServerData core](self, "core");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountFlagsForAccountID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setAccountFlags:(id)a3 forAccountID:(id)a4
{
  -[AMSAccountCachedServerData setAccountFlags:forAccountID:completion:](self, "setAccountFlags:forAccountID:completion:", a3, a4, &__block_literal_global_10);
}

- (void)setAutoPlay:(BOOL)a3 forAccountID:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  if (a4)
  {
    v4 = a3;
    v6 = a4;
    -[AMSAccountCachedServerData core](self, "core");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutoPlayTo:forAccountID:completionHandler:", v4, v6, &__block_literal_global_11);

  }
}

- (void)setPersonalization:(BOOL)a3 forAccountID:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  if (a4)
  {
    v4 = a3;
    v6 = a4;
    -[AMSAccountCachedServerData core](self, "core");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPersonalizationTo:forAccountID:completionHandler:", v4, v6, &__block_literal_global_12);

  }
}

- (void)setAccountFlags:(id)a3 forAccountID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  if (a4)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[AMSAccountCachedServerData core](self, "core");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccountFlags:forAccountID:completionHandler:", v10, v9, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_core, 0);
}

@end
