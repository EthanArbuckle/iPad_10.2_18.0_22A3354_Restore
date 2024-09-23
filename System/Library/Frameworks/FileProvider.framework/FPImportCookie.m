@implementation FPImportCookie

- (FPImportCookie)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  FPImportCookie *v10;
  FPImportCookie *v11;
  id v13;
  id v14;
  int v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *entries;
  objc_super v18;
  id v19;

  v6 = a3;
  v19 = 0;
  FPGetImportCookieForURL(v6, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      if (a4)
      {
        v13 = objc_retainAutorelease(v8);
LABEL_8:
        v11 = 0;
        *a4 = v13;
        goto LABEL_4;
      }
      goto LABEL_15;
    }
    v18.receiver = self;
    v18.super_class = (Class)FPImportCookie;
    self = -[FPImportCookie init](&v18, sel_init);
    if (self)
    {
      objc_msgSend(v6, "path");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = access((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 0);

      if (v15 < 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v6, CFSTR("FPImportCookie passed non-existent url"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_15:
        v11 = 0;
        goto LABEL_4;
      }
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      entries = self->_entries;
      self->_entries = v16;

    }
    v10 = self;
    self = v10;
    goto LABEL_3;
  }
  v10 = v7;
LABEL_3:
  v11 = v10;
LABEL_4:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entries, CFSTR("_entries"));
}

- (FPImportCookie)initWithCoder:(id)a3
{
  id v4;
  FPImportCookie *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *entries;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPImportCookie;
  v5 = -[FPImportCookie init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_entries"));
    v10 = objc_claimAutoreleasedReturnValue();
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (void)addEntry:(id)a3
{
  NSMutableDictionary *entries;
  id v4;
  id v5;

  entries = self->_entries;
  v4 = a3;
  objc_msgSend(v4, "domainPathRelativeToVolumeRoot");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entries, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)removeEntryForPathRelativeToVolumeRoot:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_entries, "removeObjectForKey:", a3);
}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->_entries, "count") == 0;
}

- (BOOL)hasExpired
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  ExpirationInterval();
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_entries, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "creationTime");
        v15 = v7 - v14;
        if (v12 >= v15)
          v12 = v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1.79769313e308;
  }

  return v12 > v4;
}

- (id)providersWithOngoingImport
{
  double v3;
  double v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  ExpirationInterval();
  v4 = v3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allValues](self->_entries, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          objc_msgSend(v14, "creationTime");
          if (v8 - v17 < v4)
          {
            objc_msgSend(v14, "displayName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v18);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FPImportCookie entries](self, "entries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_map:", &__block_literal_global_15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@>"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __29__FPImportCookie_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (NSDictionary)entries
{
  return &self->_entries->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
