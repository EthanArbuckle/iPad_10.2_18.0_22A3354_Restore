@implementation MPModelLibraryPlaylistEditController

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, 0, 0, 0, 0);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, 0, 0, a4, 0);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4 authorProfile:(id)a5
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, 0, 0, a4, a5);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, a4, 0, 0, 0);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, a4, 0, a5, 0);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5 authorProfile:(id)a6
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, a4, 0, a5, a6);
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6
{
  return (MPModelLibraryPlaylistEditController *)-[MPModelLibraryPlaylistEditController _initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:](self, "_initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", a3, a4, a5, a6, 0);
}

- (id)_initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6 authorProfile:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MPModelLibraryPlaylistEditController *v18;
  NSOperationQueue *v19;
  NSOperationQueue *operationQueue;
  uint64_t v21;
  MPModelPlaylist *playlist;
  uint64_t v23;
  MPSectionedCollection *initialTrackList;
  MPPropertySet *v25;
  MPPropertySet *playlistEntryProperties;
  uint64_t v27;
  MPModelSocialPerson *authorProfile;
  uint64_t v29;
  NSMutableDictionary *dataSources;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MPModelLibraryPlaylistEditController;
  v18 = -[MPModelLibraryPlaylistEditController init](&v32, sel_init);
  if (v18)
  {
    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v19;

    -[NSOperationQueue setName:](v18->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryPlaylistEditController.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v18->_operationQueue, "setQualityOfService:", 33);
    objc_storeStrong((id *)&v18->_library, a3);
    v21 = objc_msgSend(v14, "copy");
    playlist = v18->_playlist;
    v18->_playlist = (MPModelPlaylist *)v21;

    v23 = objc_msgSend(v15, "copy");
    initialTrackList = v18->_initialTrackList;
    v18->_initialTrackList = (MPSectionedCollection *)v23;

    if (v16)
    {
      v25 = (MPPropertySet *)v16;
    }
    else
    {
      +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
      v25 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    }
    playlistEntryProperties = v18->_playlistEntryProperties;
    v18->_playlistEntryProperties = v25;

    v27 = objc_msgSend(v17, "copy");
    authorProfile = v18->_authorProfile;
    v18->_authorProfile = (MPModelSocialPerson *)v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v29 = objc_claimAutoreleasedReturnValue();
    dataSources = v18->_dataSources;
    v18->_dataSources = (NSMutableDictionary *)v29;

    v18->_lock._os_unfair_lock_opaque = 0;
  }

  return v18;
}

- (void)beginEditingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  MPModelPlaylist *playlist;
  MPSectionedCollection *initialTrackList;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v12;
  __int16 v13;
  MPModelPlaylist *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    playlist = self->_playlist;
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = playlist;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Begining edit with playlist %{public}@", buf, 0x16u);
  }

  initialTrackList = self->_initialTrackList;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__MPModelLibraryPlaylistEditController_beginEditingWithCompletion___block_invoke;
  v9[3] = &unk_1E3161878;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[MPModelLibraryPlaylistEditController _createTrackIdentifierListWithInitialEntries:completion:](self, "_createTrackIdentifierListWithInitialEntries:completion:", initialTrackList, v9);

}

- (NSString)name
{
  NSString *newName;

  newName = self->_newName;
  if (newName)
    return newName;
  -[MPModelPlaylist name](self->_playlist, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *newName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  newName = self->_newName;
  self->_newName = v4;

}

- (NSString)descriptionText
{
  NSString *newDescriptionText;

  newDescriptionText = self->_newDescriptionText;
  if (newDescriptionText)
    return newDescriptionText;
  -[MPModelPlaylist descriptionText](self->_playlist, "descriptionText");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDescriptionText:(id)a3
{
  NSString *v4;
  NSString *newDescriptionText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  newDescriptionText = self->_newDescriptionText;
  self->_newDescriptionText = v4;

}

- (MPModelPlaylist)parentPlaylist
{
  return self->_newParentPlaylist;
}

- (void)setParentPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_newParentPlaylist, a3);
}

- (UIImage)userImage
{
  return self->_newUserImage;
}

- (void)setUserImage:(id)a3
{
  objc_storeStrong((id *)&self->_newUserImage, a3);
}

- (NSNumber)isPublicPlaylist
{
  NSNumber *publicPlaylist;
  NSNumber *v3;

  publicPlaylist = self->_publicPlaylist;
  if (publicPlaylist)
  {
    v3 = publicPlaylist;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPModelPlaylist isPublicPlaylist](self->_playlist, "isPublicPlaylist"));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setPublicPlaylist:(id)a3
{
  NSNumber *v4;
  NSNumber *publicPlaylist;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  publicPlaylist = self->_publicPlaylist;
  self->_publicPlaylist = v4;

}

