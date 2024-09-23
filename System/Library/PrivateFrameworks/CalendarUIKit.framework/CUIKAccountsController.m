@implementation CUIKAccountsController

+ (id)sharedInstance
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (id)__SharedRefreshController;
  objc_sync_enter(v2);
  v3 = (void *)__SharedRefreshController;
  if (!__SharedRefreshController)
  {
    v4 = objc_opt_new();
    v5 = (void *)__SharedRefreshController;
    __SharedRefreshController = v4;

    v3 = (void *)__SharedRefreshController;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)invalidate
{
  void *v2;
  id obj;

  obj = (id)__SharedRefreshController;
  objc_sync_enter(obj);
  v2 = (void *)__SharedRefreshController;
  __SharedRefreshController = 0;

  objc_sync_exit(obj);
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_10);
}

void __36__CUIKAccountsController_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)__cachedAccounts;
  __cachedAccounts = v0;

  v2 = objc_opt_new();
  v3 = (void *)__cachedDisplayAccounts;
  __cachedDisplayAccounts = v2;

}

- (CUIKAccountsController)init
{
  CUIKAccountsController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKAccountsController;
  v2 = -[CUIKAccountsController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CUIKAccountsController;
  -[CUIKAccountsController dealloc](&v4, sel_dealloc);
}

- (id)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)_accountStoreDidChange:(id)a3
{
  objc_msgSend((id)__cachedAccounts, "removeAllObjects", a3);
  objc_msgSend((id)__cachedDisplayAccounts, "removeAllObjects");
}

- (id)_accountForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)__cachedAccounts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CUIKAccountsController accountStore](self, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend((id)__cachedAccounts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_displayAccountForAccountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)__cachedDisplayAccounts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CUIKAccountsController _accountForAccountIdentifier:](self, "_accountForAccountIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "displayAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__cachedDisplayAccounts, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)titleForSource:(id)a3 forBeginningOfSentence:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "sourceType");
  if (v7 == 4)
  {
    CUIKBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
      v11 = CFSTR("Subscribed calendar group title");
    else
      v11 = CFSTR("Subscribed calendar group title.  Usually preceded by 'All' to denote selecting all the calendars in the group. In English these are the same.");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("Subscribed"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7)
  {
    if (objc_msgSend(v6, "isDelegate"))
    {
      objc_msgSend(v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "externalID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[CUIKAccountsController _displayAccountForAccountWithIdentifier:](self, "_displayAccountForAccountWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "accountDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
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
      if (!objc_msgSend(v8, "length") && objc_msgSend(v6, "sourceType") == 5)
      {
        CUIKBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("The 'other' account, where the birthday calendar lives"), CFSTR("Other"), 0);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }
      if (!objc_msgSend(v8, "length"))
      {
        objc_msgSend(v6, "title");
        v17 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v17;
      }

    }
    if (!objc_msgSend(v8, "length"))
    {
      CUIKBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Untitled Account"), &stru_1E6EBAE30, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v19;
    }
  }
  else
  {
    objc_msgSend((id)EKWeakLinkClass(), "localizedTitleForLocalSourceOfDataclass:usedAtBeginningOfSentence:", *MEMORY[0x1E0C8F378], v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)accountTypeTitleForSourceWithExternalId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[CUIKAccountsController _displayAccountForAccountWithIdentifier:](self, "_displayAccountForAccountWithIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "accountType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountTypeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accountTypeTitleForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "sourceType"))
  {
    objc_msgSend(v4, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKAccountsController accountTypeTitleForSourceWithExternalId:](self, "accountTypeTitleForSourceWithExternalId:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)sourceIsManaged:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSourceManaged:", v3);

  return v5;
}

- (int)sortOrderForSource:(id)a3
{
  return -[CUIKAccountsController sortOrderForSourceType:](self, "sortOrderForSourceType:", objc_msgSend(a3, "sourceType"));
}

- (int)sortOrderForSourceType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 1;
  else
    return dword_1B8BA47D0[a3];
}

- (int)sortOrderForStoreType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 1;
  else
    return dword_1B8BA47EC[a3];
}

- (BOOL)haveiCloudCalendarAccountInSources:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0C8F030];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "sourceType", (_QWORD)v18))
        {
          objc_msgSend(v10, "externalID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUIKAccountsController _displayAccountForAccountWithIdentifier:](self, "_displayAccountForAccountWithIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "accountType");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v8);

            if ((v15 & 1) != 0)
            {
              v16 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
