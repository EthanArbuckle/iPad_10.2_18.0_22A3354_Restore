@implementation IKURLBagCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__IKURLBagCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (id)sharedCache_inMemoryBagCache;
}

void __28__IKURLBagCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedCache_inMemoryBagCache;
  sharedCache_inMemoryBagCache = (uint64_t)v0;

}

- (IKURLBagCache)init
{
  IKURLBagCache *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SSURLBag *urlBag;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IKURLBagCache;
  v2 = -[IKURLBagCache init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DAF658];
    objc_msgSend((id)objc_opt_class(), "URLBagContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLBagForContext:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    urlBag = v2->_urlBag;
    v2->_urlBag = (SSURLBag *)v5;

    ITMLKitGetLogObject(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[IKURLBagCache init].cold.1();

    -[IKURLBagCache updateWithInvalidation:](v2, "updateWithInvalidation:", 0);
  }
  return v2;
}

- (void)updateWithInvalidation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;

  v3 = a3;
  ITMLKitGetLogObject(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[IKURLBagCache updateWithInvalidation:].cold.1();

  if (v3)
  {
    -[IKURLBagCache urlBag](self, "urlBag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  -[IKURLBagCache _loadWithNotification:completion:](self, "_loadWithNotification:completion:", 1, 0);
}

- (void)_loadWithNotification:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[IKURLBagCache urlBag](self, "urlBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__IKURLBagCache__loadWithNotification_completion___block_invoke;
  v9[3] = &unk_1E9F4BEC8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a3;
  objc_msgSend(v7, "loadWithCompletionBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  BOOL v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_19;
  v9 = v5 == 0;
  if (!v5)
  {
    ITMLKitGetLogObject(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_2();
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "existingDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isEqualToDictionary:", v10);

  if ((v11 & 1) == 0)
  {
    v13 = objc_msgSend(v5, "copy");
    v14 = (void *)v8[2];
    v8[2] = v13;

    ITMLKitGetLogObject(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D95F2000, v12, OS_LOG_TYPE_INFO, "URL Bag is different. Replacing current existing dictionary...", v20, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
  {
    objc_msgSend(v8, "existingDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v16, v6);

  }
  if (*(_BYTE *)(a1 + 48))
    v17 = v9;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    ITMLKitGetLogObject(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_1(v18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("IKURLBagCacheUpdatedNotification"), v8);

  }
LABEL_19:

}

- (id)valueForKey:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__IKURLBagCache_valueForKey___block_invoke;
  v9[3] = &unk_1E9F4BEF0;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[IKURLBagCache loadValueForKey:completion:](self, "loadValueForKey:completion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __29__IKURLBagCache_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_urlForKey:(id)a3
{
  void *v3;
  void *v4;

  -[IKURLBagCache valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)loadValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__IKURLBagCache_loadValueForKey_completion___block_invoke;
  v10[3] = &unk_1E9F4BF18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[IKURLBagCache _loadWithNotification:completion:](self, "_loadWithNotification:completion:", 1, v10);

}

void __44__IKURLBagCache_loadValueForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    ITMLKitGetLogObject(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__IKURLBagCache_loadValueForKey_completion___block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v6, v5);

}

- (BOOL)isTrustedURL:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__IKURLBagCache_isTrustedURL___block_invoke;
  v8[3] = &unk_1E9F4BF40;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[IKURLBagCache checkTrustStatusForURL:completion:](self, "checkTrustStatusForURL:completion:", v4, v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

intptr_t __30__IKURLBagCache_isTrustedURL___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)checkTrustStatusForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IKURLBagCache urlBag](self, "urlBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke;
  v11[3] = &unk_1E9F4BF68;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getTrustForURL:completionBlock:", v10, v11);

}

void __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    ITMLKitGetLogObject(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

+ (id)URLBagContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF4A0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", v4, *MEMORY[0x1E0DAFA58]);

  return v2;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)CFSTR("IKAMSBagShim");
}

- (NSString)profileVersion
{
  return (NSString *)CFSTR("1");
}

- (id)URLForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 5);
}

- (id)arrayForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 0);
}

- (id)BOOLForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 1);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke;
  v6[3] = &unk_1E9F4BF90;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IKURLBagCache _loadWithNotification:completion:](self, "_loadWithNotification:completion:", 1, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    ITMLKitGetLogObject(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_1(v14);
    goto LABEL_10;
  }
  if (!v5)
  {
    ITMLKitGetLogObject(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_2();
LABEL_10:

    v15 = *(_QWORD *)(a1 + 32);
    AMSError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v8);
    goto LABEL_15;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CFDC40]);
  objc_msgSend(v8, "setData:", v5);
  objc_msgSend(WeakRetained, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpirationDate:", v9);

  objc_msgSend(WeakRetained, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProfile:", v10);

  objc_msgSend(WeakRetained, "profileVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProfileVersion:", v11);

  v19 = 0;
  objc_msgSend(v8, "buildWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    ITMLKitGetLogObject(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_3();

    v17 = *(_QWORD *)(a1 + 32);
    AMSError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

  }
LABEL_15:

}

- (id)dictionaryForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 6);
}

- (id)doubleForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 2);
}

- (id)integerForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 3);
}

- (id)stringForKey:(id)a3
{
  return -[IKURLBagCache _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 4);
}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (a4 == 5)
    -[IKURLBagCache _urlForKey:](self, "_urlForKey:", v6);
  else
    -[IKURLBagCache valueForKey:](self, "valueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CFD9F8], "frozenBagValueWithKey:value:valueType:", v6, v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSErrorWithFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFD9F8], "failingBagValueWithKey:valueType:error:", v6, a4, v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (SSURLBag)urlBag
{
  return self->_urlBag;
}

- (NSDictionary)existingDictionary
{
  return self->_existingDictionary;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_existingDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
}

- (void)init
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D95F2000, v0, OS_LOG_TYPE_DEBUG, "Started %@ and sending first update...", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)updateWithInvalidation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1D95F2000, v1, OS_LOG_TYPE_DEBUG, "Update bag cache (%@) with invalidation: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D95F2000, log, OS_LOG_TYPE_DEBUG, "Posting bag update notification...", v1, 2u);
}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "Unable to fetch URL Bag: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__IKURLBagCache_loadValueForKey_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1D95F2000, v0, v1, "Error fetching %@ in URL Bag: %@");
  OUTLINED_FUNCTION_3();
}

void __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1D95F2000, v0, v1, "Error getting trust status for URL (%@): %@");
  OUTLINED_FUNCTION_3();
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D95F2000, log, OS_LOG_TYPE_ERROR, "Someone called -[AMSBag createSnapshotWithCompletion:] but didn't hold onto a reference to the original AMSBag.", v1, 2u);
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "Failed to load the bag. Unable to create a snapshot. error = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1D95F2000, v0, v1, "Failed to create the snapshot. error = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
