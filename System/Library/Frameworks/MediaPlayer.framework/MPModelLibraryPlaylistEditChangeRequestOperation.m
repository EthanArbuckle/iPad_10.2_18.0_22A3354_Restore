@implementation MPModelLibraryPlaylistEditChangeRequestOperation

+ (id)requiredPlaylistEntryProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  MPPropertySet *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v7 = CFSTR("MPModelRelationshipPlaylistEntrySong");
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v4);

  return v5;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  char v34;
  char v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  MPModelLibraryPlaylistEditChangeRequestOperation *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryPlaylistEditChangeRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "shouldCreatePlaylist");
  if (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsCollaborative")))
    v7 = objc_msgSend(v4, "isCollaborative");
  else
    v7 = 0;
  objc_msgSend(v3, "coverArtworkRecipe");
  v8 = objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__28901;
  v23[4] = __Block_byref_object_dispose__28902;
  v24 = 0;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v39 = self;
    v40 = 2114;
    v41 = v4;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting operation with playlist %{public}@", buf, 0x16u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke;
  v37[3] = &unk_1E315AF50;
  v37[4] = self;
  v11 = MEMORY[0x19403A810](v37);
  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3;
  v36[3] = &unk_1E315AF50;
  v36[4] = self;
  v22 = (void *)MEMORY[0x19403A810](v36);
  v20 = (void *)v11;
  v21 = (void *)v8;
  -[MPModelLibraryPlaylistEditChangeRequestOperation _updatedPlaylistProperties](self, "_updatedPlaylistProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_5;
  v25[3] = &unk_1E315B038;
  v34 = v6;
  v25[4] = self;
  v26 = v12;
  v19 = v3;
  v27 = v19;
  v13 = v5;
  v28 = v13;
  v33 = v23;
  v14 = v4;
  v29 = v14;
  v15 = v20;
  v31 = v15;
  v16 = v22;
  v32 = v16;
  v17 = v21;
  v30 = v17;
  v35 = v7;
  v18 = v12;
  -[MPModelLibraryPlaylistEditChangeRequestOperation _loadUpdatedTrackListWithCompletion:](self, "_loadUpdatedTrackListWithCompletion:", v25, v3);

  _Block_object_dispose(v23, 8);
}

- (BOOL)_isCloudLibraryEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudLibraryEnabled");

  return v4;
}

- (id)_updatedPlaylistProperties
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MPModelLibraryPlaylistEditChangeRequestOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldCreatePlaylist");
  objc_msgSend(v4, "playlistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("name"));
  LODWORD(v25) = v5;
  objc_msgSend(v4, "parentPlaylist", v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("parentPersistentID"));
  }
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("name"));
  objc_msgSend(v4, "playlistDescription");
  v11 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v11;
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("descriptionInfo"));
  objc_msgSend(v4, "isPublicPlaylist");
  v12 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v12;
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cloudIsPublic"));
  objc_msgSend(v4, "isVisiblePlaylist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cloudIsVisible"));
  objc_msgSend(v4, "isCuratorPlaylist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cloudIsCuratorPlaylist"));
  objc_msgSend(v4, "isOwner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("iO"));
  objc_msgSend(v4, "authorStoreIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "integerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cloudAuthorStoreID"));

  }
  objc_msgSend(v4, "coverArtworkRecipe");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playlistEntries");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if ((v26 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("dateCreated"));
LABEL_27:

    goto LABEL_28;
  }
  if (v6 || v28 || v20 || v19 || objc_msgSend(v4, "didSetPlaylistUserImage"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("dateModified"));
    goto LABEL_27;
  }
LABEL_28:
  objc_msgSend(v4, "playlistUserImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

    v19 = CFSTR("{\"version\":\"0.0\"}");
LABEL_31:
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("coverArtworkRecipe"));
    goto LABEL_32;
  }
  if (v19)
    goto LABEL_31;
LABEL_32:

  return v3;
}

