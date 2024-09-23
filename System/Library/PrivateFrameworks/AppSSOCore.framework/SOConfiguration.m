@implementation SOConfiguration

- (void)encodeWithCoder:(id)a3
{
  NSArray *profiles;
  id v4;
  id v5;

  profiles = self->_profiles;
  v4 = a3;
  NSStringFromSelector(sel_profiles);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", profiles, v5);

}

- (SOConfiguration)initWithProfiles:(id)a3
{
  id v5;
  NSObject *v6;
  SOConfiguration *v7;
  SOConfiguration *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SOConfiguration *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOConfiguration();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SOConfiguration initWithProfiles:]";
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v19.receiver = self;
  v19.super_class = (Class)SOConfiguration;
  v7 = -[SOConfiguration init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_profiles, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8->_profiles;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "preLoadURLData", (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (SOConfiguration)initWithCoder:(id)a3
{
  id v4;
  SOConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *profiles;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SOConfiguration;
  v5 = -[SOConfiguration init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_profiles);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v11;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v5->_profiles;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "preLoadURLData");
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _BOOL8 v15;
  void *v16;

  v6 = a3;
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ssoid"));

  if (v8)
  {
    -[SOConfiguration _profileForURLWithSSOIDScheme:](self, "_profileForURLWithSSOIDScheme:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("host"));

    if (v11)
    {
      -[SOConfiguration _profileForURLWithHostScheme:](self, "_profileForURLWithHostScheme:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "scheme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("realm"));

      if (v13)
      {
        -[SOConfiguration _profileForURLWithRealmScheme:](self, "_profileForURLWithRealmScheme:", v6);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = a4 == 401 || a4 == 407;
        -[SOConfiguration _profileForURLWithStandardScheme:isCredential:](self, "_profileForURLWithStandardScheme:isCredential:", v6, v15);
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v16 = (void *)v9;

  return v16;
}

- (id)_profileForURLWithStandardScheme:(id)a3 isCredential:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v28;
  uint64_t v29;
  SOConfiguration *v30;
  _BOOL4 v31;
  uint64_t v32;
  NSArray *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = self->_profiles;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    v33 = v7;
    v34 = v6;
    v31 = v4;
    v29 = *(_QWORD *)v40;
    v30 = self;
    while (2)
    {
      v11 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        objc_msgSend(v6, "absoluteString", v29, v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type") == 1 && !v4 && objc_msgSend(v12, "matchesURL:", v13))
        {
LABEL_30:
          v28 = v12;
LABEL_27:

          goto LABEL_29;
        }
        if (objc_msgSend(v12, "type") == 2 && v4)
        {
          objc_msgSend(v6, "host");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SOConfiguration _matchHost:inCredentialProfile:](self, "_matchHost:inCredentialProfile:", v15, v12);

          if (v16)
            goto LABEL_30;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v12, "URLPrefix");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v36;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v36 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_msgSend(v13, "lowercaseString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lowercaseString");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "hasPrefix:", v24);

                if ((v25 & 1) != 0)
                {
                  v26 = v12;

                  v7 = v33;
                  v6 = v34;
                  goto LABEL_27;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v19)
                continue;
              break;
            }
          }

          v7 = v33;
          v6 = v34;
          v4 = v31;
          v10 = v29;
          self = v30;
          v9 = v32;
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      v12 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_29:

  return v12;
}

- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  id v8;
  int64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v21;

  v8 = a3;
  v21 = 0;
  v9 = -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:profile:](self, "willHandleURL:responseCode:callerBundleIdentifier:profile:", v8, a4, a5, &v21);
  v10 = v21;
  v11 = v10;
  if (v9)
  {
    v12 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "type") != 2)
    goto LABEL_12;
  v12 = 1;
  if (a4 != 401 && a4 != 407)
  {
    objc_msgSend(v8, "scheme");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject lowercaseString](v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("host")))
    {
LABEL_9:

      v12 = 1;
LABEL_10:

      goto LABEL_13;
    }
    objc_msgSend(v8, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("realm")) & 1) != 0)
    {

      goto LABEL_9;
    }
    objc_msgSend(v8, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ssoid"));

    if ((v19 & 1) == 0)
    {
      SO_LOG_SOConfiguration();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:].cold.1(a4, v13);
      v12 = 0;
      goto LABEL_10;
    }
LABEL_12:
    v12 = 1;
  }
LABEL_13:

  return v12;
}

- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 profile:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[SOConfiguration profileForURL:responseCode:](self, "profileForURL:responseCode:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v16 = 1;
    goto LABEL_16;
  }
  if (!v10)
    goto LABEL_14;
  objc_msgSend(v11, "extensionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v10))
  {
    v14 = objc_msgSend(v12, "type");

    if (v14 != 2)
    {
      SO_LOG_SOConfiguration();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v21 = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1CF39B000, v15, OS_LOG_TYPE_INFO, "breaking calling recursion for caller with bundleIdentifier: %{public}@", (uint8_t *)&v21, 0xCu);
      }

      v16 = 2;
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v12, "deniedBundleIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v10);

  if (v18)
  {
    SO_LOG_SOConfiguration();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1CF39B000, v19, OS_LOG_TYPE_INFO, "denied caller with bundleIdentifier: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    v16 = 3;
  }
  else
  {
LABEL_14:
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v12);
  }
LABEL_16:

  return v16;
}

- (NSArray)profiles
{
  return self->_profiles;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
}

- (id)realms
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  SOConfiguration *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SOConfiguration realms]";
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_profiles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v14) == 2)
        {
          objc_msgSend(v10, "realm");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "realm");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)empty
{
  return -[NSArray count](self->_profiles, "count") == 0;
}

- (id)description
{
  return -[NSArray description](self->_profiles, "description");
}

- (id)_profileForURLWithHostScheme:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_profiles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v15) == 2)
        {
          objc_msgSend(v4, "host");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[SOConfiguration _matchHost:inCredentialProfile:](self, "_matchHost:inCredentialProfile:", v11, v10);

          if (v12)
          {
            v13 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)_matchHost:(id)a3 inCredentialProfile:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a4, "hosts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("."));
        objc_msgSend(v5, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if ((objc_msgSend(v13, "hasSuffix:", v14) & 1) != 0)
          {
            objc_msgSend(v5, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lowercaseString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((v17 & 1) == 0)
              goto LABEL_16;
          }
          else
          {

          }
        }
        else
        {
          v18 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v18 & 1) != 0)
          {
LABEL_16:
            v19 = 1;
            goto LABEL_17;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (id)_profileForURLWithRealmScheme:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_profiles;
  v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type") == 2)
        {
          objc_msgSend(v9, "realm");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v13 & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v6),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "isEqualToString:", v4),
                v14,
                (v15 & 1) != 0))
          {
            v5 = v9;
            goto LABEL_14;
          }
          v6 = (v6 + 1);
        }
      }
      v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)_profileForURLWithSSOIDScheme:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_profiles;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "extensionBundleIdentifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)stringWithHandleResult:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return *(&off_1E8C5C8D8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown, code: %u"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)willHandleURL:(int)a1 responseCode:(NSObject *)a2 callerBundleIdentifier:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1CF39B000, a2, OS_LOG_TYPE_ERROR, "invalid response code %u, expected 401 or 407", (uint8_t *)v2, 8u);
}

@end
