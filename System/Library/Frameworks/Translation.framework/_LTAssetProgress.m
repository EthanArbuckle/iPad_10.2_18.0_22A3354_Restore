@implementation _LTAssetProgress

- (_LTAssetProgress)initWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4 completedUnitCount:(int64_t)a5
{
  id v8;
  _LTAssetProgress *v9;
  _LTAssetProgress *v10;
  NSString *v11;
  void *identifier;
  uint64_t v13;
  NSString *v14;
  _LTAssetProgress *v15;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTAssetProgress;
  v9 = -[_LTAssetProgress init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    if (objc_msgSend(v8, "length"))
    {
      v11 = (NSString *)v8;
      identifier = v10->_identifier;
      v10->_identifier = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v10->_identifier;
      v10->_identifier = (NSString *)v13;

    }
    v10->_totalUnitCount = a4;
    v10->_completedUnitCount = a5;
    v15 = v10;
  }

  return v10;
}

- (_LTAssetProgress)initWithIdentifier:(id)a3 offlineState:(int64_t)a4
{
  _LTAssetProgress *v5;

  v5 = -[_LTAssetProgress initWithIdentifier:totalUnitCount:completedUnitCount:](self, "initWithIdentifier:totalUnitCount:completedUnitCount:", a3, 100, 0);
  -[_LTAssetProgress setOfflineState:](v5, "setOfflineState:", a4);
  return v5;
}

+ (id)discreteProgressWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  if (a4 <= 100)
    v8 = 100;
  else
    v8 = a4;
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:totalUnitCount:completedUnitCount:", v6, v8, 0);

  return v9;
}

+ (id)discreteProgressWithIdentifier:(id)a3 offlineState:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:offlineState:", v6, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v4 = a3;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v6, &v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("totalUnitCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", v5, CFSTR("completedUnitCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_componentFilter, CFSTR("componentFilter"));

}

- (_LTAssetProgress)initWithCoder:(id)a3
{
  id v4;
  _LTAssetProgress *v5;
  _LTAssetProgress *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *componentFilter;
  _LTAssetProgress *v11;

  v4 = a3;
  v5 = -[_LTAssetProgress init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_totalUnitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalUnitCount"));
    v6->_completedUnitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("completedUnitCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("componentFilter"));
    v9 = objc_claimAutoreleasedReturnValue();
    componentFilter = v6->_componentFilter;
    v6->_componentFilter = (NSString *)v9;

    v11 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)totalUnitCount
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v4, &v3);
  return v4;
}

- (int64_t)completedUnitCount
{
  int64_t v3;
  uint64_t v4;

  v3 = 0;
  v4 = 0;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v4, &v3);
  return v3;
}

- (id)identifierPrefix
{
  NSString *identifierPrefix;
  void *v4;
  NSString *v5;
  NSString *v6;

  identifierPrefix = self->_identifierPrefix;
  if (!identifierPrefix)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_identifierPrefix)
    {
      -[NSString componentsSeparatedByString:](self->_identifier, "componentsSeparatedByString:", CFSTR("-"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_identifierPrefix;
      self->_identifierPrefix = v5;

    }
    os_unfair_lock_unlock(&self->_lock);
    identifierPrefix = self->_identifierPrefix;
  }
  return identifierPrefix;
}

- (void)_fastReadTotal:(int64_t *)a3 completed:(int64_t *)a4
{
  os_unfair_lock_s *p_lock;
  NSString *componentFilter;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  _QWORD *v21;
  _QWORD *v22;
  os_unfair_lock_s *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableDictionary count](self->_components, "count"))
  {
    componentFilter = self->_componentFilter;
    if (componentFilter)
    {
      v9 = (void *)MEMORY[0x24BDBCF20];
      -[NSString componentsSeparatedByString:](componentFilter, "componentsSeparatedByString:", CFSTR("|"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    v23 = p_lock;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSMutableDictionary allValues](self->_components, "allValues", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (self->_componentFilter)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "identifierPrefix");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v24, "containsObject:", v19);

            if (!v20)
              continue;
          }
          v25 = 0;
          v26 = 0;
          objc_msgSend(v18, "_fastReadTotal:completed:", &v26, &v25);
          v15 += v26;
          v14 += v25;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }

    *v21 = v15;
    *v22 = v14;

    p_lock = v23;
  }
  else
  {
    *a3 = self->_totalUnitCount;
    *a4 = self->_completedUnitCount;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)offlineState
{
  int64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  v5 = 0;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v5, &v4);
  v2 = 1;
  if (v4 == v5)
    v2 = 2;
  if (v4)
    return v2;
  else
    return 0;
}

- (void)setOfflineState:(int64_t)a3
{
  NSObject *v5;
  int64_t totalUnitCount;
  int64_t completedUnitCount;

  if (!-[_LTAssetProgress hasComponents](self, "hasComponents"))
  {
    os_unfair_lock_lock(&self->_lock);
    if (a3)
    {
      if (a3 == 1)
      {
        completedUnitCount = self->_completedUnitCount;
        if (completedUnitCount && completedUnitCount != self->_totalUnitCount)
          goto LABEL_14;
        totalUnitCount = 1;
        goto LABEL_13;
      }
      if (a3 == 2)
      {
        totalUnitCount = self->_totalUnitCount;
LABEL_13:
        self->_completedUnitCount = totalUnitCount;
      }
    }
    else
    {
      self->_completedUnitCount = 0;
    }
LABEL_14:
    os_unfair_lock_unlock(&self->_lock);
    return;
  }
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[_LTAssetProgress setOfflineState:].cold.1();
}

