@implementation DACActivityList

- (DACActivityList)init
{
  DACActivityList *v2;
  DACActivityList *v3;
  uint64_t v4;
  NSMutableArray *activeActivities;
  uint64_t v6;
  NSDate *lastModified;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DACActivityList;
  v2 = -[DACActivityList init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    activeActivities = v3->_activeActivities;
    v3->_activeActivities = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
    lastModified = v3->_lastModified;
    v3->_lastModified = (NSDate *)v6;

  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, stack: {"), v5, self);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__DACActivityList_description__block_invoke;
  v10[3] = &unk_24ED133C8;
  v10[4] = self;
  v10[5] = &v11;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v10);
  objc_msgSend((id)v12[5], "stringByAppendingString:", CFSTR("}>"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v12[5];
  v12[5] = v6;

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __30__DACActivityList_description__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  void (**v3)(_QWORD);

  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (DACActivityList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  DACActivityList *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  int v16;
  DACActivityList *v17;
  NSObject *v19;
  NSDate *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  DACActivityList *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    DACLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v28 = self;
      _os_log_error_impl(&dword_224FBF000, v8, OS_LOG_TYPE_ERROR, "%p failed to initialize with coder: invalid version", buf, 0xCu);
    }
    v17 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (DACActivityList *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("activeActivities"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModified"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = v11;
      v22 = v9;
      v13 = *(_QWORD *)v24;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            v14 = 0;
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v12);
      v16 = v14 & 1;
      v9 = v22;
    }
    else
    {
      v16 = 1;
    }

    if (!v16 || v9 == 0)
    {
LABEL_22:
      DACLogForCategory(1);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v28 = self;
        _os_log_error_impl(&dword_224FBF000, v19, OS_LOG_TYPE_ERROR, "%p failed to initialize with coder: invalid types", buf, 0xCu);
      }

      v17 = 0;
    }
    else
    {
      v17 = -[DACActivityList init](self, "init");
      objc_storeStrong((id *)&v17->_activeActivities, v8);
      v20 = v9;
      self = (DACActivityList *)v17->_lastModified;
      v17->_lastModified = v20;
    }

    self = v7;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DACActivityList *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__DACActivityList_encodeWithCoder___block_invoke;
  v6[3] = &unk_24ED13280;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v6);

}

uint64_t __35__DACActivityList_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", 1, CFSTR("version"));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(_QWORD *)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", v3, CFSTR("activeActivities"));
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("lastModified"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACActivityList *v4;
  DACActivityList *v5;
  DACActivityList *v6;
  _QWORD v8[4];
  DACActivityList *v9;
  DACActivityList *v10;

  v4 = objc_alloc_init(DACActivityList);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__DACActivityList_copyWithZone___block_invoke;
  v8[3] = &unk_24ED13280;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  v6 = v5;

  return v6;
}

void __32__DACActivityList_copyWithZone___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

}

void __41__DACActivityList_isEqualToActivityList___block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__DACActivityList_isEqualToActivityList___block_invoke_2;
  v2[3] = &unk_24ED133F0;
  v4 = a1[3].i64[0];
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  -[DACActivityList _withLock:]((os_unfair_lock_s *)(id)v1.i64[0], v2);

}

void __41__DACActivityList_isEqualToActivityList___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  _QWORD *v6;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v6 = v2;
  v3 = (_QWORD *)a1[5];
  if (v3)
    v3 = (_QWORD *)v3[3];
  v4 = v3;
  v5 = objc_msgSend(v6, "isEqualToArray:", v4);
  if (v5)
    LOBYTE(v5) = objc_msgSend(*(id *)(a1[4] + 16), "isEqualToDate:", *(_QWORD *)(a1[5] + 16));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

}

