@implementation FCFileCoordinatedTodayDropboxTransaction

+ (id)transactionOfIdentity
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:", MEMORY[0x1E0C9AA60], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:(id)a3 deletedArticleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "insertedOrUpdatedHistoryItems");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:de"
          "letedArticleIDs:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    v15 = 1024;
    v16 = 390;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "deletedArticleIDs");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:de"
          "letedArticleIDs:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    v15 = 1024;
    v16 = 391;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTransactionType:insertedOrUpdatedHistoryItems:deletedArticleIDs:", 0, v5, v6);

  return v7;
}

- (FCFileCoordinatedTodayDropboxTransaction)initWithTransactionType:(unint64_t)a3 insertedOrUpdatedHistoryItems:(id)a4 deletedArticleIDs:(id)a5
{
  id v8;
  id v9;
  FCFileCoordinatedTodayDropboxTransaction *v10;
  FCFileCoordinatedTodayDropboxTransaction *v11;
  uint64_t v12;
  NSArray *insertedOrUpdatedHistoryItems;
  uint64_t v14;
  NSSet *deletedArticleIDs;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCFileCoordinatedTodayDropboxTransaction;
  v10 = -[FCFileCoordinatedTodayDropboxTransaction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_transactionType = a3;
    v12 = objc_msgSend(v8, "copy");
    insertedOrUpdatedHistoryItems = v11->_insertedOrUpdatedHistoryItems;
    v11->_insertedOrUpdatedHistoryItems = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    deletedArticleIDs = v11->_deletedArticleIDs;
    v11->_deletedArticleIDs = (NSSet *)v14;

  }
  return v11;
}

- (FCFileCoordinatedTodayDropboxTransaction)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedTodayDropboxTransaction init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    v11 = 1024;
    v12 = 359;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedTodayDropboxTransaction init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (id)transactionToClearSeenArticles
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTransactionType:insertedOrUpdatedHistoryItems:deletedArticleIDs:", 1, 0, 0);
}

+ (id)collapsedTransactionOfTransactions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  FCFileCoordinatedTodayDropboxTransaction *v44;
  void *v45;
  FCFileCoordinatedTodayDropboxTransaction *v46;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v48 = v3;
  obj = (id)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v65;
    v49 = *(_QWORD *)v65;
    do
    {
      v9 = 0;
      v50 = v6;
      do
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "transactionType");
        v12 = v11;
        if (v11)
        {
          if (v11 == 1)
          {
            objc_msgSend(v55, "removeAllObjects");
            objc_msgSend(v7, "removeAllObjects");
            objc_msgSend(v4, "removeAllObjects");
          }
        }
        else
        {
          v52 = v9;
          objc_msgSend(v10, "deletedArticleIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14)
          {
            objc_msgSend(v10, "deletedArticleIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v7)
            {
              objc_msgSend(v7, "unionSet:", v15);

              objc_msgSend(v10, "deletedArticleIDs");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "minusSet:", v17);

              objc_msgSend(v10, "deletedArticleIDs");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "allObjects");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "removeObjectsForKeys:", v18);

            }
            else
            {
              v7 = (void *)objc_msgSend(v15, "mutableCopy");
            }

          }
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          objc_msgSend(v10, "insertedOrUpdatedHistoryItems");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v61 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                objc_msgSend(v24, "articleID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  objc_msgSend(v7, "removeObject:", v25);
                  objc_msgSend(v55, "addObject:", v25);
                  objc_msgSend(v4, "objectForKeyedSubscript:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    FCCheckedProtocolCast((uint64_t)&unk_1EE6AFB78, v26);
                    v27 = v4;
                    v28 = v7;
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(a1, "_mergeItem:intoItem:", v24, v29);

                    v7 = v28;
                    v4 = v27;
                  }
                  else
                  {
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);
                  }

                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
            }
            while (v21);
          }

          v9 = v52;
          v12 = 0;
          v8 = v49;
          v6 = v50;
        }
        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    }
    while (v6);
    v53 = v12;
  }
  else
  {
    v7 = 0;
    v53 = 1;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v55, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v31 = v55;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  v33 = v7;
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v57;
    v36 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v57 != v35)
          objc_enumerationMutation(v31);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(v30, "addObject:", v38);
        }
        else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "existingItem");
          *(_DWORD *)buf = 136315906;
          v69 = "+[FCFileCoordinatedTodayDropboxTransaction collapsedTransactionOfTransactions:]";
          v70 = 2080;
          v71 = "FCFileCoordinatedTodayDropbox.m";
          v72 = 1024;
          v73 = 493;
          v74 = 2114;
          v75 = v39;
          _os_log_error_impl(&dword_1A1B90000, v36, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v7 = v33;
        }

      }
      v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    }
    while (v34);
  }

  v40 = (void *)objc_msgSend(v7, "copy");
  v41 = v40;
  if (v40)
  {
    v42 = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = v42;

  v44 = [FCFileCoordinatedTodayDropboxTransaction alloc];
  v45 = (void *)objc_msgSend(v30, "copy");
  v46 = -[FCFileCoordinatedTodayDropboxTransaction initWithTransactionType:insertedOrUpdatedHistoryItems:deletedArticleIDs:](v44, "initWithTransactionType:insertedOrUpdatedHistoryItems:deletedArticleIDs:", v53, v45, v43);

  return v46;
}

