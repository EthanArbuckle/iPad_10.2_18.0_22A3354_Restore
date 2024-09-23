@implementation MPAssistantAddMediaItemsToPlaylist

- (void)dealloc
{
  void *v3;
  NSString *v4;
  NSString *requestAceHash;
  NSObject *v6;
  NSString *v7;
  objc_super v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v3);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v4;

  }
  _MPLogCategoryAssistant();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CC97B000, v6, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (dealloc) <%{public}@>: dealloced", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPAssistantAddMediaItemsToPlaylist;
  -[MPAssistantAddMediaItemsToPlaylist dealloc](&v8, sel_dealloc);
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[SAMPAddMediaItemsToPlaylist insertLocation](self, "insertLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMPAddMediaItemsToPlaylist playlist](self, "playlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (invoke) <%{public}@>: insert location %{public}@, media item %{public}@, playlist %{public}@", buf, 0x2Au);

  }
  v14 = self->_requestAceHash;
  -[SAMPAddMediaItemsToPlaylist influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMPAddMediaItemsToPlaylist influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1CC982310;
  v18[3] = &unk_1E88E3E10;
  v18[4] = self;
  v19 = v4;
  v17 = v4;
  sub_1CC995BFC(CFSTR("Add Media Items To Playlist"), v14, v15, v16, v18);

}

- (void)_appendToPlaylistWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSUInteger v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  NSString *requestAceHash;
  NSObject *v18;
  NSString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  NSObject *v27;
  NSString *v28;
  int v29;
  NSString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[SAMPAddMediaItemsToPlaylist playlist](self, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Collection object was not a playlist. Unable to add tracks to something that is not a playlist."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v16;

    }
    _MPLogCategoryAssistant();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_requestAceHash;
      v29 = 138543618;
      v30 = v19;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_1CC97B000, v18, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (append) <%{public}@>: failed: %{public}@", (uint8_t *)&v29, 0x16u);
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v7);
    goto LABEL_15;
  }
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC2038]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "BOOLValue"))
  {
    v21 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v20 = (void *)objc_msgSend(v21, "initWithErrorCode:", *MEMORY[0x1E0D88DC8]);
LABEL_15:
    v22 = v20;
    objc_msgSend(v20, "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v23);

    goto LABEL_16;
  }
  v8 = -[MPAssistantAddMediaItemsToPlaylist _isSagaAuthenticated](self, "_isSagaAuthenticated");
  v9 = -[NSString length](self->_requestAceHash, "length");
  if (v8)
  {
    if (!v9)
    {
      -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->_requestAceHash;
      self->_requestAceHash = v11;

    }
    _MPLogCategoryAssistant();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_requestAceHash;
      v29 = 138543362;
      v30 = v14;
      _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (append) <%{public}@>: iCML available", (uint8_t *)&v29, 0xCu);
    }

    -[MPAssistantAddMediaItemsToPlaylist _addItemsToCloudLibrary:](self, "_addItemsToCloudLibrary:", v4);
  }
  else
  {
    if (!v9)
    {
      -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v24);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_requestAceHash;
      self->_requestAceHash = v25;

    }
    _MPLogCategoryAssistant();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_requestAceHash;
      v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_1CC97B000, v27, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (append) <%{public}@>: local library", (uint8_t *)&v29, 0xCu);
    }

    -[MPAssistantAddMediaItemsToPlaylist _addItemsToLocalLibrary:](self, "_addItemsToLocalLibrary:", v4);
  }
LABEL_16:

}