- (void)_loadUpdatedTrackListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  mlcore *v14;
  char *v15;
  mlcore *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  char *v23;
  mlcore *v24;
  uint64_t v25;
  _QWORD *v26;
  MPMediaLibraryView *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char *v41;
  std::__shared_weak_count *v42;
  void *__p;
  void *v44;
  _QWORD *v45;
  __int128 v46;
  char *v47;
  std::__shared_weak_count *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[4];
  id v56;
  _QWORD *v57;
  uint64_t *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  __n128 (*v63)(__n128 *, __n128 *);
  void (*v64)(uint64_t);
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  _QWORD v69[6];
  void *v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[5];
  id v74;
  __int128 v75;

  v4 = a3;
  -[MPModelLibraryPlaylistEditChangeRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playlistEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaLibrary");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    v37 = (void *)v7;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = __Block_byref_object_copy__28901;
    v73[4] = __Block_byref_object_dispose__28902;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "totalItemCount"));
    v74 = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x4812000000;
    v69[3] = __Block_byref_object_copy__42;
    v69[4] = __Block_byref_object_dispose__43;
    v69[5] = &unk_193F4554F;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x4812000000;
    v63 = __Block_byref_object_copy__44;
    v64 = __Block_byref_object_dispose__45;
    v65 = &unk_193F4554F;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke;
    v55[3] = &unk_1E315B090;
    v56 = v6;
    v57 = v69;
    v58 = &v60;
    v59 = v73;
    objc_msgSend(v56, "enumerateItemIdentifiersUsingBlock:", v55);
    v49[0] = v9;
    v49[1] = 3221225472;
    v49[2] = __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_2;
    v49[3] = &unk_1E315B0B8;
    v53 = v69;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v50 = v10;
    v11 = v36;
    v51 = v11;
    v52 = v4;
    v54 = v73;
    v12 = MEMORY[0x19403A810](v49);
    v13 = (void *)v12;
    if (v61[7] == v61[6])
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
    else
    {
      v14 = (mlcore *)MEMORY[0x194038ED8]();
      mlcore::PlaylistItemPropertyPersistentID(v14);
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v46);
      v15 = (char *)operator new(0x80uLL);
      *(_OWORD *)(v15 + 8) = 0u;
      *(_QWORD *)v15 = &off_1E314A800;
      v75 = v46;
      v46 = 0u;
      v16 = (mlcore *)MEMORY[0x194038F80](v15 + 24, v14, &v75);
      v17 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
      if (*((_QWORD *)&v75 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v47 = v15 + 24;
      v48 = (std::__shared_weak_count *)v15;
      v20 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
      if (*((_QWORD *)&v46 + 1))
      {
        v21 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      v23 = v47;
      v24 = (mlcore *)mlcore::PlaylistItemPropertyPersistentID(v16);
      v25 = mlcore::PlaylistItemPropertyItemPersistentID(v24);
      v26 = operator new(0x10uLL);
      v44 = v26 + 2;
      v45 = v26 + 2;
      *v26 = v24;
      v26[1] = v25;
      __p = v26;
      mlcore::PropertiesQuery::setPropertiesToFetch();
      if (__p)
      {
        v44 = __p;
        operator delete(__p);
      }
      v27 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", v37, 0x10000);
      v41 = v23;
      v42 = v48;
      if (v48)
      {
        p_shared_owners = (unint64_t *)&v48->__shared_owners_;
        do
          v29 = __ldxr(p_shared_owners);
        while (__stxr(v29 + 1, p_shared_owners));
      }
      v38[0] = v9;
      v38[1] = 3221225472;
      v38[2] = __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_3;
      v38[3] = &unk_1E315B0E0;
      v39 = v10;
      v40 = v13;
      -[MPMediaLibraryView performCoreQuery:withCompletion:](v27, "performCoreQuery:withCompletion:", &v41, v38);
      v30 = v42;
      if (v42)
      {
        v31 = (unint64_t *)&v42->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }

      v33 = v48;
      if (v48)
      {
        v34 = (unint64_t *)&v48->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
    }

    _Block_object_dispose(&v60, 8);
    if (v66)
    {
      v67 = v66;
      operator delete(v66);
    }
    _Block_object_dispose(v69, 8);
    v8 = v37;
    if (v70)
    {
      v71 = v70;
      operator delete(v70);
    }

    _Block_object_dispose(v73, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (id)_collaborationTrackEdits
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  MPModelLibraryPlaylistEditChangeRequestOperation *v22;
  id v23;
  SEL v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  MPModelLibraryPlaylistEditChangeRequestOperation *v29;
  id v30;
  SEL v31;
  _QWORD v32[4];
  id v33;
  MPModelLibraryPlaylistEditChangeRequestOperation *v34;
  id v35;
  SEL v36;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditChangeRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackListChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "hasChanges"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playlistEntries", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "insertedIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke;
    v32[3] = &unk_1E315B108;
    v12 = v19;
    v36 = a2;
    v33 = v12;
    v34 = self;
    v13 = v8;
    v35 = v13;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v32);

    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_2;
    v27[3] = &unk_1E315B130;
    v14 = v12;
    v31 = a2;
    v28 = v14;
    v29 = self;
    v15 = v13;
    v30 = v15;
    objc_msgSend(v7, "enumerateMovesUsingBlock:", v27);
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_4;
    v25[3] = &unk_1E315B198;
    v16 = v4;
    v26 = v16;
    objc_msgSend(v15, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_59_28887, v25);
    objc_msgSend(v7, "deletedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_5;
    v20[3] = &unk_1E315B108;
    v24 = a2;
    v21 = v5;
    v22 = self;
    v23 = v16;
    objc_msgSend(v17, "enumerateIndexesUsingBlock:", v20);

  }
  return v4;
}

- (MPModelLibraryPlaylistEditChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)localPersistenceResponseHandler
{
  return self->_localPersistenceResponseHandler;
}

- (void)setLocalPersistenceResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)completeResponseHandler
{
  return self->_completeResponseHandler;
}

- (void)setCompleteResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completeResponseHandler, 0);
  objc_storeStrong(&self->_localPersistenceResponseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "song");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPModelLibraryPlaylistEditChangeRequestOperation.mm"), 388, CFSTR("No playlist entry at index %lu"), a2);

  }
  objc_msgSend(v5, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "subscriptionAdamID");

  if (!v7)
  {
    objc_msgSend(v5, "universalStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "adamID");

  }
  objc_msgSend(v18, "universalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "positionUniversalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DDBF18];
    objc_msgSend(v11, "positionUniversalIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paramsForAddingTrackWithAdamID:itemUUID:itemPositionUUID:afterReferencePositionUUD:", v7, v9, v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForAddingTrackWithAdamID:itemUUID:itemPositionUUID:atPosition:", v7, v9, v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v14, v16);

}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPModelLibraryPlaylistEditChangeRequestOperation.mm"), 411, CFSTR("No playlist entry at index %lu"), a3);

    v5 = 0;
  }
  objc_msgSend(v5, "universalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "positionUniversalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DDBF18];
    objc_msgSend(v8, "positionUniversalIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paramsForMovingTrackWithItemUUID:withNewItemPositionUUID:afterReferencePositionUUD:", v6, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForMovingTrackWithItemUUID:withNewItemPositionUUID:toPosition:", v6, v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v13);

}

