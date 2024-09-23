@implementation NotesMigrationMapping

+ (id)descriptionStringFromSourceStoreNames:(id)a3 destinationStoreName:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    objc_msgSend(v7, "appendString:", CFSTR("["));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "appendString:", v13, (_QWORD)v18);
        objc_msgSend(v8, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", v14);

        v15 = CFSTR("|");
        if ((_DWORD)v13)
        {
          v16 = objc_msgSend(v8, "count", CFSTR("|"));
          v15 = CFSTR("]");
          if (v16 < 2)
            continue;
        }
        objc_msgSend(v7, "appendString:", v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "appendString:", CFSTR(" -> "));
  objc_msgSend(v7, "appendString:", v6);

  return v7;
}

+ (id)modelForModelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  NoteContextManagedObjectModelPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("mom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v8);
  return v9;
}

+ (id)mappings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NotesMigrationMapping inferredMappingFromSourceModelNames:toDestinationModelName:](NotesMigrationMapping, "inferredMappingFromSourceModelNames:toDestinationModelName:", &unk_1E81F0210, CFSTR("DidChooseToMigrate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[NotesMigrationMapping customMappingFromSourceModelName:toDestinationModelName:](NotesMigrationMapping, "customMappingFromSourceModelName:toDestinationModelName:", CFSTR("ExternalSequenceNumber"), CFSTR("Attachments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  +[NotesMigrationMapping inferredMappingFromSourceModelNames:toDestinationModelName:](NotesMigrationMapping, "inferredMappingFromSourceModelNames:toDestinationModelName:", &unk_1E81F0228, CFSTR("ExternalSequenceNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

+ (id)inferredMappingFromSourceModelNames:(id)a3 toDestinationModelName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "modelForModelName:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v15, "setSourceModels:", v8);
  objc_msgSend(a1, "modelForModelName:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDestinationModel:", v16);

  objc_msgSend(v15, "setType:", 1);
  objc_msgSend(a1, "descriptionStringFromSourceStoreNames:destinationStoreName:", v9, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDescriptionString:", v17);

  return v15;
}

+ (id)customMappingFromSourceModelName:(id)a3 toDestinationModelName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(a1, "modelForModelName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceModels:", v10);

  objc_msgSend(a1, "modelForModelName:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDestinationModel:", v11);

  objc_msgSend(v8, "setType:", 0);
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "descriptionStringFromSourceStoreNames:destinationStoreName:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDescriptionString:", v13);
  return v8;
}

- (id)sourceModelForStoreMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C97B98];
  v5 = a3;
  -[NotesMigrationMapping sourceModels](self, "sourceModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelByMergingModels:forStoreMetadata:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mappingModelForStoreMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v4 = a3;
  if (-[NotesMigrationMapping type](self, "type") == 1)
  {
    -[NotesMigrationMapping sourceModelForStoreMetadata:](self, "sourceModelForStoreMetadata:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C97BA0];
    -[NotesMigrationMapping destinationModel](self, "destinationModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v6, "inferredMappingModelForSourceModel:destinationModel:error:", v5, v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (!v8)
      NSLog(CFSTR("Unexpected error building mapping model for store metadata: %@, error: %@"), v4, v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C97BA0];
    -[NotesMigrationMapping sourceModels](self, "sourceModels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesMigrationMapping destinationModel](self, "destinationModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mappingModelFromBundles:forSourceModel:destinationModel:", 0, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)canMigrateStoreMetadata:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C979F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NotesMigrationMapping sourceModels](self, "sourceModels", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "entityVersionHashesByName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotesMigrationMapping descriptionString](self, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p ; %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSManagedObjectModel)destinationModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestinationModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)sourceModels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourceModels:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)descriptionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDescriptionString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_sourceModels, 0);
  objc_storeStrong((id *)&self->_destinationModel, 0);
}

@end
