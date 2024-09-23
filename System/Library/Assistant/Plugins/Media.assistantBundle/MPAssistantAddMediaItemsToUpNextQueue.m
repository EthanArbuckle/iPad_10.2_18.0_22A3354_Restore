@implementation MPAssistantAddMediaItemsToUpNextQueue

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToUpNextQueue aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[MPAssistantAddMediaItemsToUpNextQueue hashedRouteUIDs](self, "hashedRouteUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[MPAssistantAddMediaItemsToUpNextQueue insertLocation](self, "insertLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantAddMediaItemsToUpNextQueue mediaCollection](self, "mediaCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v9;
    v25 = 2048;
    v26 = v11;
    v27 = 2114;
    v28 = v12;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Up Next Queue (invoke) <%{public}@>: %lu UIDs, insert location %{public}@, media collection %{public}@", buf, 0x2Au);

  }
  v15 = self->_requestAceHash;
  -[MPAssistantAddMediaItemsToUpNextQueue hashedRouteUIDs](self, "hashedRouteUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Add Media Items To Up Next Queue"), v15, v16);

  v17 = self->_requestAceHash;
  -[MPAssistantAddMediaItemsToUpNextQueue speakerSharedUserId](self, "speakerSharedUserId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantAddMediaItemsToUpNextQueue musicAccountSharedUserId](self, "musicAccountSharedUserId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1CC993AE0;
  v21[3] = &unk_1E88E3E10;
  v21[4] = self;
  v22 = v4;
  v20 = v4;
  sub_1CC995BFC(CFSTR("Add Media Items To Up Next Queue"), v17, v18, v19, v21);

}

- (void)_perform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MPAssistantAddMediaItemsToUpNextQueue *v20;
  id v21;
  id v22;
  id v23[8];
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1CC992B34;
  v27[3] = &unk_1E88E3E60;
  v27[4] = self;
  v6 = v4;
  v28 = v6;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = sub_1CC992EA4;
  v24[3] = &unk_1E88E2E70;
  v7 = (id)MEMORY[0x1D17B0600](v27);
  v25 = v7;
  v8 = v6;
  v26 = v8;
  v9 = (void *)MEMORY[0x1D17B0600](v24);
  -[MPAssistantAddMediaItemsToUpNextQueue hashedRouteUIDs](self, "hashedRouteUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D4B310]);
    -[MPAssistantAddMediaItemsToUpNextQueue hashedRouteUIDs](self, "hashedRouteUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = sub_1CC993058;
    v18[3] = &unk_1E88E2EE8;
    v19 = v12;
    v20 = self;
    v21 = v8;
    v22 = v9;
    v14 = v9;
    v15 = v12;
    objc_msgSend(v15, "decodeHashedRouteUIDs:completion:", v13, v18);

    v16 = v19;
  }
  else
  {
    v23[0] = v5;
    v23[1] = (id)3221225472;
    v23[2] = sub_1CC992F5C;
    v23[3] = &unk_1E88E35B8;
    v23[4] = self;
    v23[5] = v9;
    v16 = v8;
    v23[6] = v16;
    v17 = v7;
    v23[7] = v17;
    v14 = v9;
    sub_1CC992F5C(v23, 0);

    v15 = v14;
  }

}