- (BOOL)isEqual:(id)a3
{
  DACActivityList *v4;
  DACActivityList *v5;
  DACActivityList *v6;
  DACActivityList *v7;
  _QWORD v9[4];
  DACActivityList *v10;
  DACActivityList *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (DACActivityList *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    LOBYTE(self) = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = v6;
    if (self)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __41__DACActivityList_isEqualToActivityList___block_invoke;
      v9[3] = &unk_24ED133F0;
      v11 = self;
      v12 = &v13;
      v10 = v6;
      -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v9);
      LOBYTE(self) = *((_BYTE *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }

  }
  else
  {
LABEL_7:
    LOBYTE(self) = 0;
  }
LABEL_9:

  return (char)self;
}

- (unint64_t)hash
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__DACActivityList_hash__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __23__DACActivityList_hash__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v4 = v2;
  v3 = objc_msgSend(v4, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hash") ^ v3;

}

- (BOOL)isEqualIgnoringLastModified:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  DACActivityList *v9;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__DACActivityList_isEqualIgnoringLastModified___block_invoke;
  v7[3] = &unk_24ED133F0;
  v5 = v4;
  v9 = self;
  v10 = &v11;
  v8 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __47__DACActivityList_isEqualIgnoringLastModified___block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__DACActivityList_isEqualIgnoringLastModified___block_invoke_2;
  v2[3] = &unk_24ED133F0;
  v4 = a1[3].i64[0];
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  -[DACActivityList _withLock:]((os_unfair_lock_s *)(id)v1.i64[0], v2);

}

void __47__DACActivityList_isEqualIgnoringLastModified___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v4 = (_QWORD *)a1[5];
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  v6 = v3;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "isEqualToArray:", v5);

}

- (unint64_t)activityCount
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__DACActivityList_activityCount__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__DACActivityList_activityCount__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");

}

- (unint64_t)stateOfActivity:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__DACActivityList_stateOfActivity___block_invoke;
  v8[3] = &unk_24ED133F0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __35__DACActivityList_stateOfActivity___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), *(void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_stateOfActivity:(const os_unfair_lock *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  const os_unfair_lock *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 2);
    v4 = -[DACActivityList _indexOfActivity:]((uint64_t)a1, v3);
    os_unfair_lock_assert_owner(a1 + 2);
    v5 = 1;
    if (v4)
      v5 = 2;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0;
    else
      v6 = v5;
    DACLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134218498;
      v10 = a1;
      v11 = 2048;
      v12 = v6;
      v13 = 2114;
      v14 = v3;
      _os_log_debug_impl(&dword_224FBF000, v7, OS_LOG_TYPE_DEBUG, "%p determined state(%lu) for Activity(%{public}@)", (uint8_t *)&v9, 0x20u);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)changeMarkerForActivity:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__DACActivityList_changeMarkerForActivity___block_invoke;
  v8[3] = &unk_24ED133F0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __43__DACActivityList_changeMarkerForActivity___block_invoke(uint64_t a1)
{
  os_unfair_lock *v2;
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = *(os_unfair_lock **)(a1 + 32);
  if (v2)
  {
    v3 = *(id *)(a1 + 40);
    os_unfair_lock_assert_owner(v2 + 2);
    -[DACActivityList _entryOfActivity:](v2, v3);
    v4 = (id *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = v4[5];
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)enumerate:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __29__DACActivityList_enumerate___block_invoke;
  v16[3] = &unk_24ED13280;
  v16[4] = self;
  v6 = v5;
  v17 = v6;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __29__DACActivityList_enumerate___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  DACLifecycleInfo *v7;
  void *v8;
  id v9;
  const os_unfair_lock *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  obj = v2;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v23)
  {
    v3 = 0;
    v21 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      v22 = v3 - 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v4);
        v6 = *(void **)(a1 + 40);
        v7 = [DACLifecycleInfo alloc];
        if (v5)
          v8 = *(void **)(v5 + 8);
        else
          v8 = 0;
        v9 = v8;
        v10 = *(const os_unfair_lock **)(a1 + 32);
        if (v10)
        {
          v11 = v3;
          os_unfair_lock_assert_owner(v10 + 2);
          v12 = 1;
          if (v3 + v4)
            v12 = 2;
          if (v22 + v4)
            v13 = v12;
          else
            v13 = 0;
          if (v5)
          {
LABEL_17:
            v14 = *(_QWORD *)(v5 + 24);
            v15 = *(id *)(v5 + 32);
            v16 = *(void **)(v5 + 40);
            goto LABEL_18;
          }
        }
        else
        {
          v11 = v3;
          v13 = 0;
          if (v5)
            goto LABEL_17;
        }
        v15 = 0;
        v14 = 0;
        v16 = 0;
LABEL_18:
        v17 = v16;
        v18 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v7, "_initWithActivity:state:reason:origin:changeMarker:", v9, v13, v14, v15, v17);
        objc_msgSend(v6, "addObject:", v18);

        ++v4;
        v3 = v11;
      }
      while (v23 != v4);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v3 = v11 + v4;
      v23 = v19;
    }
    while (v19);
  }

}

