@implementation MPMediaEntityResultSetArray

void __45__MPMediaEntityResultSetArray_objectAtIndex___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MPMediaQuery *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(a1[4] + 8), "persistentIDAtIndex:", a1[6]);
  v3 = a1[4];
  if (!*(_QWORD *)(v3 + 40))
  {
    v4 = objc_msgSend(*(id *)(v3 + 8), "count");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    v6 = a1[4];
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (v4)
    {
      v8 = 1;
      do
      {
        v9 = *(void **)(a1[4] + 40);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      while (v4 > v8++);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
    v14 = objc_msgSend(*(id *)(a1[4] + 16), "isSubclassOfClass:", objc_opt_class());
    v15 = a1[4];
    if (v14)
    {
      if (objc_msgSend(*(id *)(v15 + 56), "groupingType") != 6)
      {
        +[MPMediaItem persistentIDPropertyForGroupingType:](MPMediaItem, "persistentIDPropertyForGroupingType:", objc_msgSend(*(id *)(a1[4] + 56), "groupingType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v20, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)objc_msgSend(*(id *)(a1[4] + 56), "copy");
        objc_msgSend(v18, "addFilterPredicate:", v21);
        objc_msgSend(v18, "setGroupingType:", 0);
        objc_msgSend(v18, "setOrderingProperties:", 0);
        objc_msgSend(v18, "setEntityLimit:", 0);
        v22 = -[MPMediaQuery initWithCriteria:library:]([MPMediaQuery alloc], "initWithCriteria:library:", v18, WeakRetained);
        v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1[4] + 16)), "initWithIdentifier:itemsQuery:grouping:", v2, v22, objc_msgSend(*(id *)(a1[4] + 56), "groupingType"));
        objc_msgSend(*(id *)(a1[4] + 40), "setObject:atIndexedSubscript:", v23, a1[6]);

        goto LABEL_14;
      }
      objc_msgSend(WeakRetained, "playlistWithPersistentID:", v2);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(_QWORD *)(v15 + 16);
      if (v17 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], *(_QWORD *)(a1[4] + 16));

      }
      +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", v2, WeakRetained);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v16;
    objc_msgSend(*(id *)(a1[4] + 40), "setObject:atIndexedSubscript:", v16, a1[6]);
LABEL_14:

  }
  objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", a1[6]);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1[5] + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

}

- (unint64_t)count
{
  return -[MPMediaLibraryResultSet count](self->_resultSet, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  NSObject *entitiesQueue;
  id v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19541;
  v11 = __Block_byref_object_dispose__19542;
  v12 = 0;
  entitiesQueue = self->_entitiesQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MPMediaEntityResultSetArray_objectAtIndex___block_invoke;
  v6[3] = &unk_1E315A630;
  v6[6] = a3;
  v6[7] = a2;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(entitiesQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __82__MPMediaEntityResultSetArray_initWithResultSet_queryCriteria_entityType_library___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSectionWithHeaderTitle:sectionIndexTitleIndex:count:", a3, a4, a2);
}

- (MPMediaEntityResultSetArray)initWithResultSet:(id)a3 queryCriteria:(id)a4 entityType:(int64_t)a5 library:(id)a6
{
  id v11;
  id v12;
  id v13;
  MPMediaEntityResultSetArray *v14;
  MPMediaEntityResultSetArray *v15;
  id *p_resultSet;
  id v17;
  void *v18;
  id v19;
  MPMediaQueryMutableSectionInfo *v20;
  id v21;
  MPMediaQueryMutableSectionInfo *v22;
  void *v23;
  MPMediaQuerySectionInfo *sectionInfo;
  MPMediaQueryMutableSectionInfo *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *entitiesQueue;
  _QWORD v29[4];
  MPMediaQueryMutableSectionInfo *v30;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MPMediaEntityResultSetArray;
  v14 = -[MPMediaEntityResultSetArray init](&v31, sel_init);
  v15 = v14;
  if (v14)
  {
    p_resultSet = (id *)&v14->_resultSet;
    objc_storeStrong((id *)&v14->_resultSet, a3);
    v17 = v12;
    v18 = v17;
    if (a5)
      objc_msgSend(v17, "groupingType");
    v19 = (id)objc_opt_class();

    v15->_entityClass = (Class)v19;
    objc_storeWeak((id *)&v15->_library, v13);
    objc_storeStrong((id *)&v15->_queryCriteria, a4);
    v20 = objc_alloc_init(MPMediaQueryMutableSectionInfo);
    v21 = *p_resultSet;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__MPMediaEntityResultSetArray_initWithResultSet_queryCriteria_entityType_library___block_invoke;
    v29[3] = &unk_1E3157828;
    v22 = v20;
    v30 = v22;
    objc_msgSend(v21, "enumerateSectionHeadersUsingBlock:", v29);
    objc_msgSend(*p_resultSet, "sectionIndexTitles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaQuerySectionInfo setSectionIndexTitles:](v22, "setSectionIndexTitles:", v23);

    sectionInfo = v15->_sectionInfo;
    v15->_sectionInfo = &v22->super;
    v25 = v22;

    v15->_revision = objc_msgSend(*p_resultSet, "localRevision");
    v26 = dispatch_queue_create("com.apple.mediaplayer.ResultSetEntities", 0);
    entitiesQueue = v15->_entitiesQueue;
    v15->_entitiesQueue = (OS_dispatch_queue *)v26;

  }
  return v15;
}

- (id)sectionInfo
{
  return self->_sectionInfo;
}

- (MPMediaLibraryResultSet)resultSet
{
  return self->_resultSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCriteria, 0);
  objc_storeStrong((id *)&self->_entitiesQueue, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_resultSet, 0);
}

- (BOOL)isQueryResultSetInvalidated
{
  int64_t revision;

  -[MPMediaLibraryResultSet updateToLibraryCurrentRevision](self->_resultSet, "updateToLibraryCurrentRevision");
  revision = self->_revision;
  return revision != -[MPMediaLibraryResultSet localRevision](self->_resultSet, "localRevision");
}

@end