- (id)_createPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = sub_1CC9834E0(v7);
    if (v9 == 3)
    {
      -[MPAssistantAddMediaItemsToUpNextQueue _createStoreTracklistPlaybackQueueWithCollection:error:](self, "_createStoreTracklistPlaybackQueueWithCollection:error:", v6, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (v9 == 1)
    {
      -[MPAssistantAddMediaItemsToUpNextQueue _createLocalLibraryPlaybackQueueWithCollection:error:](self, "_createLocalLibraryPlaybackQueueWithCollection:error:", v6, a4);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v10;
      goto LABEL_8;
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (id)_createLocalLibraryPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *requestAceHash;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Up Next Queue"), self->_requestAceHash);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(v7, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithEntities:entityType:", v9, 0);

    v11 = objc_alloc(MEMORY[0x1E0D4B328]);
    -[MPAssistantAddMediaItemsToUpNextQueue refId](self, "refId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = (id *)objc_msgSend(v11, "initWithContextID:query:", v12, v10);

  }
  else if (a4)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToUpNextQueue aceId](self, "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v14;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (libraryqueue) <%{public}@>: collection %{public}@ does not exist", buf, 0x16u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Collection does not exist in library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MPAssistantAddToUpNextErrorDomain"), -1, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)_createStoreTracklistPlaybackQueueWithCollection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  NSString *requestAceHash;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  id *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  NSString *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v40 = v5;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (sub_1CC9834E0(v11) == 3)
        {
          objc_msgSend(v11, "lastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "longLongValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v14);
        }
        else
        {
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantAddMediaItemsToUpNextQueue aceId](self, "aceId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v15);
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            requestAceHash = self->_requestAceHash;
            self->_requestAceHash = v16;

          }
          _MPLogCategoryAssistant();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v51 = v18;
            v52 = 2114;
            v53 = v11;
            _os_log_impl(&dword_1CC97B000, v14, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (storetrack) <%{public}@>: unknown origin for %{public}@", buf, 0x16u);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v41, "count"))
  {
    objc_msgSend(v40, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v40, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "longLongValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v23);

    }
  }
  objc_msgSend(MEMORY[0x1E0CC2398], "emptyIdentifierSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("x-sampplaylist"));

  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x1E0CC2398]);
    objc_msgSend(MEMORY[0x1E0CC2458], "identityKind");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1CC992998;
    v44[3] = &unk_1E88E2F38;
    v30 = &v45;
    v45 = v40;
    v31 = v44;
LABEL_21:
    v35 = objc_msgSend(v28, "initWithSource:modelKind:block:", CFSTR("MPCAssistant"), v29, v31);

    v24 = (void *)v35;
    goto LABEL_22;
  }
  objc_msgSend(v40, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scheme");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("x-sampcollection-album"));

  if (v34)
  {
    v28 = objc_alloc(MEMORY[0x1E0CC2398]);
    objc_msgSend(MEMORY[0x1E0CC2440], "identityKind");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = sub_1CC992A04;
    v42[3] = &unk_1E88E2F38;
    v30 = &v43;
    v43 = v40;
    v31 = v42;
    goto LABEL_21;
  }
LABEL_22:
  v36 = objc_alloc(MEMORY[0x1E0D4B340]);
  -[MPAssistantAddMediaItemsToUpNextQueue refId](self, "refId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithContextID:storeItemIDs:collectionIdentifierSet:", v37, v41, v24);

  return v38;
}

- (BOOL)_isInsertionPositionSupported:(int)a3 origin:(void *)a4 supportedCommands:(__CFArray *)a5
{
  uint64_t (**v7)(_QWORD, _QWORD);
  CFIndex Count;
  uint64_t v9;
  CFIndex v10;
  unsigned int v11;
  const void *ValueAtIndex;
  char v14;
  void *v15;
  NSString *v16;
  NSString *requestAceHash;
  NSObject *v18;
  NSString *v19;
  _QWORD v21[5];
  int v22;
  uint8_t buf[4];
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1CC992820;
  v21[3] = &unk_1E88E2F60;
  v22 = a3;
  v21[4] = self;
  v7 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17B0600](v21, a2, *(_QWORD *)&a3, a4);
  Count = CFArrayGetCount(a5);
  if (Count < 1)
    goto LABEL_9;
  v9 = Count;
  v10 = 0;
  v11 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a5, v10);
    if (MEMORY[0x1D17B01A4]() == 125)
      break;
    v10 = v11;
    if (v9 <= v11++)
      goto LABEL_9;
  }
  if (MRMediaRemoteCommandInfoGetEnabled())
  {
    v14 = ((uint64_t (**)(_QWORD, const void *))v7)[2](v7, ValueAtIndex);
  }
  else
  {
LABEL_9:
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToUpNextQueue aceId](self, "aceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Up Next Queue"), v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v16;

    }
    _MPLogCategoryAssistant();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_requestAceHash;
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_ERROR, "Add Media Items To Up Next Queue (issupported) <%{public}@>: MRMediaRemoteCommandInsertIntoPlaybackQueue not found in supported commands", buf, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
}

@end
