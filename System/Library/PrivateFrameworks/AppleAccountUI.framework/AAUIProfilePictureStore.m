@implementation AAUIProfilePictureStore

- (void)setPictureDiameter:(double)a3
{
  if (self->_pictureDiameter != a3)
  {
    self->_pictureDiameter = a3;
    -[AAUIProfilePictureStore _invalidateMonogrammer](self, "_invalidateMonogrammer");
  }
}

- (AAUIProfilePictureStore)init
{
  void *v3;
  void *v4;
  void *v5;
  AAUIProfilePictureStore *v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_monogrammerLock._os_unfair_lock_opaque = 0;
  if (v4)
  {
    objc_msgSend(v3, "aa_grandSlamAccountForiCloudAccount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AAUIProfilePictureStore initWithAppleAccount:grandSlamAccount:accountStore:](self, "initWithAppleAccount:grandSlamAccount:accountStore:", v4, v5, v3);

  }
  else
  {
    _AAUIPPSLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "No primary iCloud account found! Creating AAUIProfilePictureStore without primary account.", v9, 2u);
    }

    v6 = (AAUIProfilePictureStore *)-[AAUIProfilePictureStore _initWithoutAppleAccount](self, "_initWithoutAppleAccount");
  }

  return v6;
}

- (id)_initWithoutAppleAccount
{
  AAUIProfilePictureStore *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  NSOperationQueue *v5;
  NSOperationQueue *networkingQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUIProfilePictureStore;
  v2 = -[AAUIProfilePictureStore init](&v8, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = v5;

    v2->_pictureDiameter = 60.0;
    v2->_monogramType = 0;
    -[AAUIProfilePictureStore _beginObservingContactStoreDidChangeNotifications](v2, "_beginObservingContactStoreDidChangeNotifications");
  }
  return v2;
}

- (void)_beginObservingContactStoreDidChangeNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *contactStoreDidChangeObserver;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C96870];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__AAUIProfilePictureStore__beginObservingContactStoreDidChangeNotifications__block_invoke;
  v8[3] = &unk_1EA2DB410;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v8);
  v6 = objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeObserver = self->_contactStoreDidChangeObserver;
  self->_contactStoreDidChangeObserver = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_invalidateMonogrammer
{
  os_unfair_lock_s *p_monogrammerLock;
  _QWORD v3[5];

  p_monogrammerLock = &self->_monogrammerLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke;
  v3[3] = &unk_1EA2DB208;
  v3[4] = self;
  os_unfair_lock_lock(&self->_monogrammerLock);
  __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_monogrammerLock);
}

void __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v7;
  id v8;
  id *v9;
  AAUIProfilePictureStore *v10;
  uint64_t v11;
  ACAccountStore *accountStore;

  v7 = a3;
  v8 = a4;
  v9 = -[AAUIProfilePictureStore _initWithoutAppleAccount](self, "_initWithoutAppleAccount");
  v10 = (AAUIProfilePictureStore *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_msgSend(v8, "accountStore");
    v11 = objc_claimAutoreleasedReturnValue();
    accountStore = v10->_accountStore;
    v10->_accountStore = (ACAccountStore *)v11;

    objc_storeStrong((id *)&v10->_grandSlamSigner, a4);
  }

  return v10;
}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  AAUIProfilePictureStore *v18;
  uint8_t v20[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  _AAUIPPSLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore initWithAppleAccount:grandSlamAccount:accountStore:].cold.1();

    v16 = objc_alloc(MEMORY[0x1E0CFAC78]);
    v17 = (void *)objc_msgSend(v16, "initWithAccountStore:grandSlamAccount:appTokenID:", v10, v9, *MEMORY[0x1E0CFAB50]);
    v18 = -[AAUIProfilePictureStore initWithAppleAccount:grandSlamSigner:](self, "initWithAppleAccount:grandSlamSigner:", v8, v17);

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Cannot create AAUIProfilePictureStore with a non-iCloud account! Returning default store without account", v20, 2u);
    }

    v18 = (AAUIProfilePictureStore *)-[AAUIProfilePictureStore _initWithoutAppleAccount](self, "_initWithoutAppleAccount");
  }

  return v18;
}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AAUIProfilePictureStore *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "aa_grandSlamAccountForiCloudAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AAUIProfilePictureStore initWithAppleAccount:grandSlamAccount:accountStore:](self, "initWithAppleAccount:grandSlamAccount:accountStore:", v7, v8, v6);

  return v9;
}

- (AAUIProfilePictureStore)initWithGrandSlamSigner:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  AAUIProfilePictureStore *v15;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore initWithGrandSlamSigner:].cold.3();

  objc_msgSend(v4, "grandSlamAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aida_alternateDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_appleAccountWithAltDSID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _AAUIPPSLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore initWithGrandSlamSigner:].cold.2();

    objc_msgSend(v4, "grandSlamAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aida_dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUIPPSLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore initWithGrandSlamSigner:].cold.1();

    objc_msgSend(v4, "accountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_appleAccountWithPersonID:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[AAUIProfilePictureStore initWithAppleAccount:grandSlamSigner:](self, "initWithAppleAccount:grandSlamSigner:", v9, v4);

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[AAUIProfilePictureStore _endObservingContactStoreDidChangeNotifications](self, "_endObservingContactStoreDidChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AAUIProfilePictureStore;
  -[AAUIProfilePictureStore dealloc](&v3, sel_dealloc);
}

- (int64_t)pictureStyle
{
  return 2 * (-[AAUIProfilePictureStore monogramType](self, "monogramType") == 1);
}

- (id)_monogrammer
{
  os_unfair_lock_s *p_monogrammerLock;
  void *v3;
  _QWORD v5[5];

  p_monogrammerLock = &self->_monogrammerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AAUIProfilePictureStore__monogrammer__block_invoke;
  v5[3] = &unk_1EA2DB1E0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_monogrammerLock);
  __39__AAUIProfilePictureStore__monogrammer__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_monogrammerLock);
  return v3;
}

id __39__AAUIProfilePictureStore__monogrammer__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettingsWithCacheSize:skipContactLookup:", 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "initWithSettings:", v3);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

  }
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (void)setMonogramType:(int64_t)a3
{
  if (self->_monogramType != a3)
  {
    self->_monogramType = a3;
    -[AAUIProfilePictureStore _invalidateMonogrammer](self, "_invalidateMonogrammer");
  }
}

