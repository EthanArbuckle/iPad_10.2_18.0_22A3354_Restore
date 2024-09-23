@implementation AMSUnitTests

+ (BOOL)isRunningUnitTests
{
  Class v2;
  SEL v3;
  void *v4;
  void *v5;
  char v7;

  v2 = NSClassFromString(CFSTR("XCTestProbe"));
  if (v2)
  {
    v3 = NSSelectorFromString(CFSTR("isTesting"));
    -[objc_class methodSignatureForSelector:](v2, "methodSignatureForSelector:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelector:", v3);
    objc_msgSend(v5, "invokeWithTarget:", v2);
    v7 = 0;
    objc_msgSend(v5, "getReturnValue:", &v7);
    LOBYTE(v2) = v7 != 0;

  }
  return (char)v2;
}

+ (id)encryptionKeyForDataProtectionClass:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUnitTests_encryptionKeyForDataProtectionClass___block_invoke;
  v5[3] = &unk_1E2546680;
  v5[4] = &v6;
  v5[5] = a1;
  v5[6] = a3;
  objc_msgSend(a1, "_sync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__AMSUnitTests_encryptionKeyForDataProtectionClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "_encryptionKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)setEncryptionKey:(id)a3 forDataProtectionClass:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  unint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__AMSUnitTests_setEncryptionKey_forDataProtectionClass___block_invoke;
  v8[3] = &unk_1E25466A8;
  v10 = a1;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_sync:", v8);

}

void __56__AMSUnitTests_setEncryptionKey_forDataProtectionClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_encryptionKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

+ (id)_encryptionKeys
{
  if (_MergedGlobals_148 != -1)
    dispatch_once(&_MergedGlobals_148, &__block_literal_global_129);
  return (id)qword_1ECEAD8F8;
}

void __31__AMSUnitTests__encryptionKeys__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECEAD8F8;
  qword_1ECEAD8F8 = (uint64_t)v0;

}

+ (void)_sync:(id)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  id v5;

  v3 = qword_1ECEAD900;
  v4 = (void (**)(_QWORD))a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECEAD900, &__block_literal_global_6_1);
  v5 = (id)qword_1ECEAD908;
  objc_msgSend(v5, "lock");
  v4[2](v4);

  objc_msgSend(v5, "unlock");
}

void __22__AMSUnitTests__sync___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)qword_1ECEAD908;
  qword_1ECEAD908 = (uint64_t)v0;

}

@end
