@implementation MPModelLibraryPlaylistEditAlbumDataSource

- (MPModelLibraryPlaylistEditAlbumDataSource)initWithLibrary:(id)a3 album:(id)a4 trackProperties:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  MPModelLibraryPlaylistEditAlbumDataSource *v24;
  MPModelLibraryPlaylistEditAlbumDataSource *v25;
  uint64_t v26;
  MPModelAlbum *album;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "library");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "persistentID");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("l.%lld"), objc_msgSend(v16, "persistentID"));
LABEL_5:
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v12, "universalStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "adamID");

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "universalStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("a.%lld"), objc_msgSend(v16, "adamID"));
    goto LABEL_5;
  }
  v20 = CFSTR("u");
LABEL_6:
  v21 = (void *)MEMORY[0x1E0CB3940];
  MSVNanoIDCreateTaggedPointer();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("a-%@-%@"), v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v29.receiver = self;
  v29.super_class = (Class)MPModelLibraryPlaylistEditAlbumDataSource;
  v24 = -[MPModelLibraryPlaylistEditDataSource initWithIdentifier:](&v29, sel_initWithIdentifier_, v23);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_library, a3);
    v26 = objc_msgSend(v10, "copy");
    album = v25->_album;
    v25->_album = (MPModelAlbum *)v26;

    objc_storeStrong((id *)&v25->_trackPropertySet, a5);
  }

  return v25;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p : %@>{\n"), objc_opt_class(), self, self->_album);
}

- (void)loadEntriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPModelLibraryRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  MPModelAlbum *album;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MPModelLibraryRequest);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loading track list"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setLabel:](v7, "setLabel:", v8);

  +[MPModelAlbum kindWithSongKind:options:](MPModelAlbum, "kindWithSongKind:options:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setSectionKind:](v7, "setSectionKind:", v9);

  -[MPModelRequest setSectionProperties:](v7, "setSectionProperties:", v6);
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest setItemKind:](v7, "setItemKind:", v11);

  -[MPModelRequest setItemProperties:](v7, "setItemProperties:", self->_trackPropertySet);
  album = self->_album;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &album, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequest setScopedContainers:](v7, "setScopedContainers:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke;
  v14[3] = &unk_1E3156E50;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[MPModelLibraryRequest performWithResponseHandler:](v7, "performWithResponseHandler:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackPropertySet, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

void __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to album tracks from library. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke_17;
    v11[3] = &unk_1E3156E28;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "msv_map:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

id __71__MPModelLibraryPlaylistEditAlbumDataSource_loadEntriesWithCompletion___block_invoke_17(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPlaylistEntryForTrack:", a2);
}

@end