- (NSNumber)isVisiblePlaylist
{
  NSNumber *visiblePlaylist;
  NSNumber *v3;

  visiblePlaylist = self->_visiblePlaylist;
  if (visiblePlaylist)
  {
    v3 = visiblePlaylist;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPModelPlaylist isVisiblePlaylist](self->_playlist, "isVisiblePlaylist"));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setVisiblePlaylist:(id)a3
{
  NSNumber *v4;
  NSNumber *visiblePlaylist;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  visiblePlaylist = self->_visiblePlaylist;
  self->_visiblePlaylist = v4;

}

- (NSNumber)isCuratorPlaylist
{
  NSNumber *curatorPlaylist;
  NSNumber *v3;

  curatorPlaylist = self->_curatorPlaylist;
  if (curatorPlaylist)
  {
    v3 = curatorPlaylist;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPModelPlaylist isCuratorPlaylist](self->_playlist, "isCuratorPlaylist"));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setCuratorPlaylist:(id)a3
{
  NSNumber *v4;
  NSNumber *curatorPlaylist;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  curatorPlaylist = self->_curatorPlaylist;
  self->_curatorPlaylist = v4;

}

- (NSString)coverArtworkRecipe
{
  NSString *coverArtworkRecipe;

  coverArtworkRecipe = self->_coverArtworkRecipe;
  if (coverArtworkRecipe)
    return coverArtworkRecipe;
  -[MPModelPlaylist coverArtworkRecipe](self->_playlist, "coverArtworkRecipe");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCoverArtworkRecipe:(id)a3
{
  NSString *v4;
  NSString *coverArtworkRecipe;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  coverArtworkRecipe = self->_coverArtworkRecipe;
  self->_coverArtworkRecipe = v4;

}

- (MPSectionedCollection)currentTrackList
{
  MPMutableSectionedCollection *v3;
  int64_t v4;
  MPSectionedIdentifierList *trackIdentifierList;
  MPMutableSectionedCollection *v6;
  MPMutableSectionedCollection *v7;
  MPSectionedCollection *v8;
  _QWORD v10[5];
  MPMutableSectionedCollection *v11;
  int64_t v12;

  v3 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPMutableSectionedCollection appendSection:](v3, "appendSection:", self->_playlist);
  v4 = -[MPSectionedIdentifierList itemCount](self->_trackIdentifierList, "itemCount");
  trackIdentifierList = self->_trackIdentifierList;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke;
  v10[3] = &unk_1E315E368;
  v10[4] = self;
  v12 = v4;
  v6 = v3;
  v11 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](trackIdentifierList, "performWithExclusiveAccess:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)appendItem:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryPlaylistEditController appendItems:completion:](self, "appendItems:completion:", v9, v7, v10, v11);
}

- (void)appendItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  MPSectionedIdentifierList *trackIdentifierList;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ appending items %{public}@ ", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  v9 = -[MPModelLibraryPlaylistEditController _newDataSourceForModelObjects:](self, "_newDataSourceForModelObjects:", v6);
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_dataSources, "setObject:forKey:", v9, v10);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  trackIdentifierList = self->_trackIdentifierList;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MPModelLibraryPlaylistEditController_appendItems_completion___block_invoke;
  v13[3] = &unk_1E31617A8;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v7;
  v14 = v12;
  -[MPSectionedIdentifierList addDataSourceAtEnd:section:completion:](trackIdentifierList, "addDataSourceAtEnd:section:completion:", v9, v10, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)insertItemAtStart:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryPlaylistEditController insertItemsAtStart:completion:](self, "insertItemsAtStart:completion:", v9, v7, v10, v11);
}

- (void)insertItemsAtStart:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  MPSectionedIdentifierList *trackIdentifierList;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting items at start %{public}@ ", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  v9 = -[MPModelLibraryPlaylistEditController _newDataSourceForModelObjects:](self, "_newDataSourceForModelObjects:", v6);
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_dataSources, "setObject:forKey:", v9, v10);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  trackIdentifierList = self->_trackIdentifierList;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__MPModelLibraryPlaylistEditController_insertItemsAtStart_completion___block_invoke;
  v13[3] = &unk_1E31617A8;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v7;
  v14 = v12;
  -[MPSectionedIdentifierList addDataSourceAtStart:section:completion:](trackIdentifierList, "addDataSourceAtStart:section:completion:", v9, v10, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)insertItem:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryPlaylistEditController insertItems:atIndexPath:completion:](self, "insertItems:atIndexPath:completion:", v12, v10, v9, v13, v14);
}