uint64_t __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "deletedEntryUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPModelLibraryPlaylistEditChangeRequestOperation.mm"), 436, CFSTR("No uuid for deleted entry at position %lu"), a2);

  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DDBF18], "paramsForRemovingTrackWithItemUUID:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

uint64_t __76__MPModelLibraryPlaylistEditChangeRequestOperation__collaborationTrackEdits__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;

  v58 = a2;
  v5 = a3;
  objc_msgSend(v5, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "persistentID");

  if (v7)
  {
    v8 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v10 = (char *)v8[7];
    v9 = v8[8];
    if ((unint64_t)v10 >= v9)
    {
      v21 = (char *)v8[6];
      v22 = (v10 - v21) >> 4;
      v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v24 = v9 - (_QWORD)v21;
      if (v24 >> 3 > v23)
        v23 = v24 >> 3;
      v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0;
      v26 = 0xFFFFFFFFFFFFFFFLL;
      if (!v25)
        v26 = v23;
      if (v26)
      {
        v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v26);
        v21 = (char *)v8[6];
        v10 = (char *)v8[7];
      }
      else
      {
        v27 = 0;
      }
      v28 = v26 + 16 * v22;
      v29 = v26 + 16 * v27;
      *(_BYTE *)v28 = 0;
      *(_QWORD *)(v28 + 8) = v7;
      v11 = (_QWORD *)(v28 + 16);
      if (v10 != v21)
      {
        do
        {
          *(_OWORD *)(v28 - 16) = *((_OWORD *)v10 - 1);
          v28 -= 16;
          v10 -= 16;
        }
        while (v10 != v21);
        v21 = (char *)v8[6];
      }
      v8[6] = v28;
      v8[7] = v11;
      v8[8] = v29;
      if (v21)
        operator delete(v21);
    }
    else
    {
      *v10 = 0;
      *((_QWORD *)v10 + 1) = v7;
      v11 = v10 + 16;
    }
    v8[7] = v11;
    v30 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v32 = (uint64_t *)v30[7];
    v31 = v30[8];
    if ((unint64_t)v32 >= v31)
    {
      v34 = (uint64_t *)v30[6];
      v35 = v32 - v34;
      v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v37 = v31 - (_QWORD)v34;
      if (v37 >> 2 > v36)
        v36 = v37 >> 2;
      v25 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8;
      v38 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v25)
        v38 = v36;
      if (v38)
      {
        v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v38);
        v34 = (uint64_t *)v30[6];
        v32 = (uint64_t *)v30[7];
      }
      else
      {
        v39 = 0;
      }
      v40 = (uint64_t *)(v38 + 8 * v35);
      v41 = v38 + 8 * v39;
      *v40 = v7;
      v33 = v40 + 1;
      while (v32 != v34)
      {
        v42 = *--v32;
        *--v40 = v42;
      }
      v30[6] = v40;
      v30[7] = v33;
      v30[8] = v41;
      if (v34)
        operator delete(v34);
    }
    else
    {
      *v32 = v7;
      v33 = v32 + 1;
    }
    v30[7] = v33;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v58);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "song");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "library");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "persistentID");

    if (v16)
    {
      v17 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v19 = (char *)v17[7];
      v18 = v17[8];
      if ((unint64_t)v19 >= v18)
      {
        v43 = (char *)v17[6];
        v44 = (v19 - v43) >> 4;
        v45 = v44 + 1;
        if ((unint64_t)(v44 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v46 = v18 - (_QWORD)v43;
        if (v46 >> 3 > v45)
          v45 = v46 >> 3;
        v25 = (unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0;
        v47 = 0xFFFFFFFFFFFFFFFLL;
        if (!v25)
          v47 = v45;
        if (v47)
        {
          v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v47);
          v43 = (char *)v17[6];
          v19 = (char *)v17[7];
        }
        else
        {
          v48 = 0;
        }
        v49 = v47 + 16 * v44;
        v50 = v47 + 16 * v48;
        *(_BYTE *)v49 = 1;
        *(_QWORD *)(v49 + 8) = v16;
        v20 = (_QWORD *)(v49 + 16);
        if (v19 != v43)
        {
          do
          {
            *(_OWORD *)(v49 - 16) = *((_OWORD *)v19 - 1);
            v49 -= 16;
            v19 -= 16;
          }
          while (v19 != v43);
          v43 = (char *)v17[6];
        }
        v17[6] = v49;
        v17[7] = v20;
        v17[8] = v50;
        if (v43)
          operator delete(v43);
      }
      else
      {
        *v19 = 1;
        *((_QWORD *)v19 + 1) = v16;
        v20 = v19 + 16;
      }
      v17[7] = v20;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v58);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryUniversalIdentifier")))
  {
    objc_msgSend(v52, "universalIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", v53, CFSTR("entryUniversalIdentifier"));

  }
  if (objc_msgSend(v52, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEntryPositionUniversalIdentifier")))
  {
    objc_msgSend(v52, "positionUniversalIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", v54, CFSTR("entryPositionUniversalIdentifier"));

  }
  v55 = objc_msgSend(v58, "indexAtPosition:", 1);
  v56 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v51, v57);

}

uint64_t __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(_QWORD *)(a1[7] + 8);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(_QWORD *)(v2 + 56);
  if (v3 != v4)
  {
    while (!*(_BYTE *)v3)
    {
      v6 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(v3 + 8));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "longLongValue");

      if (v5)
        goto LABEL_7;
LABEL_8:
      v3 += 16;
      if (v3 == v4)
        return (*(uint64_t (**)(void))(a1[6] + 16))();
    }
    if (*(_BYTE *)v3 != 1)
      goto LABEL_8;
    v5 = *(_QWORD *)(v3 + 8);
    if (!v5)
      goto LABEL_8;
LABEL_7:
    v9 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    goto LABEL_8;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __88__MPModelLibraryPlaylistEditChangeRequestOperation__loadUpdatedTrackListWithCompletion___block_invoke_3(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v13[0] = &off_1E314A0D8;
    v13[1] = a1 + 32;
    v14 = v13;
    mlcore::PropertiesQueryResult::enumerateResults();
    v9 = v14;
    if (v14 == v13)
    {
      v10 = 4;
      v9 = v13;
      goto LABEL_10;
    }
    if (v14)
    {
      v10 = 5;
LABEL_10:
      (*(void (**)(void))(*v9 + 8 * v10))();
    }
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "localPersistenceResponseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2;
    v7[3] = &unk_1E3162560;
    v9 = v5;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completeResponseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4;
    block[3] = &unk_1E3161780;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MPModelPlaylist *v16;
  MPIdentifierSet *v17;
  void *v18;
  MPIdentifierSet *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __CFString *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  id v43;
  __CFString *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  char v51;
  char v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = *(unsigned __int8 *)(a1 + 104);
  v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = objc_msgSend(v5, "count");
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v59 = v24;
      v60 = 2048;
      v61 = v25;
      v62 = 2114;
      v63 = v26;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating existing playlist with %lu tracks and properties: '%{public}@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 64), "identifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "library");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "persistentID");

    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 56), "playlistWithPersistentID:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v30;
      if (v30)
      {
        objc_msgSend(v30, "valueForProperty:", CFSTR("coverArtworkRecipe"));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 40);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_15;
        v53[3] = &unk_1E31637D0;
        v54 = v7;
        objc_msgSend(v15, "setValuesForProperties:trackList:andEntryProperties:withCompletionBlock:", v31, v5, v6, v53);

LABEL_14:
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v33 = *(id *)(a1 + 64);
        v14 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v33;
        goto LABEL_15;
      }
    }
    else
    {
      v15 = 0;
    }
    v23 = &stru_1E3163D10;
    goto LABEL_14;
  }
  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(v5, "count");
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v59 = v11;
    v60 = 2048;
    v61 = v12;
    v62 = 2114;
    v63 = v13;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating new playlist with %lu tracks and properties: '%{public}@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "playlistName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addPlaylistWithName:properties:trackList:playlistEntryProperties:", v14, *(_QWORD *)(a1 + 40), v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = [MPModelPlaylist alloc];
    v17 = [MPIdentifierSet alloc];
    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_9;
    v55[3] = &unk_1E3162A70;
    v56 = *(id *)(a1 + 56);
    v57 = v15;
    v19 = -[MPIdentifierSet initWithSource:modelKind:block:](v17, "initWithSource:modelKind:block:", CFSTR("LibraryPlaylistEdit"), v18, v55);
    v20 = -[MPModelObject initWithIdentifiers:block:](v16, "initWithIdentifiers:block:", v19, &__block_literal_global_28925);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  dispatch_group_leave(v7);
  v23 = &stru_1E3163D10;