- (void)setPictureStyle:(int64_t)a3
{
  -[AAUIProfilePictureStore setMonogramType:](self, "setMonogramType:", a3 == 2);
}

- (id)renderingScope
{
  void *v2;
  double pictureDiameter;
  void *v4;
  double v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C97460];
  pictureDiameter = self->_pictureDiameter;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v2, "scopeWithPointSize:scale:rightToLeft:style:", 1, 0, pictureDiameter, pictureDiameter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)profilePictureForAccountOwner
{
  void *v3;
  void *v4;

  -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback](self, "profilePictureForAccountOwnerWithoutMonogramFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:](self, "_sizedProfilePictureWithFallback:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)profilePictureForAccountOwnerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithCompletion:].cold.1();

  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke;
  v8[3] = &unk_1EA2DB280;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  char v31;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  _AAUIPPSLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_2();

    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(double *)(*(_QWORD *)(a1 + 32) + 72);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_33;
    v23 = &unk_1EA2DB258;
    v27 = buf;
    v24 = WeakRetained;
    v12 = v9;
    v25 = v12;
    v26 = *(id *)(a1 + 40);
    objc_msgSend(v10, "profilePictureForPersonID:diameter:serverFetchBlock:", v12, &v20, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29[24])
    {
      _AAUIPPSLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_1();

      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "_sizedProfilePictureWithFallback:", v13, v20, v21, v22, v23, v24, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "User not signed into iCloud, falling back to Me card for profile picture.", buf, 2u);
    }

    objc_msgSend(WeakRetained, "_meCardPicture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "_sizedProfilePictureWithFallback:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

  }
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  _AAUIPPSLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_33_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_34;
  v8[3] = &unk_1EA2DB230;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v5, "_fetchProfilePictureForAccountOwnerFromServer:serverCacheTag:completion:", v6, v3, v8);

}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  _AAUIPPSLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_34_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_sizedProfilePictureWithFallback:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (id)_sizedProfilePictureWithFallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:].cold.2();

  v6 = v4;
  v7 = v6;
  if (!v6)
  {
    _AAUIPPSLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:].cold.1();

    -[ACAccount aa_firstName](self->_account, "aa_firstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount aa_lastName](self->_account, "aa_lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:](self, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)profilePictureForAccountOwnerWithoutMonogramFallback
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double pictureDiameter;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  AAUIProfilePictureStore *v17;
  id v18;

  _AAUIPPSLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback].cold.2();

  if (!-[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]))goto LABEL_7;
  _AAUIPPSLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback].cold.1();

  -[AAUIProfilePictureStore _meCardPicture](self, "_meCardPicture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    -[ACAccount aa_personID](self->_account, "aa_personID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    pictureDiameter = self->_pictureDiameter;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __79__AAUIProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallback__block_invoke;
    v16 = &unk_1EA2DB2A8;
    v17 = self;
    v18 = v7;
    v10 = v7;
    objc_msgSend(v8, "profilePictureForPersonID:diameter:serverFetchBlock:", v10, &v13, pictureDiameter);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v5, v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfilePictureStore _saveProfilePictureToCacheIfNeeded:](self, "_saveProfilePictureToCacheIfNeeded:", v11);

  return v11;
}

uint64_t __79__AAUIProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallback__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchProfilePictureForAccountOwnerFromServer:serverCacheTag:completion:", *(_QWORD *)(a1 + 40), a2, 0);
}

- (void)fetchProfilePictureForAccountOwner:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore fetchProfilePictureForAccountOwner:].cold.1();

  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke;
  v8[3] = &unk_1EA2DB320;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  id v19;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!objc_msgSend(WeakRetained[1], "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]))
    goto LABEL_8;
  _AAUIPPSLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_3();

  objc_msgSend(WeakRetained, "_meCardPicture");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;
    _AAUIPPSLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_2();

    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_correctlySizedImageFromImage:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
LABEL_8:
    _AAUIPPSLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();

    objc_msgSend(WeakRetained[1], "aa_personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    v14 = *(double *)(*(_QWORD *)(a1 + 32) + 72);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37;
    v16[3] = &unk_1EA2DB2F8;
    v16[1] = 3221225472;
    v16[4] = WeakRetained;
    v17 = v11;
    v15 = v13;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v15;
    v5 = v11;
    objc_msgSend(v12, "profilePictureForPersonID:diameter:completion:", v5, v16, v14);

  }
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];
  id v20;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    _AAUIPPSLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37_cold_1();

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_38;
    v19[3] = &unk_1EA2DB2D0;
    v19[4] = v10;
    v12 = *(id *)(a1 + 56);
    v19[5] = *(_QWORD *)(a1 + 48);
    v20 = v12;
    objc_msgSend(v10, "_fetchProfilePictureForAccountOwnerFromServer:serverCacheTag:completion:", v11, v8, v19);

  }
  else
  {
    if (!v7)
    {
      _AAUIPPSLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37_cold_2();

      v14 = *(id **)(a1 + 32);
      objc_msgSend(v14[1], "aa_firstName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_lastName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v15, v16);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "_correctlySizedImageFromImage:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

  }
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _AAUIPPSLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();

    v8 = *(id **)(a1 + 32);
    objc_msgSend(v8[1], "aa_firstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v9, v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_correctlySizedImageFromImage:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);

}

- (void)fetchProfilePictureFromCacheForAccountOwner:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore fetchProfilePictureFromCacheForAccountOwner:].cold.1();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AAUIProfilePictureStore_fetchProfilePictureFromCacheForAccountOwner___block_invoke;
  v7[3] = &unk_1EA2DB348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AAUIProfilePictureStore fetchProfilePictureForAccountOwner:](self, "fetchProfilePictureForAccountOwner:", v7);

}

