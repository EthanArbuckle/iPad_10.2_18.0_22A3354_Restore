@implementation AMSThreadSafeSet

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSThreadSafeSet backingSet](self, "backingSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__AMSThreadSafeSet_addObject___block_invoke;
  v7[3] = &unk_1E2546540;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

id __33__AMSThreadSafeSet_removeObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  return v3;
}

id __30__AMSThreadSafeSet_addObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
  return v3;
}

- (void)removeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSThreadSafeSet backingSet](self, "backingSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__AMSThreadSafeSet_removeObject___block_invoke;
  v7[3] = &unk_1E2546540;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

- (AMSThreadSafeObject)backingSet
{
  return self->_backingSet;
}

- (AMSThreadSafeSet)init
{
  AMSThreadSafeSet *v2;
  AMSThreadSafeObject *v3;
  id v4;
  uint64_t v5;
  AMSThreadSafeObject *backingSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSThreadSafeSet;
  v2 = -[AMSThreadSafeSet init](&v8, sel_init);
  if (v2)
  {
    v3 = [AMSThreadSafeObject alloc];
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = -[AMSThreadSafeObject initWithObject:](v3, "initWithObject:", v4);
    backingSet = v2->_backingSet;
    v2->_backingSet = (AMSThreadSafeObject *)v5;

  }
  return v2;
}

- (NSArray)allObjects
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__68;
  v10 = __Block_byref_object_dispose__68;
  v11 = (id)MEMORY[0x1E0C9AA60];
  -[AMSThreadSafeSet backingSet](self, "backingSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AMSThreadSafeSet_allObjects__block_invoke;
  v5[3] = &unk_1E2546518;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__AMSThreadSafeSet_allObjects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AMSThreadSafeSet backingSet](self, "backingSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__AMSThreadSafeSet_count__block_invoke;
  v5[3] = &unk_1E2546518;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__AMSThreadSafeSet_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  -[AMSThreadSafeSet backingSet](self, "backingSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__AMSThreadSafeSet_containsObject___block_invoke;
  v8[3] = &unk_1E2546568;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "read:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __35__AMSThreadSafeSet_containsObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setBackingSet:(id)a3
{
  objc_storeStrong((id *)&self->_backingSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingSet, 0);
}

@end