- (void)_addItemsToLocalLibrary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  NSString *requestAceHash;
  NSObject *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  NSObject *v40;
  NSString *v41;
  uint64_t v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _QWORD v79[2];
  uint8_t buf[4];
  NSString *v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  -[SAMPAddMediaItemsToPlaylist playlist](self, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v5;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v75;
    v59 = *MEMORY[0x1E0CC1FA0];
    v58 = *MEMORY[0x1E0CC1FC8];
    v53 = *(_QWORD *)v75;
    do
    {
      v10 = 0;
      v54 = v8;
      do
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = sub_1CC9834E0(v12);

        if (v13 == 3)
        {
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          objc_msgSend(v11, "items");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
          if (v61)
          {
            v56 = v10;
            v60 = *(_QWORD *)v71;
            v57 = v14;
            do
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v71 != v60)
                  objc_enumerationMutation(v57);
                objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "lastPathComponent");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "longLongValue");

                if (!-[NSString length](self->_requestAceHash, "length"))
                {
                  -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v19);
                  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
                  requestAceHash = self->_requestAceHash;
                  self->_requestAceHash = v20;

                }
                _MPLogCategoryAssistant();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v81 = v23;
                  v82 = 2048;
                  v83 = v18;
                  _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: add adam ID: %lld", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = (void *)MEMORY[0x1E0CC23C0];
                objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v24, v59);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v79[0] = v26;
                objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v24, v58);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v79[1] = v27;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "predicateMatchingPredicates:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addFilterPredicate:", v29);
                objc_msgSend(v30, "setEntityLimit:", 1);
                v68 = 0u;
                v69 = 0u;
                v66 = 0u;
                v67 = 0u;
                objc_msgSend(v30, "items");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v67;
                  do
                  {
                    for (j = 0; j != v33; ++j)
                    {
                      if (*(_QWORD *)v67 != v34)
                        objc_enumerationMutation(v31);
                      objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
                  }
                  while (v33);
                }

              }
              v14 = v57;
              v61 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
            }
            while (v61);
            v9 = v53;
            v8 = v54;
            v10 = v56;
          }
        }
        else
        {
          objc_msgSend(v11, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "items");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v36);

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v8);
  }

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v37);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    v39 = self->_requestAceHash;
    self->_requestAceHash = v38;

  }
  _MPLogCategoryAssistant();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = self->_requestAceHash;
    v42 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543618;
    v81 = v41;
    v82 = 2048;
    v83 = v42;
    _os_log_impl(&dword_1CC97B000, v40, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (local) <%{public}@>: items to add: %lu", buf, 0x16u);
  }

  -[SAMPAddMediaItemsToPlaylist insertLocation](self, "insertLocation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D88D60]);

  if (v44)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v45, "addObjectsFromArray:", v6);
    v46 = v51;
    objc_msgSend(v51, "items");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObjectsFromArray:", v47);

    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = sub_1CC982000;
    v64[3] = &unk_1E88E2D80;
    v64[4] = self;
    v48 = v52;
    v65 = v52;
    objc_msgSend(v51, "replaceItems:completion:", v45, v64);

  }
  else
  {
    -[SAMPAddMediaItemsToPlaylist insertLocation](self, "insertLocation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D88D68]);

    if (v50)
    {
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = sub_1CC982188;
      v62[3] = &unk_1E88E2D80;
      v62[4] = self;
      v48 = v52;
      v63 = v52;
      v46 = v51;
      objc_msgSend(v51, "appendItems:completion:", v6, v62);

    }
    else
    {
      v48 = v52;
      +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithString:requestHash:completion:", CFSTR("Uexpected insertion order requested."), self->_requestAceHash, v52);
      v46 = v51;
    }
  }

}

