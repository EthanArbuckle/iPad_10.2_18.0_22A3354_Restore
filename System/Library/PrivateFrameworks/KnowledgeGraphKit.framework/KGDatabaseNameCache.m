@implementation KGDatabaseNameCache

- (KGDatabaseNameCache)init
{
  KGDatabaseNameCache *v2;
  KGDatabaseNameCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *labelIdByName;
  NSMutableDictionary *v6;
  NSMutableDictionary *labelNameById;
  NSMutableDictionary *v8;
  NSMutableDictionary *attrIdByPropertyName;
  NSMutableDictionary *v10;
  NSMutableDictionary *propertyNameByAttrId;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)KGDatabaseNameCache;
  v2 = -[KGDatabaseNameCache init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_loaded = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    labelIdByName = v3->_labelIdByName;
    v3->_labelIdByName = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    labelNameById = v3->_labelNameById;
    v3->_labelNameById = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attrIdByPropertyName = v3->_attrIdByPropertyName;
    v3->_attrIdByPropertyName = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    propertyNameByAttrId = v3->_propertyNameByAttrId;
    v3->_propertyNameByAttrId = v10;

    v3->_highestLabelId = 0;
    v3->_highestAttrId = 0;
    *(_WORD *)&v3->_readOnly = 1;
    v3->_loadedInThisTransaction = 0;
  }
  return v3;
}

- (void)setWritable
{
  self->_readOnly = 0;
}

- (void)transactionBegin
{
  os_unfair_lock_s *p_lock;
  uint8_t v4[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isInTransaction && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "KGDatabase name cache: transactionBegin is not reentrant", v4, 2u);
  }
  *(_WORD *)&self->_isInTransaction = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)transactionEnd
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_isInTransaction = 0;
  os_unfair_lock_unlock(p_lock);
}

- (id)labelIdentifierForName:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_labelIdByName, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_labelIdByName, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)labelNameForIdentifier:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_labelNameById, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_labelNameById, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)attrIdentifierForPropertyName:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attrIdByPropertyName, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_attrIdByPropertyName, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)propertyNameForIdentifier:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyNameByAttrId, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyNameByAttrId, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)addLabelName:(id)a3 identifier:(id)a4 database:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelNameById, "setObject:forKeyedSubscript:", v10, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelIdByName, "setObject:forKeyedSubscript:", v8, v10);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[KGDatabaseNameCache _loadCacheIfNeeded:](self, "_loadCacheIfNeeded:", v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyNameByAttrId, "setObject:forKeyedSubscript:", v10, v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attrIdByPropertyName, "setObject:forKeyedSubscript:", v8, v10);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_addLabelName:(id)a3 identifier:(id)a4 database:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_labelNameById, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
LABEL_6:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelNameById, "setObject:forKeyedSubscript:", v8, v9);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_labelIdByName, "objectForKeyedSubscript:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (-[NSObject isEqualToNumber:](v14, "isEqualToNumber:", v9) & 1) == 0)
    {
      objc_msgSend(v10, "setFatalError:", CFSTR("duplicate label"));
      KGLoggingConnection();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v17 = 138543874;
        v18 = v9;
        v19 = 2114;
        v20 = v15;
        v21 = 2114;
        v22 = v8;
        _os_log_fault_impl(&dword_1CA0A5000, v16, OS_LOG_TYPE_FAULT, "duplicate label by identifiers %{public}@ and %{public}@, name %{public}@", (uint8_t *)&v17, 0x20u);
      }

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_labelIdByName, "setObject:forKeyedSubscript:", v9, v8);
    goto LABEL_14;
  }
  if ((-[NSObject isEqualToString:](v11, "isEqualToString:", v8) & 1) != 0)
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "redundant insert of label in cache name=%{public}@, identifier=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    goto LABEL_6;
  }
  objc_msgSend(v10, "setFatalError:", CFSTR("duplicate label"));
  KGLoggingConnection();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v17 = 138543874;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v9;
    _os_log_fault_impl(&dword_1CA0A5000, v15, OS_LOG_TYPE_FAULT, "duplicate label by name=%{public}@, other name=%{public}@, identifier %{public}@", (uint8_t *)&v17, 0x20u);
  }
LABEL_14:

}

