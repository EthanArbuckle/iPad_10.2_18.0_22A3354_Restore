@implementation MPModelLibraryPlaylistEditPlaylistDataSource

- (MPModelLibraryPlaylistEditPlaylistDataSource)initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MPModelLibraryPlaylistEditPlaylistDataSource *v26;
  MPModelLibraryPlaylistEditPlaylistDataSource *v27;
  uint64_t v28;
  MPModelPlaylist *playlist;
  void *v30;
  uint64_t v31;
  MPPropertySet *playlistPropertySet;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v11 = a4;
  v34 = a5;
  v12 = a6;
  objc_msgSend(v11, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "persistentID");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("l.%lld"), objc_msgSend(v17, "persistentID"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v13, "universalStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "globalPlaylistID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "universalStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "globalPlaylistID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("g.%@"), v22);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v18 = CFSTR("u");
LABEL_6:
  v23 = (void *)MEMORY[0x1E0CB3940];
  MSVNanoIDCreateTaggedPointer();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("p-%@-%@"), v18, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v36.receiver = self;
  v36.super_class = (Class)MPModelLibraryPlaylistEditPlaylistDataSource;
  v26 = -[MPModelLibraryPlaylistEditDataSource initWithIdentifier:](&v36, sel_initWithIdentifier_, v25);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_library, a3);
    v28 = objc_msgSend(v11, "copy");
    playlist = v27->_playlist;
    v27->_playlist = (MPModelPlaylist *)v28;

    objc_storeStrong((id *)&v27->_initialTrackList, a5);
    -[MPModelLibraryPlaylistEditPlaylistDataSource _defaultPlaylistEntryPropertySet](v27, "_defaultPlaylistEntryPropertySet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "propertySetByCombiningWithPropertySet:", v12);
    v31 = objc_claimAutoreleasedReturnValue();
    playlistPropertySet = v27->_playlistPropertySet;
    v27->_playlistPropertySet = (MPPropertySet *)v31;

  }
  return v27;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p : %@>{\n"), objc_opt_class(), self, self->_playlist);
}

- (void)loadEntriesWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  MPModelLibraryRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, void *, _QWORD);
  MPModelPlaylist *playlist;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if (self->_initialTrackList && !self->_hasPerformedInitialLoad)
  {
    self->_hasPerformedInitialLoad = 1;
    -[MPSectionedCollection allItems](self->_initialTrackList, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5, 0);
    -[MPModelLibraryPlaylistEditDataSource reload](self, "reload");
  }
  else
  {
    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading track list"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setLabel:](v7, "setLabel:", v8);

    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylist kindWithPlaylistEntryKind:options:](MPModelPlaylist, "kindWithPlaylistEntryKind:options:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setSectionKind:](v7, "setSectionKind:", v11);

    -[MPModelRequest setSectionProperties:](v7, "setSectionProperties:", v6);
    v18 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemKind:](v7, "setItemKind:", v13);

    -[MPModelRequest setItemProperties:](v7, "setItemProperties:", self->_playlistPropertySet);
    playlist = self->_playlist;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &playlist, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setScopedContainers:](v7, "setScopedContainers:", v14);

    -[MPModelLibraryRequest setFilteringOptions:](v7, "setFilteringOptions:", 0x10000);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__MPModelLibraryPlaylistEditPlaylistDataSource_loadEntriesWithCompletion___block_invoke;
    v15[3] = &unk_1E3156E50;
    v15[4] = self;
    v16 = v4;
    -[MPModelLibraryRequest performWithResponseHandler:](v7, "performWithResponseHandler:", v15);

  }
}

- (id)_defaultPlaylistEntryPropertySet
{
  MPPropertySet *v2;
  void *v3;
  MPPropertySet *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v6[0] = CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier");
  v6[1] = CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier");
  v6[2] = CFSTR("MPModelPropertyPlaylistEntryPosition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, 0);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistPropertySet, 0);
  objc_storeStrong((id *)&self->_initialTrackList, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

void __74__MPModelLibraryPlaylistEditPlaylistDataSource_loadEntriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load playlist tracks from library. err=%{public}@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