- (void)_addItemsToCloudLibrary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[SAMPAddMediaItemsToPlaylist insertLocation](self, "insertLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D88D68]);

  -[SAMPAddMediaItemsToPlaylist playlist](self, "playlist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  if (v5 == 1 && v9 == 1 && v11)
  {
    -[MPAssistantAddMediaItemsToPlaylist _appendItemToCloudPlaylist:completion:](self, "_appendItemToCloudPlaylist:completion:", v14, v15);
  }
  else if (v11)
  {
    -[MPAssistantAddMediaItemsToPlaylist _appendItemsToCloudPlaylist:completion:](self, "_appendItemsToCloudPlaylist:completion:", v14, v15);
  }
  else
  {
    -[MPAssistantAddMediaItemsToPlaylist _prependItemsToCloudPlaylist:completion:](self, "_prependItemsToCloudPlaylist:completion:", v14, v15);
  }

}

- (void)_appendItemToCloudPlaylist:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *requestAceHash;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  MPCloudController *v15;
  MPCloudController *cloudController;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  NSObject *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  NSObject *v36;
  NSString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  NSObject *v44;
  NSString *v45;
  MPCloudController *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSString *v50;
  NSString *v51;
  NSObject *v52;
  NSString *v53;
  MPCloudController *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  uint8_t buf[4];
  NSString *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v9;

  }
  _MPLogCategoryAssistant();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v63 = v12;
    _os_log_impl(&dword_1CC97B000, v11, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: tail insertion", buf, 0xCu);
  }

  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC2358], "controllerWithUserIdentity:", self->_userIdentity);
  v15 = (MPCloudController *)objc_claimAutoreleasedReturnValue();
  cloudController = self->_cloudController;
  self->_cloudController = v15;

  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = sub_1CC9834E0(v17);

  if (v18 == 3)
  {
    objc_msgSend(v14, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v22);
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_requestAceHash;
      self->_requestAceHash = v23;

    }
    _MPLogCategoryAssistant();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v63 = v26;
      v64 = 2114;
      v65 = (uint64_t)v21;
      _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append store: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v21, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "longLongValue");

    v29 = (id)-[NSString copy](self->_requestAceHash, "copy");
  }
  else
  {
    objc_msgSend(v14, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "items");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v33);
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      v35 = self->_requestAceHash;
      self->_requestAceHash = v34;

    }
    _MPLogCategoryAssistant();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v63 = v37;
      v64 = 2114;
      v65 = (uint64_t)v32;
      _os_log_impl(&dword_1CC97B000, v36, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v32, "valueForProperty:", *MEMORY[0x1E0CC1FC8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v38, "longLongValue");

    objc_msgSend(v32, "valueForProperty:", *MEMORY[0x1E0CC1FC0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedLongLongValue");

    v29 = (id)-[NSString copy](self->_requestAceHash, "copy");
    if (v40)
    {
      if (!-[NSString length](self->_requestAceHash, "length"))
      {
        -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v41);
        v42 = (NSString *)objc_claimAutoreleasedReturnValue();
        v43 = self->_requestAceHash;
        self->_requestAceHash = v42;

      }
      _MPLogCategoryAssistant();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = self->_requestAceHash;
        *(_DWORD *)buf = 138543618;
        v63 = v45;
        v64 = 2048;
        v65 = v40;
        _os_log_impl(&dword_1CC97B000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append saga: %llu", buf, 0x16u);
      }

      v46 = self->_cloudController;
      v47 = objc_msgSend(v6, "persistentID");
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = sub_1CC981FD0;
      v59[3] = &unk_1E88E3ED8;
      v29 = v29;
      v60 = v29;
      v61 = v7;
      -[MPCloudController addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:](v46, "addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", v40, v47, v59);

      v48 = v60;
      goto LABEL_27;
    }
  }
  if (!v28)
  {
    +[MPAssistantAddMediaItemsToPlaylist _notifyAssistantWithString:requestHash:completion:](MPAssistantAddMediaItemsToPlaylist, "_notifyAssistantWithString:requestHash:completion:", CFSTR("Unknown item type"), self->_requestAceHash, v7);
    goto LABEL_29;
  }
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v49);
    v50 = (NSString *)objc_claimAutoreleasedReturnValue();
    v51 = self->_requestAceHash;
    self->_requestAceHash = v50;

  }
  _MPLogCategoryAssistant();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    v63 = v53;
    v64 = 2048;
    v65 = 0;
    _os_log_impl(&dword_1CC97B000, v52, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud item) <%{public}@>: append adam: %llu", buf, 0x16u);
  }

  v54 = self->_cloudController;
  v55 = objc_msgSend(v6, "persistentID");
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1CC981FE8;
  v56[3] = &unk_1E88E3ED8;
  v29 = v29;
  v57 = v29;
  v58 = v7;
  -[MPCloudController addStoreItemWithAdamID:toPlaylistWithPersistentID:completionHandler:](v54, "addStoreItemWithAdamID:toPlaylistWithPersistentID:completionHandler:", v28, v55, v56);

  v48 = v57;
LABEL_27:

LABEL_29:
}

