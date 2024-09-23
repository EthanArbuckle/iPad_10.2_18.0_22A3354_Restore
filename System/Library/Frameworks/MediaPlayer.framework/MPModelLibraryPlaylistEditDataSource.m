@implementation MPModelLibraryPlaylistEditDataSource

- (MPModelLibraryPlaylistEditDataSource)initWithIdentifier:(id)a3
{
  id v5;
  MPModelLibraryPlaylistEditDataSource *v6;
  MPModelLibraryPlaylistEditDataSource *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibraryPlaylistEditDataSource;
  v6 = -[MPModelLibraryPlaylistEditDataSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPModelLibraryPlaylistEditDataSource.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__handleMPMediaLibraryEntitiesAddedOrRemovedNotification_, CFSTR("MPMediaLibraryEntitiesAddedOrRemovedNotification"), 0);

  }
  return v7;
}

- (id)newPlaylistEntryForTrack:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  MPModelPlaylistEntry *v8;
  id v9;
  MPModelPlaylistEntry *v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  objc_msgSend(v5, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithSource:block:", CFSTR("com.apple.MediaPlayer.MPModelLibraryPlaylistEditController"), &__block_literal_global_30321);
  v8 = [MPModelPlaylistEntry alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_3;
  v12[3] = &unk_1E315BF88;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v9 = v5;
  v10 = -[MPModelObject initWithIdentifiers:block:](v8, "initWithIdentifiers:block:", v7, v12);

  return v10;
}

- (void)loadEntriesWithCompletion:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEditDataSource.m"), 59, CFSTR("Subclass %@ must implement -%@ defined in %@."), v7, v8, CFSTR("[MPModelLibraryPlaylistEditDataSource class]"));

  }
}

- (void)reload
{
  -[MPModelLibraryPlaylistEditDataSource _reloadWithCompletion:](self, "_reloadWithCompletion:", &__block_literal_global_21_30311);
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  objc_storeWeak((id *)&self->_dataSourceSection, a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__MPModelLibraryPlaylistEditDataSource_reloadSection_completion___block_invoke;
  v8[3] = &unk_1E31624C0;
  v9 = v6;
  v7 = v6;
  -[MPModelLibraryPlaylistEditDataSource _reloadWithCompletion:](self, "_reloadWithCompletion:", v8);

}

- (void)_reloadWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[5];
  id v7;
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceSection);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke;
    v6[3] = &unk_1E315C0B0;
    v6[4] = self;
    v8 = v4;
    v7 = WeakRetained;
    -[MPModelLibraryPlaylistEditDataSource loadEntriesWithCompletion:](self, "loadEntriesWithCompletion:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (MPModelSocialPerson)authorProfile
{
  return self->_authorProfile;
}

- (void)setAuthorProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)playlistEntries
{
  return self->_playlistEntries;
}

- (NSDictionary)playlistEntriesByIdentifier
{
  return self->_playlistEntriesByIdentifier;
}

- (MPMutableIdentifierListSection)dataSourceSection
{
  return (MPMutableIdentifierListSection *)objc_loadWeakRetained((id *)&self->_dataSourceSection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSourceSection);
  objc_storeStrong((id *)&self->_playlistEntriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_playlistEntries, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_authorProfile, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load entries. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_22;
    v13[3] = &unk_1E315C088;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = *(id *)(a1 + 48);
    dispatch_async(v9, v13);

  }
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2;
  v27[3] = &unk_1E315BFD0;
  v6 = v3;
  v28 = v6;
  v7 = v2;
  v29 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v27);
  v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    v32 = 2048;
    v33 = v10;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded %ld tracks from data source", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(v6, "count");
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_27;
  v24[3] = &unk_1E315BFF8;
  v25 = v11;
  v14 = v6;
  v26 = v14;
  v15 = v11;
  +[MPChangeDetails changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:](MPChangeDetails, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v12, v13, v24, &__block_literal_global_30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "copy");
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_3;
  v22[3] = &unk_1E315C060;
  v23 = v14;
  v21 = v14;
  objc_msgSend(WeakRetained, "applyChanges:itemLookupBlock:", v16, v22);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "universalIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2_29()
{
  return 0;
}

uint64_t __65__MPModelLibraryPlaylistEditDataSource_reloadSection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUniversalIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPositionUniversalIdentifier:", v8);

  objc_msgSend(v10, "setSocialContributor:", *(_QWORD *)(a1[4] + 16));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setSong:", a1[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPModelLibraryPlaylistEditDataSource.m"), 51, CFSTR("Unsupported model object type for track %@"), a1[5]);

  }
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "databaseID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_2;
    v6[3] = &unk_1E3162B80;
    v7 = v3;
    objc_msgSend(v5, "setLibraryIdentifiersWithDatabaseID:block:", v4, v6);

  }
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setContainedPersistentID:", objc_msgSend(v2, "persistentID"));
  objc_msgSend(v3, "setPersistentID:", 0);

}

@end
