@implementation FPLocalizableStringLookup

- (void)setTableNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCfBundle:(id)a3
{
  objc_storeStrong(&self->_cfBundle, a3);
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id cfBundle;
  NSBundle *v9;
  __CFBundle *v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[FPLocalizableStringLookup tableNames](self, "tableNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v23;
    v5 = CFSTR("UNLOCALIZED_FALLBACK_MARKER");
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v6);
        cfBundle = self->_cfBundle;
        v9 = self->_bundle;
        v10 = (__CFBundle *)cfBundle;
        v11 = v7;
        v12 = v4;
        v13 = (__CFString *)v4;
        if (v10)
        {
          v14 = (void *)CFBundleCopyLocalizedString(v10, v13, v5, v11);
        }
        else
        {
          -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v13, v5, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;
        v16 = v5;
        if ((objc_msgSend(v14, "isEqualToString:", v5) & 1) != 0)
          v17 = 0;
        else
          v17 = v15;

        if (v17)
        {

          v4 = v12;
          goto LABEL_17;
        }
        ++v6;
        v4 = v12;
        v5 = v16;
      }
      while (v21 != v6);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v21)
        continue;
      break;
    }
  }

  v17 = v4;
LABEL_17:

  return v17;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong(&self->_cfBundle, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)setTableName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPLocalizableStringLookup setTableNames:](self, "setTableNames:", v6, v7, v8);
}

- (NSString)tableName
{
  void *v2;
  void *v3;

  -[FPLocalizableStringLookup tableNames](self, "tableNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (id)cfBundle
{
  return self->_cfBundle;
}

@end
