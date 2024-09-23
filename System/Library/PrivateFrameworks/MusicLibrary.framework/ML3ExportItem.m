@implementation ML3ExportItem

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 library:(id)a5
{
  return -[ML3ExportItem initWithPersistentId:entityClass:propertyKeysToExport:numKeys:library:](self, "initWithPersistentId:entityClass:propertyKeysToExport:numKeys:library:", a3, a4, 0, 0, a5);
}

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 propertyKeysToExport:(unsigned int *)a5 numKeys:(unsigned int)a6 library:(id)a7
{
  uint64_t v8;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  ML3ExportItem *v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = *(_QWORD *)&a6;
  v13 = a7;
  objc_storeStrong((id *)&self->_entityClass, a4);
  objc_storeStrong((id *)&self->_library, a7);
  -[ML3ExportItem _propertyNamesFromKeys:numKeys:](self, "_propertyNamesFromKeys:numKeys:", a5, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6170;
  v30 = __Block_byref_object_dispose__6171;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class queryWithLibrary:predicate:](a4, "queryWithLibrary:predicate:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __87__ML3ExportItem_initWithPersistentId_entityClass_propertyKeysToExport_numKeys_library___block_invoke;
  v23 = &unk_1E5B61BA8;
  v25 = &v26;
  v17 = v14;
  v24 = v17;
  objc_msgSend(v16, "enumeratePersistentIDsAndProperties:usingBlock:", v17, &v20);

  v18 = -[ML3ExportItem initWithPersistentId:entityClass:properties:library:](self, "initWithPersistentId:entityClass:properties:library:", a3, a4, v27[5], v13, v20, v21, v22, v23);
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(id)a4 properties:(id)a5 library:(id)a6
{
  id v11;
  id v12;
  id v13;
  ML3ExportItem *v14;
  ML3ExportItem *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ML3ExportItem;
  v14 = -[ML3ExportItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityClass, a4);
    v15->_persistentId = a3;
    objc_storeStrong((id *)&v15->_properties, a5);
    objc_storeStrong((id *)&v15->_library, a6);
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: pid=%lld>: %@"), objc_opt_class(), self->_persistentId, self->_properties);
}

- (id)valueForProperty:(unsigned int)a3
{
  NSDictionary *properties;
  void *v4;
  void *v5;

  properties = self->_properties;
  -[ML3ExportItem _propertyNameForKey:](self, "_propertyNameForKey:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary valueForKey:](properties, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (char)charValueForProperty:(unsigned int)a3
{
  void *v3;
  char v4;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "charValue");

  return v4;
}

- (signed)shortValueForProperty:(unsigned int)a3
{
  void *v3;
  signed __int16 v4;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shortValue");

  return v4;
}

- (int)longValueForProperty:(unsigned int)a3
{
  void *v3;
  int v4;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)longlongValueForProperty:(unsigned int)a3
{
  void *v3;
  int64_t v4;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (id)stringValueForProperty:(unsigned int)a3
{
  void *v3;
  id v4;
  void *v5;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)hasValueForProperty:(unsigned int)a3
{
  void *v3;
  BOOL v4;

  -[ML3ExportItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isValid
{
  return -[NSDictionary count](self->_properties, "count") != 0;
}

- (unsigned)propertyKeysToExport:(unsigned int *)a3
{
  return +[ML3ExportItem allExportPropertyKeysForEntityClass:returnedCount:](ML3ExportItem, "allExportPropertyKeysForEntityClass:returnedCount:", self->_entityClass, a3);
}

- (id)exportData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_properties, 1, 0);
}

- (id)_propertyNameForKey:(unsigned int)a3
{
  __CFString *v3;
  __CFString *v4;

  if ((int)a3 <= 184549396)
  {
    switch(a3)
    {
      case 0xA00000Fu:
        v3 = CFSTR("album_pid");
        goto LABEL_26;
      case 0xA000010u:
        v3 = CFSTR("item_artist_pid");
        goto LABEL_26;
      case 0xA000011u:
        v3 = CFSTR("album_artist_pid");
        goto LABEL_26;
      case 0xA000012u:
        v3 = CFSTR("composer_pid");
        goto LABEL_26;
      case 0xA000013u:
        v3 = CFSTR("genre_id");
        goto LABEL_26;
      case 0xA000014u:
      case 0xA000015u:
      case 0xA000016u:
      case 0xA000017u:
      case 0xA000018u:
        goto LABEL_28;
      case 0xA000019u:
        v3 = CFSTR("album.user_rating");
        goto LABEL_26;
      default:
        switch(a3)
        {
          case 0xB000001u:
          case 0xB000002u:
            v3 = CFSTR("container_pid");
            goto LABEL_26;
          case 0xB000003u:
            v3 = CFSTR("distinguished_kind");
            goto LABEL_26;
          case 0xB000008u:
            v3 = CFSTR("name");
            goto LABEL_26;
          default:
            goto LABEL_28;
        }
    }
  }
  if ((int)a3 <= 184549408)
  {
    switch(a3)
    {
      case 0xB000015u:
        v3 = CFSTR("smart_is_folder");
        goto LABEL_26;
      case 0xB000018u:
        v3 = CFSTR("smart_is_genius");
        goto LABEL_26;
      case 0xB000020u:
        v3 = CFSTR("store_cloud_id");
LABEL_26:
        v4 = v3;
        return v3;
    }
LABEL_28:
    ML3TrackRulesGetPropertyNameForKey(HIBYTE(a3), *(uint64_t *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 == 184549409)
  {
    v3 = CFSTR("play_order");
    goto LABEL_26;
  }
  if (a3 == 184549410)
  {
    v3 = CFSTR("is_reversed");
    goto LABEL_26;
  }
  if (a3 != 184549432)
    goto LABEL_28;
  v3 = 0;
  return v3;
}

- (id)_propertyNamesFromKeys:(unsigned int *)a3 numKeys:(unsigned int)a4
{
  unsigned int *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;

  if (a3)
  {
    v6 = a3;
    v7 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      do
      {
        v9 = *v6++;
        -[ML3ExportItem _propertyNameForKey:](self, "_propertyNameForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v8, "addObject:", v10);

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    -[ML3ExportItem _allExportPropertyNames](self, "_allExportPropertyNames", 0, *(_QWORD *)&a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_allExportPropertyNames
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ML3ExportItem__allExportPropertyNames__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  if (_allExportPropertyNames___once != -1)
    dispatch_once(&_allExportPropertyNames___once, block);
  v3 = (void *)_allExportPropertyNames___allExportPropertyNames;
  NSStringFromClass(self->_entityClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

void __40__ML3ExportItem__allExportPropertyNames__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unsigned int *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  unsigned int *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  unsigned int v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_allExportPropertyNames___allExportPropertyNames;
  _allExportPropertyNames___allExportPropertyNames = v2;

  v16 = 0;
  v4 = +[ML3ExportItem allExportPropertyKeysForEntityClass:returnedCount:](ML3ExportItem, "allExportPropertyKeysForEntityClass:returnedCount:", objc_opt_class(), &v16);
  objc_msgSend(*(id *)(a1 + 32), "_propertyNamesFromKeys:numKeys:", v4, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)_allExportPropertyNames___allExportPropertyNames;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v9);

  v10 = +[ML3ExportItem allExportPropertyKeysForEntityClass:returnedCount:](ML3ExportItem, "allExportPropertyKeysForEntityClass:returnedCount:", objc_opt_class(), &v16);
  objc_msgSend(*(id *)(a1 + 32), "_propertyNamesFromKeys:numKeys:", v10, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = (void *)_allExportPropertyNames___allExportPropertyNames;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v15);

}

unint64_t __87__ML3ExportItem_initWithPersistentId_entityClass_propertyKeysToExport_numKeys_library___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  unint64_t result;
  unint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ROWID"));

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v9 = *(_QWORD *)(a3 + 8 * i);
      if (v9)
      {
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

      }
      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
  }
  return result;
}

+ (unsigned)allExportPropertyKeysForEntityClass:(Class)a3 returnedCount:(unsigned int *)a4
{
  unsigned int *result;
  unsigned int v7;

  *a4 = 0;
  if ((Class)objc_opt_class() == a3)
  {
    result = (unsigned int *)&ML3ExportItemAllTrackPropertyKeys;
    v7 = 136;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
      return 0;
    result = (unsigned int *)&ML3ExportItemAllPlaylistPropertyKeys;
    v7 = 7;
  }
  *a4 = v7;
  return result;
}

@end