- (void)setGreaterThanOrEqualToOfflineState:(int64_t)a3
{
  if (-[_LTAssetProgress offlineState](self, "offlineState") < a3)
  {
    -[_LTAssetProgress removeAllComponents](self, "removeAllComponents");
    -[_LTAssetProgress setOfflineState:](self, "setOfflineState:", a3);
  }
}

- (void)removeAllComponents
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_components, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasComponents
{
  _LTAssetProgress *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_components, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)addComponent:(id)a3
{
  _LTAssetProgress *v4;
  _LTAssetProgress *v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *components;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;

  v4 = (_LTAssetProgress *)a3;
  v5 = v4;
  if (!v4)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_LTAssetProgress addComponent:].cold.1();
    goto LABEL_10;
  }
  if (self == v4)
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[_LTAssetProgress addComponent:].cold.2();
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  components = self->_components;
  if (!components)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_components;
    self->_components = v8;

    components = self->_components;
  }
  -[_LTAssetProgress identifier](v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](components, "setObject:forKeyedSubscript:", v5, v10);

  os_unfair_lock_unlock(p_lock);
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)removeComponent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *components;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    components = self->_components;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](components, "removeObjectForKey:", v7);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_LTAssetProgress removeComponent:].cold.1();
  }

  return v4 != 0;
}

- (BOOL)updateTotalUnitCount:(int64_t)a3 completedUnitCount:(int64_t)a4
{
  NSObject *v7;
  int64_t totalUnitCount;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;

  if (-[_LTAssetProgress hasComponents](self, "hasComponents"))
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:].cold.1();
    return 0;
  }
  if (a3 <= 0)
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:].cold.2();
    return 0;
  }
  if (a4 < 0 || a4 > a3)
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:].cold.3();
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  totalUnitCount = self->_totalUnitCount;
  v9 = totalUnitCount != a3;
  if (totalUnitCount != a3)
    self->_totalUnitCount = a3;
  if (self->_completedUnitCount != a4)
  {
    self->_completedUnitCount = a4;
    v9 = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v9;
}

- (BOOL)updatePercentComplete:(double)a3
{
  NSObject *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  double v17;
  uint64_t v18;

  if (-[_LTAssetProgress hasComponents](self, "hasComponents"))
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_LTAssetProgress updatePercentComplete:].cold.1();
    return 0;
  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_LTAssetProgress updatePercentComplete:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  v16 = -[_LTAssetProgress totalUnitCount](self, "totalUnitCount");
  if (a3 <= 0.0)
  {
    v18 = 0;
  }
  else
  {
    v17 = (double)v16 * a3;
    if (v17 < 1.0)
      v17 = 1.0;
    v18 = (uint64_t)v17;
  }
  return -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:](self, "updateTotalUnitCount:completedUnitCount:", v16, v18);
}

- (double)fractionCompleted
{
  uint64_t v3;
  uint64_t v4;

  v3 = 0;
  v4 = 0;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v4, &v3);
  if (v4)
    return round((double)v3 / (double)v4 * 1000.0) / 1000.0;
  else
    return 0.0;
}

- (BOOL)isFinished
{
  return -[_LTAssetProgress offlineState](self, "offlineState") == 2;
}

- (BOOL)isCancelled
{
  return -[_LTAssetProgress offlineState](self, "offlineState") == 0;
}

- (void)cancel
{
  -[_LTAssetProgress setOfflineState:](self, "setOfflineState:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_LTAssetProgress identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _LTAssetProgress *v4;
  _LTAssetProgress *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (_LTAssetProgress *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_LTAssetProgress identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTAssetProgress identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        v14 = 0;
        v15 = 0;
        -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v15, &v14);
        v12 = 0;
        v13 = 0;
        -[_LTAssetProgress _fastReadTotal:completed:](v5, "_fastReadTotal:completed:", &v13, &v12);
        v10 = v14 == v12 && v15 == v13;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:totalUnitCount:completedUnitCount:", self->_identifier, self->_totalUnitCount, self->_completedUnitCount);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_components, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)debugDescription
{
  __CFString *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  -[_LTAssetProgress _fastReadTotal:completed:](self, "_fastReadTotal:completed:", &v12, &v11);
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableDictionary count](self->_components, "count"))
  {
    -[NSMutableDictionary debugDescription](self->_components, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_250695360;
  }
  os_unfair_lock_unlock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v12)
    v8 = (double)v11 / (double)v12;
  else
    v8 = 0.0;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@ [%zd / %zd : %.02f] %@>"),
    v6,
    self,
    self->_identifier,
    v11,
    v12,
    *(_QWORD *)&v8,
    v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)componentFilter
{
  return self->_componentFilter;
}

- (void)setComponentFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierPrefix, 0);
  objc_storeStrong((id *)&self->_componentFilter, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOfflineState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance with components cannot have offline state updated directly %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance cannot set nil components %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addComponent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance cannot set itself as a component %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance cannot remove nil components %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance with components cannot have total unit count updated directly %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Total count cannot be 0: %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_235438000, v1, OS_LOG_TYPE_ERROR, "Completed count outside of range 0...%zd: %zd", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updatePercentComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_235438000, v0, v1, "Progress instance with components cannot have percent completion updated directly %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updatePercentComplete:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a1, a3, "Percent completion outside of range 0.0...1.0: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
