@implementation EXExtensionPointCatalog

- (EXExtensionPointCatalog)init
{
  void *v3;
  EXExtensionPointCatalog *v4;

  +[EXEnumerator extensionPointDefinitionEnumerator](EXEnumerator, "extensionPointDefinitionEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EXExtensionPointCatalog initWithEnumerator:](self, "initWithEnumerator:", v3);

  return v4;
}

- (EXExtensionPointCatalog)initWithEnumerator:(id)a3
{
  id v4;
  EXExtensionPointCatalog *v5;
  EXExtensionPointCatalog *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *extensionPointByIdentifierPlatform;
  EXExtensionPointCatalog *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EXExtensionPointCatalog;
  v5 = -[EXExtensionPointCatalog init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v21 = v5;
    v7 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@:%u"), v15, objc_msgSend(v13, "platform"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v18 = objc_msgSend(v7, "copy");
    v6 = v21;
    extensionPointByIdentifierPlatform = v21->_extensionPointByIdentifierPlatform;
    v21->_extensionPointByIdentifierPlatform = (NSDictionary *)v18;

  }
  return v6;
}

- (id)extensionPointForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EXExtensionPointCatalog extensionPointForIdentifier:platform:](self, "extensionPointForIdentifier:platform:", v4, dyld_get_active_platform());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)extensionPointForIdentifier:(id)a3 platform:(unsigned int)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_extensionPointByIdentifierPlatform, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)extensionPointByIdentifierPlatform
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPointByIdentifierPlatform, 0);
}

@end
