@implementation MusicKit_RemoteLibraryPlaybackQueue

- (MusicKit_RemoteLibraryPlaybackQueue)initWithRequest:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5
{
  id v8;
  MusicKit_RemoteLibraryPlaybackQueue *v9;
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  MPModelLibraryRequest *v15;
  void *libraryRequest;
  void *v17;
  char v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id MPMediaPropertyPredicateClass;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  char v47;
  id v48;
  void *v49;
  id *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  char v57;
  void *v58;
  id v59;
  void *v60;
  char v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  id v68;
  void *v69;
  uint64_t v70;
  MPMediaQuery *mediaQuery;
  uint64_t v72;
  MPModelObject *underlyingStartObject;
  id obj;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v8 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  v9 = -[MusicKit_RemotePlaybackQueue initWithReplaceQueueIntent:](&v82, sel_initWithReplaceQueueIntent_, a5);
  if (!v9)
    goto LABEL_51;
  v10 = v77;
  if ((objc_msgSend(v10, "filteringOptions") & 2) != 0)
  {
    v15 = (MPModelLibraryRequest *)v10;
    libraryRequest = v9->_libraryRequest;
    v9->_libraryRequest = v15;
    goto LABEL_48;
  }
  v11 = objc_alloc_init((Class)getMPMediaQueryClass());
  objc_msgSend(v11, "setGroupingType:", 0);
  objc_msgSend(v10, "sectionKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelAlbumKindClass();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(getMPMediaQueryClass(), "albumsQuery");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    libraryRequest = (void *)v14;

    goto LABEL_10;
  }
  objc_msgSend(v10, "sectionKind");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelPlaylistKindClass();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(getMPMediaQueryClass(), "playlistsQuery");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  libraryRequest = v11;
LABEL_10:
  objc_msgSend(v10, "allowedSectionIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count") == 0;

  if (v20)
  {
    objc_msgSend(v10, "scopedContainers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count") == 0;

    if (!v30)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      objc_msgSend(v10, "scopedContainers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
      if (v31)
      {
        v76 = *(_QWORD *)v79;
LABEL_16:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v79 != v76)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v32), "identifiers");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "library");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "persistentID");

          if (!v35)
            break;
          getMPModelAlbumClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            getMPMediaItemPropertyAlbumPersistentID();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:comparisonType:", v37, v38, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(libraryRequest, "addFilterPredicate:", v39);

          }
          else
          {
            getMPModelPlaylistClass();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v40 = getMPMediaPropertyPredicateClass();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              getMPMediaPlaylistPropertyPersistentID();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "predicateWithValue:forProperty:comparisonType:", v41, v42, 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(libraryRequest, "addFilterPredicate:", v43);

              objc_msgSend(libraryRequest, "setShouldIncludeNonLibraryEntities:", 1);
            }
            else
            {
              v88 = 0;
              v89 = &v88;
              v90 = 0x2050000000;
              v44 = (void *)getMPModelArtistClass_softClass;
              v91 = getMPModelArtistClass_softClass;
              if (!getMPModelArtistClass_softClass)
              {
                v83 = MEMORY[0x1E0C809B0];
                v84 = 3221225472;
                v85 = (uint64_t)__getMPModelArtistClass_block_invoke;
                v86 = &unk_1E9C05688;
                v87 = &v88;
                __getMPModelArtistClass_block_invoke((uint64_t)&v83);
                v44 = (void *)v89[3];
              }
              v45 = objc_retainAutorelease(v44);
              _Block_object_dispose(&v88, 8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v10, "sectionKind"),
                    v46 = (void *)objc_claimAutoreleasedReturnValue(),
                    getMPModelAlbumKindClass(),
                    objc_opt_class(),
                    v47 = objc_opt_isKindOfClass(),
                    v46,
                    (v47 & 1) != 0))
              {
                v48 = getMPMediaPropertyPredicateClass();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = 0;
                v84 = (uint64_t)&v83;
                v85 = 0x2020000000;
                v50 = (id *)getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr;
                v86 = (void *)getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr;
                if (!getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr)
                {
                  v51 = (void *)MediaPlayerLibrary_14();
                  v50 = (id *)dlsym(v51, "MPMediaItemPropertyAlbumArtistPersistentID");
                  *(_QWORD *)(v84 + 24) = v50;
                  getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr = (uint64_t)v50;
                }
                _Block_object_dispose(&v83, 8);
                if (!v50)
                  getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
                v52 = *v50;
                objc_msgSend(v48, "predicateWithValue:forProperty:comparisonType:", v49, v52, 0);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(libraryRequest, "addFilterPredicate:", v53);

              }
              else
              {
                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v54 = (void *)getMPModelComposerClass_softClass;
                v91 = getMPModelComposerClass_softClass;
                if (!getMPModelComposerClass_softClass)
                {
                  v83 = MEMORY[0x1E0C809B0];
                  v84 = 3221225472;
                  v85 = (uint64_t)__getMPModelComposerClass_block_invoke;
                  v86 = &unk_1E9C05688;
                  v87 = &v88;
                  __getMPModelComposerClass_block_invoke((uint64_t)&v83);
                  v54 = (void *)v89[3];
                }
                v55 = objc_retainAutorelease(v54);
                _Block_object_dispose(&v88, 8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v10, "sectionKind");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  getMPModelAlbumKindClass();
                  objc_opt_class();
                  v57 = objc_opt_isKindOfClass();

                  if ((v57 & 1) != 0)
                    goto LABEL_40;
                }
                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v58 = (void *)getMPModelGenreClass_softClass;
                v91 = getMPModelGenreClass_softClass;
                if (!getMPModelGenreClass_softClass)
                {
                  v83 = MEMORY[0x1E0C809B0];
                  v84 = 3221225472;
                  v85 = (uint64_t)__getMPModelGenreClass_block_invoke;
                  v86 = &unk_1E9C05688;
                  v87 = &v88;
                  __getMPModelGenreClass_block_invoke((uint64_t)&v83);
                  v58 = (void *)v89[3];
                }
                v59 = objc_retainAutorelease(v58);
                _Block_object_dispose(&v88, 8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v10, "sectionKind");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  getMPModelAlbumKindClass();
                  objc_opt_class();
                  v61 = objc_opt_isKindOfClass();

                  if ((v61 & 1) != 0)
                  {
LABEL_40:
                    v62 = getMPMediaPropertyPredicateClass();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    getMPMediaItemPropertyComposerPersistentID();
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "predicateWithValue:forProperty:comparisonType:", v63, v64, 0);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(libraryRequest, "addFilterPredicate:", v65);

                  }
                }
              }
            }
          }
          if (v31 == ++v32)
          {
            v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
            if (v31)
              goto LABEL_16;
            goto LABEL_47;
          }
        }
      }
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(v10, "allowedSectionIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v22, "library");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "persistentID");

    objc_msgSend(v10, "sectionKind");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelAlbumKindClass();
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
    {
      v26 = getMPMediaPropertyPredicateClass();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
      obj = (id)objc_claimAutoreleasedReturnValue();
      getMPMediaItemPropertyAlbumPersistentID();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "predicateWithValue:forProperty:comparisonType:", obj, v27, 0);
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_46:
      v69 = (void *)v28;
      objc_msgSend(libraryRequest, "addFilterPredicate:", v28);

LABEL_47:
      objc_storeStrong((id *)&v9->_mediaQuery, libraryRequest);
      goto LABEL_48;
    }
    objc_msgSend(v10, "sectionKind");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelPlaylistKindClass();
    objc_opt_class();
    v67 = objc_opt_isKindOfClass();

    if ((v67 & 1) != 0)
    {
      v68 = getMPMediaPropertyPredicateClass();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
      obj = (id)objc_claimAutoreleasedReturnValue();
      getMPMediaPlaylistPropertyPersistentID();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "predicateWithValue:forProperty:comparisonType:", obj, v27, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
  }