- (BOOL)addActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  DACActivityList *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v11 = objc_msgSend(v8, "isEqual:", v9);
  v12 = 4;
  if (!v9)
    v12 = 5;
  v20[0] = MEMORY[0x24BDAC760];
  v20[2] = __54__DACActivityList_addActivity_requester_changeMarker___block_invoke;
  v20[3] = &unk_24ED13418;
  v20[1] = 3221225472;
  if (v11)
    v13 = 3;
  else
    v13 = v12;
  v24 = &v45;
  v20[4] = self;
  v14 = v8;
  v21 = v14;
  v25 = &v35;
  v26 = &v29;
  v28 = v13;
  v15 = v9;
  v22 = v15;
  v16 = v10;
  v23 = v16;
  v27 = &v41;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v20);
  DACLogForCategory(1);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = self;
    v51 = 2114;
    v52 = v14;
    _os_log_impl(&dword_224FBF000, v17, OS_LOG_TYPE_DEFAULT, "%p added activity %{public}@ to list", buf, 0x16u);
  }

  if (v46[3] == v42[3])
    v18 = objc_msgSend((id)v30[5], "isEqual:", v36[5]) ^ 1;
  else
    LOBYTE(v18) = 1;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v18;
}

uint64_t __54__DACActivityList_addActivity_requester_changeMarker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  DACActivityListEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[DACActivityList _indexOfActivity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), *(void **)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    DACLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v21 = 134218242;
      v22 = v19;
      v23 = 2114;
      v24 = v20;
      _os_log_error_impl(&dword_224FBF000, v5, OS_LOG_TYPE_ERROR, "%p activity %{public}@ already in list, removing it", (uint8_t *)&v21, 0x16u);
    }

    -[DACActivityList _removeActivity:origin:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 40));
  }
  v6 = [DACActivityListEntry alloc];
  if (v6)
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(void **)(a1 + 96);
    v9 = *(void **)(a1 + 40);
    v10 = (void *)MEMORY[0x24BDBCE60];
    v11 = *(id *)(a1 + 56);
    v12 = v7;
    v13 = v9;
    objc_msgSend(v10, "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&v6->super.isa, v13, v14, v8, v12, v11);

    v6 = v15;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v6;

  -[DACActivityList _addActivityEntry:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  result = -[DACActivityList _indexOfActivity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = result;
  return result;
}

- (uint64_t)_indexOfActivity:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v4 = *(void **)(a1 + 24);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__DACActivityList__indexOfActivity___block_invoke;
    v6[3] = &unk_24ED134E0;
    v7 = v3;
    a1 = objc_msgSend(v4, "indexOfObjectPassingTest:", v6);

  }
  return a1;
}