- (void)_addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyNameByAttrId, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
LABEL_6:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyNameByAttrId, "setObject:forKeyedSubscript:", v8, v9);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_attrIdByPropertyName, "objectForKeyedSubscript:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (-[NSObject isEqualToNumber:](v14, "isEqualToNumber:", v9) & 1) == 0)
    {
      objc_msgSend(v10, "setFatalError:", CFSTR("duplicate property"));
      KGLoggingConnection();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_attrIdByPropertyName, "objectForKeyedSubscript:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v9;
        v20 = 2114;
        v21 = v17;
        v22 = 2114;
        v23 = v8;
        _os_log_fault_impl(&dword_1CA0A5000, v16, OS_LOG_TYPE_FAULT, "duplicate property by identifiers %{public}@ and %{public}@, name %{public}@", (uint8_t *)&v18, 0x20u);

      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attrIdByPropertyName, "setObject:forKeyedSubscript:", v9, v8);
    goto LABEL_14;
  }
  if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0)
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "redundant insert of property in cache name=%{public}@, identifier=%{public}@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_6;
  }
  objc_msgSend(v10, "setFatalError:", CFSTR("duplicate property"));
  KGLoggingConnection();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v18 = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v12;
    v22 = 2114;
    v23 = v9;
    _os_log_fault_impl(&dword_1CA0A5000, v15, OS_LOG_TYPE_FAULT, "duplicate property by name=%{public}@, other name=%{public}@, identifier %{public}@", (uint8_t *)&v18, 0x20u);
  }
LABEL_14:

}

- (void)_loadCacheIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *p_p;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  degas::Statement *v18[2];
  void *__p;
  uint64_t v20;
  uint64_t v21;
  degas::Statement *v22[2];

  v4 = a3;
  v5 = v4;
  if (!self->_loaded)
  {
    degas::LabelCursor::LabelCursor((uint64_t *)v22, self->_highestLabelId, objc_msgSend(v4, "database") + 80, 5);
    while (degas::Statement::next((sqlite3_stmt **)v22[0]) == 1)
    {
      v6 = sqlite3_column_int64(*(sqlite3_stmt **)v22[0], 0);
      v7 = v6;
      if (v6 > self->_highestLabelId)
        self->_highestLabelId = v6;
      __p = 0;
      v20 = 0;
      v21 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v22[0], 1, (uint64_t)&__p);
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v21 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      v10 = (void *)objc_msgSend(v8, "initWithUTF8String:", p_p);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[KGDatabaseNameCache _addLabelName:identifier:database:](self, "_addLabelName:identifier:database:", v10, v11, v5);

      if (SHIBYTE(v21) < 0)
        operator delete(__p);
    }
    degas::AttributeCursor::AttributeCursor((uint64_t *)v18, self->_highestAttrId, objc_msgSend(v5, "database") + 304, 5);
    while (degas::Statement::next((sqlite3_stmt **)v18[0]) == 1)
    {
      v12 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
      v13 = v12;
      if (v12 > self->_highestAttrId)
        self->_highestAttrId = v12;
      __p = 0;
      v20 = 0;
      v21 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v18[0], 1, (uint64_t)&__p);
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v21 >= 0)
        v15 = &__p;
      else
        v15 = __p;
      v16 = (void *)objc_msgSend(v14, "initWithUTF8String:", v15);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[KGDatabaseNameCache _addPropertyName:identifier:database:](self, "_addPropertyName:identifier:database:", v16, v17, v5);

      if (SHIBYTE(v21) < 0)
        operator delete(__p);
    }
    self->_loaded = 1;
    self->_loadedInThisTransaction = self->_isInTransaction;
    degas::Cursor::~Cursor(v18);
    degas::Cursor::~Cursor(v22);
  }

}

- (void)unloadCache
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_loaded)
  {
    -[NSMutableDictionary removeAllObjects](self->_labelIdByName, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_labelNameById, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_attrIdByPropertyName, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_propertyNameByAttrId, "removeAllObjects");
    self->_loaded = 0;
    self->_loadedInThisTransaction = 0;
    self->_highestLabelId = 0;
    self->_highestAttrId = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNameByAttrId, 0);
  objc_storeStrong((id *)&self->_attrIdByPropertyName, 0);
  objc_storeStrong((id *)&self->_labelNameById, 0);
  objc_storeStrong((id *)&self->_labelIdByName, 0);
}

@end
