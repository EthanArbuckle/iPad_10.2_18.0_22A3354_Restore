@implementation BRQueryStitch

- (BRQueryStitch)initWithURL:(id)a3 objid:(id)a4 kind:(char)a5
{
  id v9;
  id v10;
  BRQueryStitch *v11;
  BRQueryStitch *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRQueryStitch;
  v11 = -[BRQueryStitch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_objid, a4);
    v12->_kind = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  unint64_t kind;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  objc_msgSend(v3, "appendFormat:", CFSTR("<BRQueryStitch %p for "), self);
  kind = self->_kind;
  if (kind <= 2)
    objc_msgSend(v3, "appendString:", off_1E3DA7428[kind]);
  -[NSURL path](self->_url, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\" possibly interesting %ld queries>"), v5, -[NSArray count](self->_contexts, "count"));

  return v3;
}

- (void)setQueries:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BRQueryStitchingContext *v12;
  BRQueryStitchingContext *v13;
  NSArray *contexts;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_contexts)
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryStitch setQueries:]", 170);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRQueryStitch setQueries:].cold.1();

  }
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [BRQueryStitchingContext alloc];
        v13 = -[BRQueryStitchingContext initWithQuery:](v12, "initWithQuery:", v11, (_QWORD)v17);
        -[NSArray addObject:](v5, "addObject:", v13);
        -[BRQueryStitchingContext performAsyncOnReceiver:](v13, "performAsyncOnReceiver:", &__block_literal_global_28);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  contexts = self->_contexts;
  self->_contexts = v5;

}

uint64_t __28__BRQueryStitch_setQueries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disableUpdatesFromIPCBeforeStitching");
}

- (void)_enableUpdatesFromIPCAfterStitchingOnAllQueries
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_contexts;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "performAsyncOnReceiver:", &__block_literal_global_24, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __64__BRQueryStitch__enableUpdatesFromIPCAfterStitchingOnAllQueries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableUpdatesFromIPCAfterStitching");
}

- (void)_creationDone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] could not get notification, not stitching anything%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __30__BRQueryStitch__creationDone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
  brc_bread_crumbs((uint64_t)"-[BRQueryStitch _creationDone]_block_invoke", 217);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] sending update to %@: %@%@", buf, 0x20u);
  }

  objc_msgSend(v3, "receiveStitchingUpdates:", v5);
  objc_msgSend(v3, "enableUpdatesFromIPCAfterStitching");

}

- (void)_renameDone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] destination URL is outside of clouddocs, pretend it's a deletion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __28__BRQueryStitch__renameDone__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "isFolderOrAliasID"))
  {
    v22 = v8;
    v24 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "url");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "hasPrefix:", v9);

          if (v18)
          {
            v19 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(v7, "addObject:", v19);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v12);
    }

    v6 = v23;
    v5 = v24;
    v8 = v22;
  }
  brc_bread_crumbs((uint64_t)"-[BRQueryStitch _renameDone]_block_invoke", 272);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v5;
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v20;
    _os_log_debug_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] sending updates to %@: %@%@", buf, 0x20u);
  }

  objc_msgSend(v5, "receiveStitchingUpdates:", v7);
  objc_msgSend(v5, "enableUpdatesFromIPCAfterStitching");

}

- (void)_deletionDone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] the URL is still reachable, not stitching anything%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __30__BRQueryStitch__deletionDone__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isFolderOrAliasID"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v12)
    {
      v13 = v12;
      v24 = v9;
      v25 = v8;
      v14 = 0;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v11);
          v17 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);

          objc_msgSend(v17, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "checkPromisedItemIsReachableAndReturnError:", 0);

          if ((v19 & 1) != 0)
          {
            v14 = v17;
          }
          else
          {
            v14 = (void *)objc_msgSend(v17, "copy");

            objc_msgSend(v14, "markDead");
            objc_msgSend(v10, "addObject:", v14);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v13);

      v9 = v24;
      v8 = v25;
    }

  }
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v24, v25, (_QWORD)v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  if (v21)
  {
    objc_msgSend(v21, "markDead");
    objc_msgSend(v10, "addObject:", v21);
  }
  brc_bread_crumbs((uint64_t)"-[BRQueryStitch _deletionDone]_block_invoke", 316);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v7;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v22;
    _os_log_debug_impl(&dword_19CBF0000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] sending update to %@: %@%@", buf, 0x20u);
  }

  objc_msgSend(v7, "receiveStitchingUpdates:", v10);
  objc_msgSend(v7, "enableUpdatesFromIPCAfterStitching");

}

- (void)done
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: unknown stitching handler%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_contexts)
    -[BRQueryStitch done](self, "done");
  v3.receiver = self;
  v3.super_class = (Class)BRQueryStitch;
  -[BRQueryStitch dealloc](&v3, sel_dealloc);
}

- (NSURL)fromURL
{
  return self->_fromURL;
}

- (void)setFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_fromURL, a3);
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fromURL, 0);
  objc_storeStrong((id *)&self->_objid, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

- (void)setQueries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _contexts == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
