@implementation GKPlayerActivitySectionInternal

- (GKPlayerActivitySectionInternal)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivitySectionInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __objc2_class **v17;
  void *v18;
  GKPlayerActivitySectionInternal *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKPlayerActivitySectionInternal;
  v5 = -[GKPlayerActivitySectionInternal init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivitySectionInternal setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5;
    -[GKPlayerActivitySectionInternal setInstrumentationKey:](v5, "setInstrumentationKey:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("symbol"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              v17 = off_1E75AF988;
            else
              v17 = off_1E75AF940;
            v18 = (void *)objc_msgSend(objc_alloc(*v17), "initWithDictionary:", v15);
            objc_msgSend(v8, "addObject:", v18);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
      }
    }
    v5 = v20;
    -[GKPlayerActivitySectionInternal setItems:](v20, "setItems:", v8);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerActivitySectionInternal title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySectionInternal items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivitySectionInternal instrumentationKey](self, "instrumentationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("title: %@            \n items: %@            \n instrumentationKey: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_156 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_156, &__block_literal_global_157);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_155;
}

void __58__GKPlayerActivitySectionInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("title"), CFSTR("instrumentationKey"), CFSTR("items"), v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_155;
  secureCodedPropertyKeys_sSecureCodedKeys_155 = v4;

}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