- (os_unfair_lock)_entryOfActivity:(os_unfair_lock *)a1
{
  uint64_t v2;
  const os_unfair_lock *v3;
  id v4;
  uint64_t v5;

  if (a1)
  {
    v2 = (uint64_t)a1;
    v3 = a1 + 2;
    v4 = a2;
    os_unfair_lock_assert_owner(v3);
    v5 = -[DACActivityList _indexOfActivity:](v2, v4);

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      return (os_unfair_lock *)0;
    objc_msgSend(*(id *)(v2 + 24), "objectAtIndex:", v5);
    a1 = (os_unfair_lock *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_removeActivity:(void *)a3 origin:
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v7 = -[DACActivityList _indexOfActivity:](a1, v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      DACLogForCategory(1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 134218242;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        _os_log_error_impl(&dword_224FBF000, v8, OS_LOG_TYPE_ERROR, "%p activity %{public}@ not in list, unable to remove it", (uint8_t *)&v11, 0x16u);
      }

      a1 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 24), "removeObjectAtIndex:", v7);
      -[DACActivityList _updateModificationDate](a1);
      DACLogForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218498;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_224FBF000, v9, OS_LOG_TYPE_DEFAULT, "%p removed activity %{public}@ from list due to %{public}@", (uint8_t *)&v11, 0x20u);
      }

      -[DACActivityList _reconcileReasons](a1);
      a1 = 1;
    }
  }

  return a1;
}

- (void)_addActivityEntry:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v4 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v5 = objc_msgSend(*(id *)(a1 + 24), "count");
    v6 = *(id *)(a1 + 24);
    objc_opt_self();
    v7 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1280, &__block_literal_global_1);

    DACLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218498;
      v13 = a1;
      v14 = 2048;
      v15 = v7;
      v16 = 2114;
      v17 = v4;
      _os_log_debug_impl(&dword_224FBF000, v8, OS_LOG_TYPE_DEBUG, "%p insert index %lu for %{public}@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 24), "insertObject:atIndex:", v4, v7);
    -[DACActivityList _updateModificationDate](a1);
    DACLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v10 = (void *)v4[1];
      else
        v10 = 0;
      v11 = v10;
      v12 = 134218242;
      v13 = a1;
      v14 = 2114;
      v15 = (uint64_t)v11;
      _os_log_impl(&dword_224FBF000, v9, OS_LOG_TYPE_DEFAULT, "%p added activity %{public}@ to list", (uint8_t *)&v12, 0x16u);

    }
    -[DACActivityList _reconcileReasons](a1);
  }

}

- (BOOL)removeActivity:(id)a3 requester:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__DACActivityList_removeActivity_requester___block_invoke;
  v11[3] = &unk_24ED13440;
  v14 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

uint64_t __44__DACActivityList_removeActivity_requester___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[DACActivityList _removeActivity:origin:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (DACActivityList)listWithMerge:(id)a3
{
  id v4;
  void *v5;
  id v6;
  os_unfair_lock_s *v7;
  NSObject *v8;
  os_unfair_lock_s *v9;
  DACActivityList *v10;
  _QWORD v12[4];
  id v13;
  os_unfair_lock_s *v14;
  uint8_t buf[4];
  DACActivityList *v16;
  __int16 v17;
  os_unfair_lock_s *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  DACActivityList *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[DACActivityList copy](self, "copy");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__DACActivityList_listWithMerge___block_invoke;
  v12[3] = &unk_24ED13280;
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  -[DACActivityList _withLock:](v7, v12);
  DACLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = self;
    _os_log_debug_impl(&dword_224FBF000, v8, OS_LOG_TYPE_DEBUG, "%p merge result %{public}@ from %{public}@ into %{public}@", buf, 0x2Au);
  }

  v9 = v14;
  v10 = v7;

  return v10;
}

void __33__DACActivityList_listWithMerge___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__DACActivityList_listWithMerge___block_invoke_2;
  v3[3] = &unk_24ED13280;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  -[DACActivityList _withLock:]((os_unfair_lock_s *)v4, v3);
  -[DACActivityList _reconcileReasons](*(_QWORD *)(a1 + 40));

}

void __33__DACActivityList_listWithMerge___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        if (v8)
          v9 = (void *)v8[1];
        else
          v9 = 0;
        v10 = -[DACActivityList _indexOfActivity:](*(_QWORD *)(a1 + 40), v9);
        v11 = *(_QWORD **)(a1 + 40);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[DACActivityList _addActivityEntry:]((uint64_t)v11, v8);
          goto LABEL_22;
        }
        if (v11)
          v11 = (_QWORD *)v11[3];
        objc_msgSend(v11, "objectAtIndex:", v10, (_QWORD)v21);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
        {
          v14 = *(void **)(v12 + 16);
          if (!v8)
            goto LABEL_26;
        }
        else
        {
          v14 = 0;
          if (!v8)
          {
LABEL_26:
            v15 = 0;
            goto LABEL_17;
          }
        }
        v15 = v8[2];
