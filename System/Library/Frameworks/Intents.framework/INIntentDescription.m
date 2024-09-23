@implementation INIntentDescription

uint64_t __39__INIntentDescription_slotDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rank");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "rank");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "rank");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rank");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v13 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(a1 + 32);
        v20 = v13;
        objc_msgSend(v19, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "facadePropertyName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136315650;
        v24 = "-[INIntentDescription slotDescriptions]_block_invoke";
        v25 = 2112;
        v26 = v21;
        v27 = 2112;
        v28 = v22;
        _os_log_error_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_ERROR, "%s Slot %@:%@ does not have a valid rank", (uint8_t *)&v23, 0x20u);

      }
      v11 = 1;
    }
  }
  else
  {
    v12 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 32);
      v16 = v12;
      objc_msgSend(v15, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "facadePropertyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315650;
      v24 = "-[INIntentDescription slotDescriptions]_block_invoke";
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Slot %@:%@ does not have a valid rank", (uint8_t *)&v23, 0x20u);

    }
    v11 = -1;
  }

  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (INIntentDescription)initWithName:(id)a3 responseName:(id)a4 facadeClass:(Class)a5 dataClass:(Class)a6 type:(id)a7 isPrivate:(BOOL)a8 handleSelector:(SEL)a9 confirmSelector:(SEL)a10 slotsByName:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  INIntentDescription *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *responseName;
  uint64_t v26;
  NSString *type;
  uint64_t v28;
  NSDictionary *slotsByName;
  id v30;
  NSDictionary *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  NSDictionary *alternativeSlotNames;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a11;
  v46.receiver = self;
  v46.super_class = (Class)INIntentDescription;
  v21 = -[INIntentDescription init](&v46, sel_init);
  if (v21)
  {
    v45 = v17;
    v22 = objc_msgSend(v17, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v22;

    v44 = v18;
    v24 = objc_msgSend(v18, "copy");
    responseName = v21->_responseName;
    v21->_responseName = (NSString *)v24;

    v21->_facadeClass = a5;
    v21->_dataClass = a6;
    v43 = v19;
    v26 = objc_msgSend(v19, "copy");
    type = v21->_type;
    v21->_type = (NSString *)v26;

    v21->_isPrivate = a8;
    v21->_handleSelector = a9;
    v21->_confirmSelector = a10;
    v28 = objc_msgSend(v20, "copy");
    slotsByName = v21->_slotsByName;
    v21->_slotsByName = (NSDictionary *)v28;

    v42 = v20;
    v30 = v20;
    v31 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v30, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v30, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v48 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v30, "objectForKeyedSubscript:", v37, v42);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "facadePropertyName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v31, "setObject:forKey:", v37, v39);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v34);
    }

    alternativeSlotNames = v21->_alternativeSlotNames;
    v21->_alternativeSlotNames = v31;

    v18 = v44;
    v17 = v45;
    v20 = v42;
    v19 = v43;
  }

  return v21;
}

- (id)slotDescriptions
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSDictionary allValues](self->_slotsByName, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__INIntentDescription_slotDescriptions__block_invoke;
  v6[3] = &unk_1E228CD48;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)facadeClass
{
  return self->_facadeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_responseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_alternativeSlotNames, 0);
  objc_storeStrong((id *)&self->_slotsByName, 0);
}

- (id)slotByName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_slotsByName, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_alternativeSlotNames, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && (-[NSDictionary objectForKeyedSubscript:](self->_slotsByName, "objectForKeyedSubscript:", v7),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v6 = v8;
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  _BOOL8 isPrivate;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_responseName, "hash") ^ v3;
  NSStringFromClass(self->_facadeClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  NSStringFromClass(self->_dataClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_type, "hash");
  isPrivate = self->_isPrivate;
  NSStringFromSelector(self->_handleSelector);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = isPrivate ^ objc_msgSend(v11, "hash");
  NSStringFromSelector(self->_confirmSelector);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[NSDictionary hash](self->_slotsByName, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDictionary **v5;
  NSString *name;
  NSString *responseName;
  BOOL v8;
  NSString *type;
  NSDictionary *slotsByName;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSDictionary **)v4;
    name = self->_name;
    v8 = 0;
    if (name == (NSString *)v5[4] || -[NSString isEqualToString:](name, "isEqualToString:"))
    {
      responseName = self->_responseName;
      if ((responseName == (NSString *)v5[5] || -[NSString isEqualToString:](responseName, "isEqualToString:"))
        && (NSDictionary *)self->_facadeClass == v5[6]
        && (NSDictionary *)self->_dataClass == v5[7])
      {
        type = self->_type;
        if ((type == (NSString *)v5[8] || -[NSString isEqualToString:](type, "isEqualToString:"))
          && self->_isPrivate == *((unsigned __int8 *)v5 + 24)
          && (NSDictionary *)self->_handleSelector == v5[9]
          && (NSDictionary *)self->_confirmSelector == v5[10])
        {
          slotsByName = self->_slotsByName;
          if (slotsByName == v5[1] || -[NSDictionary isEqualToDictionary:](slotsByName, "isEqualToDictionary:"))
            v8 = 1;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)slotsByName
{
  return self->_slotsByName;
}

- (NSString)responseName
{
  return self->_responseName;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (SEL)handleSelector
{
  return self->_handleSelector;
}

- (SEL)confirmSelector
{
  return self->_confirmSelector;
}

@end
