@implementation _MXBundleBlacklistEntry

- (_MXBundleBlacklistEntry)initWithBundleIdentifier:(id)a3 minimumDisallowedVersion:(id)a4 maximumDisallowedVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MXBundleBlacklistEntry *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MXBundleBlacklistEntry;
  v11 = -[_MXBundleBlacklistEntry init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_minimum, a4);
    objc_storeStrong((id *)&v11->_maximum, a5);
  }

  return v11;
}

- (BOOL)_isVersionValueAllowed:(id)a3
{
  _MXVersion *v4;
  uint64_t v5;
  _MXVersion *maximum;
  _MXVersion *minimum;
  BOOL v8;

  v4 = (_MXVersion *)a3;
  if (*(_OWORD *)&self->_minimum != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_MXVersion stringValue](v4, "stringValue");
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        v8 = 0;
        goto LABEL_16;
      }
      v5 = (uint64_t)v4;
      if (v4)
      {
LABEL_4:
        v4 = -[_MXVersion initWithVersionString:]([_MXVersion alloc], "initWithVersionString:", v5);
        minimum = self->_minimum;
        maximum = self->_maximum;
        if (minimum)
        {
          if (maximum)
          {
            if (-[_MXVersion compare:](maximum, "compare:", v4) == -1)
            {
              v8 = 1;
              goto LABEL_16;
            }
            minimum = self->_minimum;
          }
          maximum = v4;
        }
        else
        {
          minimum = v4;
        }
        v8 = -[_MXVersion compare:](maximum, "compare:", minimum) == -1;
LABEL_16:

        v4 = (_MXVersion *)v5;
        goto LABEL_17;
      }
    }
    v4 = 0;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)isBundleRecordAllowed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_bundleIdentifier);

  if (v6)
  {
    objc_msgSend(v4, "bundleVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_MXBundleBlacklistEntry _isVersionValueAllowed:](self, "_isVersionValueAllowed:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isExtensionAllowed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_bundleIdentifier);

  if (v6)
  {
    objc_msgSend(v4, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_MXBundleBlacklistEntry _isVersionValueAllowed:](self, "_isVersionValueAllowed:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)blacklistEntriesFromDefaultsValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _MXVersion *v17;
  _MXVersion *v18;
  void *v19;
  id v21;
  uint64_t v22;
  _MXVersion *v23;
  _MXVersion *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_29;
  }
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v4;
  v6 = v4;
  v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v25)
    goto LABEL_27;
  v7 = *(_QWORD *)v27;
  v8 = MEMORY[0x1E0C9AAB0];
  v22 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v6, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:", v8))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        objc_msgSend(v11, "objectForKey:", CFSTR("MinimumVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("MaximumVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v12 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v13 = 0;
        }
        v14 = v5;
        v15 = a1;
        v16 = objc_alloc((Class)a1);
        if (v12)
        {
          v17 = -[_MXVersion initWithVersionString:]([_MXVersion alloc], "initWithVersionString:", v12);
          v24 = v17;
          if (v13)
            goto LABEL_16;
LABEL_18:
          v18 = 0;
        }
        else
        {
          v17 = 0;
          if (!v13)
            goto LABEL_18;
LABEL_16:
          v23 = -[_MXVersion initWithVersionString:]([_MXVersion alloc], "initWithVersionString:", v13);
          v18 = v23;
        }
        v19 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:minimumDisallowedVersion:maximumDisallowedVersion:", v10, v17, v18);
        v5 = v14;
        objc_msgSend(v14, "addObject:", v19);

        if (v13)
        a1 = v15;
        v7 = v22;
        if (v12)

        v8 = MEMORY[0x1E0C9AAB0];
        goto LABEL_24;
      }
      v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:minimumDisallowedVersion:maximumDisallowedVersion:", v10, 0, 0);
      objc_msgSend(v5, "addObject:", v12);
LABEL_24:

LABEL_25:
    }
    v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v25);
LABEL_27:

  v4 = v21;
LABEL_29:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