LABEL_17:
        v16 = v14;
        v17 = objc_msgSend(v16, "compare:", v15);

        if (v17 == -1)
        {
          v18 = *(_QWORD *)(a1 + 40);
          if (v18)
            v19 = *(void **)(v18 + 24);
          else
            v19 = 0;
          objc_msgSend(v19, "removeObjectAtIndex:", v10);
          -[DACActivityList _addActivityEntry:](*(_QWORD *)(a1 + 40), v8);
        }

LABEL_22:
        ++v7;
      }
      while (v5 != v7);
      v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v5 = v20;
    }
    while (v20);
  }

}

- (void)_reconcileReasons
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    DACLogForCategory(1);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134217984;
      v21 = a1;
      _os_log_debug_impl(&dword_224FBF000, v2, OS_LOG_TYPE_DEBUG, "%p starting reason reconciliation", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 24), "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 8);
    else
      v5 = 0;
    v6 = v5;
    v7 = objc_msgSend(v6, "priority");
    v8 = objc_msgSend(*(id *)(a1 + 24), "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (!v11)
          break;
        v13 = *(_QWORD *)(v11 + 24);
        if (v10)
        {
          v14 = *(void **)(v11 + 8);
LABEL_11:
          v15 = objc_msgSend(v14, "priority");
          if (v15 != v7 || v13 == 6)
          {
            if (v15 >= v7 || v13 == 8)
              goto LABEL_24;
            v16 = a1;
            v17 = 8;
          }
          else
          {
            v16 = a1;
            v17 = 6;
          }
          v18 = v10;
          goto LABEL_23;
        }
        if (v13 == 8)
        {
          v16 = a1;
          v17 = 9;
LABEL_22:
          v18 = 0;
LABEL_23:
          -[DACActivityList _updateReason:atIndex:](v16, v17, v18);
          goto LABEL_24;
        }
        if (v13 == 6)
        {
          v16 = a1;
          v17 = 7;
          goto LABEL_22;
        }
LABEL_24:

        if (v9 == ++v10)
          goto LABEL_28;
      }
      if (!v10)
        goto LABEL_24;
      v13 = 0;
      v14 = 0;
      goto LABEL_11;
    }
LABEL_28:
    DACLogForCategory(1);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134217984;
      v21 = a1;
      _os_log_debug_impl(&dword_224FBF000, v19, OS_LOG_TYPE_DEBUG, "%p finished reason reconciliation", (uint8_t *)&v20, 0xCu);
    }

  }
}

- (void)splitLocalOnly:(id)a3
{
  void (**v4)(id, id, id);
  DACActivityList *v5;
  DACActivityList *v6;
  DACActivityList *v7;
  DACActivityList *v8;
  _QWORD v9[5];
  DACActivityList *v10;
  DACActivityList *v11;

  v4 = (void (**)(id, id, id))a3;
  v5 = objc_alloc_init(DACActivityList);
  v6 = objc_alloc_init(DACActivityList);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__DACActivityList_splitLocalOnly___block_invoke;
  v9[3] = &unk_24ED13468;
  v9[4] = self;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v9);
  v4[2](v4, v8, v7);

}

void __34__DACActivityList_splitLocalOnly___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        if (v8)
          v9 = *(void **)(v8 + 8);
        else
          v9 = 0;
        if (objc_msgSend(v9, "isLocalOnly", (_QWORD)v19))
        {
          v10 = a1[5];
          if (!v10)
            goto LABEL_12;
        }
        else
        {
          v10 = a1[6];
          if (!v10)
          {
LABEL_12:
            v11 = 0;
            goto LABEL_15;
          }
        }
        v11 = *(void **)(v10 + 24);
