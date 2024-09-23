@implementation PHAssociatedObjectsTable

- (PHAssociatedObjectsTable)init
{
  PHAssociatedObjectsTable *v2;
  uint64_t i;
  uint64_t v4;
  Class *v5;
  Class v6;
  PHAssociatedObjectsTable *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHAssociatedObjectsTable;
  v2 = -[PHAssociatedObjectsTable init](&v9, sel_init);
  if (v2)
  {
    for (i = 0; i != 16; ++i)
    {
      v2->_locks[i]._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 514, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = &v2->super.isa + i;
      v6 = v5[9];
      v5[9] = (Class)v4;

    }
    v7 = v2;
  }

  return v2;
}

- (int64_t)stripeCount
{
  return 16;
}

- (id)associatedObjectOnObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    -[PHAssociatedObjectsTable _entryForObject:](self, v7);
    v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0;
    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_6;
LABEL_3:
  -[PHAssociatedObjectsTable _entryForObject:](self, v7);
  v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v9;
LABEL_4:
  -[PHAssociatedObjectsEntry associatedObjectForKey:](v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setAssociatedObject:(id)a3 onObject:(id)a4 forKey:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = v18;
    v15 = 0;
    goto LABEL_4;
  }
  if (!v10)
    goto LABEL_6;
LABEL_3:
  -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = v18;
  v15 = v11;
LABEL_4:
  -[PHAssociatedObjectsEntry setAssociatedObject:forKey:](v12, v14, v15);

}

- (id)setAssociatedObjectIfNotSet:(id)a3 onObject:(id)a4 forKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    if (v12)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = v9;
    v16 = 0;
    goto LABEL_4;
  }
  if (!v11)
    goto LABEL_6;
LABEL_3:
  -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = v9;
  v16 = v12;
LABEL_4:
  -[PHAssociatedObjectsEntry setAssociatedObjectIfNotSet:forKey:](v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)removeAssociatedObjectOnObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = v15;
  v9 = v7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    v8 = 0;
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    -[PHAssociatedObjectsTable _entryForObject:](self, v15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    goto LABEL_4;
  }
  if (!v7)
    goto LABEL_6;
LABEL_3:
  -[PHAssociatedObjectsTable _entryForObject:](self, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = v9;
LABEL_4:
  -[PHAssociatedObjectsEntry setAssociatedObject:forKey:](v10, 0, v12);

}

- (void)removeAllAssociatedObjectsOnObject:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssociatedObjectsTable.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PHAssociatedObjectsTable_removeAllAssociatedObjectsOnObject___block_invoke;
  v8[3] = &unk_1E35DBAC8;
  v9 = v5;
  v6 = v5;
  -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)self, v6, v8);

}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 192; i != 64; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

uint64_t __63__PHAssociatedObjectsTable_removeAllAssociatedObjectsOnObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)_runWithLockedBucketForObject:(void *)a3 block:
{
  id v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);
  id v8;

  v5 = a2;
  if (a1)
  {
    v6 = v5 >> 4;
    v8 = v5;
    v7 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4 * v6 + 8));
    v7[2](v7, *(_QWORD *)(a1 + 8 * v6 + 72));

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4 * v6 + 8));
    v5 = v8;
  }

}

- (id)_entryForObject:(id)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__26861;
    v13 = __Block_byref_object_dispose__26862;
    v14 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__PHAssociatedObjectsTable__entryForObject___block_invoke;
    v6[3] = &unk_1E35DBAA0;
    v8 = &v9;
    v7 = v3;
    -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)a1, v7, v6);
    a1 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

void __44__PHAssociatedObjectsTable__entryForObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_entryForObjectCreatingIfNecessary:(id)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__26861;
    v13 = __Block_byref_object_dispose__26862;
    v14 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__PHAssociatedObjectsTable__entryForObjectCreatingIfNecessary___block_invoke;
    v6[3] = &unk_1E35DBAA0;
    v8 = &v9;
    v7 = v3;
    -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)a1, v7, v6);
    a1 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

void __63__PHAssociatedObjectsTable__entryForObjectCreatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PHAssociatedObjectsEntry *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = objc_alloc_init(PHAssociatedObjectsEntry);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

@end