LABEL_48:

  if (!v9->_mediaQuery)
  {
    objc_msgSend(getMPMediaQueryClass(), "songsQuery");
    v70 = objc_claimAutoreleasedReturnValue();
    mediaQuery = v9->_mediaQuery;
    v9->_mediaQuery = (MPMediaQuery *)v70;

  }
  objc_msgSend(v8, "_underlyingModelObject");
  v72 = objc_claimAutoreleasedReturnValue();
  underlyingStartObject = v9->_underlyingStartObject;
  v9->_underlyingStartObject = (MPModelObject *)v72;

LABEL_51:
  return v9;
}

- (MusicKit_RemoteLibraryPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4
{
  id v6;
  MusicKit_RemoteLibraryPlaybackQueue *v7;
  uint64_t v8;
  MPMediaQuery *mediaQuery;
  uint64_t v10;
  MPModelObject *underlyingStartObject;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  v7 = -[MusicKit_RemotePlaybackQueue initWithReplaceQueueIntent:](&v13, sel_initWithReplaceQueueIntent_, a4);
  if (v7)
  {
    objc_msgSend(getMPMediaQueryClass(), "songsQuery");
    v8 = objc_claimAutoreleasedReturnValue();
    mediaQuery = v7->_mediaQuery;
    v7->_mediaQuery = (MPMediaQuery *)v8;

    objc_msgSend(v6, "_underlyingModelObject");
    v10 = objc_claimAutoreleasedReturnValue();
    underlyingStartObject = v7->_underlyingStartObject;
    v7->_underlyingStartObject = (MPModelObject *)v10;

  }
  return v7;
}

- (MusicKit_RemoteLibraryPlaybackQueue)initWithContainer:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5
{
  id v8;
  id v9;
  MusicKit_RemoteLibraryPlaybackQueue *v10;
  void *v11;
  id v12;
  id MPMediaPropertyPredicateClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  MPMediaQuery *v22;
  MPMediaQuery *mediaQuery;
  uint64_t v24;
  uint64_t v25;
  MPModelObject *underlyingStartObject;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  v10 = -[MusicKit_RemotePlaybackQueue initWithReplaceQueueIntent:](&v28, sel_initWithReplaceQueueIntent_, a5);
  if (v10)
  {
    objc_msgSend(v8, "_underlyingModelObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init((Class)getMPMediaQueryClass());
    objc_msgSend(v12, "setGroupingType:", 0);
    getMPModelAlbumClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "library");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      getMPMediaItemPropertyAlbumPersistentID();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getMPModelPlaylistClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(getMPMediaQueryClass(), "songsQuery");
        v24 = objc_claimAutoreleasedReturnValue();
        mediaQuery = v10->_mediaQuery;
        v10->_mediaQuery = (MPMediaQuery *)v24;
        goto LABEL_8;
      }
      MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "library");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      getMPMediaPlaylistPropertyPersistentID();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v18;
    objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:comparisonType:", v17, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addFilterPredicate:", v21);

    v22 = (MPMediaQuery *)v12;
    mediaQuery = v10->_mediaQuery;
    v10->_mediaQuery = v22;