LABEL_15:
        objc_msgSend(v11, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v5 = v12;
    }
    while (v12);
  }

  v13 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v14 = a1[5];
  v15 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v13;

  v16 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v17 = a1[6];
  v18 = *(void **)(v17 + 16);
  *(_QWORD *)(v17 + 16) = v16;

}

- (id)changesFromList:(id)a3 includingMetadata:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  DACActivityList *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __53__DACActivityList_changesFromList_includingMetadata___block_invoke;
  v17 = &unk_24ED134B8;
  v8 = v6;
  v18 = v8;
  v19 = self;
  v21 = &v30;
  v9 = v7;
  v23 = a4;
  v20 = v9;
  v22 = &v24;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, &v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v31[5])
    objc_msgSend(v10, "addObject:");
  if (v25[5])
    objc_msgSend(v11, "addObject:");
  objc_msgSend(v11, "addObjectsFromArray:", v9);
  v12 = -[DACLifecycleChangelist _initWithLifecycleInfoArray:]([DACLifecycleChangelist alloc], "_initWithLifecycleInfoArray:", v11);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v12;
}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  id v3;
  int8x16_t v4;
  __int128 v5;
  _QWORD v6[4];
  int8x16_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__DACActivityList_changesFromList_includingMetadata___block_invoke_2;
  v6[3] = &unk_24ED134B8;
  v4 = *(int8x16_t *)(a1 + 32);
  v2 = (os_unfair_lock_s *)(id)v4.i64[0];
  v7 = vextq_s8(v4, v4, 8uLL);
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v8 = v5;
  v10 = *(_BYTE *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 64);
  -[DACActivityList _withLock:](v2, v6);

}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  os_unfair_lock *v8;
  uint64_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *, void *);
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  os_unfair_lock *v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v33 = MEMORY[0x24BDAC760];
  v35 = __53__DACActivityList_changesFromList_includingMetadata___block_invoke_3;
  v36 = &unk_24ED13490;
  v5 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v37 = v3;
  v40 = v4;
  v34 = 3221225472;
  v38 = v5;
  v6 = *(id *)(a1 + 40);
  v42 = *(_BYTE *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 64);
  v39 = v6;
  v41 = v7;
  v8 = v2;
  v9 = &v33;
  if (v3)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v3 + 8));
    os_unfair_lock_assert_owner(v8 + 2);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = *(id *)(v3 + 24);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v64, 16, v33, v34);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v15);
          if (v16)
            v17 = *(_QWORD *)(v16 + 8);
          else
            v17 = 0;
          objc_msgSend(v10, "addObject:", v17);
          ++v15;
        }
        while (v13 != v15);
        v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
        v13 = v18;
      }
      while (v18);
    }

    v19 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    if (v8)
      v20 = *(void **)&v8[6]._os_unfair_lock_opaque;
    else
      v20 = 0;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v44;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v25);
          if (v26)
            v27 = *(_QWORD *)(v26 + 8);
          else
            v27 = 0;
          objc_msgSend(v19, "addObject:", v27);
          ++v25;
        }
        while (v23 != v25);
        v28 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
        v23 = v28;
      }
      while (v28);
    }

    v29 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v29, "intersectOrderedSet:", v19);
    v30 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v30, "minusOrderedSet:", v19);
    v31 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v31, "minusOrderedSet:", v10);
    DACLogForCategory(1);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219266;
      v52 = v3;
      v53 = 2114;
      v54 = v29;
      v55 = 2114;
      v56 = v30;
      v57 = 2114;
      v58 = v31;
      v59 = 2048;
      v60 = v8;
      v61 = 2048;
      v62 = v3;
      _os_log_debug_impl(&dword_224FBF000, v32, OS_LOG_TYPE_DEBUG, "%p delta common(%{public}@) add(%{public}@) remove(%{public}@) from %p to %p", buf, 0x3Eu);
    }

    v35((uint64_t)v9, v29, v30, v31);
  }

}

