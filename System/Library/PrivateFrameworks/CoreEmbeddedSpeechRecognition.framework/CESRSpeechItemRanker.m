@implementation CESRSpeechItemRanker

uint64_t __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(a1[5] + 8);
  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 24) = v2 + 1;
  if (v2 >= a1[6])
    return 1;
  else
    return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __73__CESRSpeechItemRanker_Contact_enumerateRankedItemsWithError_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = a2;
  v4 = v3;
  v5 = (void *)a1[4];
  if (v5)
  {
    objc_msgSend(v3, "metaContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "ordinality");
      v9 = *(uint64_t (**)(void))(a1[5] + 16);
    }
    else
    {
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(_DWORD *)(v11 + 24);
      if (!v12)
      {
        v10 = 1;
        goto LABEL_8;
      }
      *(_DWORD *)(v11 + 24) = v12 - 1;
      v9 = *(uint64_t (**)(void))(a1[5] + 16);
    }
    v10 = v9();
LABEL_8:

    goto LABEL_9;
  }
  v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
LABEL_9:

  return v10;
}

uint64_t __53__CESRSpeechItemRanker_Media__queryAndRankMediaItems__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  id *v13;
  id *v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  id *v19;
  void *v21;
  char v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_19;
  objc_msgSend(v3, "metaContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1[4], "containsObject:", v7))
    goto LABEL_18;
  v22 = isKindOfClass;
  v23 = v3;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v6;
  objc_msgSend(v6, "linkedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = *(_QWORD *)v25;
  v12 = a1 + 7;
  v13 = a1 + 6;
  v14 = a1 + 5;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v16, "sourceItemIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_msgSend(v16, "type");
        if (v18 == 3)
        {
          v19 = v12;
LABEL_14:
          objc_msgSend(*v19, "setObject:forKey:", v17, v7);
          goto LABEL_15;
        }
        v19 = v14;
        if (v18 == 2)
          goto LABEL_14;
        v19 = v13;
        if (v18 == 1)
          goto LABEL_14;
      }
LABEL_15:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v10);
LABEL_17:

  v3 = v23;
  isKindOfClass = v22;
  v6 = v21;
LABEL_18:

LABEL_19:
  return isKindOfClass & 1;
}

uint64_t __71__CESRSpeechItemRanker_Media_enumerateRankedItemsWithError_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  if (!objc_msgSend(*(id *)(a1[4] + 56), "count"))
  {
    if (+[CESRSpeechItemRanker_Media _isPlayableItem:](CESRSpeechItemRanker_Media, "_isPlayableItem:", v3)&& (v12 = *(_QWORD *)(a1[7] + 8), (v13 = *(_QWORD *)(v12 + 24)) != 0)|| +[CESRSpeechItemRanker_Media _isArtistItem:](CESRSpeechItemRanker_Media, "_isArtistItem:", v3)&& (v12 = *(_QWORD *)(a1[8] + 8), (v13 = *(_QWORD *)(v12 + 24)) != 0))
    {
      *(_QWORD *)(v12 + 24) = v13 - 1;
      v11 = (*(uint64_t (**)(void))(a1[6] + 16))();
      goto LABEL_13;
    }
LABEL_12:
    v11 = 1;
    goto LABEL_13;
  }
  v4 = *(void **)(a1[4] + 56);
  objc_msgSend(v3, "metaContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || a1[9] <= (unint64_t)objc_msgSend(v7, "unsignedIntValue"))
  {
    v8 = (void *)a1[5];
    objc_msgSend(v3, "metaContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "containsObject:", v10);

    if (!(_DWORD)v8)
    {

      goto LABEL_12;
    }
  }
  v11 = (*(uint64_t (**)(void))(a1[6] + 16))();

LABEL_13:
  return v11;
}

- (CESRSpeechItemRanker)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CESRSpeechItemRanker)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  id v9;
  id v10;
  id v11;
  CESRSpeechItemRanker *v12;
  CESRSpeechItemRanker *v13;
  NSMutableArray *v14;
  NSMutableArray *sets;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CESRSpeechItemRanker;
  v12 = -[CESRSpeechItemRanker init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instance, a3);
    objc_storeStrong((id *)&v13->_speechProfileSite, a4);
    objc_storeStrong((id *)&v13->_categoryGroup, a5);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sets = v13->_sets;
    v13->_sets = v14;

    v13->_enumeratedItemCount = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CESRSpeechItemRanker *v7;
  CESRSpeechItemRanker *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = (CESRSpeechItemRanker *)a3;
  v8 = v7;
  if (v7 == self)
  {
    v11 = 1;
    goto LABEL_23;
  }
  if (!v7 || !-[CESRSpeechItemRanker isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = 0;
    goto LABEL_23;
  }
  -[CESRSpeechItemRanker instance](self, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[CESRSpeechItemRanker instance](v8, "instance"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CESRSpeechItemRanker instance](self, "instance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CESRSpeechItemRanker instance](v8, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v11 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v10 = 1;
  }
  else
  {
    v16 = 0;
    v10 = 0;
  }
  -[CESRSpeechItemRanker sets](self, "sets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (-[CESRSpeechItemRanker sets](v8, "sets"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CESRSpeechItemRanker sets](self, "sets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CESRSpeechItemRanker sets](v8, "sets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEqual:", v14);

    if (v12)
      goto LABEL_18;
  }
  else
  {
    v11 = 1;
  }

LABEL_18:
  if (v10)
    goto LABEL_19;
LABEL_20:
  if (!v9)

LABEL_23:
  return v11;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_sets, "hash");
}