- (void)_appendItemsToCloudPlaylist:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *requestAceHash;
  NSObject *v10;
  NSString *v11;
  MPCloudController *v12;
  MPCloudController *cloudController;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  NSObject *v44;
  NSString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  void *v50;
  NSString *v51;
  NSString *v52;
  NSObject *v53;
  NSString *v54;
  void *v55;
  NSString *v56;
  NSString *v57;
  NSObject *v58;
  NSString *v59;
  uint64_t v60;
  void *v61;
  NSString *v62;
  NSString *v63;
  NSObject *v64;
  NSString *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  uint8_t buf[4];
  NSString *v99;
  __int16 v100;
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v72 = a4;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;

  }
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v99 = v11;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: tail insertion", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CC2358], "controllerWithUserIdentity:", self->_userIdentity);
  v12 = (MPCloudController *)objc_claimAutoreleasedReturnValue();
  cloudController = self->_cloudController;
  v71 = 72;
  self->_cloudController = v12;

  v73 = v6;
  objc_msgSend(MEMORY[0x1E0CC2360], "cloudItemIDListForPlaylist:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v77)
  {
    v76 = *(_QWORD *)v94;
    v80 = *MEMORY[0x1E0CC1FC0];
    v81 = *MEMORY[0x1E0CC1FC8];
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v94 != v76)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend(v16, "identifier", v71);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = sub_1CC9834E0(v17);

        if (v18 != 3)
        {
          v75 = i;
          objc_msgSend(v16, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v79 = v31;
          objc_msgSend(v31, "items");
          v78 = (id)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          if (!v32)
            goto LABEL_49;
          v33 = v32;
          v34 = *(_QWORD *)v86;
          while (1)
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v86 != v34)
                objc_enumerationMutation(v78);
              v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v35);
              objc_msgSend(v36, "valueForProperty:", v81);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "longLongValue");

              objc_msgSend(v36, "valueForProperty:", v80);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "unsignedLongLongValue");

              if (v40)
              {
                if (!-[NSString length](self->_requestAceHash, "length"))
                {
                  -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v41);
                  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v43 = self->_requestAceHash;
                  self->_requestAceHash = v42;

                }
                _MPLogCategoryAssistant();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v99 = v45;
                  v100 = 2048;
                  v101 = v40;
                  _os_log_impl(&dword_1CC97B000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append saga: %lld", buf, 0x16u);
                }

                v46 = v14;
                v47 = v40;
                v48 = 0;
LABEL_40:
                objc_msgSend(v46, "addCloudItemID:idType:", v47, v48);
                goto LABEL_41;
              }
              v49 = -[NSString length](self->_requestAceHash, "length");
              if (v38)
              {
                if (!v49)
                {
                  -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v50);
                  v51 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v52 = self->_requestAceHash;
                  self->_requestAceHash = v51;

                }
                _MPLogCategoryAssistant();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  v54 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v99 = v54;
                  v100 = 2048;
                  v101 = v38;
                  _os_log_impl(&dword_1CC97B000, v53, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append adam: %lld", buf, 0x16u);
                }

                v46 = v14;
                v47 = v38;
                v48 = 1;
                goto LABEL_40;
              }
              if (!v49)
              {
                -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v55);
                v56 = (NSString *)objc_claimAutoreleasedReturnValue();
                v57 = self->_requestAceHash;
                self->_requestAceHash = v56;

              }
              _MPLogCategoryAssistant();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v59 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v99 = v59;
                v100 = 2114;
                v101 = (uint64_t)v36;
                _os_log_impl(&dword_1CC97B000, v58, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (cloud items) <%{public}@>: append failed: %{public}@", buf, 0x16u);
              }

LABEL_41:
              ++v35;
            }
            while (v33 != v35);
            v60 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
            v33 = v60;
            if (!v60)
            {
LABEL_49:

              i = v75;
              goto LABEL_50;
            }
          }
        }
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v16, "items");
        v79 = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v90;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v90 != v21)
                objc_enumerationMutation(v79);
              objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "longLongValue");

              if (!-[NSString length](self->_requestAceHash, "length"))
              {
                -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v26);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v28 = self->_requestAceHash;
                self->_requestAceHash = v27;

              }
              _MPLogCategoryAssistant();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v99 = v30;
                v100 = 2048;
                v101 = v25;
                _os_log_impl(&dword_1CC97B000, v29, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: append store: %lld", buf, 0x16u);
              }

              objc_msgSend(v14, "addCloudItemID:idType:", v25, 1);
            }
            v20 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
          }
          while (v20);
        }
