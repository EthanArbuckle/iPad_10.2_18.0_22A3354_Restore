@implementation SGURLContainer

- (SGURLContainer)init
{
  SGURLContainer *v2;
  uint64_t v3;
  NSMutableArray *urls;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGURLContainer;
  v2 = -[SGURLContainer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    urls = v2->_urls;
    v2->_urls = (NSMutableArray *)v3;

    v2->_needsFlushing = 0;
  }
  return v2;
}

- (void)writeWithEntityStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_urls;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD4F6C](v9);
        self->_needsFlushing = 1;
        objc_msgSend(v7, "writeURL:", v13, (_QWORD)v15);
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = v9;
    }
    while (v9);
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_needsFlushing)
    -[SGURLContainer flushWrites](self, "flushWrites");
  v3.receiver = self;
  v3.super_class = (Class)SGURLContainer;
  -[SGURLContainer dealloc](&v3, sel_dealloc);
}

- (void)flushWrites
{
  self->_needsFlushing = 0;
  +[SGDNotificationBroadcaster emitURLChanged](SGDNotificationBroadcaster, "emitURLChanged");
}

- (id)numberOfExtractions
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_urls, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
}

+ (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdentifier:(id)a5 entityStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  objc_msgSend(v14, "urlsFoundBetweenStartDate:endDate:bundleIdentifier:", v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 entityStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "deleteURLsFromBundleIdentifier:", v5);

  return v10;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 documentIdentifiers:(id)a4 entityStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v13 = objc_msgSend(v11, "deleteURLsFromBundleIdentifier:documentIdentifiers:", v7, v8);

  return v13;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 domainSelection:(id)a4 entityStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  objc_msgSend(v8, "globPatterns");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__SGURLContainer_deleteAllURLsWithBundleIdentifier_domainSelection_entityStore___block_invoke;
  v17[3] = &unk_1E7DB1410;
  v20 = &v21;
  v14 = v12;
  v18 = v14;
  v15 = v7;
  v19 = v15;
  objc_msgSend(v13, "_pas_enumerateChunksOfSize:usingBlock:", 100, v17);

  LOBYTE(v13) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v13;
}

uint64_t __80__SGURLContainer_deleteAllURLsWithBundleIdentifier_domainSelection_entityStore___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteURLsFromBundleIdentifier:groupIdentifierGlobs:", *(_QWORD *)(a1 + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
  return result;
}

@end