- (void)insertItems:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  MPSectionedIdentifierList *trackIdentifierList;
  uint64_t v14;
  void *v15;
  MPSectionedIdentifierList *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "item"))
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = -[MPModelLibraryPlaylistEditController _newDataSourceForModelObjects:](self, "_newDataSourceForModelObjects:", v8);
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_dataSources, "setObject:forKey:", v11, v12);
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(location, self);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__25410;
    v28 = __Block_byref_object_dispose__25411;
    v29 = 0;
    trackIdentifierList = self->_trackIdentifierList;
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke;
    v21[3] = &unk_1E315E2A0;
    v23 = &v24;
    v21[4] = self;
    v22 = v9;
    -[MPSectionedIdentifierList performWithExclusiveAccess:](trackIdentifierList, "performWithExclusiveAccess:", v21);
    -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v25[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_trackIdentifierList;
    v17 = v25[5];
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke_2;
    v18[3] = &unk_1E31617A8;
    objc_copyWeak(&v20, location);
    v19 = v10;
    -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](v16, "addDataSource:section:afterItem:inSection:completion:", v11, v12, v17, v15, v18);

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v24, 8);

    objc_destroyWeak(location);
  }
  else
  {
    -[MPModelLibraryPlaylistEditController insertItemsAtStart:completion:](self, "insertItemsAtStart:completion:", v8, v10);
  }

}

- (void)insertItem:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryPlaylistEditController insertItems:afterEntry:completion:](self, "insertItems:afterEntry:completion:", v12, v10, v9, v13, v14);
}

- (void)insertItems:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MPSectionedIdentifierList *trackIdentifierList;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = self;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting items %{public}@ after entry %{public}@", buf, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  v12 = -[MPModelLibraryPlaylistEditController _newDataSourceForModelObjects:](self, "_newDataSourceForModelObjects:", v8);
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_dataSources, "setObject:forKey:", v12, v13);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  objc_msgSend(v9, "universalIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  trackIdentifierList = self->_trackIdentifierList;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__MPModelLibraryPlaylistEditController_insertItems_afterEntry_completion___block_invoke;
  v18[3] = &unk_1E31617A8;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v10;
  v19 = v17;
  -[MPSectionedIdentifierList addDataSource:section:afterItem:inSection:completion:](trackIdentifierList, "addDataSource:section:afterItem:inSection:completion:", v12, v13, v14, v15, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  MPSectionedIdentifierList *trackIdentifierList;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "item");
  if (v8 != objc_msgSend(v7, "item"))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__25410;
    v28 = __Block_byref_object_dispose__25411;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__25410;
    v22 = __Block_byref_object_dispose__25411;
    v23 = 0;
    trackIdentifierList = self->_trackIdentifierList;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__MPModelLibraryPlaylistEditController_moveItemFromIndexPath_toIndexPath___block_invoke;
    v13[3] = &unk_1E3159A40;
    v16 = &v24;
    v13[4] = self;
    v14 = v6;
    v17 = &v18;
    v15 = v7;
    -[MPSectionedIdentifierList performWithExclusiveAccess:](trackIdentifierList, "performWithExclusiveAccess:", v13);
    -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v25[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v19[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSectionedIdentifierList moveItem:fromSection:afterItem:inSection:](self->_trackIdentifierList, "moveItem:fromSection:afterItem:inSection:", v25[5], v10, v19[5], v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
}

- (void)removeItemAtIndexPath:(id)a3
{
  id v4;
  MPSectionedIdentifierList *trackIdentifierList;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25410;
  v16 = __Block_byref_object_dispose__25411;
  v17 = 0;
  trackIdentifierList = self->_trackIdentifierList;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MPModelLibraryPlaylistEditController_removeItemAtIndexPath___block_invoke;
  v9[3] = &unk_1E315E2A0;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](trackIdentifierList, "performWithExclusiveAccess:", v9);
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v13[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList removeItem:fromSection:](self->_trackIdentifierList, "removeItem:fromSection:", v13[5], v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

  _Block_object_dispose(&v12, 8);
}

- (void)moveEntry:(id)a3 afterEntry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  MPModelLibraryPlaylistEditController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ moving entry %{public}@ after entry %{public}@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(v6, "universalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList moveItem:fromSection:afterItem:inSection:](self->_trackIdentifierList, "moveItem:fromSection:afterItem:inSection:", v9, v11, v10, v12);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

}

- (void)moveEntryToStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MPModelLibraryPlaylistEditController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ moving entry to start %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "universalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList moveItemToStart:fromSection:](self->_trackIdentifierList, "moveItemToStart:fromSection:", v6, v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

}

- (void)removeEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MPModelLibraryPlaylistEditController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing entry %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "universalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList removeItem:fromSection:](self->_trackIdentifierList, "removeItem:fromSection:", v6, v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

}

- (void)removeEntries:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing entries %{public}@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "universalIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSectionedIdentifierList removeItem:fromSection:](self->_trackIdentifierList, "removeItem:fromSection:", v11, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

}