void __71__AAUIProfilePictureStore_fetchProfilePictureFromCacheForAccountOwner___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_saveProfilePictureToCacheIfNeeded:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_saveProfilePictureToCache:(id)a3
{
  void *v3;
  NSObject *v4;

  UIImagePNGRepresentation((UIImage *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png"), 1);
  CFPreferencesSetAppValue(CFSTR("AAProfilePictureCacheURL"), CFSTR("/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png"), (CFStringRef)*MEMORY[0x1E0CFAB68]);
  _AAUIPPSLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _saveProfilePictureToCache:].cold.1();

}

- (id)_readProfilePictureFromCache
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", CFSTR("/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isCachedProfilePictureUpdated:(id)a3
{
  UIImage *v4;
  UIImage *v5;
  void *v6;
  void *v7;

  v4 = (UIImage *)a3;
  -[AAUIProfilePictureStore _readProfilePictureFromCache](self, "_readProfilePictureFromCache");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToData:", v7);
  return (char)v4;
}

- (BOOL)_isProfilePictureCachePresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AAProfilePictureCacheURL"), (CFStringRef)*MEMORY[0x1E0CFAB68]);
  v3 = v2 != 0;

  return v3;
}

- (void)_saveProfilePictureToCacheIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[ACAccount aa_isAccountClass:](self->_account, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]))
  {
    if (!-[AAUIProfilePictureStore _isProfilePictureCachePresent](self, "_isProfilePictureCachePresent"))
    {
LABEL_7:
      -[AAUIProfilePictureStore _saveProfilePictureToCache:](self, "_saveProfilePictureToCache:", v4);
      goto LABEL_8;
    }
    if (!-[AAUIProfilePictureStore _isCachedProfilePictureUpdated:](self, "_isCachedProfilePictureUpdated:", v4))
    {
      _AAUIPPSLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore _saveProfilePictureToCacheIfNeeded:].cold.1();

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)setProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4
{
  UIImage *v6;
  id v7;
  NSObject *v8;
  CNContactStore *contactStore;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  CNContactStore *v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  id v39;

  v6 = (UIImage *)a3;
  v7 = a4;
  _AAUIPPSLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.10();

  contactStore = self->_contactStore;
  -[ACAccount aa_primaryEmail](self->_account, "aa_primaryEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUIDefaultFetchDescriptors();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  -[CNContactStore unifiedMeContactMatchingEmailAddress:keysToFetch:error:](contactStore, "unifiedMeContactMatchingEmailAddress:keysToFetch:error:", v10, v11, &v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v39;

  if (v12)
  {
    _AAUIPPSLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.9();

    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    _AAUIPPSLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    v37 = v13;
    if (v6)
    {
      if (v17)
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.8();

      UIImageJPEGRepresentation(v6, 0.8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImageData:", v18);
      if (v7)
      {
        objc_msgSend(v7, "CGRectValue");
        objc_msgSend(v15, "setCropRect:");
      }

    }
    else
    {
      if (v17)
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.7();

      objc_msgSend(v15, "setImageData:", 0);
    }
    objc_msgSend(v15, "setMemojiMetadata:", 0);
    v19 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v19, "updateContact:", v15);
    v20 = self->_contactStore;
    v38 = 0;
    v21 = -[CNContactStore executeSaveRequest:error:](v20, "executeSaveRequest:error:", v19, &v38);
    v22 = v38;
    _AAUIPPSLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.5();

      v25 = -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:](self, "_contactSyncsWithiCloud:error:", v12, 0);
      if ((_DWORD)v25)
      {
        _AAUIPPSLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.4();

        v27 = 1;
      }
      else
      {
        v27 = 0;
      }
      _AAUIPPSLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.3(v25, v24, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.6();
      v27 = 0;
    }
    v13 = v37;

    if (v27)
      goto LABEL_33;
  }
  if (!-[ACAccount aa_isPrimaryEmailVerified](self->_account, "aa_isPrimaryEmailVerified"))
  {
LABEL_33:
    _AAUIPPSLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.2();

    -[ACAccount aa_personID](self->_account, "aa_personID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:](self, "updateCacheWithPhoto:cropRect:forPersonID:", v6, v7, v36);

  }
  else
  {
    _AAUIPPSLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.1();

    -[AAUIProfilePictureStore _updateServerProfilePictureForAccountOwner:cropRect:](self, "_updateServerProfilePictureForAccountOwner:cropRect:", v6, v7);
  }

}

- (id)profilePictureForFamilyMember:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForFamilyMember: %@ %@ %@", (uint8_t *)&v14, 0x20u);

  }
  -[AAUIProfilePictureStore _profilePictureForFamilyMemberWithoutMonogramFallback:](self, "_profilePictureForFamilyMemberWithoutMonogramFallback:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v4, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:](self, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)fetchProfilePictureForFamilyMember:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double pictureDiameter;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  _AAUIPPSLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "appleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore fetchProfilePictureForFamilyMember: %@ %@ %@ completion:", buf, 0x20u);

  }
  if (-[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388])
    && (-[AAUIProfilePictureStore _familyMemberPersonPicture:](self, "_familyMemberPersonPicture:", v6),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14, 0);

  }
  else
  {
    objc_msgSend(v6, "personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    pictureDiameter = self->_pictureDiameter;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke;
    v18[3] = &unk_1EA2DB398;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    objc_msgSend(v16, "profilePictureForPersonID:diameter:completion:", v13, v18, pictureDiameter);

  }
}

void __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    v10 = a1[4];
    v9 = a1[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke_2;
    v16[3] = &unk_1EA2DB370;
    v16[4] = v10;
    v17 = v9;
    v18 = a1[6];
    objc_msgSend(v10, "_fetchProfilePictureForFamilyMemberFromServer:serverCacheTag:completion:", v17, v8, v16);

  }
  else
  {
    if (!v7)
    {
      v11 = a1[4];
      objc_msgSend(a1[5], "firstName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "lastName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v12, v13);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void (**)(id, void *, _QWORD))a1[6];
    objc_msgSend(a1[4], "_correctlySizedImageFromImage:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15, 0);

  }
}

void __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (!v11)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_correctlySizedImageFromImage:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5);

}