- (BOOL)addSet:(id)a3
{
  -[NSMutableArray addObject:](self->_sets, "addObject:", a3);
  return 1;
}

- (id)sets
{
  return self->_sets;
}

- (BOOL)hasSets
{
  return -[NSMutableArray count](self->_sets, "count") != 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRSpeechItemRanker instance](self, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRSpeechItemRanker sets](self, "sets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@) - sets: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)calculateItemLimit
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[CESRSpeechProfileCategoryGroup speechCategories](self->_categoryGroup, "speechCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechProfileBuilder categoryToLimitHintMap](CESRSpeechProfileBuilder, "categoryToLimitHintMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "unsignedIntValue") < v8)
          v8 = objc_msgSend(v11, "unsignedIntValue");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v6);
  }
  else
  {
    v8 = -1;
  }

  v12 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v4, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[CESRSpeechItemRanker calculateItemLimit]";
    v23 = 1024;
    v24 = v8;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_INFO, "%s Resolved Limit: %u from categories: %@", buf, 0x1Cu);

  }
  return v8;
}

- (id)getAllCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)getActivatedCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)enumerateAllItemsOfSet:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  CESRSpeechProfileInstance *instance;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  CESRSpeechProfileInstance *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2629;
  v41 = __Block_byref_object_dispose__2630;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  -[CESRSpeechProfileInstance changeRegistry](self->_instance, "changeRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changePublisherWithUseCase:", CFSTR("SpeechProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke;
  v28[3] = &unk_1E67344E8;
  v13 = v10;
  v29 = v13;
  v14 = v8;
  v30 = v14;
  v31 = &v37;
  v32 = &v33;
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke_16;
  v24[3] = &unk_1E6734510;
  v15 = v9;
  v25 = v15;
  v26 = &v37;
  v27 = &v33;
  v16 = (id)objc_msgSend(v11, "drivableSinkWithBookmark:completion:shouldContinue:", 0, v28, v24);

  v17 = v38;
  if (*((_BYTE *)v34 + 24) && !v38[5])
  {
    v19 = 1;
  }
  else
  {
    v18 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      instance = self->_instance;
      v23 = v17[5];
      *(_DWORD *)buf = 136315906;
      v44 = "-[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:]";
      v45 = 2112;
      v46 = instance;
      v47 = 2112;
      v48 = v14;
      v49 = 2112;
      v50 = v23;
      _os_log_error_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
      v17 = v38;
    }
    v19 = 0;
    if (a4)
    {
      v20 = (void *)v17[5];
      if (v20)
      {
        v19 = 0;
        *a4 = objc_retainAutorelease(v20);
      }
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v19;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  NSMutableArray *obj;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_sets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __65__CESRSpeechItemRanker_enumerateRankedItemsWithError_usingBlock___block_invoke;
        v16[3] = &unk_1E6734538;
        v16[4] = self;
        v17 = v6;
        LODWORD(v12) = -[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:](self, "enumerateAllItemsOfSet:error:usingBlock:", v12, a3, v16);

        if (!(_DWORD)v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (int64_t)enumeratedItemCount
{
  return self->_enumeratedItemCount;
}

- (BOOL)refreshRankedItemCache:(id *)a3
{
  return 1;
}

- (CESRSpeechProfileInstance)instance
{
  return self->_instance;
}

- (CESRSpeechProfileSite)speechProfileSite
{
  return self->_speechProfileSite;
}

- (CESRSpeechProfileCategoryGroup)categoryGroup
{
  return self->_categoryGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryGroup, 0);
  objc_storeStrong((id *)&self->_speechProfileSite, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_sets, 0);
}

uint64_t __65__CESRSpeechItemRanker_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  id obj;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "state"))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    objc_msgSend(v5, "error");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)a1[4];
    v11 = a1[5];
    v12 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v10, "updateBookmark:forSet:error:", v6, v11, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      v14 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v18 = "-[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:]_block_invoke";
        v19 = 2112;
        v20 = v15;
        _os_log_error_impl(&dword_1B3E5F000, v14, OS_LOG_TYPE_ERROR, "%s Failed to update bookmark, error: %@", buf, 0x16u);
      }
    }
  }

}

