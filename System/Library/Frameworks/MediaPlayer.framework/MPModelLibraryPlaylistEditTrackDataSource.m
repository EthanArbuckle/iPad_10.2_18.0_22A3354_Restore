@implementation MPModelLibraryPlaylistEditTrackDataSource

- (MPModelLibraryPlaylistEditTrackDataSource)initWithTrackObjects:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  MPModelLibraryPlaylistEditTrackDataSource *v19;
  uint64_t v20;
  NSArray *tracks;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSArray *playlistEntries;
  SEL v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[4];
  MPModelLibraryPlaylistEditTrackDataSource *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "persistentID");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("l.%lld"), objc_msgSend(v11, "persistentID"));
LABEL_5:
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v7, "universalStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "subscriptionAdamID");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("s.%lld"), objc_msgSend(v11, "subscriptionAdamID"));
    goto LABEL_5;
  }
  v15 = CFSTR("u");
LABEL_6:
  v16 = (void *)MEMORY[0x1E0CB3940];
  MSVNanoIDCreateTaggedPointer();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("t-%@-%@"), v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v43.receiver = self;
  v43.super_class = (Class)MPModelLibraryPlaylistEditTrackDataSource;
  v19 = -[MPModelLibraryPlaylistEditDataSource initWithIdentifier:](&v43, sel_initWithIdentifier_, v18);
  if (v19)
  {
    v36 = v18;
    v35 = a2;
    v37 = v7;
    v20 = objc_msgSend(v5, "copy");
    tracks = v19->_tracks;
    v19->_tracks = (NSArray *)v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v38 = v5;
    v23 = v5;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v35, v19, CFSTR("MPModelLibraryPlaylistEditTrackDataSource.m"), 40, CFSTR("Object is not a song track: %@"), objc_opt_class());

          }
          v29 = -[MPModelLibraryPlaylistEditDataSource newPlaylistEntryForTrack:](v19, "newPlaylistEntryForTrack:", v28);
          if (v29)
          {
            objc_msgSend(v22, "addObject:", v29);
          }
          else
          {
            v30 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v19;
              v46 = 2114;
              v47 = v28;
              _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist entry for track object %{public}@", buf, 0x16u);
            }

          }
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v25);
    }

    v32 = objc_msgSend(v22, "copy");
    playlistEntries = v19->_playlistEntries;
    v19->_playlistEntries = (NSArray *)v32;

    v7 = v37;
    v5 = v38;
    v18 = v36;
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPModelLibraryPlaylistEditDataSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p : %@>{\n"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadEntriesWithCompletion:(id)a3
{
  (*((void (**)(id, NSArray *, _QWORD))a3 + 2))(a3, self->_playlistEntries, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_playlistEntries, 0);
}

@end
