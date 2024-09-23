@implementation MusicKit_SoftLinking_MPModelLibrarySearchScope

- (id)_initWithUnderlyingSearchScope:(id)a3 modelObjectType:(int64_t)a4
{
  id v7;
  MusicKit_SoftLinking_MPModelLibrarySearchScope *v8;
  MusicKit_SoftLinking_MPModelLibrarySearchScope *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelLibrarySearchScope;
  v8 = -[MusicKit_SoftLinking_MPModelLibrarySearchScope init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_underlyingSearchScope, a3);
    v9->_modelObjectType = a4;
  }

  return v9;
}

- (MusicKit_SoftLinking_MPModelLibrarySearchScope)initWithModelObjectType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  MusicKit_SoftLinking_MPModelLibrarySearchScope *v8;

  +[MusicKit_SoftLinking_MPModelRequest _supportedPropertiesForModelObjectType:](MusicKit_SoftLinking_MPModelRequest, "_supportedPropertiesForModelObjectType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)getMPModelLibrarySearchScopeClass()), "initWithItemKind:name:properties:", v6, 0, v5);
  v8 = -[MusicKit_SoftLinking_MPModelLibrarySearchScope _initWithUnderlyingSearchScope:modelObjectType:](self, "_initWithUnderlyingSearchScope:modelObjectType:", v7, a3);

  return v8;
}

+ (id)scopeForTopResultsWithSpecificModelObjectTypeScopes:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(a1, "_topResultsRelationshipKeyForSpecificModelObjectType:", objc_msgSend(v11, "_modelObjectType", (_QWORD)v28));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "_underlyingSearchScope");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "itemKind");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);

          objc_msgSend(v13, "itemProperties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v12);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v8);
  }

  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v16 = (void *)getMPModelGenericObjectClass_softClass;
  v40 = getMPModelGenericObjectClass_softClass;
  if (!getMPModelGenericObjectClass_softClass)
  {
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __getMPModelGenericObjectClass_block_invoke;
    v35 = &unk_24CD1CC68;
    v36 = &v37;
    __getMPModelGenericObjectClass_block_invoke((uint64_t)&v32);
    v16 = (void *)v38[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v37, 8);
  v18 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v17, "kindWithRelationshipKinds:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v20 = (void *)getMPPropertySetClass_softClass;
  v40 = getMPPropertySetClass_softClass;
  if (!getMPPropertySetClass_softClass)
  {
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __getMPPropertySetClass_block_invoke;
    v35 = &unk_24CD1CC68;
    v36 = &v37;
    __getMPPropertySetClass_block_invoke((uint64_t)&v32);
    v20 = (void *)v38[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v37, 8);
  v22 = [v21 alloc];
  v23 = (void *)objc_msgSend(v6, "copy");
  v24 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v23);

  v25 = (void *)objc_msgSend(objc_alloc((Class)getMPModelLibrarySearchScopeClass()), "initWithItemKind:name:properties:", v19, 0, v24);
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUnderlyingSearchScope:modelObjectType:", v25, 11);

  return v26;
}

- (id)_underlyingSearchScope
{
  return self->_underlyingSearchScope;
}

- (int64_t)_modelObjectType
{
  return self->_modelObjectType;
}

+ (id)_topResultsRelationshipKeyForSpecificModelObjectType:(int64_t)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 0;
  if (a3 <= 14)
  {
    if (a3 > 12)
    {
      if (a3 == 13)
        goto LABEL_30;
      goto LABEL_21;
    }
    if (!a3)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v4 = (id *)getMPModelRelationshipGenericAlbumSymbolLoc_ptr;
      v15 = getMPModelRelationshipGenericAlbumSymbolLoc_ptr;
      if (!getMPModelRelationshipGenericAlbumSymbolLoc_ptr)
      {
        v7 = (void *)MediaPlayerLibrary();
        v4 = (id *)dlsym(v7, "MPModelRelationshipGenericAlbum");
        v13[3] = (uint64_t)v4;
        getMPModelRelationshipGenericAlbumSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v12, 8);
      if (v4)
        goto LABEL_33;
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
      goto LABEL_26;
    }
    if (a3 != 2)
      return v3;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (id *)getMPModelRelationshipGenericArtistSymbolLoc_ptr;
    v15 = getMPModelRelationshipGenericArtistSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericArtistSymbolLoc_ptr)
    {
      v5 = (void *)MediaPlayerLibrary();
      v4 = (id *)dlsym(v5, "MPModelRelationshipGenericArtist");
      v13[3] = (uint64_t)v4;
      getMPModelRelationshipGenericArtistSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v12, 8);
    if (v4)
      goto LABEL_33;
    v3 = (id)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
  }
  if (a3 <= 29)
  {
    if (a3 != 15)
    {
      if (a3 != 26)
        return v3;
      goto LABEL_21;
    }
LABEL_26:
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (id *)getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
    v15 = getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericPlaylistSymbolLoc_ptr)
    {
      v8 = (void *)MediaPlayerLibrary();
      v4 = (id *)dlsym(v8, "MPModelRelationshipGenericPlaylist");
      v13[3] = (uint64_t)v4;
      getMPModelRelationshipGenericPlaylistSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v12, 8);
    if (v4)
      goto LABEL_33;
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
LABEL_30:
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (id *)getMPModelRelationshipGenericMovieSymbolLoc_ptr;
    v15 = getMPModelRelationshipGenericMovieSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericMovieSymbolLoc_ptr)
    {
      v9 = (void *)MediaPlayerLibrary();
      v4 = (id *)dlsym(v9, "MPModelRelationshipGenericMovie");
      v13[3] = (uint64_t)v4;
      getMPModelRelationshipGenericMovieSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v12, 8);
    if (!v4)
    {
      v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
      _Block_object_dispose(&v12, 8);
      _Unwind_Resume(v11);
    }
LABEL_33:
    v3 = *v4;
    return v3;
  }
  if (a3 == 30)
  {
LABEL_21:
    getMPModelRelationshipGenericSong();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 == 31)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (id *)getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr;
    v15 = getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr;
    if (!getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr)
    {
      v6 = (void *)MediaPlayerLibrary();
      v4 = (id *)dlsym(v6, "MPModelRelationshipGenericTVEpisode");
      v13[3] = (uint64_t)v4;
      getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v12, 8);
    if (v4)
      goto LABEL_33;
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    goto LABEL_21;
  }
  return v3;
}

- (int64_t)modelObjectType
{
  return self->_modelObjectType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSearchScope, 0);
}

+ (uint64_t)_topResultsRelationshipKeyForSpecificModelObjectType:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getMPModelLibrarySearchScopeClass_block_invoke_cold_1(v0);
}

@end
