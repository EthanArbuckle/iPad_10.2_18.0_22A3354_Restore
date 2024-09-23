@implementation MPModelLibraryPlaylistEditPlaylistEntryDataSource

- (MPModelLibraryPlaylistEditPlaylistEntryDataSource)initWithPlaylistEntries:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  MPModelLibraryPlaylistEditPlaylistEntryDataSource *v20;
  MPModelLibraryPlaylistEditPlaylistEntryDataSource *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *playlistEntries;
  SEL v35;
  void *v36;
  __CFString *v37;
  id v38;
  MPModelLibraryPlaylistEditPlaylistEntryDataSource *v39;
  id obj;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "persistentID");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("l.%lld"), objc_msgSend(v12, "persistentID"));
LABEL_5:
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v8, "universalStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "subscriptionAdamID");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "universalStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("s.%lld"), objc_msgSend(v12, "subscriptionAdamID"));
    goto LABEL_5;
  }
  v16 = CFSTR("u");
LABEL_6:
  v17 = (void *)MEMORY[0x1E0CB3940];
  MSVNanoIDCreateTaggedPointer();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("e-%@-%@"), v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v46.receiver = self;
  v46.super_class = (Class)MPModelLibraryPlaylistEditPlaylistEntryDataSource;
  v20 = -[MPModelLibraryPlaylistEditDataSource initWithIdentifier:](&v46, sel_initWithIdentifier_, v19);
  v21 = v20;
  if (v20)
  {
    v36 = v19;
    v37 = v16;
    v39 = v20;
    v35 = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v38 = v5;
    obj = v5;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      v26 = MEMORY[0x1E0C809B0];
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v35, v39, CFSTR("MPModelLibraryPlaylistEditPlaylistEntryDataSource.m"), 35, CFSTR("Object is not a playlist entry: %@"), objc_opt_class());

          }
          objc_msgSend(v28, "identifiers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v26;
          v41[1] = 3221225472;
          v41[2] = __77__MPModelLibraryPlaylistEditPlaylistEntryDataSource_initWithPlaylistEntries___block_invoke;
          v41[3] = &unk_1E315BBD0;
          v41[4] = v28;
          v30 = (void *)objc_msgSend(v28, "copyWithIdentifiers:block:", v29, v41);

          objc_msgSend(v22, "addObject:", v30);
          ++v27;
        }
        while (v24 != v27);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v24);
    }

    v32 = objc_msgSend(v22, "copy");
    v21 = v39;
    playlistEntries = v39->_playlistEntries;
    v39->_playlistEntries = (NSArray *)v32;

    v5 = v38;
    v16 = v37;
    v19 = v36;
  }

  return v21;
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
  objc_storeStrong((id *)&self->_playlistEntries, 0);
}

void __77__MPModelLibraryPlaylistEditPlaylistEntryDataSource_initWithPlaylistEntries___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier")))
  {
    objc_msgSend(v11, "universalIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E3163D10;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier")))
  {
    objc_msgSend(v11, "positionUniversalIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E3163D10;
  }
  if (!-[__CFString length](v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUniversalIdentifier:", v7);

  }
  if (!-[__CFString length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPositionUniversalIdentifier:", v10);

  }
}

@end