- (void)fetchRawImageAndCropRectForAccountOwner:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  _QWORD v8[4];
  id v9;
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke;
  aBlock[3] = &unk_1EA2DB138;
  aBlock[4] = self;
  v6 = v4;
  v12 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]))
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke_47;
    v8[3] = &unk_1EA2DB3C0;
    v9 = v6;
    v10 = v7;
    -[AAUIProfilePictureStore _meCardRawImageAndCropRect:](self, "_meCardRawImageAndCropRect:", v8);

  }
  else
  {
    v7[2](v7);
  }

}

void __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  +[_AAUIRawImageAndCropRectCache entryForPersonID:](_AAUIRawImageAndCropRectCache, "entryForPersonID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "rawImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawCropRect");
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFACB8]), "initWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "serverCacheTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServerCacheTag:", v7);

    _AAUIPPSLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Fetching account owner profile picture from server with request %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_fetchAndCacheRawImageAndCropRectWithRequest:personID:completion:", v6, v3, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchRawImageAndCropRectForFamilyMember:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  AAUIProfilePictureStore *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke;
  aBlock[3] = &unk_1EA2DB3E8;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = self;
  v18 = v10;
  v11 = _Block_copy(aBlock);
  if (-[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]))
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke_50;
    v12[3] = &unk_1EA2DB3C0;
    v13 = v10;
    v14 = v11;
    -[AAUIProfilePictureStore _familyMember:rawImageAndCropRect:](self, "_familyMember:rawImageAndCropRect:", v9, v12);

  }
}

void __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[_AAUIRawImageAndCropRectCache entryForPersonID:](_AAUIRawImageAndCropRectCache, "entryForPersonID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "rawImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawCropRect");
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20EA0]), "initWithGrandSlamSigner:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFamilyMemberDSID:", v7);

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_activeiTunesAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setiTunesAccount:", v9);

    objc_msgSend(v4, "serverCacheTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServerCacheTag:", v10);

    _AAUIPPSLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Fetching family member profile picture from server with request %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_fetchAndCacheRawImageAndCropRectWithRequest:personID:completion:", v6, v3, *(_QWORD *)(a1 + 48));
  }

}

uint64_t __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)profilePictureForLocalContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  _AAUIPPSLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore profilePictureForLocalContact:].cold.1();

  objc_msgSend(v4, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v4, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePictureStore profilePictureForPicture:](self, "profilePictureForPicture:", v9);
  }
  else
  {
    objc_msgSend(v4, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:](self, "_fallbackProfilePictureForPersonWithFirstName:lastName:", v8, v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)monogramForCurrentAccount
{
  NSObject *v3;

  _AAUIPPSLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore monogramForCurrentAccount].cold.1();

  -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:](self, "_sizedProfilePictureWithFallback:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __76__AAUIProfilePictureStore__beginObservingContactStoreDidChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_contactStoreDidChange:", v3);

}

- (void)_contactStoreDidChange:(id)a3
{
  NSObject *v4;
  void *v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _AAUIPPSLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _contactStoreDidChange:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("AAUIProfilePictureStoreDidChange"), self);

}

- (void)_endObservingContactStoreDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_contactStoreDidChangeObserver);

}

- (id)_fallbackProfilePictureForPersonWithFirstName:(id)a3 lastName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUIPPSLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:].cold.3();

  if (!v6 || !v7)
    goto LABEL_8;
  _AAUIPPSLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:].cold.2();

  v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v10, "setGivenName:", v6);
  objc_msgSend(v10, "setFamilyName:", v7);
  -[AAUIProfilePictureStore _monogrammer](self, "_monogrammer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfilePictureStore renderingScope](self, "renderingScope");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avatarImageForContacts:scope:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_8:
    _AAUIPPSLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();

    v16 = self->_pictureDiameter * 0.5;
    -[AAUIProfilePictureStore _monogrammer](self, "_monogrammer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "placeholderImageProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    objc_msgSend(v18, "imageForSize:scale:style:", 0, v16, v16, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)_fetchAndCacheRawImageAndCropRectWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__AAUIProfilePictureStore__fetchAndCacheRawImageAndCropRectWithRequest_personID_completion___block_invoke;
  v10[3] = &unk_1EA2DB438;
  v11 = v8;
  v9 = v8;
  -[AAUIProfilePictureStore _fetchProfilePictureSupersetWithRequest:personID:completion:](self, "_fetchProfilePictureSupersetWithRequest:personID:completion:", a3, a4, v10);

}

uint64_t __92__AAUIProfilePictureStore__fetchAndCacheRawImageAndCropRectWithRequest_personID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_correctlySizedImageFromImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double pictureDiameter;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    -[AAUIProfilePictureStore pictureDiameter](self, "pictureDiameter");
    if (v7 == v8)
    {
      v9 = v5;
    }
    else
    {
      pictureDiameter = self->_pictureDiameter;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", pictureDiameter, pictureDiameter);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__AAUIProfilePictureStore__correctlySizedImageFromImage___block_invoke;
      v13[3] = &unk_1EA2DB460;
      v15 = 0;
      v16 = 0;
      v14 = v5;
      v17 = pictureDiameter;
      v18 = pictureDiameter;
      objc_msgSend(v11, "imageWithActions:", v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __57__AAUIProfilePictureStore__correctlySizedImageFromImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_fetchProfilePictureForAccountOwnerFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CFACB8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithAccount:", self->_account);
  objc_msgSend(v12, "setServerCacheTag:", v10);

  _AAUIPPSLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Fetching account owner profile picture from server with request %@", (uint8_t *)&v14, 0xCu);
  }

  -[AAUIProfilePictureStore _fetchProfilePictureWithRequest:personID:completion:](self, "_fetchProfilePictureWithRequest:personID:completion:", v12, v11, v9);
}

- (void)_fetchProfilePictureSupersetWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  AAUIProfilePictureStore *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__AAUIProfilePictureStore__fetchProfilePictureSupersetWithRequest_personID_completion___block_invoke;
  v14[3] = &unk_1EA2DB488;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v13, "performRequestWithHandler:", v14);

}