- (void)commitWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MPSectionedIdentifierList setDelegate:](self->_trackIdentifierList, "setDelegate:", 0);
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MPSectionedIdentifierList debugDescription](self->_trackIdentifierList, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Committing playlist with track list: %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke;
  v9[3] = &unk_1E3159AD8;
  v9[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  -[MPModelLibraryPlaylistEditController _resolveTrackListWithCompletion:](self, "_resolveTrackListWithCompletion:", v9);

}

- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  -[MPModelLibraryPlaylistEditController _sectionIdentifierForItemIdentifier:](self, "_sectionIdentifierForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSources, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEditController.m"), 512, CFSTR("No data source for item identifier %@"), v6);

  }
  objc_msgSend(v8, "playlistEntriesByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier")))
  {
    objc_msgSend(v10, "positionUniversalIdentifier");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_5;
LABEL_9:
    v18 = 0;
    goto LABEL_12;
  }
  v11 = &stru_1E3163D10;
  if (!v10)
    goto LABEL_9;
LABEL_5:
  objc_msgSend(v10, "song");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        objc_msgSend(v10, "song"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertySongTitle")),
        v14,
        v13,
        v15))
  {
    objc_msgSend(v10, "song");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@; %@)"), v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  MPModelLibraryPlaylistEditController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Datasource %{public}@ changed - posting notification", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPModelLibraryPlaylistEditControllerDidChangeNotification"), self);

}

- (void)_createTrackIdentifierListWithInitialEntries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MPSectionedIdentifierList *v8;
  MPSectionedIdentifierList *trackIdentifierList;
  void *v10;
  void *v11;
  MPModelLibraryPlaylistEditPlaylistDataSource *v12;
  NSString *v13;
  NSString *initialDataSourceIdentifier;
  MPSectionedIdentifierList *v15;
  NSString *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary removeAllObjects](self->_dataSources, "removeAllObjects");
  v8 = -[MPSectionedIdentifierList initWithIdentifier:]([MPSectionedIdentifierList alloc], "initWithIdentifier:", CFSTR("MPModelLibraryPlaylistEditControllerLibrarySectionIdentifierName"));
  trackIdentifierList = self->_trackIdentifierList;
  self->_trackIdentifierList = v8;

  -[MPSectionedIdentifierList setDelegate:](self->_trackIdentifierList, "setDelegate:", self);
  -[MPSectionedIdentifierList setAnnotationDelegate:](self->_trackIdentifierList, "setAnnotationDelegate:", self);
  if (self->_playlist)
  {
    -[MPModelLibraryPlaylistEditController _defaultPlaylistEntryPropertySet](self, "_defaultPlaylistEntryPropertySet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertySetByCombiningWithPropertySet:", self->_playlistEntryProperties);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[MPModelLibraryPlaylistEditPlaylistDataSource initWithLibrary:playlist:initialTrackList:playlistEntryProperties:]([MPModelLibraryPlaylistEditPlaylistDataSource alloc], "initWithLibrary:playlist:initialTrackList:playlistEntryProperties:", self->_library, self->_playlist, v6, v11);
    -[MPModelLibraryPlaylistEditDataSource identifier](v12, "identifier");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    initialDataSourceIdentifier = self->_initialDataSourceIdentifier;
    self->_initialDataSourceIdentifier = v13;

    -[NSMutableDictionary setObject:forKey:](self->_dataSources, "setObject:forKey:", v12, self->_initialDataSourceIdentifier);
    objc_initWeak(&location, self);
    v16 = self->_initialDataSourceIdentifier;
    v15 = self->_trackIdentifierList;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96__MPModelLibraryPlaylistEditController__createTrackIdentifierListWithInitialEntries_completion___block_invoke;
    v17[3] = &unk_1E31617A8;
    objc_copyWeak(&v19, &location);
    v18 = v7;
    -[MPSectionedIdentifierList addDataSourceAtStart:section:completion:](v15, "addDataSourceAtStart:section:completion:", v12, v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)_itemIdentifierForIndexPath:(id)a3 usingExclusiveAccessToken:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "item");
  -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:](self->_trackIdentifierList, "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", 0x1000000, 0, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextObjectWithExclusiveAccessToken:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
    do
    {
      if (objc_msgSend(v11, "entryType") == 3)
      {
        objc_msgSend(v11, "itemResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "itemIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v9)
        {
          if (v14)
            goto LABEL_9;
          break;
        }
        ++v12;

      }
      objc_msgSend(v10, "nextObjectWithExclusiveAccessToken:", v8);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    while (v15);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEditController.m"), 586, CFSTR("Invalid index path %@"), v7);

  v14 = 0;
LABEL_9:

  return v14;
}

- (id)_newDataSourceForModelObjects:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  MPModelLibraryPlaylistEditTrackDataSource *v10;
  MPModelLibraryPlaylistEditPlaylistDataSource *v11;
  void *v12;
  char v13;
  MPModelLibraryPlaylistEditPlaylistDataSource *v14;
  MPMediaLibrary *library;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  MPModelLibraryPlaylistEditAlbumDataSource *v21;
  MPMediaLibrary *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;

  v5 = a3;
  -[MPModelLibraryPlaylistEditController _defaultPlaylistEntryPropertySet](self, "_defaultPlaylistEntryPropertySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertySetByCombiningWithPropertySet:", self->_playlistEntryProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = -[MPModelLibraryPlaylistEditTrackDataSource initWithTrackObjects:]([MPModelLibraryPlaylistEditTrackDataSource alloc], "initWithTrackObjects:", v5);
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      v14 = [MPModelLibraryPlaylistEditPlaylistDataSource alloc];
      library = self->_library;
      objc_msgSend(v5, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MPModelLibraryPlaylistEditPlaylistDataSource initWithLibrary:playlist:initialTrackList:playlistEntryProperties:](v14, "initWithLibrary:playlist:initialTrackList:playlistEntryProperties:", library, v16, 0, v7);

      goto LABEL_11;
    }
    objc_msgSend(v5, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v7, "relationships");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("MPModelRelationshipPlaylistEntrySong"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = [MPModelLibraryPlaylistEditAlbumDataSource alloc];
      v22 = self->_library;
      objc_msgSend(v5, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MPModelLibraryPlaylistEditAlbumDataSource initWithLibrary:album:trackProperties:](v21, "initWithLibrary:album:trackProperties:", v22, v23, v20);

      goto LABEL_11;
    }
    objc_msgSend(v5, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEditController.m"), 607, CFSTR("Unsupported model object %@"), v27);

      v11 = 0;
      goto LABEL_11;
    }
    v10 = -[MPModelLibraryPlaylistEditPlaylistEntryDataSource initWithPlaylistEntries:]([MPModelLibraryPlaylistEditPlaylistEntryDataSource alloc], "initWithPlaylistEntries:", v5);
  }
  v11 = (MPModelLibraryPlaylistEditPlaylistDataSource *)v10;
