@implementation _INVocabularyGenerationDocument

- (void)assignMissingSiriIDsForOptimalDiffFromPreviousDocument:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _INVocabularyGenerationDocument *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_haveAssignedAllSiriIDs)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[_INVocabularyGenerationDocument assignMissingSiriIDsForOptimalDiffFromPreviousDocument:]";
      v41 = 2112;
      v42 = v4;
      _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    v28 = self;
    -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v14, "_siriID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = v8;
            v17 = v15;
          }
          else
          {
            v16 = v7;
            v17 = v14;
          }
          objc_msgSend(v16, "addObject:", v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }
    v27 = v9;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v23, "string", v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_vocabularyItemWithString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_23;
          objc_msgSend(v25, "_siriID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26 || objc_msgSend(v8, "containsObject:", v26))
          {

LABEL_23:
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v23, "_setSiriID:", v26);
          objc_msgSend(v8, "addObject:", v26);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    v28->_haveAssignedAllSiriIDs = 1;
  }

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", &unk_1E23E99B8, CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INVocabularyGenerationDocument resetOnNextSync](self, "resetOnNextSync"))
    objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("resetOnNextSync"));
  -[_INVocabularyGenerationDocument _addValueForSelector:toDictionary:](self, "_addValueForSelector:toDictionary:", sel_validity, v3);
  -[_INVocabularyGenerationDocument _addValueForSelector:toDictionary:](self, "_addValueForSelector:toDictionary:", sel_thisGeneration, v3);
  -[_INVocabularyGenerationDocument _addValueForSelector:toDictionary:](self, "_addValueForSelector:toDictionary:", sel_appBundleID, v3);
  -[_INVocabularyGenerationDocument _addValueForSelector:toDictionary:](self, "_addValueForSelector:toDictionary:", sel_intentSlot, v3);
  -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("_dictionaryForSaving"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("vocabularyItems"));
  return v3;
}

- (void)_addValueForSelector:(SEL)a3 toDictionary:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[_INVocabularyGenerationDocument performSelector:](self, "performSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSStringFromSelector(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v6, v7);

  }
}

- (NSString)validity
{
  return self->_validity;
}

- (NSString)thisGeneration
{
  return self->_thisGeneration;
}

- (BOOL)resetOnNextSync
{
  return self->_resetOnNextSync;
}

- (NSString)intentSlot
{
  return self->_intentSlot;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (id)diffFromPreviousDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  _INVocabularyGenerationDiff *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _INVocabularyGenerationDiff *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  _INVocabularyGenerationDiff *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  _BYTE v57[10];
  _QWORD v58[5];

  *(_QWORD *)((char *)&v58[2] + 6) = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "appBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INVocabularyGenerationDocument appBundleID](self, "appBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v5, "intentSlot");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INVocabularyGenerationDocument intentSlot](self, "intentSlot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_4;
      v44 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v38 = 0;
        goto LABEL_32;
      }
      v40 = v44;
      objc_msgSend(v5, "intentSlot");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INVocabularyGenerationDocument intentSlot](self, "intentSlot");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v54 = 2082;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v56 = 2114;
      *(_QWORD *)v57 = v41;
      *(_WORD *)&v57[8] = 2114;
      v58[0] = v42;
      v43 = "%s %{public}s previous document's slot %{public}@ != ours %{public}@";
    }
    else
    {
      v39 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      v40 = v39;
      objc_msgSend(v5, "appBundleID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INVocabularyGenerationDocument appBundleID](self, "appBundleID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v54 = 2082;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v56 = 2114;
      *(_QWORD *)v57 = v41;
      *(_WORD *)&v57[8] = 2114;
      v58[0] = v42;
      v43 = "%s %{public}s previous document's appBundleID %{public}@ != ours %{public}@";
    }
    _os_log_error_impl(&dword_18BEBC000, v40, OS_LOG_TYPE_ERROR, v43, buf, 0x2Au);

    goto LABEL_31;
  }