LABEL_50:

      }
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v77);
  }

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v61);
    v62 = (NSString *)objc_claimAutoreleasedReturnValue();
    v63 = self->_requestAceHash;
    self->_requestAceHash = v62;

  }
  _MPLogCategoryAssistant();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v99 = v65;
    _os_log_impl(&dword_1CC97B000, v64, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: rewrite playlist", buf, 0xCu);
  }

  v66 = (void *)-[NSString copy](self->_requestAceHash, "copy");
  v67 = *(Class *)((char *)&self->super.super.super.super.super.isa + v71);
  v68 = objc_msgSend(v73, "persistentID");
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = sub_1CC981EF0;
  v82[3] = &unk_1E88E3ED8;
  v83 = v66;
  v84 = v72;
  v69 = v72;
  v70 = v66;
  objc_msgSend(v67, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", 0, v14, v68, v82);

}

- (void)_prependItemsToCloudPlaylist:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *requestAceHash;
  NSObject *v10;
  NSString *v11;
  MPCloudController *v12;
  MPCloudController *cloudController;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  NSObject *v44;
  NSString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSObject *v54;
  NSString *v55;
  void *v56;
  NSString *v57;
  NSString *v58;
  NSObject *v59;
  NSString *v60;
  uint64_t v61;
  void *v62;
  NSString *v63;
  NSString *v64;
  NSObject *v65;
  NSString *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  NSString *v101;
  __int16 v102;
  uint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v73 = a4;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;

  }
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v101 = v11;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: head insertion", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CC2358], "controllerWithUserIdentity:", self->_userIdentity);
  v12 = (MPCloudController *)objc_claimAutoreleasedReturnValue();
  cloudController = self->_cloudController;
  v72 = 72;
  self->_cloudController = v12;

  v74 = v6;
  objc_msgSend(MEMORY[0x1E0CC2360], "cloudItemIDListForPlaylist:", v6);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[SAMPAddMediaItemsToPlaylist mediaItems](self, "mediaItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  if (v78)
  {
    v14 = 0;
    v77 = *(_QWORD *)v96;
    v81 = *MEMORY[0x1E0CC1FC0];
    v82 = *MEMORY[0x1E0CC1FC8];
    do
    {
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v96 != v77)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v16, "identifier", v72);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = sub_1CC9834E0(v17);

        if (v18 != 3)
        {
          v76 = i;
          objc_msgSend(v16, "MPMediaItemCollectionRepresentationWithUserIdentity:plugin:hash:", self->_userIdentity, CFSTR("Add Media Items To Playlist"), self->_requestAceHash);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          v80 = v31;
          objc_msgSend(v31, "items");
          v79 = (id)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
          if (!v32)
            goto LABEL_49;
          v33 = v32;
          v34 = *(_QWORD *)v88;
          while (1)
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v88 != v34)
                objc_enumerationMutation(v79);
              v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v35);
              objc_msgSend(v36, "valueForProperty:", v82);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "longLongValue");

              objc_msgSend(v36, "valueForProperty:", v81);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "unsignedLongLongValue");

              if (v40)
              {
                if (!-[NSString length](self->_requestAceHash, "length"))
                {
                  -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v41);
                  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v43 = self->_requestAceHash;
                  self->_requestAceHash = v42;

                }
                _MPLogCategoryAssistant();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v101 = v45;
                  v102 = 2048;
                  v103 = v40;
                  _os_log_impl(&dword_1CC97B000, v44, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend saga: %lld", buf, 0x16u);
                }

                v46 = v14 + 1;
                v47 = v83;
                v48 = v40;
                v49 = 0;