void __87__AAUIProfilePictureStore__fetchProfilePictureSupersetWithRequest_personID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (objc_msgSend(v6, "statusCode") == 404)
  {
    _AAUIPPSLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v39 = 138412290;
      v40 = v13;
      _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: No photo was found on the server", (uint8_t *)&v39, 0xCu);
    }
    v14 = 0;
    v15 = 0;
    v16 = 0;
LABEL_12:

    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v8, v9, v10, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateCacheWithPhoto:cropRect:forPersonID:", v15, v28, *(_QWORD *)(a1 + 48));

    v29 = 0;
    v30 = 1;
    goto LABEL_26;
  }
  if (objc_msgSend(v6, "statusCode") == 200)
  {
    v12 = v6;
    -[NSObject photoData](v12, "photoData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _AAUIPPSLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 32);
        v39 = 138412290;
        v40 = v20;
        _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Success! Status code 200 with image data", (uint8_t *)&v39, 0xCu);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v17);
      -[NSObject cropRect](v12, "cropRect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NSObject cropRect](v12, "cropRect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "CGRectValue");
        v8 = v23;
        v9 = v24;
        v10 = v25;
        v11 = v26;

      }
      objc_msgSend(*(id *)(a1 + 40), "cacheablePictureForPicture:cropRect:", v15, v8, v9, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject serverCacheTag](v12, "serverCacheTag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    if (v19)
    {
      v37 = *(_QWORD *)(a1 + 32);
      v39 = 138412290;
      v40 = v37;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Failure. Status code 200, but no image data", (uint8_t *)&v39, 0xCu);
    }

    goto LABEL_23;
  }
  v31 = objc_msgSend(v6, "statusCode");
  _AAUIPPSLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v31 == 304)
  {
    if (v32)
    {
      v33 = *(_QWORD *)(a1 + 32);
      v39 = 138412290;
      v40 = v33;
      _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Cache still valid.", (uint8_t *)&v39, 0xCu);
    }
LABEL_23:

    v14 = 0;
    v15 = 0;
    v16 = 0;
    v30 = 0;
    v29 = 0;
    goto LABEL_26;
  }
  if (v32)
  {
    v34 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "statusCode"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412546;
    v40 = v34;
    v41 = 2112;
    v42 = v35;
    _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Failure. Status code %@", (uint8_t *)&v39, 0x16u);

  }
  if (v7)
  {
    v36 = v7;
  }
  else
  {
    objc_msgSend(v6, "error");
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v36;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v30 = 0;
LABEL_26:
  v38 = *(_QWORD *)(a1 + 56);
  if (v38)
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, void *, double, double, double, double))(v38 + 16))(v38, v30, v14, v15, v16, v29, v8, v9, v10, v11);

}

- (void)_fetchProfilePictureWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__AAUIProfilePictureStore__fetchProfilePictureWithRequest_personID_completion___block_invoke;
  v10[3] = &unk_1EA2DB438;
  v11 = v8;
  v9 = v8;
  -[AAUIProfilePictureStore _fetchProfilePictureSupersetWithRequest:personID:completion:](self, "_fetchProfilePictureSupersetWithRequest:personID:completion:", a3, a4, v10);

}

uint64_t __79__AAUIProfilePictureStore__fetchProfilePictureWithRequest_personID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a6);
  return result;
}

- (id)_profilePictureForFamilyMemberWithoutMonogramFallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double pictureDiameter;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  AAUIProfilePictureStore *v16;
  id v17;

  v4 = a3;
  if (!-[ACAccount isEnabledForDataclass:](self->_account, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388])|| (-[AAUIProfilePictureStore _familyMemberPersonPicture:](self, "_familyMemberPersonPicture:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    pictureDiameter = self->_pictureDiameter;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __81__AAUIProfilePictureStore__profilePictureForFamilyMemberWithoutMonogramFallback___block_invoke;
    v15 = &unk_1EA2DB2A8;
    v16 = self;
    v17 = v4;
    objc_msgSend(v6, "profilePictureForPersonID:diameter:serverFetchBlock:", v8, &v12, pictureDiameter);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v5, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __81__AAUIProfilePictureStore__profilePictureForFamilyMemberWithoutMonogramFallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchProfilePictureForFamilyMemberFromServer:serverCacheTag:completion:", *(_QWORD *)(a1 + 40), a2, 0);
}

- (void)_fetchProfilePictureForFamilyMemberFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0D20EA0];
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithGrandSlamSigner:", self->_grandSlamSigner);
  objc_msgSend(v8, "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFamilyMemberDSID:", v13);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_activeiTunesAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setiTunesAccount:", v15);

  objc_msgSend(v12, "setServerCacheTag:", v11);
  _AAUIPPSLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "Fetching family member profile picture from server with request %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(v8, "personID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIProfilePictureStore _fetchProfilePictureWithRequest:personID:completion:](self, "_fetchProfilePictureWithRequest:personID:completion:", v12, v18, v10);

}