LABEL_4:
  v12 = objc_alloc_init(_INVocabularyGenerationDiff);
  -[_INVocabularyGenerationDocument appBundleID](self, "appBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDiff setAppBundleID:](v12, "setAppBundleID:", v13);

  -[_INVocabularyGenerationDocument intentSlot](self, "intentSlot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDiff setIntentSlotName:](v12, "setIntentSlotName:", v14);

  objc_msgSend(v5, "vocabularyItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 && (objc_msgSend(v5, "haveAssignedAllSiriIDs") & 1) == 0)
  {
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v54 = 2080;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v56 = 2112;
      *(_QWORD *)v57 = v5;
      _os_log_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_INFO, "%s %s previous document %@ has items that are missing identifiers, so it can not be trusted as a source for remote truth.", buf, 0x20u);
    }

    v5 = 0;
  }
  if ((objc_msgSend(v5, "resetOnNextSync") & 1) != 0
    || -[_INVocabularyGenerationDocument resetOnNextSync](self, "resetOnNextSync"))
  {
    v18 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      v20 = objc_msgSend(v5, "resetOnNextSync");
      v21 = -[_INVocabularyGenerationDocument resetOnNextSync](self, "resetOnNextSync");
      *(_DWORD *)buf = 136316162;
      v53 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v54 = 2080;
      v55 = "-[_INVocabularyGenerationDocument diffFromPreviousDocument:]";
      v56 = 1024;
      *(_DWORD *)v57 = v20;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v21;
      LOWORD(v58[0]) = 2112;
      *(_QWORD *)((char *)v58 + 2) = v5;
      _os_log_impl(&dword_18BEBC000, v19, OS_LOG_TYPE_INFO, "%s %s Reset requested by old=%d current=%d, computing diff as-if from nil. Discarded old %@", buf, 0x2Cu);

    }
    goto LABEL_14;
  }
  if (!v5)
  {
LABEL_14:
    -[_INVocabularyGenerationDiff setIsFullReset:](v12, "setIsFullReset:", 1);
    v5 = 0;
  }
  objc_msgSend(v5, "vocabularyItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
    -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
      -[_INVocabularyGenerationDiff setIsFullReset:](v12, "setIsFullReset:", 1);
  }
  v46 = v12;
  objc_msgSend(v5, "assignMissingSiriIDsForOptimalDiffFromPreviousDocument:", 0);
  -[_INVocabularyGenerationDocument assignMissingSiriIDsForOptimalDiffFromPreviousDocument:](self, "assignMissingSiriIDsForOptimalDiffFromPreviousDocument:", v5);
  -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_everyVocabularyItemSiriID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v29 = v26;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v48 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v34, "_siriID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObject:", v35);

        objc_msgSend(v34, "_siriID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_vocabularyItemForSiriID:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v37, "_isSimilarEnoughToNotSync:", v34) & 1) == 0)
          objc_msgSend(v28, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v31);
  }

  v38 = v46;
  -[_INVocabularyGenerationDiff setCountOfVocabularyItemsAfterApplying:](v46, "setCountOfVocabularyItemsAfterApplying:", objc_msgSend(v29, "count"));
  -[_INVocabularyGenerationDiff setUpdatedVocabularyItems:](v46, "setUpdatedVocabularyItems:", v28);
  -[_INVocabularyGenerationDiff setDeletedSiriIDs:](v46, "setDeletedSiriIDs:", v27);

LABEL_32:
  return v38;
}

- (NSArray)vocabularyItems
{
  return self->_vocabularyItems;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)writeToFile:(id)a3 createIntermediateDirectories:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, MEMORY[0x1E0C9AA70], &v21);
    v11 = v21;

    if (!v10)
    {
      v16 = v11;
      goto LABEL_9;
    }

  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x1E0CB38B0];
  -[_INVocabularyGenerationDocument _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v12, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;

  v19 = v14;
  v15 = objc_msgSend(v8, "writeToFile:options:error:", v7, 1073741825, &v19);
  v16 = v19;

  if (v15)
    v11 = 0;
  else
    v11 = v16;
LABEL_9:
  v17 = v11;

  return v17;
}

- (void)setVocabularyItems:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *vocabularyItems;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INVocabularyGenerationDocument _clearVocabularyItemCaches](self, "_clearVocabularyItemCaches");
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
  vocabularyItems = self->_vocabularyItems;
  self->_vocabularyItems = v5;

  self->_haveAssignedAllSiriIDs = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_vocabularyItems;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_siriID", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          self->_haveAssignedAllSiriIDs = 0;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setIntentSlot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)_clearVocabularyItemCaches
{
  NSMutableDictionary *itemsBySiriIDCache;
  NSMutableDictionary *itemsByStringCache;

  itemsBySiriIDCache = self->_itemsBySiriIDCache;
  self->_itemsBySiriIDCache = 0;

  itemsByStringCache = self->_itemsByStringCache;
  self->_itemsByStringCache = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyItems, 0);
  objc_storeStrong((id *)&self->_thisGeneration, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_intentSlot, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_itemsByStringCache, 0);
  objc_storeStrong((id *)&self->_itemsBySiriIDCache, 0);
}