LABEL_11:
  -[MPModelLibraryPlaylistEditDataSource setAuthorProfile:](v11, "setAuthorProfile:", self->_authorProfile);

  return v11;
}

- (id)_sectionIdentifierForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25410;
  v16 = __Block_byref_object_dispose__25411;
  v17 = 0;
  -[MPSectionedIdentifierList allSectionIdentifiers](self->_trackIdentifierList, "allSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__MPModelLibraryPlaylistEditController__sectionIdentifierForItemIdentifier___block_invoke;
  v9[3] = &unk_1E3159B00;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_defaultPlaylistEntryPropertySet
{
  MPPropertySet *v2;
  void *v3;
  MPPropertySet *v4;
  MPPropertySet *v5;
  void *v6;
  void *v7;
  MPPropertySet *v8;
  MPPropertySet *v9;
  void *v10;
  MPPropertySet *v11;
  MPPropertySet *v12;
  void *v13;
  void *v14;
  MPPropertySet *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[4];
  const __CFString *v21;
  MPPropertySet *v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v24[0] = CFSTR("MPModelPropertyPersonName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, 0);

  v5 = [MPPropertySet alloc];
  v23[0] = CFSTR("MPModelPropertySongTitle");
  v23[1] = CFSTR("MPModelPropertySongArtwork");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("MPModelRelationshipSongArtist");
  v22 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPPropertySet initWithProperties:relationships:](v5, "initWithProperties:relationships:", v6, v7);

  v9 = [MPPropertySet alloc];
  v20[0] = CFSTR("MPModelPropertyPersonName");
  v20[1] = CFSTR("MPModelPropertySocialPersonHandle");
  v20[2] = CFSTR("MPModelPropertySocialPersonArtwork");
  v20[3] = CFSTR("MPModelPropertySocialPersonHasLightweightProfile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPPropertySet initWithProperties:relationships:](v9, "initWithProperties:relationships:", v10, 0);

  v12 = [MPPropertySet alloc];
  v19[0] = CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier");
  v19[1] = CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier");
  v19[2] = CFSTR("MPModelPropertyPlaylistEntryPosition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("MPModelRelationshipPlaylistEntrySong");
  v17[1] = CFSTR("MPModelRelationshipPlaylistEntrySocialContributor");
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPPropertySet initWithProperties:relationships:](v12, "initWithProperties:relationships:", v13, v14);

  return v15;
}

- (void)_resolveTrackListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  MPMutableSectionedCollection *v6;
  void *v7;
  uint64_t v8;
  id v9;
  MPMutableSectionedCollection *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  MPModelLibraryImportChangeRequest *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  MPMutableSectionedCollection *v21;
  id v22;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditController *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  MPMutableSectionedCollection *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPModelLibraryPlaylistEditController currentTrackList](self, "currentTrackList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPMutableSectionedCollection appendSection:](v6, "appendSection:", &stru_1E3163D10);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "totalItemCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke;
  v19[3] = &unk_1E3159B30;
  v19[4] = self;
  v9 = v5;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  objc_msgSend(v9, "enumerateItemIdentifiersUsingBlock:", v19);
  if (-[MPSectionedCollection totalItemCount](v10, "totalItemCount"))
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[MPSectionedCollection totalItemCount](v10, "totalItemCount");
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2048;
      v26 = v13;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Importing %ld non-library tracks: %{public}@", buf, 0x20u);
    }

    v14 = objc_alloc_init(MPModelLibraryImportChangeRequest);
    -[MPModelLibraryImportChangeRequest setReferralObject:](v14, "setReferralObject:", self->_playlist);
    -[MPModelLibraryImportChangeRequest setModelObjects:](v14, "setModelObjects:", v10);
    -[MPModelLibraryImportChangeRequest setShouldLibraryAdd:](v14, "setShouldLibraryAdd:", self->_addInsertedTracksToLibrary);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_66;
    v15[3] = &unk_1E3159BD0;
    v15[4] = self;
    v18 = v4;
    v16 = v9;
    v17 = v11;
    -[MPModelLibraryImportChangeRequest performWithResponseHandler:](v14, "performWithResponseHandler:", v15);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v4 + 2))(v4, v9, 0);
  }

}