- (id)_meCardPicture
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  CNContactStore *contactStore;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 IsEmpty;
  NSObject *v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint8_t buf[16];
  uint8_t v34[16];
  CGRect v35;

  v3 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  _AAUIPPSLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Fetching me card picture", buf, 2u);
    }

    contactStore = self->_contactStore;
    -[ACAccount aa_primaryEmail](self->_account, "aa_primaryEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AAUIDefaultFetchDescriptors();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    -[CNContactStore unifiedMeContactMatchingEmailAddress:keysToFetch:error:](contactStore, "unifiedMeContactMatchingEmailAddress:keysToFetch:error:", v7, v8, &v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v32;

    if (v9)
    {
      objc_msgSend(v9, "imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_26;
      _AAUIPPSLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore _meCardPicture].cold.6();

      v12 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v9, "imageData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithData:", v13);

      objc_msgSend(v9, "cropRect");
      IsEmpty = CGRectIsEmpty(v35);
      _AAUIPPSLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (IsEmpty)
      {
        if (v17)
          -[AAUIProfilePictureStore _meCardPicture].cold.4();

        v18 = *MEMORY[0x1E0C9D648];
        v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      else
      {
        if (v17)
          -[AAUIProfilePictureStore _meCardPicture].cold.5();

        objc_msgSend(v9, "cropRect");
      }
      -[AAUIProfilePictureStore cacheablePictureForPicture:cropRect:](self, "cacheablePictureForPicture:cropRect:", v14, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_26:
        -[AAUIProfilePictureStore _monogrammedContactImage:](self, "_monogrammedContactImage:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _AAUIPPSLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore _meCardPicture].cold.3((uint64_t)v22, v24, v25, v26, v27, v28, v29, v30);
    }
    else
    {
      if (v4)
      {
        _AAUIPPSLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[AAUIProfilePictureStore _meCardPicture].cold.2();

      }
      _AAUIPPSLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore _meCardPicture].cold.1();
      v22 = 0;
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup because we are not authorized", v34, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (void)meCardWithVisualIdentity:(id)a3
{
  void (**v4)(id, _QWORD);
  CNContactStore *contactStore;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  void (**v16)(id, _QWORD);
  uint64_t *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  contactStore = self->_contactStore;
  -[ACAccount aa_primaryEmail](self->_account, "aa_primaryEmail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUIDefaultFetchDescriptors();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[CNContactStore unifiedMeContactMatchingEmailAddress:keysToFetch:error:](contactStore, "unifiedMeContactMatchingEmailAddress:keysToFetch:error:", v6, v7, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v25 = v8;

  v10 = v21[5];
  v11 = v10 != 0;
  _AAUIPPSLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v27 = v10 != 0;
    _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "meCard exists %d", buf, 8u);
  }

  objc_msgSend((id)v21[5], "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUIPPSLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v27 = v13 != 0;
    _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "meCard.image exists %d", buf, 8u);
  }

  if (v13)
  {
    v4[2](v4, v21[5]);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke;
    v15[3] = &unk_1EA2DB4D8;
    v18 = v11;
    v17 = &v20;
    v15[4] = self;
    v16 = v4;
    -[AAUIProfilePictureStore fetchRawImageAndCropRectForAccountOwner:](self, "fetchRawImageAndCropRectForAccountOwner:", v15);

  }
  _Block_object_dispose(&v20, 8);

}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  NSObject *v15;
  void *v16;
  UIImage *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  UIImage *v35;
  id v36;
  id v37;
  _BYTE *v38;
  uint64_t v39;
  uint8_t v40[4];
  _BOOL4 v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  _AAUIPPSLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v47.origin.x = a4;
    v47.origin.y = a5;
    v47.size.width = a6;
    v47.size.height = a7;
    NSStringFromCGRect(v47);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v43 = v14;
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "RawImageAndCropRect is %@ %@ %@", buf, 0x20u);

  }
  v17 = (UIImage *)v13;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  UIImageJPEGRepresentation(v17, 1.0);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
  {
    _AAUIPPSLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "meCard exists", v40, 2u);
    }

    v19 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutableCopy");
  }
  else
  {
    _AAUIPPSLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "meCard is missing", v40, 2u);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_firstName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGivenName:", v21);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_lastName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFamilyName:", v22);

  }
  v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  _AAUIPPSLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v40 = 67109120;
    v41 = v23 != 0;
    _os_log_impl(&dword_1DB4ED000, v24, OS_LOG_TYPE_DEFAULT, "raw.image is not nil %d", v40, 8u);
  }

  v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "imageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUIPPSLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v40 = 67109120;
    v41 = v25 != v26;
    _os_log_impl(&dword_1DB4ED000, v27, OS_LOG_TYPE_DEFAULT, "meCard.image is different from rawImage %d", v40, 8u);
  }

  if (v25 != v26 && v23 != 0)
  {
    objc_msgSend(v19, "setImageData:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    objc_msgSend(v19, "setCropRect:", a4, a5, a6, a7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v19);
    _AAUIPPSLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "imageData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 67109120;
      v41 = v29 != 0;
      _os_log_impl(&dword_1DB4ED000, v28, OS_LOG_TYPE_DEFAULT, "rawimagedata on mutable is not nil %d", v40, 8u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v30 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61;
    v34[3] = &unk_1EA2DB4B0;
    v38 = buf;
    v35 = v17;
    v31 = v19;
    v33 = *(void **)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 48);
    v36 = v31;
    v39 = v32;
    v37 = v33;
    objc_msgSend(v30, "fetchProfilePictureForAccountOwner:", v34);

  }
  _Block_object_dispose(buf, 8);

}

uint64_t __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61(uint64_t a1, UIImage *image)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  UIImageJPEGRepresentation(image, 0.8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  _AAUIPPSLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61_cold_2(a1, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(*(id *)(a1 + 40), "setImageData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  _AAUIPPSLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61_cold_1(a1 + 56, v13, v14, v15, v16, v17, v18, v19);

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  _AAUIPPSLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "imageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 67109120;
    v23[1] = v21 != 0;
    _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "serverimagedata on mutable is not nil %d", (uint8_t *)v23, 8u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_decodeImageAndCropRectForContact:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__AAUIProfilePictureStore__decodeImageAndCropRectForContact_completion___block_invoke;
    block[3] = &unk_1EA2DB500;
    v12 = v6;
    v10 = v7;
    v11 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v6 + 2))(v6, 0, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

}

void __72__AAUIProfilePictureStore__decodeImageAndCropRectForContact_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cropRect");
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

- (void)_meCardRawImageAndCropRect:(id)a3
{
  void (**v4)(id, _QWORD, id, double, double, double, double);
  CNContactStore *contactStore;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, id, double, double, double, double))a3;
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    contactStore = self->_contactStore;
    -[ACAccount aa_primaryEmail](self->_account, "aa_primaryEmail");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _AAUIDefaultFetchDescriptors();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    -[CNContactStore unifiedMeContactMatchingEmailAddress:keysToFetch:error:](contactStore, "unifiedMeContactMatchingEmailAddress:keysToFetch:error:", v6, v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v8)
      -[AAUIProfilePictureStore _decodeImageAndCropRectForContact:completion:](self, "_decodeImageAndCropRectForContact:completion:", v8, v4);
    else
      v4[2](v4, 0, v9, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  }
  else
  {
    _AAUIPPSLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup because we are not authorized", buf, 2u);
    }

    v4[2](v4, 0, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

}

