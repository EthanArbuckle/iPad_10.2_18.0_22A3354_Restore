@implementation HMApplicationData

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMApplicationData dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)dictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_applicationData, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
}

- (HMApplicationData)init
{
  return -[HMApplicationData initWithContentsOfDictionary:](self, "initWithContentsOfDictionary:", 0);
}

- (HMApplicationData)initWithDictionaryFromCoder:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMApplicationData *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "allowedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMApplicationData initWithContentsOfDictionary:](self, "initWithContentsOfDictionary:", v9);
  return v10;
}

- (HMApplicationData)initWithContentsOfDictionary:(id)a3
{
  id v4;
  HMApplicationData *v5;
  HMApplicationData *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMAsset *v19;
  id v20;
  uint64_t v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  NSMutableDictionary *applicationData;
  uint64_t v30;
  HMApplicationData *v32;
  void *v33;
  NSMutableDictionary *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)HMApplicationData;
  v5 = -[HMApplicationData init](&v44, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v32 = v5;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      v33 = v4;
      v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("kAssetsKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v8)
      {
        v9 = v8;
        v35 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v41 != v35)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v7, "hmf_dictionaryForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              v14 = v7;
              objc_msgSend(v12, "hmf_stringForKey:", CFSTR("kIdentifierKey"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "hmf_stringForKey:", CFSTR("kAssetURLKey"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v17 = 0;
              }
              objc_msgSend(v13, "hmf_dictionaryForKey:", CFSTR("kAssetMetadataKey"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[HMAsset initWithIdentifier:metadata:resourceURL:]([HMAsset alloc], "initWithIdentifier:metadata:resourceURL:", v15, v18, v17);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v19, v11);

              v7 = v14;
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v9);
      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v4 = v33;
      v20 = v33;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      v22 = v34;
      if (v21)
      {
        v23 = v21;
        v24 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            if ((objc_msgSend(v26, "isEqualToString:", CFSTR("kAssetsKey")) & 1) == 0)
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v27, v26);

            }
          }
          v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v23);
      }

      v28 = -[NSMutableDictionary mutableCopy](v34, "mutableCopy");
      v6 = v32;
      applicationData = v32->_applicationData;
      v32->_applicationData = (NSMutableDictionary *)v28;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v30 = objc_claimAutoreleasedReturnValue();
      v22 = v6->_applicationData;
      v6->_applicationData = (NSMutableDictionary *)v30;
    }

  }
  return v6;
}

+ (NSSet)allowedObjectClasses
{
  if (allowedObjectClasses__hmf_once_t0 != -1)
    dispatch_once(&allowedObjectClasses__hmf_once_t0, &__block_literal_global_11402);
  return (NSSet *)(id)allowedObjectClasses__hmf_once_v1;
}

void __41__HMApplicationData_allowedObjectClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)allowedObjectClasses__hmf_once_v1;
  allowedObjectClasses__hmf_once_v1 = v8;

}

- (NSArray)allKeys
{
  void *v2;
  void *v3;

  -[HMApplicationData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allValues
{
  void *v2;
  void *v3;

  -[HMApplicationData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[HMApplicationData validateObject:]((uint64_t)self, v8);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary setObject:forKey:](self->_applicationData, "setObject:forKey:", v8, v6);
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary removeObjectForKey:](self->_applicationData, "removeObjectForKey:", v6);
  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)isEmpty
{
  HMApplicationData *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_applicationData, "count") == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDictionary:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    -[HMApplicationData validateObject:]((uint64_t)self, v4);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary setDictionary:](self->_applicationData, "setDictionary:", v6);
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary removeAllObjects](self->_applicationData, "removeAllObjects");
  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)isEqual:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMApplicationData *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMApplicationData dictionary](self, "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMApplicationData dictionary](v5, "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = HMFEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMApplicationData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMApplicationData *v4;
  void *v5;
  HMApplicationData *v6;

  v4 = [HMApplicationData alloc];
  -[HMApplicationData dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMApplicationData initWithContentsOfDictionary:](v4, "initWithContentsOfDictionary:", v5);

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  -[HMApplicationData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__HMApplicationData_dictionaryRepresentation__block_invoke;
  v13 = &unk_1E3AAED28;
  v5 = v4;
  v14 = v5;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v10);
  if (objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kAssetsKey"));

  }
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

void __45__HMApplicationData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (id *)(a1 + 32);
    v8 = (void *)v9;
  }
  else
  {
    v10 = (id *)(a1 + 40);
    v9 = (uint64_t)v5;
  }
  objc_msgSend(*v10, "setObject:forKeyedSubscript:", v9, v11);

}

- (void)validateObject:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v24 != v7)
              objc_enumerationMutation(v4);
            -[HMApplicationData validateObject:](a1, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v6);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v3;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __36__HMApplicationData_validateObject___block_invoke;
        v20[3] = &unk_1E3AAED00;
        v21 = v9;
        v22 = a1;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v20);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "allowedObjectClasses");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
        if (!v11)
          goto LABEL_21;
        v12 = v11;
        v13 = *(_QWORD *)v17;
LABEL_15:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
            if (!v12)
            {
LABEL_21:

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported data type %@ - allowed %@"), objc_opt_class(), v10, v16);
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
              v15 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v15);
            }
            goto LABEL_15;
          }
        }

      }
    }
  }

}

void __36__HMApplicationData_validateObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported dictionary key type %@, must be NSString"), objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  -[HMApplicationData validateObject:](*(_QWORD *)(a1 + 40), v5);

}

@end
