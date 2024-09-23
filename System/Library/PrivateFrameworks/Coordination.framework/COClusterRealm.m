@implementation COClusterRealm

- (id)_initWithPredicate:(id)a3
{
  id v4;
  COClusterRealm *v5;
  COClusterRealm *v6;
  NSString *identifier;
  uint64_t v8;
  NSPredicate *predicate;
  id updateHandler;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COClusterRealm;
  v5 = -[COClusterRealm init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    identifier = v5->_identifier;
    v5->_identifier = 0;

    v8 = objc_msgSend(v4, "copy");
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v8;

    updateHandler = v6->_updateHandler;
    v6->_updateHandler = 0;

    v6->_updateHandlerInvoked = 0;
  }

  return v6;
}

+ (id)realmWithMediaGroup:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE64B88], "predicateForGroup:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPredicate:", v4);

  return v5;
}

+ (id)realmWithPredicate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPredicate:", v4);

  return v5;
}

- (COClusterRealm)initWithCoder:(id)a3
{
  id v4;
  COClusterRealm *v5;
  COClusterRealm *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v5 = (COClusterRealm *)objc_claimAutoreleasedReturnValue();
    -[COClusterRealm allowEvaluation](v5, "allowEvaluation");
    if (v5)
    {
      v6 = -[COClusterRealm _initWithPredicate:](self, "_initWithPredicate:", v5);
    }
    else
    {

      v6 = 0;
    }
    self = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[COClusterRealm predicate](self, "predicate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predicate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[COClusterRealm predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithPredicate:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterRealm identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterRealm predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id(%@), p(%@)>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COClusterRealm predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COClusterRealm *v4;
  COClusterRealm *v5;
  BOOL v6;

  v4 = (COClusterRealm *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[COClusterRealm isEqualToClusterRealm:](self, "isEqualToClusterRealm:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToClusterRealm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COClusterRealm predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (void)_setIdentifierLocked:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)_setUpdateHandlerLocked:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id updateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = (void *)MEMORY[0x212BE9A2C](v5);

  updateHandler = self->_updateHandler;
  self->_updateHandler = v6;

  self->_updateHandlerInvoked = 0;
}

- (void)activate:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __27__COClusterRealm_activate___block_invoke;
    v5[3] = &unk_24CD3ED38;
    v5[4] = self;
    v6 = v4;
    -[COClusterRealm _withLock:](self, "_withLock:", v5);
    -[COClusterRealm _startQuery](self, "_startQuery");

  }
}

void __27__COClusterRealm_activate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  COLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 134218242;
    v10 = v3;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21214B000, v2, OS_LOG_TYPE_DEFAULT, "%p realm activating %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

}

- (void)_startQuery
{
  void *v3;
  void *v4;
  MGGroupQuery *v5;
  MGGroupQuery *query;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BE64BA8];
  -[COClusterRealm predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__COClusterRealm__startQuery__block_invoke;
  v7[3] = &unk_24CD3ED60;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "queryWithPredicate:updateHandler:", v4, v7);
  v5 = (MGGroupQuery *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __29__COClusterRealm__startQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleQueryResult:error:", v8, v5);

}

- (void)_handleQueryResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t *);
  void *v13;
  COClusterRealm *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __43__COClusterRealm__handleQueryResult_error___block_invoke;
  v13 = &unk_24CD3ED88;
  v14 = self;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v17 = &v18;
  -[COClusterRealm _withLock:](self, "_withLock:", &v10);
  if (*((_BYTE *)v19 + 24)
    || !-[COClusterRealm updateHandlerInvoked](self, "updateHandlerInvoked", v10, v11, v12, v13, v14, v15))
  {
    -[COClusterRealm _invokeUpdateHandler](self, "_invokeUpdateHandler", v10, v11, v12, v13, v14);
  }

  _Block_object_dispose(&v18, 8);
}

void __43__COClusterRealm__handleQueryResult_error___block_invoke(uint64_t *a1)
{
  uint64_t *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 4;
  objc_msgSend((id)a1[4], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[5])
  {
    COLogForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__COClusterRealm__handleQueryResult_error___block_invoke_cold_1(v2, a1 + 5, v4);

    v5 = 0;
    if (!v3)
    {
LABEL_8:
      if (!v5 || (objc_msgSend(v5, "isEqual:", v3) & 1) != 0)
        goto LABEL_13;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend((id)a1[4], "_identifierForGroupResult:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqual:", v5))
    goto LABEL_8;
LABEL_10:
  COLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *v2;
    v11 = 134218498;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_21214B000, v6, OS_LOG_TYPE_DEFAULT, "%p realm identifier changing to %@ from %@", (uint8_t *)&v11, 0x20u);
  }

  v8 = objc_msgSend(v5, "copy");
  v9 = a1[4];
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v8;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
LABEL_13:

}

- (id)_identifierForGroupResult:(id)a3
{
  id v4;
  uint64_t DigestSize;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  COClusterRealm *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  COClusterRealm *v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DigestSize = CryptoHashDescriptorGetDigestSize();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  CryptoHashInit();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v24 = self;
    v9 = 0;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          ++v9;
          v14 = objc_retainAutorelease(v13);
          objc_msgSend(v14, "bytes");
          objc_msgSend(v14, "length");
          CryptoHashUpdate();
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);

    self = v24;
    if (v9)
    {
      v15 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", DigestSize));
      objc_msgSend(v15, "mutableBytes");
      CryptoHashFinal();
      v16 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      v17 = objc_retainAutorelease(v15);
      v18 = -[NSObject bytes](v17, "bytes");
      if (DigestSize)
      {
        v19 = (unsigned __int8 *)v18;
        do
        {
          v20 = *v19++;
          objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("%hhX"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v21;
          --DigestSize;
        }
        while (DigestSize);
      }
      else
      {
        v21 = v16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("r-mg-%lX-%@"), v9, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
  }
  else
  {

  }
  COLogForCategory(7);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = self;
    _os_log_impl(&dword_21214B000, v17, OS_LOG_TYPE_DEFAULT, "%p received empty result, so no identifier", buf, 0xCu);
  }
  v22 = 0;
LABEL_21:

  return v22;
}

uint64_t __44__COClusterRealm__identifierForGroupResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_invokeUpdateHandler
{
  uint64_t v2;
  _QWORD v3[7];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__22;
  v8 = __Block_byref_object_dispose__23;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__COClusterRealm__invokeUpdateHandler__block_invoke;
  v3[3] = &unk_24CD3EDF0;
  v3[4] = self;
  v3[5] = &v10;
  v3[6] = &v4;
  -[COClusterRealm _withLock:](self, "_withLock:", v3);
  v2 = v11[5];
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v5[5]);
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

void __38__COClusterRealm__invokeUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (MGGroupQuery)query
{
  return self->_query;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)updateHandlerInvoked
{
  return self->_updateHandlerInvoked;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __43__COClusterRealm__handleQueryResult_error___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218242;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_21214B000, log, OS_LOG_TYPE_ERROR, "%p realm error querying groups %@", (uint8_t *)&v5, 0x16u);
}

@end