LABEL_40:
                objc_msgSend(v47, "insertCloudItemID:idType:atIndex:", v48, v49, v14);
                v14 = v46;
                goto LABEL_41;
              }
              v50 = -[NSString length](self->_requestAceHash, "length");
              if (v38)
              {
                if (!v50)
                {
                  -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v51);
                  v52 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v53 = self->_requestAceHash;
                  self->_requestAceHash = v52;

                }
                _MPLogCategoryAssistant();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = self->_requestAceHash;
                  *(_DWORD *)buf = 138543618;
                  v101 = v55;
                  v102 = 2048;
                  v103 = v38;
                  _os_log_impl(&dword_1CC97B000, v54, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend adam: %lld", buf, 0x16u);
                }

                v46 = v14 + 1;
                v47 = v83;
                v48 = v38;
                v49 = 1;
                goto LABEL_40;
              }
              if (!v50)
              {
                -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v56);
                v57 = (NSString *)objc_claimAutoreleasedReturnValue();
                v58 = self->_requestAceHash;
                self->_requestAceHash = v57;

              }
              _MPLogCategoryAssistant();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v60 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v101 = v60;
                v102 = 2114;
                v103 = (uint64_t)v36;
                _os_log_impl(&dword_1CC97B000, v59, OS_LOG_TYPE_ERROR, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend failed: %{public}@", buf, 0x16u);
              }

LABEL_41:
              ++v35;
            }
            while (v33 != v35);
            v61 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
            v33 = v61;
            if (!v61)
            {
LABEL_49:

              i = v76;
              goto LABEL_50;
            }
          }
        }
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        objc_msgSend(v16, "items");
        v80 = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v92 != v21)
                objc_enumerationMutation(v80);
              objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "longLongValue");

              if (!-[NSString length](self->_requestAceHash, "length"))
              {
                -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v26);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v28 = self->_requestAceHash;
                self->_requestAceHash = v27;

              }
              _MPLogCategoryAssistant();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = self->_requestAceHash;
                *(_DWORD *)buf = 138543618;
                v101 = v30;
                v102 = 2048;
                v103 = v25;
                _os_log_impl(&dword_1CC97B000, v29, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: prepend store: %lld", buf, 0x16u);
              }

              objc_msgSend(v83, "insertCloudItemID:idType:atIndex:", v25, 1, v14 + j);
            }
            v14 += j;
            v20 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
          }
          while (v20);
        }
LABEL_50:

      }
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    }
    while (v78);
  }

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaItemsToPlaylist aceId](self, "aceId");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Items To Playlist"), v62);
    v63 = (NSString *)objc_claimAutoreleasedReturnValue();
    v64 = self->_requestAceHash;
    self->_requestAceHash = v63;

  }
  _MPLogCategoryAssistant();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v101 = v66;
    _os_log_impl(&dword_1CC97B000, v65, OS_LOG_TYPE_DEFAULT, "Add Media Items To Playlist (cloud items) <%{public}@>: rewrite playlist", buf, 0xCu);
  }

  v67 = (void *)-[NSString copy](self->_requestAceHash, "copy");
  v68 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  v69 = objc_msgSend(v74, "persistentID");
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = sub_1CC981E10;
  v84[3] = &unk_1E88E3ED8;
  v85 = v67;
  v86 = v73;
  v70 = v73;
  v71 = v67;
  objc_msgSend(v68, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", 0, v83, v69, v84);

}

- (BOOL)_isSagaAuthenticated
{
  return MPCloudControllerGetSagaOnDiskDatabaseRevisionForUserIdentity() != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudController, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

+ (void)_notifyAssistantWithString:(id)a3 requestHash:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (objc_class *)MEMORY[0x1E0D87FE8];
    v10 = a5;
    v11 = (id)objc_msgSend([v9 alloc], "initWithReason:", v7);
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = CFSTR("Add Media Items To Playlist");
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v13;
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1CC97B000, v14, v15, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v19, 0x20u);

    }
  }
  else
  {
    v16 = (objc_class *)MEMORY[0x1E0D87FF8];
    v17 = a5;
    v11 = objc_alloc_init(v16);
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = CFSTR("Add Media Items To Playlist");
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v13;
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  objc_msgSend(v11, "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a5 + 2))(a5, v18);

}

+ (void)_notifyAssistantWithError:(id)a3 requestHash:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = a5;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", v10);
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = CFSTR("Add Media Items To Playlist");
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_ERROR, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x20u);

    }
    goto LABEL_6;
  }
  v14 = (objc_class *)MEMORY[0x1E0D87FF8];
  v15 = a5;
  v11 = objc_alloc_init(v14);
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = CFSTR("Add Media Items To Playlist");
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x20u);
LABEL_6:

  }
  objc_msgSend(v11, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a5 + 2))(a5, v16);

}

@end