void __53__DACActivityList_changesFromList_includingMetadata___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  DACLifecycleInfo *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  DACLifecycleInfo *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  DACLifecycleInfo *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  DACLifecycleInfo *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  DACLifecycleInfo *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  DACLifecycleInfo *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  DACLifecycleInfo *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  id obj;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v76 = a2;
  v7 = a3;
  v73 = a4;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v8)
  {
    v9 = (id)v8;
    v10 = *(_QWORD *)v92;
    v78 = *(_QWORD *)v92;
    do
    {
      v11 = 0;
      v80 = v9;
      do
      {
        if (*(_QWORD *)v92 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v11);
        -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), v12);
        if (v14 == 1)
        {
          v15 = [DACLifecycleInfo alloc];
          if (v13)
          {
            v16 = *(_QWORD *)(v13 + 24);
            v17 = *(id *)(v13 + 32);
            v18 = *(void **)(v13 + 40);
          }
          else
          {
            v17 = 0;
            v16 = 0;
            v18 = 0;
          }
          v19 = v18;
          v20 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v15, "_initWithActivity:state:reason:origin:changeMarker:", v12, 1, v16, v17, v19);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v22 = *(id *)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;
        }
        else
        {
          v23 = v14;
          v24 = *(void **)(a1 + 40);
          v25 = [DACLifecycleInfo alloc];
          if (v13)
          {
            v26 = *(_QWORD *)(v13 + 24);
            v17 = *(id *)(v13 + 32);
            v27 = *(void **)(v13 + 40);
          }
          else
          {
            v17 = 0;
            v26 = 0;
            v27 = 0;
          }
          v22 = v27;
          v19 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v25, "_initWithActivity:state:reason:origin:changeMarker:", v12, v23, v26, v17, v22);
          objc_msgSend(v24, "addObject:", v19);
          v10 = v78;
          v9 = v80;
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
      v9 = (id)v28;
    }
    while (v28);
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v77 = v76;
  v81 = (id)objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (v81)
  {
    v79 = *(_QWORD *)v88;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v88 != v79)
          objc_enumerationMutation(v77);
        v30 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v29);
        -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 32), v30);
        v31 = objc_claimAutoreleasedReturnValue();
        -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 48), v30);
        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v33 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 32), v30);
        v34 = -[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 48), v30);
        v35 = v34;
        if (v31)
        {
          v36 = *(_QWORD *)(v31 + 24);
          if (!v32)
            goto LABEL_49;
        }
        else
        {
          v36 = 0;
          if (!v32)
          {
LABEL_49:
            v37 = 0;
            goto LABEL_26;
          }
        }
        v37 = v32[3];
LABEL_26:
        if (v36 != v37 || v33 != v34)
          goto LABEL_33;
        if (!*(_BYTE *)(a1 + 72))
          goto LABEL_46;
        if (v31)
        {
          v38 = *(void **)(v31 + 40);
          if (v32)
            goto LABEL_31;
        }
        else
        {
          v38 = 0;
          if (v32)
          {
LABEL_31:
            v39 = v32[5];
            goto LABEL_32;
          }
        }
        v39 = 0;
LABEL_32:
        if ((objc_msgSend(v38, "isEqual:", v39) & 1) != 0)
          goto LABEL_46;