- (id)_familyMemberPersonPicture:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  -[AAUIProfilePictureStore _contactWithImageDataMatchingFamilyMember:error:](self, "_contactWithImageDataMatchingFamilyMember:error:", a3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
  {
    -[AAUIProfilePictureStore _monogrammedContactImage:](self, "_monogrammedContactImage:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      _AAUIPPSLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AAUIProfilePictureStore _familyMemberPersonPicture:].cold.1();

    }
    v7 = 0;
  }

  return v7;
}

- (void)_familyMember:(id)a3 rawImageAndCropRect:(id)a4
{
  void (**v6)(id, _QWORD, id, double, double, double, double);
  void *v7;
  id v8;
  id v9;

  v9 = 0;
  v6 = (void (**)(id, _QWORD, id, double, double, double, double))a4;
  -[AAUIProfilePictureStore _contactWithImageDataMatchingFamilyMember:error:](self, "_contactWithImageDataMatchingFamilyMember:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  -[AAUIProfilePictureStore _decodeImageAndCropRectForContact:completion:](self, "_decodeImageAndCropRectForContact:completion:", v7, v6);
  if (v7)
    -[AAUIProfilePictureStore _decodeImageAndCropRectForContact:completion:](self, "_decodeImageAndCropRectForContact:completion:", v7, v6);
  else
    v6[2](v6, 0, v8, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

}

- (id)_monogrammedContactImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AAUIProfilePictureStore _monogrammer](self, "_monogrammer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIProfilePictureStore renderingScope](self, "renderingScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarImageForContacts:scope:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_contactWithImageDataMatchingFamilyMember:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactStore *contactStore;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    v7 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "appleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContactsMatchingEmailAddress:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    contactStore = self->_contactStore;
    _AAUIDefaultFetchDescriptors();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AAUIPPSLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup for family member because we are not authorized", v16, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)_contactSyncsWithiCloud:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _AAUIPPSLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:].cold.3();

  if (objc_msgSend(v6, "isUnified"))
  {
    _AAUIPPSLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:].cold.2();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "linkedContacts", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          if (-[AAUIProfilePictureStore _contactSyncsWithiCloud:error:](self, "_contactSyncsWithiCloud:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a4))
          {
            _AAUIPPSLogSystem();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:].cold.1();
            LOBYTE(v23) = 1;
            goto LABEL_24;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
    }
    goto LABEL_20;
  }
  -[AAUIProfilePictureStore _getAccountIdentifierForContact:error:](self, "_getAccountIdentifierForContact:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ACAccountStore accountWithIdentifier:error:](self->_accountStore, "accountWithIdentifier:error:", v9, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject accountType](v14, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C8F030];
    v18 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    -[NSObject parentAccount](v14, "parentAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v19, "accountType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", v17);

      if (!v23)
      {
LABEL_24:

        goto LABEL_25;
      }
      -[NSObject parentAccount](v14, "parentAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v23) = objc_msgSend(v20, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]);

    goto LABEL_24;
  }
LABEL_20:
  LOBYTE(v23) = 0;
LABEL_25:

  return v23;
}

- (id)_getAccountIdentifierForContact:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForContainerOfContactWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactStore containersMatchingPredicate:error:](self->_contactStore, "containersMatchingPredicate:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C971B0];
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForAccountForContainerWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactStore accountsMatchingPredicate:error:](self->_contactStore, "accountsMatchingPredicate:error:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      && (objc_msgSend(v15, "externalIdentifierString"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "length"),
          v16,
          v17))
    {
      objc_msgSend(v15, "externalIdentifierString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_updateServerProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4
{
  id v6;
  id v7;
  AAUIUpdateMyPhotoRequest *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  AAUIUpdateMyPhotoRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[AAUIUpdateMyPhotoRequest initWithAccount:photo:cropRect:]([AAUIUpdateMyPhotoRequest alloc], "initWithAccount:photo:cropRect:", self->_account, v6, v7);
  _AAUIPPSLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Updating account owner profile picture on server to %@ cropRect %@ with request %@", buf, 0x20u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__AAUIProfilePictureStore__updateServerProfilePictureForAccountOwner_cropRect___block_invoke;
  v12[3] = &unk_1EA2DB528;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[AARequest performRequestWithHandler:](v8, "performRequestWithHandler:", v12);

}

void __79__AAUIProfilePictureStore__updateServerProfilePictureForAccountOwner_cropRect___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "statusCode");
  _AAUIPPSLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 200)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Update profile picture request %@ response: Success! Status code 200", buf, 0xCu);
    }

    if (_AAUILogGreenTeaEnabled())
    {
      v14 = 0;
      _AAUILogGreenTeaWithFormat(CFSTR("Uploaded 1 photos with location to Apple ID"));
      _AAUILogGreenTeaTransmittingPhotosOrVideos();
    }
    v10 = (id *)a1[4];
    v11 = a1[5];
    v12 = a1[6];
    objc_msgSend(v10[1], "aa_personID", v14);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateCacheWithPhoto:cropRect:forPersonID:", v11, v12, v8);
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "statusCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Update profile picture request %@ response: Failure. Status code %@", buf, 0x16u);

  }
}

- (void)updateCacheWithPhoto:(id)a3 cropRect:(id)a4 forPersonID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUIPPSLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.5();

  if (v10)
  {
    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverCacheTagForPersonID:diameter:", v10, self->_pictureDiameter);
    v13 = objc_claimAutoreleasedReturnValue();

    _AAUIPPSLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.4();

    if (v9)
    {
      objc_msgSend(v9, "CGRectValue");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
    }
    else
    {
      v16 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[AAUIProfilePictureStore cacheablePictureForPicture:cropRect:](self, "cacheablePictureForPicture:cropRect:", v8, v16, v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_AAUIRawImageAndCropRectCacheEntry entryWithRawImage:rawCropRect:serverCacheTag:](_AAUIRawImageAndCropRectCacheEntry, "entryWithRawImage:rawCropRect:serverCacheTag:", v8, v13, v16, v18, v20, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_AAUIRawImageAndCropRectCache setEntry:forPersonID:](_AAUIRawImageAndCropRectCache, "setEntry:forPersonID:", v24, v10);
    +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "updateProfilePicture:didReceiveNewPicture:serverCacheTag:forPersonID:", v23, 1, v13, v10);

    _AAUIPPSLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.2();

      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_0);
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.3();

    }
  }
  else
  {
    _AAUIPPSLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.1();
  }

}

