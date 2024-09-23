@implementation MPAssistantSearch

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSearch aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Search"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Search (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  -[MPAssistantSearch _prepare](self, "_prepare");
  v10 = self->_requestAceHash;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1CC9854CC;
  v12[3] = &unk_1E88E3E10;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  sub_1CC995BFC(CFSTR("Search"), v10, 0, 0, v12);

}

- (id)_perform
{
  void *v3;
  int64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSObject *v18;
  NSString *v19;
  id v20;
  id v21;
  void *v22;
  NSString *v23;
  NSString *requestAceHash;
  NSObject *v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, uint64_t, uint64_t);
  void *v32;
  id v33;
  int64_t v34;
  _QWORD v35[4];
  id v36;
  MPAssistantSearch *v37;
  id v38;
  uint64_t v39;
  uint8_t buf[4];
  NSString *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SAMPSearch maxResults](self, "maxResults");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[SAMPSearch searchTypes](self, "searchTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D88E80]);
  -[SAMPSearch constraints](self, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1CC98493C;
  v35[3] = &unk_1E88E29A0;
  v12 = v5;
  v36 = v12;
  v37 = self;
  v39 = v9;
  v13 = v8;
  v38 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v35);

  v29 = v11;
  v30 = 3221225472;
  v31 = sub_1CC9853CC;
  v32 = &unk_1E88E29F0;
  v14 = v3;
  v33 = v14;
  v34 = v4;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v29);
  if (objc_msgSend(v14, "count", v29, v30, v31, v32) || !sub_1CC994964(self->_userIdentity))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D882A0]);
    objc_msgSend(v21, "setResults:", v14);
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSearch aceId](self, "aceId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v22);
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v23;

    }
    _MPLogCategoryAssistant();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_requestAceHash;
      v27 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138543618;
      v41 = v26;
      v42 = 2048;
      v43 = v27;
      _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, "Search (search) <%{public}@>: found %ld results.", buf, 0x16u);
    }

  }
  else
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSearch aceId](self, "aceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Search"), v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_requestAceHash;
      self->_requestAceHash = v16;

    }
    _MPLogCategoryAssistant();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_requestAceHash;
      *(_DWORD *)buf = 138543362;
      v41 = v19;
      _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_ERROR, "Search (search) <%{public}@>: still loading library", buf, 0xCu);
    }

    v20 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v21 = (id)objc_msgSend(v20, "initWithErrorCode:", *MEMORY[0x1E0D88DF0]);
  }

  return v21;
}

- (id)_audiobooksByName:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = *MEMORY[0x1E0CC1D88];
    v6 = a3;
    objc_msgSend(v4, "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC2560], "predicateWithSearchString:forProperties:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc(MEMORY[0x1E0CC2438]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFilterPredicates:", v10);

  objc_msgSend(v11, "setUseSections:", 0);
  objc_msgSend(v11, "setGroupingType:", 10);
  objc_msgSend(v11, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v11, "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMediaLibrary:", v12);

  objc_msgSend(v11, "collections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_itemsByTitle:(id)a3 mediaTypes:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CC2430];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithValue:forProperty:", v9, *MEMORY[0x1E0CC1EC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *MEMORY[0x1E0CC1FD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2560], "predicateWithSearchString:forProperties:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CC2438]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFilterPredicates:", v14);

  objc_msgSend(v15, "setUseSections:", 0);
  objc_msgSend(v15, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v15, "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMediaLibrary:", v16);

  objc_msgSend(v15, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_playlistsByName:(id)a3 isGeniusMix:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CC2430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithValue:forProperty:", v8, *MEMORY[0x1E0CC2028]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC2020]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v10, *MEMORY[0x1E0CC2030]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC2040]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC2560], "predicateWithSearchString:forProperties:", v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = objc_alloc(MEMORY[0x1E0CC2438]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v9, v11, v12, v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFilterPredicates:", v16);

  objc_msgSend(v17, "setUseSections:", 0);
  objc_msgSend(v17, "setGroupingType:", 6);
  objc_msgSend(v17, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v17, "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMediaLibrary:", v18);

  objc_msgSend(v17, "collections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_songCollectionsWithGroupingType:(int64_t)a3 searchString:(id)a4 mediaTypes:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CC23F0], "titlePropertyForGroupingType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithValue:forProperty:", v11, *MEMORY[0x1E0CC1EC0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC2560], "predicateWithSearchString:forProperties:", v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v16 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v12, v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFilterPredicates:", v17);

    objc_msgSend(v18, "setUseSections:", 0);
    objc_msgSend(v18, "setGroupingType:", a3);
    objc_msgSend(v18, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v18, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMediaLibrary:", v19);

    objc_msgSend(v18, "collections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_playlistsByDateCreatedOrder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CC2430];
  v5 = *MEMORY[0x1E0CC2038];
  v6 = a3;
  objc_msgSend(v4, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC2020]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v8, *MEMORY[0x1E0CC2030]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CC2438]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFilterPredicates:", v12);

  v14 = *MEMORY[0x1E0CC2010];
  v27[0] = *MEMORY[0x1E0CC2010];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setOrderingProperties:", v15);

  LODWORD(v15) = objc_msgSend(v6, "isEqualToString:", CFSTR("Descending"));
  if ((_DWORD)v15)
  {
    v25 = v14;
    v26 = &unk_1E88E9CE8;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v26;
    v18 = &v25;
  }
  else
  {
    v23 = v14;
    v24 = &unk_1E88E9D00;
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v24;
    v18 = &v23;
  }
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setOrderingDirectionMappings:", v19);

  objc_msgSend(v13, "setUseSections:", 0);
  objc_msgSend(v13, "setGroupingType:", 6);
  objc_msgSend(v13, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v13, "setShouldIncludeNonLibraryEntities:", 1);
  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaLibrary:", v20);

  objc_msgSend(v13, "collections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_stationWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D838E0], "sharedModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userStations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featuredStations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "name", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "rangeOfString:options:", v3, 129);
          if (v14)
          {
            v9 = v12;

            goto LABEL_12;
          }

        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_stationDictionariesWithParent:(unint64_t)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1CC9848E8;
  v17 = sub_1CC9848F8;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D838D8]), "initWithParentNodeID:", a3);
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1CC984900;
    v10[3] = &unk_1E88E2A18;
    v12 = &v13;
    v6 = v4;
    v11 = v6;
    objc_msgSend(v5, "startWithCompletionHandler:", v10);
    v7 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v6, v7);

    v4 = 0;
  }
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_stationDictionaryForGenreName:(id)a3 parent:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MPAssistantSearch _stationDictionariesWithParent:](self, "_stationDictionariesWithParent:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "objectForKey:", CFSTR("children"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    v23 = v7;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", CFSTR("name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "compare:options:", v6, 129);

        if (!v15)
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("station-dict"));
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v21 = (void *)v20;
          v7 = v23;
          goto LABEL_16;
        }
        if (a4)
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("children"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (!v17)
            continue;
        }
        objc_msgSend(v13, "objectForKey:", CFSTR("id"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedLongLongValue");

        -[MPAssistantSearch _stationDictionaryForGenreName:parent:](self, "_stationDictionaryForGenreName:parent:", v6, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
          goto LABEL_15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v21 = 0;
      v7 = v23;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_16:

  return v21;
}

- (id)_stationDictionaryForGenreName:(id)a3
{
  return -[MPAssistantSearch _stationDictionaryForGenreName:parent:](self, "_stationDictionaryForGenreName:parent:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