- (id)todayPrivateDataAccessor
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v14;
  FCFileCoordinatedTodayDropboxTransaction *v15;
  id v16;

  v3 = -[FCFileCoordinatedTodayDropboxTransaction transactionType](self, "transactionType");
  if (v3 == 1)
  {
    v10 = &__block_literal_global_337;
  }
  else if (v3)
  {
    v10 = 0;
  }
  else
  {
    -[FCFileCoordinatedTodayDropboxTransaction insertedOrUpdatedHistoryItems](self, "insertedOrUpdatedHistoryItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[FCFileCoordinatedTodayDropboxTransaction deletedArticleIDs](self, "deletedArticleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke;
    aBlock[3] = &unk_1E463CAA0;
    v14 = v5;
    v15 = self;
    v16 = v7;
    v8 = v7;
    v9 = v5;
    v10 = _Block_copy(aBlock);

  }
  v11 = _Block_copy(v10);

  return v11;
}

void __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v26 = v3;
  objc_msgSend(v3, "recentlySeenHistoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "fc_setByTransformingWithBlock:", &__block_literal_global_14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_3;
  v31[3] = &unk_1E463CA78;
  v24 = v7;
  v32 = v24;
  v10 = v8;
  v33 = v10;
  v11 = v9;
  v34 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  v25 = v6;
  v23 = v11;
  objc_msgSend(v6, "removeObjectsAtIndexes:", v11);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = a1[4];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "articleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          FCCheckedProtocolCast((uint64_t)&unk_1EE6AFB78, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "_mergeItem:intoItem:", v19, v20);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v14);
  }

  objc_msgSend(v25, "addObjectsFromArray:", a1[4]);
  objc_msgSend(a1[6], "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v25, "fc_arrayByRemovingObjectsInArray:", v21);

  if ((unint64_t)objc_msgSend(v25, "count") >= 0x65)
    objc_msgSend(v25, "removeObjectsInRange:", 0, objc_msgSend(v25, "count") - 100);
  objc_msgSend(v26, "setRecentlySeenHistoryItems:", v25);

}

uint64_t __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "containsObject:", v5))
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v6, v5);
    objc_msgSend(a1[6], "addIndex:", a3);
  }

}

uint64_t __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecentlySeenHistoryItems:", 0);
}

- (void)_mergeItem:(id)a3 intoItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_mergeItem:intoItem:", v6, v5);

}

+ (void)_mergeItem:(id)a3 intoItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "rightItem");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction _mergeItem:intoItem:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    v15 = 1024;
    v16 = 596;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "leftItem");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction _mergeItem:intoItem:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    v15 = 1024;
    v16 = 597;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  FCCheckedProtocolCast((uint64_t)&unk_1EE6AFB78, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCCheckedProtocolCast((uint64_t)&unk_1EE6AFA68, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCMergeHistoryItemSeenFields(v7, v8);

}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (NSArray)insertedOrUpdatedHistoryItems
{
  return self->_insertedOrUpdatedHistoryItems;
}

- (void)setInsertedOrUpdatedHistoryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)deletedArticleIDs
{
  return self->_deletedArticleIDs;
}

- (void)setDeletedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedArticleIDs, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedHistoryItems, 0);
}

@end