LABEL_15:

  dispatch_get_global_queue(33, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_17;
  v40[3] = &unk_1E315B010;
  v35 = *(_QWORD *)(a1 + 32);
  v41 = v15;
  v42 = v35;
  v48 = *(id *)(a1 + 80);
  v49 = *(id *)(a1 + 88);
  v51 = *(_BYTE *)(a1 + 104);
  v43 = *(id *)(a1 + 72);
  v44 = v23;
  v36 = *(id *)(a1 + 48);
  v37 = *(_QWORD *)(a1 + 96);
  v45 = v36;
  v50 = v37;
  v46 = *(id *)(a1 + 40);
  v52 = *(_BYTE *)(a1 + 105);
  v47 = *(id *)(a1 + 64);
  v38 = v23;
  v39 = v15;
  dispatch_group_notify(v7, v34, v40);

}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_10;
  v5[3] = &unk_1E3162B80;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_15(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_17(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[6];
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!*(_BYTE *)(a1 + 112) && *(_QWORD *)(a1 + 48))
    {
      v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v42 = v17;
        v43 = 2114;
        v44 = v18;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating cover artwork recipe: '%{public}@", buf, 0x16u);
      }

      if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *(_QWORD *)(a1 + 56)) & 1) == 0)
      {
        v19 = *(id *)(a1 + 32);
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 48);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_21;
        v38[3] = &unk_1E315AF98;
        v39 = v19;
        v40 = *(id *)(a1 + 64);
        v22 = v19;
        objc_msgSend(v20, "setValue:forProperty:withCompletionBlock:", v21, CFSTR("coverArtworkRecipe"), v38);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 64), "didSetPlaylistUserImage"))
    {
      v2 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 64), "playlistUserImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setUserSelectedArtworkImage:", v3);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    if (!objc_msgSend(*(id *)(a1 + 40), "_isCloudLibraryEnabled"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
      return;
    }
    +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:](MPCloudControllerItemIDList, "cloudItemIDListForPlaylist:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 72), "count") && !v4)
      goto LABEL_23;
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(*(id *)(a1 + 40), "userIdentity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v8 = *(_QWORD *)(a1 + 72);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_24;
      v37[3] = &unk_1E315AFC0;
      v9 = v37;
      v10 = *(id *)(a1 + 96);
      v11 = *(_QWORD *)(a1 + 104);
      v37[4] = v10;
      v37[5] = v11;
      objc_msgSend(v6, "createPlaylistWithPersistentID:properties:trackList:completionHandler:", v7, v8, v4, v37);
    }
    else
    {
      if (*(_BYTE *)(a1 + 113))
      {
        objc_msgSend(*(id *)(a1 + 80), "identifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "library");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "persistentID");

        objc_msgSend(*(id *)(a1 + 40), "userIdentity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 40), "_collaborationTrackEdits");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3_26;
        v35[3] = &unk_1E315AFE8;
        v28 = *(id *)(a1 + 96);
        v29 = *(_QWORD *)(a1 + 104);
        v36[0] = v28;
        v36[1] = v29;
        objc_msgSend(v6, "editCollaborationWithPersistentID:properties:trackEdits:completion:", v25, v26, v27, v35);

        v12 = (id *)v36;
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(a1 + 40), "userIdentity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 72);
      v31 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4_28;
      v34[3] = &unk_1E315AFE8;
      v9 = v34;
      v32 = *(id *)(a1 + 96);
      v33 = *(_QWORD *)(a1 + 104);
      v34[4] = v32;
      v34[5] = v33;
      objc_msgSend(v6, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v30, v4, v31, v34);
    }
    v12 = (id *)(v9 + 4);
LABEL_22:

LABEL_23:
    return;
  }
  v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v42 = v14;
    _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPModelLibraryPlaylistEditChangeRequestOperationErrorDomain"), -10004, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();

}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_21(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeArtworkWithSourceType:", 200);
    objc_msgSend(*(id *)(a1 + 32), "removeArtworkWithSourceType:", 600);
    objc_msgSend(*(id *)(a1 + 40), "playlistUserImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(*(id *)(a1 + 32), "removeArtworkWithSourceType:", 100);
  }
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_3_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2_10(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));

}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __59__MPModelLibraryPlaylistEditChangeRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

@end
