@implementation DNDSPlaceholderModesRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4;
  DNDSJSONBackingStore *v5;

  v4 = a3;
  v5 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:versionNumber:", a1, v4, 1);

  return v5;
}

- (DNDSPlaceholderModesRecord)init
{
  return (DNDSPlaceholderModesRecord *)-[DNDSPlaceholderModesRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "placeholderModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSPlaceholderModesRecord _initWithModePlaceholders:](self, "_initWithModePlaceholders:", v4);

  return v5;
}

- (id)_initWithModePlaceholders:(id)a3
{
  id v5;
  DNDSPlaceholderModesRecord *v6;
  DNDSPlaceholderModesRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSPlaceholderModesRecord;
  v6 = -[DNDSPlaceholderModesRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_placeholderModes, a3);

  return v7;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_placeholderModes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDSPlaceholderModesRecord *v4;
  DNDSPlaceholderModesRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSPlaceholderModesRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSPlaceholderModesRecord placeholderModes](self, "placeholderModes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSPlaceholderModesRecord placeholderModes](v5, "placeholderModes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSPlaceholderModesRecord placeholderModes](self, "placeholderModes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSPlaceholderModesRecord placeholderModes](v5, "placeholderModes");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSPlaceholderModesRecord placeholderModes](self, "placeholderModes");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSPlaceholderModesRecord placeholderModes](v5, "placeholderModes");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; placeholderModes: %@>"),
                       objc_opt_class(),
                       self,
                       self->_placeholderModes);
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_placeholderModes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "dictionaryRepresentationWithContext:", v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("placeholderModes"));

  return v12;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("placeholderModes"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = +[DNDSModeRecord newWithDictionaryRepresentation:context:](DNDSModeRecord, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v7, (_QWORD)v18);
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithModePlaceholders:", v9);
  return v16;
}

- (NSArray)placeholderModes
{
  return self->_placeholderModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderModes, 0);
}

@end
