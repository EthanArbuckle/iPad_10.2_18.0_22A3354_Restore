@implementation BKSTerminationAssertion

- (unint64_t)_bksErrorForRBSRequestError:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return 0;
  else
    return qword_1B079AAA0[a3 - 1];
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BKSTerminationAssertion *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[BKSTerminationContext terminationAssertionContext](BKSTerminationContext, "terminationAssertionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BKSTerminationAssertion initWithBundleIdentifier:efficacy:name:context:withHandler:](self, "initWithBundleIdentifier:efficacy:name:context:withHandler:", v12, a4, v11, v13, v10);

  return v14;
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 context:(id)a6 withHandler:(id)a7
{
  id v12;
  id v13;
  BKSTerminationAssertion *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  BKSTerminationContext *context;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BKSTerminationAssertion;
  v14 = -[BKSAssertion _initWithName:handler:](&v25, sel__initWithName_handler_, a5, a7);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v14->_efficacy = a4;
    v17 = objc_msgSend(v13, "copy");
    context = v14->_context;
    v14->_context = (BKSTerminationContext *)v17;

    objc_msgSend(MEMORY[0x1E0D87DF8], "systemTarget");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSAssertion _setTarget:](v14, "_setTarget:", v19);

    v20 = (void *)MEMORY[0x1E0D87D38];
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "limitationWithPredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSAssertion _setAttributes:](v14, "_setAttributes:", v23);

    -[BKSAssertion _acquireAsynchronously](v14, "_acquireAsynchronously");
  }

  return v14;
}

- (BOOL)acquire
{
  uint64_t v2;
  char v3;
  _QWORD v5[7];
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__46;
  v11[4] = __Block_byref_object_dispose__47;
  v12 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__BKSTerminationAssertion_acquire__block_invoke;
  v6[3] = &unk_1E61697D0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = v11;
  v6[7] = &v13;
  -[BKSAssertion _lock:](self, "_lock:", v6);
  if (v14[5])
  {
    v5[0] = v2;
    v5[1] = 3221225472;
    v5[2] = __34__BKSTerminationAssertion_acquire__block_invoke_2;
    v5[3] = &unk_1E61697F8;
    v5[4] = &v13;
    v5[5] = &v7;
    v5[6] = v11;
    objc_msgSend(MEMORY[0x1E0D87E18], "performBackgroundWork:", v5);
  }
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

void __34__BKSTerminationAssertion_acquire__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), getuid(), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D87E00]);
  objc_msgSend(v3, "setExceptionCode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "exceptionCode"));
  objc_msgSend(*(id *)(a1 + 32), "_lock_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExplanation:", v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v5 == 2)
    v6 = 30;
  else
    v6 = 20;
  if (v5 == 3)
    v7 = 40;
  else
    v7 = v6;
  objc_msgSend(v3, "setMaximumTerminationResistance:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithProcessIdentity:context:", v2, v3);
  v23 = 0;
  v24 = 0;
  v9 = objc_msgSend(v8, "execute:error:", &v24, &v23);
  v10 = v24;
  v11 = v23;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_lock_setInternalAssertion:", v10);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && v10)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D87E40]) & 1) != 0)
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 3)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {

    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_msgSend(*(id *)(a1 + 32), "_bksErrorForRBSRequestError:", objc_msgSend(v11, "code"));
    objc_msgSend(v11, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BKSAssertionError"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  objc_msgSend(*(id *)(a1 + 32), "_lock_acquisitionHandler");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

}

uint64_t __34__BKSTerminationAssertion_acquire__block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)invalidate
{
  -[BKSAssertion _invalidateSynchronously:](self, "_invalidateSynchronously:", 1);
}

- (unint64_t)efficacy
{
  return self->_efficacy;
}

- (NSString)targetBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BKSTerminationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