LABEL_33:
        if (v35 == 1)
        {
          v40 = [DACLifecycleInfo alloc];
          if (v31)
          {
            v41 = *(_QWORD *)(v31 + 24);
            v42 = *(id *)(v31 + 32);
            v43 = *(void **)(v31 + 40);
          }
          else
          {
            v42 = 0;
            v41 = 0;
            v43 = 0;
          }
          v44 = v43;
          v45 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v40, "_initWithActivity:state:reason:origin:changeMarker:", v30, v33, v41, v42, v44);
          v46 = *(_QWORD *)(a1 + 64);
        }
        else
        {
          if (v33 != 1)
          {
            v74 = *(void **)(a1 + 40);
            v52 = [DACLifecycleInfo alloc];
            if (v31)
            {
              v53 = *(_QWORD *)(v31 + 24);
              v42 = *(id *)(v31 + 32);
              v54 = *(void **)(v31 + 40);
            }
            else
            {
              v42 = 0;
              v53 = 0;
              v54 = 0;
            }
            v51 = v54;
            v44 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v52, "_initWithActivity:state:reason:origin:changeMarker:", v30, v33, v53, v42, v51);
            objc_msgSend(v74, "addObject:", v44);
            goto LABEL_45;
          }
          v47 = [DACLifecycleInfo alloc];
          if (v31)
          {
            v48 = *(_QWORD *)(v31 + 24);
            v42 = *(id *)(v31 + 32);
            v49 = *(void **)(v31 + 40);
          }
          else
          {
            v42 = 0;
            v48 = 0;
            v49 = 0;
          }
          v44 = v49;
          v45 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v47, "_initWithActivity:state:reason:origin:changeMarker:", v30, 1, v48, v42, v44);
          v46 = *(_QWORD *)(a1 + 56);
        }
        v50 = *(_QWORD *)(v46 + 8);
        v51 = *(id *)(v50 + 40);
        *(_QWORD *)(v50 + 40) = v45;
LABEL_45:

LABEL_46:
        v29 = (char *)v29 + 1;
      }
      while (v81 != v29);
      v55 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      v81 = (id)v55;
    }
    while (v55);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v82 = v73;
  v56 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v84;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v84 != v58)
          objc_enumerationMutation(v82);
        v60 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v59);
        -[DACActivityList _entryOfActivity:](*(os_unfair_lock **)(a1 + 48), v60);
        v61 = objc_claimAutoreleasedReturnValue();
        if (-[DACActivityList _stateOfActivity:](*(const os_unfair_lock **)(a1 + 48), v60) == 1)
        {
          v62 = [DACLifecycleInfo alloc];
          if (v61)
          {
            v63 = *(id *)(v61 + 32);
            v64 = *(void **)(v61 + 40);
          }
          else
          {
            v63 = 0;
            v64 = 0;
          }
          v65 = v64;
          v66 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v62, "_initWithActivity:state:reason:origin:changeMarker:", v60, 0, 2, v63, v65);
          v67 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v68 = *(id *)(v67 + 40);
          *(_QWORD *)(v67 + 40) = v66;
        }
        else
        {
          v69 = *(void **)(a1 + 40);
          v70 = [DACLifecycleInfo alloc];
          if (v61)
          {
            v63 = *(id *)(v61 + 32);
            v71 = *(void **)(v61 + 40);
          }
          else
          {
            v63 = 0;
            v71 = 0;
          }
          v68 = v71;
          v65 = -[DACLifecycleInfo _initWithActivity:state:reason:origin:changeMarker:](v70, "_initWithActivity:state:reason:origin:changeMarker:", v60, 0, 2, v63, v68);
          objc_msgSend(v69, "addObject:", v65);
        }

        ++v59;
      }
      while (v57 != v59);
      v72 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      v57 = v72;
    }
    while (v72);
  }

}

- (NSDate)lastModified
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__DACActivityList_lastModified__block_invoke;
  v4[3] = &unk_24ED13258;
  v4[4] = self;
  v4[5] = &v5;
  -[DACActivityList _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __31__DACActivityList_lastModified__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __36__DACActivityList__indexOfActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = (void *)v6[1];
  else
    v8 = 0;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((_DWORD)v10)
    *a4 = 1;

  return v10;
}

- (void)_updateModificationDate
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v2;

}

- (void)_updateReason:(uint64_t)a3 atIndex:
{
  void *v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (_QWORD *)objc_msgSend(v6, "copy");
    v8[3] = a2;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 24), "replaceObjectAtIndex:withObject:", a3, v8);
  -[DACActivityList _updateModificationDate](a1);
  DACLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
      v10 = (void *)v8[1];
    else
      v10 = 0;
    v11 = v10;
    v12 = 134218754;
    v13 = a1;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = a2;
    _os_log_debug_impl(&dword_224FBF000, v9, OS_LOG_TYPE_DEBUG, "%p update reason of %{public}@ at %lu to %lu", (uint8_t *)&v12, 0x2Au);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActivities, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end