- (BOOL)addInsertedTracksToLibrary
{
  return self->_addInsertedTracksToLibrary;
}

- (void)setAddInsertedTracksToLibrary:(BOOL)a3
{
  self->_addInsertedTracksToLibrary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_curatorPlaylist, 0);
  objc_storeStrong((id *)&self->_visiblePlaylist, 0);
  objc_storeStrong((id *)&self->_publicPlaylist, 0);
  objc_storeStrong((id *)&self->_newUserImage, 0);
  objc_storeStrong((id *)&self->_newParentPlaylist, 0);
  objc_storeStrong((id *)&self->_newDescriptionText, 0);
  objc_storeStrong((id *)&self->_newName, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_authorProfile, 0);
  objc_storeStrong((id *)&self->_playlistEntryProperties, 0);
  objc_storeStrong((id *)&self->_trackIdentifierList, 0);
  objc_storeStrong((id *)&self->_initialDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_initialTrackList, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(v5, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containedPersistentID");

  if (!v7)
  {
    v9 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v5, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "persistentID"))
  {
    v9 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 152);

  if (v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "itemWithPersistentID:verifyExistence:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForProperty:", CFSTR("isInMyLibrary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "BOOLValue") ^ 1;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v12, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendItem:", v15);
  }
  else
  {
    v16 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v13, v15);
  }

}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  MPMutableSectionedCollection *v13;
  MPMutableSectionedCollection *v14;
  const __CFString *v15;
  void *v16;
  MPMutableSectionedCollection *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  MPMutableSectionedCollection *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to import non-library tracks. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_67;
    v25[3] = &unk_1E3159B58;
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 32);
    v26 = v11;
    v27 = v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);
    v13 = objc_alloc_init(MPMutableSectionedCollection);
    v14 = v13;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      v15 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 8);
    else
      v15 = &stru_1E3163D10;
    -[MPMutableSectionedCollection appendSection:](v13, "appendSection:", v15);
    v16 = *(void **)(a1 + 40);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_69;
    v19[3] = &unk_1E3159BA8;
    v20 = v16;
    v21 = *(id *)(a1 + 48);
    v22 = v11;
    v23 = *(_QWORD *)(a1 + 32);
    v24 = v14;
    v17 = v14;
    v18 = v11;
    objc_msgSend(v20, "enumerateItemIdentifiersUsingBlock:", v19);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "subscriptionAdamID");
  if (v6)
  {
    v7 = v6;

LABEL_4:
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v3, v10);
    goto LABEL_5;
  }
  objc_msgSend(v4, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "adamID");

  if (v7)
    goto LABEL_4;
  v10 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v11;
    v14 = 2114;
    v15 = v3;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Imported non-library track missing store ID. obj=%{public}@, identifiers=%{public}@", (uint8_t *)&v12, 0x20u);
  }
LABEL_5:

}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPModelPlaylistEntry *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containedPersistentID");

  v11 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v8, "universalStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "subscriptionAdamID");

    if (!v15)
      goto LABEL_15;
    v16 = *(void **)(a1 + 48);
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "universalStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v18, "subscriptionAdamID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
LABEL_15:
      objc_msgSend(v8, "universalStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "adamID");

      if (!v22)
        goto LABEL_11;
      v23 = *(void **)(a1 + 48);
      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "universalStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithLongLong:", objc_msgSend(v25, "adamID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_11:
        v13 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v31 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          v37 = v31;
          v38 = 2114;
          v39 = v6;
          v40 = 2114;
          v41 = v5;
          _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't match playlist entry to imported objects. entry=%{public}@, identifiers=%{public}@", buf, 0x20u);
        }
        goto LABEL_3;
      }
    }
    v27 = [MPModelPlaylistEntry alloc];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_70;
    v32[3] = &unk_1E3159B80;
    v28 = v6;
    v29 = *(_QWORD *)(a1 + 56);
    v33 = v28;
    v34 = v29;
    v35 = v20;
    v30 = v20;
    v13 = -[MPModelObject initWithIdentifiers:block:](v27, "initWithIdentifiers:block:", v5, v32);

    if (!v13)
      goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 64), "appendItem:", v13);