uint64_t __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke_16(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a2, "addedLocalInstances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = a1[4];
        v9 = *(_QWORD *)(a1[5] + 8);
        obj = *(id *)(v9 + 40);
        v10 = (*(uint64_t (**)(void))(v8 + 16))();
        objc_storeStrong((id *)(v9 + 40), obj);
        if ((v10 & 1) == 0)
        {
          v11 = 0;
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

+ (id)rankersForInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 sets:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CESRSpeechItemRanker_Contact *v13;
  CESRSpeechItemRanker_Media *v14;
  CESRSpeechItemRanker *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[CESRSpeechItemRanker_Contact initWithInstance:speechProfileSite:categoryGroup:]([CESRSpeechItemRanker_Contact alloc], "initWithInstance:speechProfileSite:categoryGroup:", v9, v10, v11);
  v54[0] = v13;
  v14 = -[CESRSpeechItemRanker_Media initWithInstance:speechProfileSite:categoryGroup:]([CESRSpeechItemRanker_Media alloc], "initWithInstance:speechProfileSite:categoryGroup:", v9, v10, v11);
  v54[1] = v14;
  v37 = v10;
  v38 = v9;
  v36 = v11;
  v15 = -[CESRSpeechItemRanker initWithInstance:speechProfileSite:categoryGroup:]([CESRSpeechItemRanker alloc], "initWithInstance:speechProfileSite:categoryGroup:", v9, v10, v11);
  v54[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v23 = v16;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v44;
LABEL_8:
          v27 = 0;
          while (1)
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v23);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v27), "addSet:", v22) & 1) != 0)
              break;
            if (v25 == ++v27)
            {
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
              if (v25)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v19);
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v29 = v16;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (objc_msgSend(v34, "hasSets"))
          objc_msgSend(v28, "addObject:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v31);
  }

  return v28;
}

+ (void)refreshRankedItemCachesForInstance:(id)a3 speechProfileSite:(id)a4
{
  id v5;
  id v6;
  CESRSpeechItemRanker_Media *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[CESRSpeechItemRanker_Media initWithInstance:speechProfileSite:categoryGroup:]([CESRSpeechItemRanker_Media alloc], "initWithInstance:speechProfileSite:categoryGroup:", v5, v6, 0);

  v10 = 0;
  LOBYTE(v6) = -[CESRSpeechItemRanker_Media refreshRankedItemCache:](v7, "refreshRankedItemCache:", &v10);
  v8 = v10;
  if ((v6 & 1) == 0)
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "+[CESRSpeechItemRanker refreshRankedItemCachesForInstance:speechProfileSite:]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s (%@) Ranked item cache refresh failed: %@", buf, 0x20u);
    }
  }

}

@end
