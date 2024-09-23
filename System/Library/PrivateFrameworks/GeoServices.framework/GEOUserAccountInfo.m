@implementation GEOUserAccountInfo

+ (id)sharedInstance
{
  if (_MergedGlobals_243 != -1)
    dispatch_once(&_MergedGlobals_243, &__block_literal_global_96);
  return (id)qword_1ECDBC0A0;
}

void __36__GEOUserAccountInfo_sharedInstance__block_invoke()
{
  GEOUserAccountInfo *v0;
  void *v1;

  v0 = objc_alloc_init(GEOUserAccountInfo);
  v1 = (void *)qword_1ECDBC0A0;
  qword_1ECDBC0A0 = (uint64_t)v0;

}

- (GEOUserAccountInfo)init
{
  GEOUserAccountInfo *v2;
  uint64_t v3;
  geo_isolater *isolation;
  GEOUserAccountInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOUserAccountInfo;
  v2 = -[GEOUserAccountInfo init](&v7, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

+ (BOOL)isAccountInfoAvailable
{
  if (!qword_1ECDBC0A8)
    qword_1ECDBC0A8 = _sl_dlopen();
  return qword_1ECDBC0A8 != 0;
}

+ (BOOL)hasValidICloudAccountForAddingRatingsAndPhotos
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCurrentICloudAccountChinaBased") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_msgSend(a1, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryICloudAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isCurrentICloudAccountUnderage") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

+ (BOOL)isCurrentICloudAccountUnderage
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentICloudAccountUnderage");

  return v3;
}

- (BOOL)isCurrentICloudAccountUnderage
{
  BOOL v2;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECDBC0A8)
  {
    v4 = xmmword_1E1C0C9E8;
    v5 = 0;
    qword_1ECDBC0A8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0A8)
    return 0;
  if (!qword_1ECDBC0B0)
  {
    v4 = xmmword_1E1C0CA00;
    v5 = 0;
    qword_1ECDBC0B0 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B0)
    return 0;
  if (!qword_1ECDBC0B8)
  {
    v4 = xmmword_1E1C0CA18;
    v5 = 0;
    qword_1ECDBC0B8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B8)
    return 0;
  *(_QWORD *)&v4 = 0;
  *((_QWORD *)&v4 + 1) = &v4;
  v5 = 0x2020000000;
  v6 = 0;
  geo_isolate_sync();
  v2 = *(_BYTE *)(*((_QWORD *)&v4 + 1) + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __52__GEOUserAccountInfo_isCurrentICloudAccountUnderage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_primaryICloudAccountIsolated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = v2;
    objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v4 + 40))
    {
      objc_msgSend(v9, "aa_altDSID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "authKitAccountWithAltDSID:error:", v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v6;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
      v4 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v4 + 48))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "userUnderAgeForAccount:");
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

    v2 = v9;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

+ (BOOL)isCurrentICloudAccountChinaBased
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentICloudAccountChinaBased");

  return v3;
}

- (BOOL)isCurrentICloudAccountChinaBased
{
  BOOL v2;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECDBC0A8)
  {
    v4 = xmmword_1E1C0C9E8;
    v5 = 0;
    qword_1ECDBC0A8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0A8)
    return 0;
  if (!qword_1ECDBC0B0)
  {
    v4 = xmmword_1E1C0CA00;
    v5 = 0;
    qword_1ECDBC0B0 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B0)
    return 0;
  if (!qword_1ECDBC0B8)
  {
    v4 = xmmword_1E1C0CA18;
    v5 = 0;
    qword_1ECDBC0B8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B8)
    return 0;
  *(_QWORD *)&v4 = 0;
  *((_QWORD *)&v4 + 1) = &v4;
  v5 = 0x2020000000;
  v6 = 0;
  geo_isolate_sync();
  v2 = *(_BYTE *)(*((_QWORD *)&v4 + 1) + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __54__GEOUserAccountInfo_isCurrentICloudAccountChinaBased__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_primaryICloudAccountIsolated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v10 = v2;
    objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v4 + 40))
    {
      objc_msgSend(v10, "aa_altDSID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "authKitAccountWithAltDSID:error:", v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v6;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
      v4 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v4 + 48))
    {
      objc_msgSend(v3, "appleIDCountryCodeForAccount:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "isEqualToString:", CFSTR("CN"));

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }

    v2 = v10;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

+ (BOOL)isCurrentICloudAccountManaged
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentICloudAccountManaged");

  return v3;
}