LABEL_3:

LABEL_4:
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniversalIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "positionUniversalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPositionUniversalIdentifier:", v5);

  objc_msgSend(v3, "setSocialContributor:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "song");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject mergeWithObject:](v6, "mergeWithObject:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSong:", v7);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject mergeWithObject:](v6, "mergeWithObject:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTvEpisode:", v7);
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported model object %{public}@", (uint8_t *)&v10, 0x16u);
  }
LABEL_6:

}

void __76__MPModelLibraryPlaylistEditController__sectionIdentifierForItemIdentifier___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 40), "hasItem:inSection:", a1[5]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }

}

void __96__MPModelLibraryPlaylistEditController__createTrackIdentifierListWithInitialEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add playlist data source. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  MPModelLibraryPlaylistEditChangeRequest *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 138543618;
      v55 = v7;
      v56 = 2114;
      v57 = v5;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to resolve track list. err = %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1[4] + 40), "setDelegate:");
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v8 = (void *)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1[4] + 8), "isCollaborative");
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[4];
      v37 = v9;
      if (*(_QWORD *)(v13 + 32))
      {
        objc_msgSend(*(id *)(v13 + 72), "objectForKeyedSubscript:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], *(_QWORD *)(a1[4] + 32));

        }
        v15 = v11;
        objc_msgSend(v14, "playlistEntries");
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v16;
      }
      else
      {
        v15 = v11;
      }
      objc_msgSend(v8, "allItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v12, "count");
      v20 = objc_msgSend(v18, "count");
      v51[0] = v15;
      v51[1] = 3221225472;
      v51[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_24;
      v51[3] = &unk_1E315BFF8;
      v21 = v12;
      v52 = v21;
      v22 = v18;
      v53 = v22;
      +[MPChangeDetails changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:](MPChangeDetails, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v19, v20, v51, &__block_literal_global_25442);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = a1[4];
        objc_msgSend(v17, "debugDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v24;
        v56 = 2114;
        v57 = v25;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ calculated track list changes %{public}@", buf, 0x16u);

      }
      objc_msgSend(v17, "deletedIndexes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      v47[0] = v15;
      v47[1] = 3221225472;
      v47[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_26;
      v47[3] = &unk_1E3159A88;
      v48 = v21;
      v9 = v37;
      v27 = v37;
      v28 = a1[4];
      v49 = v27;
      v50 = v28;
      v29 = v21;
      objc_msgSend(v26, "enumerateIndexesUsingBlock:", v47);

      v42[0] = v11;
      v42[1] = 3221225472;
      v42[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_28;
      v42[3] = &unk_1E315B130;
      v46 = a1[6];
      v30 = a1[4];
      v43 = v22;
      v44 = v30;
      v45 = v8;
      v31 = v22;
      objc_msgSend(v17, "enumerateMovesUsingBlock:", v42);

    }
    else
    {
      v17 = 0;
    }
    v32 = objc_alloc_init(MPModelLibraryPlaylistEditChangeRequest);
    -[MPModelLibraryPlaylistEditChangeRequest setMediaLibrary:](v32, "setMediaLibrary:", *(_QWORD *)(a1[4] + 16));
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistName:](v32, "setPlaylistName:", *(_QWORD *)(a1[4] + 88));
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistDescription:](v32, "setPlaylistDescription:", *(_QWORD *)(a1[4] + 96));
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistUserImage:](v32, "setPlaylistUserImage:", *(_QWORD *)(a1[4] + 112));
    -[MPModelLibraryPlaylistEditChangeRequest setShouldCreatePlaylist:](v32, "setShouldCreatePlaylist:", *(_QWORD *)(a1[4] + 8) == 0);
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylist:](v32, "setPlaylist:", *(_QWORD *)(a1[4] + 8));
    -[MPModelLibraryPlaylistEditChangeRequest setPlaylistEntries:](v32, "setPlaylistEntries:", v8);
    -[MPModelLibraryPlaylistEditChangeRequest setPublicPlaylist:](v32, "setPublicPlaylist:", *(_QWORD *)(a1[4] + 120));
    -[MPModelLibraryPlaylistEditChangeRequest setVisiblePlaylist:](v32, "setVisiblePlaylist:", *(_QWORD *)(a1[4] + 128));
    -[MPModelLibraryPlaylistEditChangeRequest setCuratorPlaylist:](v32, "setCuratorPlaylist:", *(_QWORD *)(a1[4] + 136));
    -[MPModelLibraryPlaylistEditChangeRequest setCoverArtworkRecipe:](v32, "setCoverArtworkRecipe:", *(_QWORD *)(a1[4] + 144));
    -[MPModelLibraryPlaylistEditChangeRequest setTrackListChanges:](v32, "setTrackListChanges:", v17);
    -[MPModelLibraryPlaylistEditChangeRequest setDeletedEntryUUIDs:](v32, "setDeletedEntryUUIDs:", v9);
    v39[0] = v11;
    v39[1] = 3221225472;
    v39[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2_37;
    v39[3] = &unk_1E3159AB0;
    v33 = (void *)a1[5];
    v39[4] = a1[4];
    v40 = v8;
    v41 = v33;
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_40;
    v38[3] = &unk_1E315AF50;
    v38[4] = a1[4];
    v34 = v8;
    v35 = -[MPModelLibraryPlaylistEditChangeRequest newOperationWithLocalPersistenceResponseHandler:completeResponseHandler:](v32, "newOperationWithLocalPersistenceResponseHandler:completeResponseHandler:", v39, v38);
    objc_msgSend(*(id *)(a1[4] + 64), "addOperation:", v35);

  }
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
    v9 = 1;
  else
    v9 = objc_msgSend(v7, "isEqual:", v8);

  return v9;
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_26(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v9;
      v12 = 2048;
      v13 = a2;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "%{public}@ no UUID for deleted entry at position %lu", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _BYTE buf[22];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPModelLibraryPlaylistEditController.m"), 451, CFSTR("No playlist entry at moved index %lu"), a3);

  }
  objc_msgSend(v6, "positionUniversalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
  v9 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a2;
    v20 = 2048;
    v21 = a3;
    v22 = 2114;
    v23 = v7;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating position UUID for entry moved from %lu --> %lu; %{public}@ --> %{public}@",
      buf,
      0x34u);
  }

  objc_msgSend(v6, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_32;
  v17[3] = &unk_1E315BBD0;
  v18 = v8;
  v12 = v8;
  v13 = (void *)objc_msgSend(v6, "copyWithIdentifiers:block:", v11, v17);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = a3;
  v14 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", buf, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceObjectAtIndexPath:withObject:", v15, v13);

}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Finished committing new playlist error=%{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished committing new playlist", buf, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 8))
    {
      objc_storeStrong((id *)(v12 + 8), a3);
      v12 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v12 + 24), *(id *)(a1 + 40));
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_38;
    v15[3] = &unk_1E315B3A8;
    v15[4] = v13;
    v17 = *(id *)(a1 + 48);
    v16 = v6;
    objc_msgSend(v13, "_createTrackIdentifierListWithInitialEntries:completion:", v14, v15);

  }
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Change operation completed error=%{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Change operation completed", (uint8_t *)&v9, 0xCu);
  }

}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Reset datasource to updated track list. error=%{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reset datasource to updated track list.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPositionUniversalIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2()
{
  return 0;
}

void __62__MPModelLibraryPlaylistEditController_removeItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_itemIdentifierForIndexPath:usingExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__MPModelLibraryPlaylistEditController_moveItemFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_itemIdentifierForIndexPath:usingExclusiveAccessToken:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "_itemIdentifierForIndexPath:usingExclusiveAccessToken:", *(_QWORD *)(a1 + 48), v5);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __74__MPModelLibraryPlaylistEditController_insertItems_afterEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_itemIdentifierForIndexPath:usingExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__MPModelLibraryPlaylistEditController_insertItemsAtStart_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__MPModelLibraryPlaylistEditController_appendItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to append items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_2;
  v22[3] = &unk_1E31599F8;
  v6 = v4;
  v23 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v22);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", 0x1000000, 0, 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObjectWithExclusiveAccessToken:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = (void *)v8;
    v11 = 0;
    *(_QWORD *)&v9 = 138543618;
    v20 = v9;
    do
    {
      if (objc_msgSend(v10, "entryType", v20) == 3)
      {
        objc_msgSend(v10, "itemResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v14;
          if (!-[NSObject hasLoadedValueForKey:](v14, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryPosition"))|| v11 != -[NSObject position](v15, "position"))
          {
            -[NSObject identifiers](v15, "identifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_13;
            v21[3] = &__block_descriptor_40_e30_v16__0__MPModelPlaylistEntry_8l;
            v21[4] = v11;
            v17 = -[NSObject copyWithIdentifiers:block:](v15, "copyWithIdentifiers:block:", v16, v21);

            v15 = (os_log_t)v17;
          }
          objc_msgSend(*(id *)(a1 + 40), "appendItem:", v15);
          ++v11;
        }
        else
        {
          v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v18 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v20;
            v25 = v18;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "%{public}@ No playlist entry for identifier '%@' - skipping", buf, 0x16u);
          }
        }

      }
      objc_msgSend(v7, "nextObjectWithExclusiveAccessToken:", v3);
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v19;
    }
    while (v19);
  }

}

void __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "playlistEntriesByIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

}

uint64_t __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPosition:", *(_QWORD *)(a1 + 32));
}

void __67__MPModelLibraryPlaylistEditController_beginEditingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 8);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Finished loading playlist %{public}@ error=%{public}@", (uint8_t *)&v10, 0x20u);

    }
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 8);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished loading playlist %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
