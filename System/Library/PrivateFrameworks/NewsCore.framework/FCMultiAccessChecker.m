@implementation FCMultiAccessChecker

- (FCMultiAccessChecker)initWithAccessCheckers:(id)a3
{
  id v4;
  FCMultiAccessChecker *v5;
  uint64_t v6;
  NSArray *accessCheckers;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessCheckers != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCMultiAccessChecker initWithAccessCheckers:]";
    v13 = 2080;
    v14 = "FCMultiAccessChecker.m";
    v15 = 1024;
    v16 = 28;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCMultiAccessChecker;
  v5 = -[FCAccessChecker init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    accessCheckers = v5->_accessCheckers;
    v5->_accessCheckers = (NSArray *)v6;

  }
  return v5;
}

- (FCMultiAccessChecker)init
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
    v8 = "-[FCMultiAccessChecker init]";
    v9 = 2080;
    v10 = "FCMultiAccessChecker.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMultiAccessChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCMultiAccessChecker accessCheckers](self, "accessCheckers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__FCMultiAccessChecker_canSynchronouslyCheckAccessToItem___block_invoke;
  v9[3] = &unk_1E4649530;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "fc_containsObjectPassingTest:", v9) ^ 1;

  return v7;
}

uint64_t __58__FCMultiAccessChecker_canSynchronouslyCheckAccessToItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canSynchronouslyCheckAccessToItem:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  unint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  -[FCMultiAccessChecker accessCheckers](self, "accessCheckers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__FCMultiAccessChecker_hasAccessToItem_blockedReason_error___block_invoke;
  v12[3] = &unk_1E4649558;
  v14 = &v17;
  v10 = v8;
  v13 = v10;
  v15 = a4;
  v16 = a5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  LOBYTE(a5) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)a5;
}

uint64_t __60__FCMultiAccessChecker_hasAccessToItem_blockedReason_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasAccessToItem:blockedReason:error:", a1[4], a1[6], a1[7]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
  return result;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_group_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v38 = "-[FCMultiAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    v39 = 2080;
    v40 = "FCMultiAccessChecker.m";
    v41 = 1024;
    v42 = 72;
    v43 = 2114;
    v44 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
    *(_DWORD *)buf = 136315906;
    v38 = "-[FCMultiAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    v39 = 2080;
    v40 = "FCMultiAccessChecker.m";
    v41 = 1024;
    v42 = 73;
    v43 = 2114;
    v44 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = dispatch_group_create();
  -[FCMultiAccessChecker accessCheckers](self, "accessCheckers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
  v31[3] = &unk_1E46495A8;
  v15 = v12;
  v32 = v15;
  v16 = v8;
  v33 = v16;
  v36 = a4;
  v17 = v10;
  v34 = v17;
  v18 = v11;
  v35 = v18;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v31);
  if (FCDispatchGroupIsEmpty(v15))
  {
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3;
    v29[3] = &unk_1E4646E50;
    v19 = (id *)v30;
    v30[0] = v13;
    v20 = v17;
    v30[1] = v20;
    v30[2] = v18;
    v30[3] = v9;
    __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3((uint64_t)v29);
  }
  else
  {
    FCDispatchQueueForQualityOfService(a4);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_4;
    block[3] = &unk_1E4646E50;
    v19 = &v25;
    v25 = v13;
    v26 = v17;
    v27 = v18;
    v28 = v9;
    dispatch_group_notify(v15, v21, block);

    v20 = v26;
  }

}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_group_enter(v5);
  v7 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_2;
  v9[3] = &unk_1E4649580;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v13 = a3;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v6, "checkAccessToItem:withQualityOfService:completion:", v8, v7, v9);

}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (v10)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = 6;
    while (1)
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v11;
      if (v11)
        break;
      v7 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (v10)
      {
        v6 = 0;
        v3 = v10;
        break;
      }
      if (++v2 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v3 = 0;
    v6 = 0;
  }
  v12 = v6;
  (*(void (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3 == 0, v3);

}

void __74__FCMultiAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = 6;
    while (1)
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v11;
      if (v11)
        break;
      v7 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (v10)
      {
        v6 = 0;
        v3 = v10;
        break;
      }
      if (++v2 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v3 = 0;
    v6 = 0;
  }
  v12 = v6;
  (*(void (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3 == 0, v3);

}

- (NSArray)accessCheckers
{
  return self->_accessCheckers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessCheckers, 0);
}

@end
