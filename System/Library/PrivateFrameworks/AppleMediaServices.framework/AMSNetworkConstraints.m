@implementation AMSNetworkConstraints

+ (id)networkConstraintsForMediaType:(id)a3 withBag:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  void *v9;
  AMSMutablePromise *v10;
  id v11;
  void *v12;
  AMSMutablePromise *v13;
  _QWORD v15[4];
  AMSMutablePromise *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(v7, "arrayForKey:", 0x1E254D2A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AMSNetworkConstraints_networkConstraintsForMediaType_withBag___block_invoke;
  v15[3] = &unk_1E25441F0;
  v10 = v8;
  v17 = v6;
  v18 = a1;
  v16 = v10;
  v11 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeLimits, 0);
}

void __64__AMSNetworkConstraints_networkConstraintsForMediaType_withBag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_networkConstraintsForMediaType:withArray:", *(_QWORD *)(a1 + 40), a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v8 = (id)v5;
    if (v5)
    {
      objc_msgSend(v6, "finishWithResult:", v5);
    }
    else
    {
      AMSError(7, CFSTR("Media type not found"), CFSTR("Could not find network constraints"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "finishWithError:", v7);

    }
  }
}

+ (id)_networkConstraintsForMediaType:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  AMSNetworkConstraints *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  AMSNetworkConstraints *v14;
  void *v15;
  void *v16;
  AMSNetworkConstraints *v17;
  AMSNetworkConstraints *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    v20 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("kinds"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v13, "count")
            && objc_msgSend(v13, "containsObject:", v5))
          {
            v14 = v9;
            objc_msgSend(v12, "objectForKey:", CFSTR("enabled"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15 || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
            {
              objc_msgSend(v12, "objectForKey:", CFSTR("size-limits"), v20);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v17 = -[AMSNetworkConstraints _initWithStoreConstraintDictionary:]([AMSNetworkConstraints alloc], "_initWithStoreConstraintDictionary:", v16);
              else
                v17 = objc_alloc_init(AMSNetworkConstraints);
              v18 = v17;

            }
            else
            {
              v18 = objc_alloc_init(AMSNetworkConstraints);

              -[AMSNetworkConstraints _disableAllNetworkTypes](v18, "_disableAllNetworkTypes");
            }

            v9 = v18;
            v5 = v20;
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initWithStoreConstraintDictionary:(id)a3
{
  id v4;
  AMSNetworkConstraints *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSNetworkConstraints init](self, "init");
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v13 = objc_msgSend(v12, "longLongValue");
            if (v13 == 1)
              v14 = -1;
            else
              v14 = v13;
            -[AMSNetworkConstraints _setSizeLimit:forNetworkType:](v5, "_setSizeLimit:forNetworkType:", v14, v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v4 = v16;
  }

  return v5;
}

- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(id)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *sizeLimits;
  void *v8;
  id v9;

  v9 = a4;
  if (!self->_sizeLimits)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizeLimits = self->_sizeLimits;
    self->_sizeLimits = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizeLimits, "setObject:forKeyedSubscript:", v8, v9);

}

- (AMSNetworkConstraints)init
{
  AMSNetworkConstraints *v2;
  AMSNetworkConstraints *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSNetworkConstraints;
  v2 = -[AMSNetworkConstraints init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AMSNetworkConstraints _setSizeLimit:forNetworkType:](v2, "_setSizeLimit:forNetworkType:", -1, CFSTR("None"));
  return v3;
}

- (BOOL)hasSizeLimitForNetworkType:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sizeLimits, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)_sizeLimitForNetworkType:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sizeLimits, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "longLongValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)isAnyNetworkTypeEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AMSNetworkConstraints sizeLimits](self, "sizeLimits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AMSNetworkConstraints sizeLimits](self, "sizeLimits", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[AMSNetworkConstraints sizeLimits](self, "sizeLimits");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "longLongValue");
        if ((v13 & 0x8000000000000000) == 0)
        {
          v14 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)isEqualToConstraints:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  -[AMSNetworkConstraints sizeLimits](self, "sizeLimits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "sizeLimits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[AMSNetworkConstraints sizeLimits](self, "sizeLimits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v9;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_134 != -1)
    dispatch_once(&_MergedGlobals_134, &__block_literal_global_98);
  return (NSString *)(id)qword_1ECEAD778;
}

void __38__AMSNetworkConstraints_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD778;
  qword_1ECEAD778 = (uint64_t)CFSTR("AMSNetworkConstraints");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD780 != -1)
    dispatch_once(&qword_1ECEAD780, &__block_literal_global_18_1);
  return (NSString *)(id)qword_1ECEAD788;
}

void __45__AMSNetworkConstraints_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD788;
  qword_1ECEAD788 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_sizeLimits;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB3940];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sizeLimits, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@"), v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v12);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18.receiver = self;
    v18.super_class = (Class)AMSNetworkConstraints;
    -[AMSNetworkConstraints description](&v18, sel_description);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@: %@"), v14, v15);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AMSNetworkConstraints;
    -[AMSNetworkConstraints description](&v19, sel_description);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AMSNetworkConstraints sizeLimits](self, "sizeLimits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AMSNetworkConstraints *v4;
  BOOL v5;

  v4 = (AMSNetworkConstraints *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AMSNetworkConstraints isEqualToConstraints:](self, "isEqualToConstraints:", v4);
  }

  return v5;
}

- (void)_disableAllNetworkTypes
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sizeLimits;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (!self->_sizeLimits)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizeLimits = self->_sizeLimits;
    self->_sizeLimits = v3;

  }
  v17[0] = CFSTR("None");
  v17[1] = CFSTR("2G");
  v17[2] = CFSTR("WiFi");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -1, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizeLimits, "setObject:forKeyedSubscript:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (NSMutableDictionary)sizeLimits
{
  return self->_sizeLimits;
}

- (void)setSizeLimits:(id)a3
{
  objc_storeStrong((id *)&self->_sizeLimits, a3);
}

@end