void __69__AAUIProfilePictureStore_updateCacheWithPhoto_cropRect_forPersonID___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AAUIProfilePictureStoreDidChange"), 0);

}

- (id)profilePictureForPicture:(id)a3
{
  return -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](self, "_profilePictureForPicture:crop:cropRect:cacheable:", a3, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)profilePictureForPicture:(id)a3 cropRect:(CGRect)a4
{
  return -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](self, "_profilePictureForPicture:crop:cropRect:cacheable:", a3, 1, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)cacheablePictureForPicture:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AAUIProfilePictureStore *v14;
  id v15;
  uint64_t v16;
  void *v17;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (CGRectIsEmpty(v19))
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = self;
    v15 = v9;
    v16 = 0;
  }
  else
  {
    v14 = self;
    v15 = v9;
    v16 = 1;
    v10 = x;
    v11 = y;
    v12 = width;
    v13 = height;
  }
  -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](v14, "_profilePictureForPicture:crop:cropRect:cacheable:", v15, v16, 1, v10, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_profilePictureForPicture:(id)a3 crop:(BOOL)a4 cropRect:(CGRect)a5 cacheable:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v11;
  id v13;
  void *v14;
  double v15;
  double pictureDiameter;
  void *v17;
  void *v18;
  uint64_t v19;
  CGSize v21;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v13 = a3;
  if (v13)
  {
    if (v6)
    {
      +[AAUIServerSuppliedProfilePictureCache sharedCache](AAUIServerSuppliedProfilePictureCache, "sharedCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pictureDiameter");
      pictureDiameter = v15;

    }
    else
    {
      pictureDiameter = self->_pictureDiameter;
    }
    v21.width = pictureDiameter;
    v21.height = pictureDiameter;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, pictureDiameter, pictureDiameter);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addClip");
    if (v11)
    {
      objc_msgSend(v13, "imageByCroppingToRect:", x, y, width, height);
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v19;
    }
    objc_msgSend(v13, "drawInRect:", 0.0, 0.0, pictureDiameter, pictureDiameter);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)fetchImageForAppleAccountPresentation:(id)a3
{
  void (**v4)(id, id, _QWORD, double, double, double, double);
  id v5;

  v4 = (void (**)(id, id, _QWORD, double, double, double, double))a3;
  -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback](self, "profilePictureForAccountOwnerWithoutMonogramFallback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

}

- (double)pictureDiameter
{
  return self->_pictureDiameter;
}

- (int64_t)monogramType
{
  return self->_monogramType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStoreDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)initWithAppleAccount:grandSlamAccount:accountStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore initWithAppleAccount]: AppleAccount exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithGrandSlamSigner:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore initWithGrandSlamSigner]: Getting AppleAccount with personID: %@, from Account Store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithGrandSlamSigner:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore initWithGrandSlamSigner]: AppleAccount is nil. Getting the personID from grandSlam Account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithGrandSlamSigner:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore]: initWithGrandSlamSigner called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)profilePictureForAccountOwnerWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profilePictureForAccountOwnerWithCompletion was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "iCloud profile picture found in cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Signed into iCloud, use profile pic from server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "No image found in cache, will fetch from server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Image fetched from server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_sizedProfilePictureWithFallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Profile picture is nil. Falling back...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_sizedProfilePictureWithFallback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "_sizedProfilePictureWithFallback was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)profilePictureForAccountOwnerWithoutMonogramFallback
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profilePictureForAccountOwnerWithoutMonogramFallback was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchProfilePictureForAccountOwner:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "fetchProfilePictureForAccountOwner was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profileImage is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profileImage not nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Contacts dataclass is enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Performing server fetch for profile picture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_37_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profileImage is nil. Falling back...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchProfilePictureFromCacheForAccountOwner:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[fetchProfilePictureFromCacheForAccountOwner:] Fetching profile picture for account owner from cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveProfilePictureToCache:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Successfully updated user defaults with profile picture cache file path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveProfilePictureToCacheIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Updating the profile picture cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Manually updating server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Contacts was updated using ContactStore on the client which will eventually update the server so we just need to update the two local caches.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:(uint64_t)a3 cropRect:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, a2, a3, "[setProfilePictureForAccountOwner:] contactsPushedToServer %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Contacts pushed to server!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Successfully updated profile picture for account owner!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Failed to save profile picture, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] picture is nil. Setting imageData to nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Picture exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Contact exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "[setProfilePictureForAccountOwner:] Updating profile picture for account owner, cropRect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)profilePictureForLocalContact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "profilePictureForLocalContact was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)monogramForCurrentAccount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "monogramForCurrentAccount was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_contactStoreDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "_contactStoreDidChange called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fallbackProfilePictureForPersonWithFirstName:lastName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "First name and last name exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fallbackProfilePictureForPersonWithFirstName:lastName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "_fallbackProfilePictureForPersonWithFirstName called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_meCardPicture
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Contact imageData is not nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1DB4ED000, a2, a3, "ImageForAccountOwner imgdata not nil %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_61_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "ImageForAccountOwner image is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_familyMemberPersonPicture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to find contact for family member, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_contactSyncsWithiCloud:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "[_contactSyncsWithiCloud:] linkedContact %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_contactSyncsWithiCloud:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[_contactSyncsWithiCloud:] contact.isUnified is true.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_contactSyncsWithiCloud:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[_contactSyncsWithiCloud:] was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: personID is nil. Abort updateCacheWithPhoto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: Cache has changed. Posting a notification.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: After updating Profile picture on the server successfully, tried updating the cache, but, cache did not update‼️", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: profilePictureForPersonID completed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "[AAUIProfilePictureStore]: updateCacheWithPhoto was called.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