- (BOOL)isCurrentICloudAccountManaged
{
  BOOL v2;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECDBC0A8)
  {
    v4 = xmmword_1E1C0C9E8;
    v5 = 0;
    qword_1ECDBC0A8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0A8)
    return 0;
  if (!qword_1ECDBC0B0)
  {
    v4 = xmmword_1E1C0CA00;
    v5 = 0;
    qword_1ECDBC0B0 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B0)
    return 0;
  if (!qword_1ECDBC0B8)
  {
    v4 = xmmword_1E1C0CA18;
    v5 = 0;
    qword_1ECDBC0B8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B8)
    return 0;
  *(_QWORD *)&v4 = 0;
  *((_QWORD *)&v4 + 1) = &v4;
  v5 = 0x2020000000;
  v6 = 0;
  geo_isolate_sync();
  v2 = *(_BYTE *)(*((_QWORD *)&v4 + 1) + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__GEOUserAccountInfo_isCurrentICloudAccountManaged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_primaryICloudAccountIsolated");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "aa_isManagedAppleID");
    v2 = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

+ (id)primaryICloudAccount
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryICloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryICloudAccount
{
  id v2;
  __int128 v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECDBC0A8)
  {
    v4 = xmmword_1E1C0C9E8;
    v5 = 0;
    qword_1ECDBC0A8 = _sl_dlopen();
  }
  if (!qword_1ECDBC0A8)
    return 0;
  if (!qword_1ECDBC0B0)
  {
    v4 = xmmword_1E1C0CA00;
    v5 = 0;
    qword_1ECDBC0B0 = _sl_dlopen();
  }
  if (!qword_1ECDBC0B0)
    return 0;
  *(_QWORD *)&v4 = 0;
  *((_QWORD *)&v4 + 1) = &v4;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__49;
  v7 = __Block_byref_object_dispose__49;
  v8 = 0;
  geo_isolate_sync();
  v2 = *(id *)(*((_QWORD *)&v4 + 1) + 40);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __42__GEOUserAccountInfo_primaryICloudAccount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_primaryICloudAccountIsolated");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_primaryICloudAccountIsolated
{
  void *v3;
  objc_class *v4;
  ACAccountStore *v5;
  ACAccountStore *accountStore;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  ACAccount *v11;
  ACAccount *primaryICloudAccount;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void **v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  if (!self->_accountStore)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v3 = (void *)qword_1ECDBC0C8;
    v18 = qword_1ECDBC0C8;
    if (!qword_1ECDBC0C8)
    {
      *(_QWORD *)&v19 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v19 + 1) = 3221225472;
      v20 = (uint64_t)__getACAccountStoreClass_block_invoke;
      v21 = &unk_1E1C03348;
      v22 = &v15;
      __getACAccountStoreClass_block_invoke((uint64_t)&v19);
      v3 = v16[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v15, 8);
    v5 = (ACAccountStore *)objc_alloc_init(v4);
    accountStore = self->_accountStore;
    self->_accountStore = v5;

    v15 = 0;
    if (!qword_1ECDBC0B0)
    {
      v19 = xmmword_1E1C0CA00;
      v20 = 0;
      qword_1ECDBC0B0 = _sl_dlopen();
      v7 = v15;
      if (!qword_1ECDBC0B0)
      {
        v14 = v15;
        v7 = (void *)abort_report_np();
        goto LABEL_16;
      }
      if (v15)
        goto LABEL_17;
    }
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v19 = 0;
      *((_QWORD *)&v19 + 1) = &v19;
      v20 = 0x2020000000;
      v9 = (_QWORD *)qword_1ECDBC0D0;
      v21 = (void *)qword_1ECDBC0D0;
      if (!qword_1ECDBC0D0)
      {
        v10 = (void *)AccountsLibrary();
        v9 = dlsym(v10, "ACAccountStoreDidChangeNotification");
        *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24) = v9;
        qword_1ECDBC0D0 = (uint64_t)v9;
      }
      _Block_object_dispose(&v19, 8);
      if (v9)
        break;
      v14 = dlerror();
      v7 = (void *)abort_report_np();
LABEL_16:
      __break(1u);
LABEL_17:
      free(v7);
    }
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__accountStoreDidChange_, *v9, self->_accountStore);

  }
  if (!self->_hasCheckedPrimaryAccount)
  {
    -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
    v11 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    primaryICloudAccount = self->_primaryICloudAccount;
    self->_primaryICloudAccount = v11;

    self->_hasCheckedPrimaryAccount = 1;
  }
  return self->_primaryICloudAccount;
}

- (void)_accountStoreDidChange:(id)a3
{
  geo_isolate_sync();
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_8_0);
}

void __45__GEOUserAccountInfo__accountStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
}

void __45__GEOUserAccountInfo__accountStoreDidChange___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("GEOUserAccountInfoDidChangeNotification"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAuthKitAccount, 0);
  objc_storeStrong((id *)&self->_primaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