LABEL_8:

    objc_msgSend(v9, "_underlyingModelObject");
    v25 = objc_claimAutoreleasedReturnValue();
    underlyingStartObject = v10->_underlyingStartObject;
    v10->_underlyingStartObject = (MPModelObject *)v25;

  }
  return v10;
}

- (void)setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPModelLibraryRequest *libraryRequest;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  int64_t v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  libraryRequest = self->_libraryRequest;
  if (libraryRequest)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__MusicKit_RemoteLibraryPlaybackQueue_setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke;
    v14[3] = &unk_1E9C05FF8;
    v14[4] = self;
    v15 = v10;
    v18 = a4;
    v16 = v11;
    v17 = v12;
    -[MusicKit_RemoteLibraryPlaybackQueue _resolveMediaQueryForLibraryRequest:completionHandler:](self, "_resolveMediaQueryForLibraryRequest:completionHandler:", libraryRequest, v14);

  }
  else
  {
    -[MusicKit_RemoteLibraryPlaybackQueue _setQueueWithPath:shuffleMode:sessionID:completionHandler:](self, "_setQueueWithPath:shuffleMode:sessionID:completionHandler:", v10, a4, v11, v12);
  }

}

- (void)_setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *ExternalRepresentation;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = MRSystemAppPlaybackQueueCreate();
  -[MPMediaQuery protobufferEncodableObject](self->_mediaQuery, "protobufferEncodableObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  MRSystemAppPlaybackQueueSetLocalQueryData();

  v14 = -[MusicKit_RemoteLibraryPlaybackQueue _persistentIDForStartItem](self, "_persistentIDForStartItem");
  if (v14)
  {
    v15 = v14;
    objc_msgSend(getMPMediaLibraryClass_0(), "defaultMediaLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "multiverseIdentifierForTrackWithPersistentID:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "data");
    MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData();

  }
  MRSystemAppPlaybackQueueSetLocalQueryShuffleMode();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v18 = (void *)getMPRemotePlaybackQueueClass_softClass_0;
  v34 = getMPRemotePlaybackQueueClass_softClass_0;
  if (!getMPRemotePlaybackQueueClass_softClass_0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __getMPRemotePlaybackQueueClass_block_invoke_0;
    v30[3] = &unk_1E9C05688;
    v30[4] = &v31;
    __getMPRemotePlaybackQueueClass_block_invoke_0((uint64_t)v30);
    v18 = (void *)v32[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(v19, "queueWithMediaRemotePlaybackQueue:", v12);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "_mediaRemotePlaybackQueue");
  -[MusicKit_RemotePlaybackQueue convertReplaceQueueIntentToMRIntent:](self, "convertReplaceQueueIntentToMRIntent:", -[MusicKit_RemotePlaybackQueue replaceQueueIntent](self, "replaceQueueIntent"));
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  v22 = v10;
  v23 = v22;
  if (!v22)
  {
    +[MusicKit_PlayerPathSessionManager sharedSessionManager](MusicKit_PlayerPathSessionManager, "sharedSessionManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sessionIDForPlayerPath:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = *MEMORY[0x1E0D4CB98];
  v35[0] = *MEMORY[0x1E0D4CBD8];
  v35[1] = v25;
  v36[0] = v23;
  v36[1] = MEMORY[0x1E0C9AAB0];
  v35[2] = *MEMORY[0x1E0D4CD20];
  v36[2] = ExternalRepresentation;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mrPlayerPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  v28 = v11;
  MRMediaRemoteSendCommandToPlayerWithResult();

}

- (void)insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPModelLibraryRequest *libraryRequest;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  int64_t v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  libraryRequest = self->_libraryRequest;
  if (libraryRequest)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__MusicKit_RemoteLibraryPlaybackQueue_insertQueueWithPath_position_sessionID_completionHandler___block_invoke;
    v14[3] = &unk_1E9C05FF8;
    v14[4] = self;
    v15 = v10;
    v18 = a4;
    v16 = v11;
    v17 = v12;
    -[MusicKit_RemoteLibraryPlaybackQueue _resolveMediaQueryForLibraryRequest:completionHandler:](self, "_resolveMediaQueryForLibraryRequest:completionHandler:", libraryRequest, v14);

  }
  else
  {
    -[MusicKit_RemoteLibraryPlaybackQueue _insertQueueWithPath:position:sessionID:completionHandler:](self, "_insertQueueWithPath:position:sessionID:completionHandler:", v10, a4, v11, v12);
  }

}

- (void)_insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10;
  int64_t v11;
  int64_t v12;
  id MPMediaPropertyPredicateClass;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *ExternalRepresentation;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  MPMediaQuery *mediaQuery;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v10 = a5;
  v32 = a6;
  MRSystemAppPlaybackQueueCreate();
  v11 = -[MusicKit_RemoteLibraryPlaybackQueue _persistentIDForStartItem](self, "_persistentIDForStartItem");
  if (v11)
  {
    v12 = v11;
    mediaQuery = self->_mediaQuery;
    MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v15 = (id *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    v37 = getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
    {
      v16 = (void *)MediaPlayerLibrary_14();
      v15 = (id *)dlsym(v16, "MPMediaItemPropertyPersistentID");
      v35[3] = (uint64_t)v15;
      getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v34, 8);
    if (!v15)
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    v17 = *v15;
    objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:comparisonType:", v14, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaQuery addFilterPredicate:](mediaQuery, "addFilterPredicate:", v18);

  }
  -[MPMediaQuery protobufferEncodableObject](self->_mediaQuery, "protobufferEncodableObject", mediaQuery);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "data");
  MRSystemAppPlaybackQueueSetLocalQueryData();

  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  v21 = v10;
  v22 = v21;
  if (!v21)
  {
    +[MusicKit_PlayerPathSessionManager sharedSessionManager](MusicKit_PlayerPathSessionManager, "sharedSessionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sessionIDForPlayerPath:", v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a4 == 2)
    v24 = 1;
  else
    v24 = 2 * (a4 == 1);
  v25 = *MEMORY[0x1E0D4CBD8];
  v39[0] = v22;
  v26 = *MEMORY[0x1E0D4CC38];
  v38[0] = v25;
  v38[1] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v27;
  v38[2] = *MEMORY[0x1E0D4CD20];
  v39[2] = ExternalRepresentation;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "mrPlayerPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v32;
  MRMediaRemoteSendCommandToPlayerWithResult();

}

- (void)_resolveMediaQueryForLibraryRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke;
  v7[3] = &unk_1E9C05978;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "performWithResponseHandler:", v7);

}

- (int64_t)_persistentIDForStartItem
{
  MPModelObject *underlyingStartObject;
  void *v4;
  void *v5;
  int64_t v6;
  MPModelObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  underlyingStartObject = self->_underlyingStartObject;
  if (!underlyingStartObject)
    return 0;
  -[MPModelObject identifiers](underlyingStartObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  getMPModelPlaylistEntryClass_0();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = self->_underlyingStartObject;
    -[MPModelObject song](v7, "song");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MPModelObject song](v7, "song");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MPModelObject tvEpisode](v7, "tvEpisode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[MPModelObject tvEpisode](v7, "tvEpisode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MPModelObject movie](v7, "movie");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_11:

          return v6;
        }
        -[MPModelObject movie](v7, "movie");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v12 = v9;
    objc_msgSend(v9, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "library");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v14, "persistentID");

    goto LABEL_11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStartObject, 0);
  objc_storeStrong((id *)&self->_mediaQuery, 0);
  objc_storeStrong((id *)&self->_libraryRequest, 0);
}

@end
