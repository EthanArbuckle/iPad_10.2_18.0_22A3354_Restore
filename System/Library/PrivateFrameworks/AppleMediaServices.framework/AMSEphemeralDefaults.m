@implementation AMSEphemeralDefaults

uint64_t __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)preferEphemeralURLSessions
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("preferEphemeralURLSessions"), MEMORY[0x1E0C9AAA0], objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)processAssertionsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("processAssertionsEnabled"), MEMORY[0x1E0C9AAB0], objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)suppressEngagement
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("suppressEngagement"), MEMORY[0x1E0C9AAA0], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("suppressEngagement"), MEMORY[0x1E0C9AAA0], objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_propertyForKey:(id)a3 defaultValue:(id)a4 expectedType:(Class)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v17 = (id *)&v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__30;
  v20 = __Block_byref_object_dispose__30;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__AMSEphemeralDefaults__propertyForKey_defaultValue_expectedType___block_invoke;
  v13[3] = &unk_1E253D528;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  objc_msgSend(a1, "_accessDataStoreUsingBlock:", v13);
  v10 = v17[5];
  if (!v10)
  {
    objc_storeStrong(v17 + 5, a4);
    v10 = v17[5];
  }
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (void)_accessDataStoreUsingBlock:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (qword_1ECEAD1C0 != -1)
    dispatch_once(&qword_1ECEAD1C0, &__block_literal_global_50);
  v4 = _MergedGlobals_104;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke_2;
  block[3] = &unk_1E2541A30;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __66__AMSEphemeralDefaults__propertyForKey_defaultValue_expectedType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __51__AMSEphemeralDefaults__accessDataStoreUsingBlock___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSEphemeralDefaults", 0);
  v1 = (void *)_MergedGlobals_104;
  _MergedGlobals_104 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)qword_1ECEAD1B8;
  qword_1ECEAD1B8 = (uint64_t)v2;

}

+ (void)setHARLoggingItemLimit:(int64_t)a3
{
  id v3;

  if (a3 == -1)
  {
    +[AMSHTTPArchiveController setMaxBufferSizeOverride:](AMSHTTPArchiveController, "setMaxBufferSizeOverride:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSHTTPArchiveController setMaxBufferSizeOverride:](AMSHTTPArchiveController, "setMaxBufferSizeOverride:", v3);

  }
}

+ (int64_t)HARLoggingItemLimit
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int64_t v6;

  +[AMSHTTPArchiveController maxBufferSizeOverride](AMSHTTPArchiveController, "maxBufferSizeOverride");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E25AF530;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (BOOL)preferEphemeralImageLoader
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("preferEphemeralImageLoader"), MEMORY[0x1E0C9AAB0], objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)purchaseAccountFallback
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("purchaseAccountFallback"), MEMORY[0x1E0C9AAA0], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_propertyForKey:defaultValue:expectedType:", CFSTR("purchaseAccountFallback"), MEMORY[0x1E0C9AAA0], objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)setPreferEphemeralImageLoader:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setProperty:forKey:", v4, CFSTR("preferEphemeralImageLoader"));

}

+ (void)setPreferEphemeralURLSessions:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setProperty:forKey:", v4, CFSTR("preferEphemeralURLSessions"));

}

+ (void)setProcessAssertionsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setProperty:forKey:", v4, CFSTR("processAssertionsEnabled"));

}

+ (void)setPurchaseAccountFallback:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setProperty:forKey:", v4, CFSTR("purchaseAccountFallback"));

}

+ (void)setSuppressEngagement:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setProperty:forKey:", v4, CFSTR("suppressEngagement"));

}

+ (BOOL)bagKeyRegistrationEnabled
{
  return 0;
}

+ (BOOL)HARLoggingEnabled
{
  return 1;
}

+ (void)_setProperty:(id)a3 forKey:(id)a4
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
  v10[2] = __44__AMSEphemeralDefaults__setProperty_forKey___block_invoke;
  v10[3] = &unk_1E2541A08;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_accessDataStoreUsingBlock:", v10);

}

uint64_t __44__AMSEphemeralDefaults__setProperty_forKey___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(a2, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(result + 40));
  return result;
}

@end