- (_INVocabularyGenerationDocument)initWithContentsOfFile:(id)a3
{
  id v4;
  void *v5;
  _INVocabularyGenerationDocument *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = (_INVocabularyGenerationDocument *)-[_INVocabularyGenerationDocument _initWithDictionary:](self, "_initWithDictionary:", v5);
    v6 = self;
  }
  else
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[_INVocabularyGenerationDocument initWithContentsOfFile:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s No file at %@", (uint8_t *)&v9, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_itemsBySiriID
{
  NSMutableDictionary *itemsBySiriIDCache;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  itemsBySiriIDCache = self->_itemsBySiriIDCache;
  if (itemsBySiriIDCache)
    return itemsBySiriIDCache;
  -[_INVocabularyGenerationDocument assignMissingSiriIDsForOptimalDiffFromPreviousDocument:](self, "assignMissingSiriIDsForOptimalDiffFromPreviousDocument:", 0);
  -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = self->_itemsBySiriIDCache;
  self->_itemsBySiriIDCache = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "_siriID", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsBySiriIDCache, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v15 = self->_itemsBySiriIDCache;
  return v15;
}

- (id)_everyVocabularyItemSiriID
{
  void *v2;
  void *v3;
  void *v4;

  -[_INVocabularyGenerationDocument _itemsBySiriID](self, "_itemsBySiriID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_vocabularyItemForSiriID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[_INVocabularyGenerationDocument _itemsBySiriID](self, "_itemsBySiriID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_vocabularyItemWithString:(id)a3
{
  id v4;
  NSMutableDictionary *itemsByStringCache;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    itemsByStringCache = self->_itemsByStringCache;
    if (!itemsByStringCache)
    {
      v21 = v4;
      -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_itemsByStringCache;
      self->_itemsByStringCache = v7;

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v14, "string");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "length"))
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsByStringCache, "setObject:forKeyedSubscript:", v14, v15);
            }
            else
            {
              v16 = (void *)INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                v17 = v16;
                objc_msgSend(v14, "_siriID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v27 = "-[_INVocabularyGenerationDocument _vocabularyItemWithString:]";
                v28 = 2112;
                v29 = v14;
                v30 = 2112;
                v31 = v18;
                _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s found _INVocabularyItem with empty string %@ %@", buf, 0x20u);

              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v11);
      }

      itemsByStringCache = self->_itemsByStringCache;
      v4 = v21;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](itemsByStringCache, "objectForKeyedSubscript:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_valueForSelector:(SEL)a3 ofClass:(Class)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

- (id)_stringForSelector:(SEL)a3 from:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[_INVocabularyGenerationDocument _valueForSelector:ofClass:from:](self, "_valueForSelector:ofClass:from:", a3, objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_takeValuesFromDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _INVocabularyItem *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("version"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", &unk_1E23E99B8) & 1) == 0)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[_INVocabularyGenerationDocument _takeValuesFromDictionary:]";
      v35 = 2080;
      v36 = "-[_INVocabularyGenerationDocument _takeValuesFromDictionary:]";
      _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s %s dictionary is missing version number", buf, 0x16u);
    }
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("resetOnNextSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setResetOnNextSync:](self, "setResetOnNextSync:", objc_msgSend(v6, "BOOLValue"));

  -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_validity, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setValidity:](self, "setValidity:", v7);

  -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_thisGeneration, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setThisGeneration:](self, "setThisGeneration:", v8);

  -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_appBundleID, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setAppBundleID:](self, "setAppBundleID:", v9);

  -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_intentSlot, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyGenerationDocument setIntentSlot:](self, "setIntentSlot:", v10);

  v25 = v4;
  -[_INVocabularyGenerationDocument _valueForSelector:ofClass:from:](self, "_valueForSelector:ofClass:from:", sel_vocabularyItems, objc_opt_class(), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_string, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel_vocabularyIdentifier, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INVocabularyGenerationDocument _valueForSelector:ofClass:from:](self, "_valueForSelector:ofClass:from:", sel_requiresUserIdentification, objc_opt_class(), v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if (v17)
          {
            v21 = -[_INVocabularyItem initWithString:vocabularyIdentifier:requiresUserIdentification:]([_INVocabularyItem alloc], "initWithString:vocabularyIdentifier:requiresUserIdentification:", v17, v18, v20);
            -[_INVocabularyGenerationDocument _stringForSelector:from:](self, "_stringForSelector:from:", sel__siriID, v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v22);
              -[_INVocabularyItem _setSiriID:](v21, "_setSiriID:", v23);

            }
            objc_msgSend(v26, "addObject:", v21);

          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  -[_INVocabularyGenerationDocument setVocabularyItems:](self, "setVocabularyItems:", v26);
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  _INVocabularyGenerationDocument *v5;
  _INVocabularyGenerationDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_INVocabularyGenerationDocument;
  v5 = -[_INVocabularyGenerationDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_INVocabularyGenerationDocument _takeValuesFromDictionary:](v5, "_takeValuesFromDictionary:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_INVocabularyGenerationDocument _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithDictionary:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[_INVocabularyGenerationDocument resetOnNextSync](self, "resetOnNextSync"))
    v5 = CFSTR("requires reset, ");
  else
    v5 = &stru_1E2295770;
  -[_INVocabularyGenerationDocument thisGeneration](self, "thisGeneration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[_INVocabularyGenerationDocument vocabularyItems](self, "vocabularyItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>{%@at %@, %@ items}"), v4, self, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setResetOnNextSync:(BOOL)a3
{
  self->_resetOnNextSync = a3;
}

- (void)setValidity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setThisGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)haveAssignedAllSiriIDs
{
  return self->_haveAssignedAllSiriIDs;
}

- (void)setHaveAssignedAllSiriIDs:(BOOL)a3
{
  self->_haveAssignedAllSiriIDs = a3;
}

@end
