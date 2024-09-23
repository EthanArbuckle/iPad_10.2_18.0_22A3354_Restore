@implementation MPModelLibraryFavoriteEntityChangeRequestOperation

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  char v9;
  void *v10;
  void *v11;
  NSOperationQueue *v12;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryFavoriteEntityChangeRequest modelObject](self->_request, "modelObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryFavoriteEntityChangeRequest requestAction](self->_request, "requestAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543618;
      *(_QWORD *)&v24[4] = v3;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v5;
      v8 = "Not running favorite state change operation for entity=%{public}@ action=%{public}@ as the request is invalid";
LABEL_20:
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, v8, v24, 0x16u);
    }
LABEL_21:

    if (!self->_responseHandler)
      goto LABEL_24;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("missing parameters to run request");
    v21 = 2;
LABEL_23:
    objc_msgSend(v19, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), v21, v20, *(_OWORD *)v24, *(_QWORD *)&v24[16]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_responseHandler + 2))();
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v22);

    goto LABEL_24;
  }
  v9 = _os_feature_enabled_impl();
  if ((v9 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138543618;
      *(_QWORD *)&v24[4] = v3;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v5;
      v8 = "Not running favorite state change operation for entity=%{public}@ action=%{public}@ Favoriting FF is disabled";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v10 = (void *)objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_class();

  }
  if ((objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class());
    if (!self->_operationQueue)
    {
      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v12;

      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
      -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryFavoriteEntityChangeRequestOperation.operationQueue"));
      v14 = self->_operationQueue;
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setQualityOfService:](v14, "setQualityOfService:", objc_msgSend(v15, "qualityOfService"));

    }
    self->_canRerunRequest = 1;
    objc_msgSend(v3, "identifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "persistentID");

    -[MPModelLibraryFavoriteEntityChangeRequestOperation _runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:](self, "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", v16, v18, objc_msgSend(v5, "changeRequestAction"), v10);
    goto LABEL_24;
  }
  _MPLogCategoryFavoriting();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 138543618;
    *(_QWORD *)&v24[4] = v3;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v5;
    _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "Not running favorite state change operation for entity=%{public}@ action=%{public}@ as the request object is not supported", v24, 0x16u);
  }

  if (self->_responseHandler)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("unsupported entity type");
    v21 = 3;
    goto LABEL_23;
  }
LABEL_24:

}

- (void)_runRequestWithIdentifiers:(id)a3 persistentID:(int64_t)a4 favoriteEntityChangeRequestAction:(int64_t)a5 class:(Class)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  MPModelLibraryFavoriteEntityChangeRequestOperation *v15;
  int64_t v16;
  Class v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  Class v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    MPNSStringForFavoriteEntityChangeRequestAction(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v12;
    v21 = 2048;
    v22 = a4;
    v23 = 2114;
    v24 = a6;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "Running request %{public}@ for entity with persistentID=%lld, modelClass=%{public}@", buf, 0x20u);

  }
  if (a4)
  {
    -[MPModelLibraryFavoriteEntityChangeRequestOperation _setLikedStateForRequestAction:forEntityWithPersistentID:modelClass:](self, "_setLikedStateForRequestAction:forEntityWithPersistentID:modelClass:", a5, a4, a6);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke;
    v13[3] = &unk_1E3153DC8;
    v14 = v10;
    v15 = self;
    v16 = a5;
    v17 = a6;
    v18 = 0;
    -[MPModelLibraryFavoriteEntityChangeRequestOperation _runLibraryMappingRequestWithIdentifiers:class:completionHandler:](self, "_runLibraryMappingRequestWithIdentifiers:class:completionHandler:", v14, a6, v13);

  }
}

- (void)_setLikedStateForRequestAction:(int64_t)a3 forEntityWithPersistentID:(int64_t)a4 modelClass:(Class)a5
{
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  void (**v44)(id, void *);
  __CFString *v45;
  __CFString *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  NSObject *v52;
  __CFString *v53;
  NSObject *v54;
  void (**v55)(id, void *);
  __CFString *v56;
  NSObject *v57;
  void (**v58)(id, void *);
  __CFString *v59;
  void *v60;
  void (**responseHandler)(id, void *);
  __CFString *v62;
  id v63;
  void *v64;
  __CFString *v65;
  __CFString *v66;
  NSObject *v67;
  void (**v68)(id, void *);
  __CFString *v69;
  void *v70;
  void (**v71)(id, void *);
  __CFString *v72;
  void *v73;
  __CFString *v74;
  __CFString *v75;
  void *v76;
  void (**v77)(id, void *);
  __CFString *v78;
  void *v79;
  __CFString *v80;
  void *v81;
  void (**v82)(id, void *);
  __CFString *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[4];
  id v90;
  id v91;
  MPModelLibraryFavoriteEntityChangeRequestOperation *v92;
  uint64_t *v93;
  int64_t v94;
  int64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint8_t buf[4];
  int64_t v104;
  __int16 v105;
  int64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__4571;
  v101 = __Block_byref_object_dispose__4572;
  v102 = 0;
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryFavoriteEntityChangeRequest modelObject](self->_request, "modelObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifiers");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MPModelLibraryFavoriteEntityChangeRequestOperation _likedStateFromRequestAction:](self, "_likedStateFromRequestAction:", a3);
  objc_msgSend(v10, "favoriteSongsPlaylist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForProperty:", CFSTR("keepLocal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v10, "itemWithPersistentID:verifyExistence:", a4, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = CFSTR("_itemLikedState");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("likedState"), CFSTR("keepLocal"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valuesForProperties:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v98[5];
      v98[5] = v19;

      objc_msgSend((id)v98[5], "objectForKey:", CFSTR("likedState"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      v23 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v24 = v23;
      if (v12 == v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v25 = CFSTR("Unknown");
          else
            v25 = off_1E31585A0[v12 - 1];
          v59 = v25;
          *(_DWORD *)buf = 134218242;
          v104 = a4;
          v105 = 2114;
          v106 = (int64_t)v59;
          _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_ERROR, "track persistentID=%lld is already %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("track is already in correct favorited state"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        responseHandler = (void (**)(id, void *))self->_responseHandler;
        if (responseHandler)
          responseHandler[2](responseHandler, v60);
        -[MPAsyncOperation finishWithError:](self, "finishWithError:", v60);

      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v45 = CFSTR("Unknown");
          else
            v45 = off_1E31585A0[v12 - 1];
          v62 = v45;
          *(_DWORD *)buf = 138543618;
          v104 = (int64_t)v62;
          v105 = 2048;
          v106 = a4;
          _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for track with persistentID=%lld", buf, 0x16u);

        }
        v63 = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke;
        v89[3] = &unk_1E3153DF0;
        v93 = &v97;
        v94 = v12;
        v96 = v15;
        v95 = a4;
        v16 = v63;
        v90 = v16;
        v91 = v10;
        v92 = self;
        objc_msgSend(v16, "setValue:forProperty:withCompletionBlock:", v64, CFSTR("_itemLikedState"), v89);

      }
      v65 = CFSTR("_itemLikedState");
      goto LABEL_94;
    }
    v42 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v104 = a4;
      _os_log_impl(&dword_193B9B000, v42, OS_LOG_TYPE_ERROR, "Could not locate item with persistentID=%lld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 4, CFSTR("could not find song in media library"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void (**)(id, void *))self->_responseHandler;
    if (v44)
      v44[2](v44, v43);
LABEL_63:
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v43);

    v16 = 0;
    v65 = 0;
    v18 = 0;
LABEL_94:

    goto LABEL_95;
  }
  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v10, "playlistWithPersistentID:", a4);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v26 = CFSTR("_playlistLikedState");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("likedState"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valuesForProperties:", v18);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v98[5];
      v98[5] = v27;

      objc_msgSend((id)v98[5], "objectForKey:", CFSTR("likedState"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "intValue");

      v31 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v32 = v31;
      if (v12 == v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v33 = CFSTR("Unknown");
          else
            v33 = off_1E31585A0[v12 - 1];
          v69 = v33;
          *(_DWORD *)buf = 134218242;
          v104 = a4;
          v105 = 2114;
          v106 = (int64_t)v69;
          _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_ERROR, "playlist persistentID=%lld is already %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("playlist is already in correct favorited state"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void (**)(id, void *))self->_responseHandler;
        if (v71)
          v71[2](v71, v70);
        -[MPAsyncOperation finishWithError:](self, "finishWithError:", v70);

      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v56 = CFSTR("Unknown");
          else
            v56 = off_1E31585A0[v12 - 1];
          v72 = v56;
          *(_DWORD *)buf = 138543618;
          v104 = (int64_t)v72;
          v105 = 2048;
          v106 = a4;
          _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for playlist with persistentID=%lld", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_69;
        v88[3] = &unk_1E31637D0;
        v88[4] = self;
        objc_msgSend(v16, "setValue:forProperty:withCompletionBlock:", v73, CFSTR("_playlistLikedState"), v88);

      }
      v65 = CFSTR("_playlistLikedState");
      goto LABEL_94;
    }
    v54 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v104 = a4;
      _os_log_impl(&dword_193B9B000, v54, OS_LOG_TYPE_ERROR, "Could not locate playlist with persistentID=%lld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 4, CFSTR("could not find playlist in media library"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void (**)(id, void *))self->_responseHandler;
    if (v55)
      v55[2](v55, v43);
    goto LABEL_63;
  }
  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v10, "collectionWithPersistentID:groupingType:", a4, 3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v34 = CFSTR("_albumArtistLikedState");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("albumArtistFavoriteState"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valuesForProperties:", v18);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v98[5];
      v98[5] = v35;

      objc_msgSend((id)v98[5], "objectForKey:", CFSTR("albumArtistFavoriteState"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "intValue");

      v39 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      v40 = v39;
      if (v12 == v38)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v41 = CFSTR("Unknown");
          else
            v41 = off_1E31585A0[v12 - 1];
          v75 = v41;
          *(_DWORD *)buf = 134218242;
          v104 = a4;
          v105 = 2114;
          v106 = (int64_t)v75;
          _os_log_impl(&dword_193B9B000, v40, OS_LOG_TYPE_ERROR, "album artist persistentID=%lld is already %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("artist is already in correct favorited state"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void (**)(id, void *))self->_responseHandler;
        if (v77)
          v77[2](v77, v76);
        -[MPAsyncOperation finishWithError:](self, "finishWithError:", v76);

      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v66 = CFSTR("Unknown");
          else
            v66 = off_1E31585A0[v12 - 1];
          v78 = v66;
          *(_DWORD *)buf = 138543618;
          v104 = (int64_t)v78;
          v105 = 2048;
          v106 = a4;
          _os_log_impl(&dword_193B9B000, v40, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for album artist with persistentID=%lld", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_74;
        v87[3] = &unk_1E31637D0;
        v87[4] = self;
        objc_msgSend(v16, "setValue:forProperty:withCompletionBlock:", v79, CFSTR("_albumArtistLikedState"), v87);

      }
      v65 = CFSTR("_albumArtistLikedState");
      goto LABEL_94;
    }
    v57 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v104 = a4;
      v105 = 2114;
      v106 = (int64_t)v85;
      _os_log_impl(&dword_193B9B000, v57, OS_LOG_TYPE_ERROR, "Could not locate album artist with persistentID=%lld, identifiers=%{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 4, CFSTR("could not find album artist in media library"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void (**)(id, void *))self->_responseHandler;
    if (v58)
      v58[2](v58, v43);
    goto LABEL_63;
  }
  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v10, "collectionWithPersistentID:groupingType:", a4, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v46 = CFSTR("_albumLikedState");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("albumLikedState"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valuesForProperties:", v18);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v98[5];
      v98[5] = v47;

      objc_msgSend((id)v98[5], "objectForKey:", CFSTR("albumLikedState"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "intValue");

      _MPLogCategoryFavoriting();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v12 == v50)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v53 = CFSTR("Unknown");
          else
            v53 = off_1E31585A0[v12 - 1];
          v80 = v53;
          *(_DWORD *)buf = 134218242;
          v104 = a4;
          v105 = 2114;
          v106 = (int64_t)v80;
          _os_log_impl(&dword_193B9B000, v52, OS_LOG_TYPE_ERROR, "album persistentID=%lld is already %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("album is already in correct favorited state"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void (**)(id, void *))self->_responseHandler;
        if (v82)
          v82[2](v82, v81);
        -[MPAsyncOperation finishWithError:](self, "finishWithError:", v81);

      }
      else
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v12 - 1) > 2)
            v74 = CFSTR("Unknown");
          else
            v74 = off_1E31585A0[v12 - 1];
          v83 = v74;
          *(_DWORD *)buf = 138543618;
          v104 = (int64_t)v83;
          v105 = 2048;
          v106 = a4;
          _os_log_impl(&dword_193B9B000, v52, OS_LOG_TYPE_DEFAULT, "Setting likedState=%{public}@ for album with persistentID=%lld", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_79;
        v86[3] = &unk_1E31637D0;
        v86[4] = self;
        objc_msgSend(v16, "setValue:forProperty:withCompletionBlock:", v84, CFSTR("_albumLikedState"), v86);

      }
      v65 = CFSTR("_albumLikedState");
      goto LABEL_94;
    }
    v67 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v104 = a4;
      _os_log_impl(&dword_193B9B000, v67, OS_LOG_TYPE_ERROR, "Could not locate album with persistentID=%lld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 4, CFSTR("could not find album in media library"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void (**)(id, void *))self->_responseHandler;
    if (v68)
      v68[2](v68, v43);
    goto LABEL_63;
  }
  v18 = 0;
LABEL_95:

  _Block_object_dispose(&v97, 8);
}

- (void)_runLibraryMappingRequestWithIdentifiers:(id)a3 class:(Class)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MPStoreLibraryMappingRequestOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  __CFString *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPStoreLibraryPersonalizationRequest libraryViewAllowingEmptyCollectionsForUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewAllowingEmptyCollectionsForUserIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryFavoriteEntityChangeRequest modelObject](self->_request, "modelObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();

  }
  if (objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class()))
  {
    v38 = v8;
    v15 = v12;
    v16 = (void *)MEMORY[0x1E0D51270];
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "musicLibraryForUserAccount:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFString name](v15, "name");
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    v37 = v19;
    -[MPStoreLibraryMappingRequestOperation setLibraryView:](v21, "setLibraryView:", v19);
    -[MPStoreLibraryMappingRequestOperation setModelClass:](v21, "setModelClass:", a4);
    v36 = v18;
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(v18, "groupingKeyForString:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v22;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "dictionaryWithObject:forKey:", v24, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPStoreLibraryMappingRequestOperation setAlbumArtistNamesToIdentifierSets:](v21, "setAlbumArtistNamesToIdentifierSets:", v26);

      if (!v22)
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke;
      v41[3] = &unk_1E3153E18;
      v42 = v9;
      -[MPStoreLibraryMappingRequestOperation setResponseHandler:](v21, "setResponseHandler:", v41);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v21);

      v8 = v38;
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0D4D030];
      v34 = *MEMORY[0x1E0D4CE38];
      if (v15)
        v28 = v15;
      else
        v28 = CFSTR("<nil>");
      v45[0] = CFSTR("modelObject");
      v45[1] = CFSTR("action");
      v46[0] = v28;
      v29 = (void *)MEMORY[0x1E0CB37E8];
      -[MPModelLibraryFavoriteEntityChangeRequest requestAction](self->_request, "requestAction");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "changeRequestAction"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v34, CFSTR("Bug"), CFSTR("Album Artist With No Name"), CFSTR("Request to run favorite change request for artist with no name"), 0, v33, 0);

      v8 = v38;
      if (!v9)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("No album artist name to favorite."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v22);
    }

LABEL_17:
    v11 = v37;
    goto LABEL_18;
  }
  v21 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
  -[MPStoreLibraryMappingRequestOperation setLibraryView:](v21, "setLibraryView:", v11);
  -[MPStoreLibraryMappingRequestOperation setModelClass:](v21, "setModelClass:", a4);
  v43 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreLibraryMappingRequestOperation setIdentifierSets:](v21, "setIdentifierSets:", v27);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke_2;
  v39[3] = &unk_1E3153E18;
  v40 = (__CFString *)v9;
  -[MPStoreLibraryMappingRequestOperation setResponseHandler:](v21, "setResponseHandler:", v39);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v21);
  v15 = v40;
LABEL_18:

}

- (id)_storeImportItemFromRequestIdentifiers:(id)a3 modelClass:(Class)a4 changeAction:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  MPStoreItemLibraryImportElement *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  MPStoreItemLibraryImport *v21;
  void *v22;
  MPStoreItemLibraryImport *v23;
  void *v24;
  _BOOL8 v25;
  MPStoreItemLibraryImport *v26;
  MPStoreItemLibraryImportElement *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "adamID");

  if (!v10)
  {
    objc_msgSend(v8, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "purchasedAdamID");

    if (!v10)
    {
      objc_msgSend(v8, "universalStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "subscriptionAdamID");

    }
  }
  objc_msgSend(v8, "universalStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "globalPlaylistID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || v14)
  {
    v16 = -[MPStoreItemLibraryImportElement initWithStoreItemID:additionalTrackMetadata:]([MPStoreItemLibraryImportElement alloc], "initWithStoreItemID:additionalTrackMetadata:", v10, 0);
    if (a5 == 2)
    {
      if (_os_feature_enabled_impl()
        && -[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
      {
        v17 = (void *)MEMORY[0x1E0D51270];
        -[MPAsyncOperation userIdentity](self, "userIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "musicLibraryForUserAccount:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (unint64_t)objc_msgSend(v19, "sagaCloudFavoriteSongAddToLibraryBehavior") < 2;
      }
      else
      {
        v20 = 1;
      }
      v26 = [MPStoreItemLibraryImport alloc];
      v29[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v26;
      v24 = v22;
      v25 = v20;
    }
    else
    {
      v21 = [MPStoreItemLibraryImport alloc];
      v28 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = v22;
      v25 = 0;
    }
    v15 = -[MPStoreItemLibraryImport initUsingLocalDeviceLibraryDestinationWithImportElements:referralObject:usingLocalLibraryDestination:usingCloudLibraryDestination:](v23, "initUsingLocalDeviceLibraryDestinationWithImportElements:referralObject:usingLocalLibraryDestination:usingCloudLibraryDestination:", v24, 0, v25, 0);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)_likedStateFromRequestAction:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 4)
    return qword_193F09998[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryFavoriteEntityChangeRequestOperation.m"), 605, CFSTR("FavoriteEntityChangeRequestAction (%d) is not a supported state"), a3);

  return 0;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (MPModelLibraryFavoriteEntityChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

uint64_t __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __119__MPModelLibraryFavoriteEntityChangeRequestOperation__runLibraryMappingRequestWithIdentifiers_class_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKey:", CFSTR("keepLocal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v4 && *(_QWORD *)(a1 + 64) == 2 && *(_BYTE *)(a1 + 80) && v6 == -1)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 72);
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Clearing keep-local on favorited track. persistentID=%lld", (uint8_t *)&v12, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", &unk_1E31E4840, CFSTR("keepLocal")))
    {
      objc_msgSend(*(id *)(a1 + 40), "ml3Library");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "notifyEntitiesAddedOrRemoved");

    }
  }
  v10 = *(_QWORD **)(a1 + 48);
  v11 = v10[36];
  if (v11)
  {
    (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v4);
    v10 = *(_QWORD **)(a1 + 48);
  }
  objc_msgSend(v10, "finishWithError:", v4);

}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[36];
  v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v4 = v7;
    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "finishWithError:", v4);

}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[36];
  v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v4 = v7;
    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "finishWithError:", v4);

}

void __122__MPModelLibraryFavoriteEntityChangeRequestOperation__setLikedStateForRequestAction_forEntityWithPersistentID_modelClass___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[36];
  v7 = v4;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v4 = v7;
    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "finishWithError:", v4);

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  int8x16_t v42;
  int8x16_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  _QWORD v47[4];
  int8x16_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  int8x16_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];
  int8x16_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  int8x16_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];
  int8x16_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  _BYTE buf[24];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "libraryIdentifierSetForIdentifierSet:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "library");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "persistentID");

    v15 = *(_BYTE **)(a1 + 40);
    if (v14)
    {
      objc_msgSend(v15, "_setLikedStateForRequestAction:forEntityWithPersistentID:modelClass:", *(_QWORD *)(a1 + 48), v14, *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (v15[280])
      {
        v15[280] = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v74 = 0;
        objc_msgSend(*(id *)(a1 + 40), "userIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_storeImportItemFromRequestIdentifiers:modelClass:changeAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (objc_msgSend(*(id *)(a1 + 56), "isSubclassOfClass:", objc_opt_class()))
          {
            objc_msgSend(*(id *)(a1 + 32), "universalStore");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "globalPlaylistID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "addToDeviceLibraryOnly"))
            {
              v67[0] = MEMORY[0x1E0C809B0];
              v67[1] = 3221225472;
              v67[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_36;
              v67[3] = &unk_1E3153D28;
              v21 = v67;
              v22 = v20;
              v67[4] = v22;
              v69 = buf;
              v42 = *(int8x16_t *)(a1 + 32);
              v23 = (id)v42.i64[0];
              v68 = vextq_s8(v42, v42, 8uLL);
              v24 = *(_QWORD *)(a1 + 56);
              v70 = *(_QWORD *)(a1 + 48);
              v71 = v24;
              objc_msgSend(v17, "addToLocalDeviceLibraryGlobalPlaylistWithID:completion:", v22, v67);
            }
            else
            {
              v72 = v20;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_40;
              v62[3] = &unk_1E3153D28;
              v21 = v62;
              v62[4] = v20;
              v64 = buf;
              v45 = *(int8x16_t *)(a1 + 32);
              v38 = (id)v45.i64[0];
              v63 = vextq_s8(v45, v45, 8uLL);
              v39 = *(_QWORD *)(a1 + 56);
              v65 = *(_QWORD *)(a1 + 48);
              v66 = v39;
              objc_msgSend(v17, "addNonLibraryOwnedPlaylistsWithGlobalIDs:completion:", v37, v62);

            }
          }
          else if (objc_msgSend(*(id *)(a1 + 56), "isSubclassOfClass:", objc_opt_class()))
          {
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_41;
            v57[3] = &unk_1E3153D50;
            v59 = buf;
            v43 = *(int8x16_t *)(a1 + 32);
            v33 = (id)v43.i64[0];
            v58 = vextq_s8(v43, v43, 8uLL);
            v34 = *(_QWORD *)(a1 + 56);
            v60 = *(_QWORD *)(a1 + 48);
            v61 = v34;
            objc_msgSend(v17, "performStoreAlbumArtistLibraryImport:withCompletion:", v18, v57);

          }
          else if (objc_msgSend(*(id *)(a1 + 56), "isSubclassOfClass:", objc_opt_class()))
          {
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_46;
            v52[3] = &unk_1E3153D50;
            v54 = buf;
            v44 = *(int8x16_t *)(a1 + 32);
            v35 = (id)v44.i64[0];
            v53 = vextq_s8(v44, v44, 8uLL);
            v36 = *(_QWORD *)(a1 + 56);
            v55 = *(_QWORD *)(a1 + 48);
            v56 = v36;
            objc_msgSend(v17, "performStoreItemLibraryImport:withCompletion:", v18, v52);

          }
          else
          {
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_49;
            v47[3] = &unk_1E3153DA0;
            v49 = *(_QWORD *)(a1 + 48);
            v46 = *(int8x16_t *)(a1 + 32);
            v40 = (id)v46.i64[0];
            v48 = vextq_s8(v46, v46, 8uLL);
            v41 = *(_QWORD *)(a1 + 56);
            v50 = *(_QWORD *)(a1 + 64);
            v51 = v41;
            objc_msgSend(v17, "performStoreItemLibraryImport:withCompletion:", v18, v47);

          }
          v7 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 2, CFSTR("no store identifiers to run request"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(_QWORD **)(a1 + 40);
          v32 = v31[36];
          if (v32)
          {
            (*(void (**)(_QWORD, void *))(v32 + 16))(v31[36], v7);
            v31 = *(_QWORD **)(a1 + 40);
          }
          objc_msgSend(v31, "finishWithError:", v7);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_32;
      }
      v25 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_ERROR, "Could not locate entity identifiers=%{public}@, class=%{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 4, CFSTR("could not find entity in media library"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD **)(a1 + 40);
      v30 = v29[36];
      if (v30)
      {
        (*(void (**)(_QWORD, void *))(v30 + 16))(v29[36], v28);
        v29 = *(_QWORD **)(a1 + 40);
      }
      objc_msgSend(v29, "finishWithError:", v28);

    }
    v7 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v7 = v6;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Library mapping for identifiers=%{public}@ failed with error=%{public}@", buf, 0x16u);
  }

  v10 = *(_QWORD **)(a1 + 40);
  v11 = v10[36];
  if (v11)
  {
    (*(void (**)(_QWORD, void *))(v11 + 16))(v10[36], v7);
    v10 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v10, "finishWithError:", v7);
LABEL_33:

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v20 = 138543874;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);

    }
    v10 = *(_QWORD **)(a1 + 40);
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v6);
      v10 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v10, "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "longLongValue");
      objc_msgSend(*(id *)(a1 + 40), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 64));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v20 = 138543874;
        v21 = v15;
        v22 = 2114;
        v23 = v16;
        v24 = 2114;
        v25 = v5;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("could not import playlist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD **)(a1 + 40);
      v19 = v18[36];
      if (v19)
      {
        (*(void (**)(_QWORD, void *))(v19 + 16))(v18[36], v17);
        v18 = *(_QWORD **)(a1 + 40);
      }
      objc_msgSend(v18, "finishWithError:", v17);

    }
  }

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v20 = 138543874;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);

    }
    v10 = *(_QWORD **)(a1 + 40);
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v6);
      v10 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v10, "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "longLongValue");
      objc_msgSend(*(id *)(a1 + 40), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 64));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        v20 = 138543874;
        v21 = v15;
        v22 = 2114;
        v23 = v16;
        v24 = 2114;
        v25 = v5;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for globalPlaylistID=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("could not import playlist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD **)(a1 + 40);
      v19 = v18[36];
      if (v19)
      {
        (*(void (**)(_QWORD, void *))(v19 + 16))(v18[36], v17);
        v18 = *(_QWORD **)(a1 + 40);
      }
      objc_msgSend(v18, "finishWithError:", v17);

    }
  }

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v21 = 138543874;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for artist with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v21, 0x20u);

    }
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v6);
      v10 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v10, "finishWithError:", v6);
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1 + 48;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "longLongValue");

    }
    else
    {
      v13 = a1 + 48;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 24);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    else
    {
      v15 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 56));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 40);
        v21 = 138543874;
        v22 = v16;
        v23 = 2114;
        v24 = v17;
        v25 = 2114;
        v26 = v5;
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for identifiers=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v21, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("could not import album artist"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD **)(a1 + 32);
      v20 = v19[36];
      if (v20)
      {
        (*(void (**)(_QWORD, void *))(v20 + 16))(v19[36], v18);
        v19 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v19, "finishWithError:", v18);

    }
  }

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v20 = 138543874;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for entity with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", (uint8_t *)&v20, 0x20u);

    }
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v6);
      v10 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v10, "finishWithError:", v6);
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "persistentID");

    }
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 40), v13, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 56));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        v20 = 138543874;
        v21 = v15;
        v22 = 2114;
        v23 = v16;
        v24 = 2114;
        v25 = v5;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for identifiers=%{public}@ as we could not lookup the item in the response=%{public}@", (uint8_t *)&v20, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("could not import song"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD **)(a1 + 32);
      v19 = v18[36];
      if (v19)
      {
        (*(void (**)(_QWORD, void *))(v19 + 16))(v18[36], v17);
        v18 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v18, "finishWithError:", v17);

    }
  }

}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD v25[5];
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE buf[24];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v31 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Not running %{public}@ request for entity with identifiers=%{public}@ as we could not lookup the item (error=%{public}@)", buf, 0x20u);

    }
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[36];
    if (v11)
    {
      (*(void (**)(_QWORD, id))(v11 + 16))(v10[36], v6);
      v10 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v10, "finishWithError:", v6);
  }
  else if (*(_QWORD *)(a1 + 48) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 2, *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(v5, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v31 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_2;
    v25[3] = &unk_1E3153D78;
    v25[4] = buf;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);
    v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_runRequestWithIdentifiers:persistentID:favoriteEntityChangeRequestAction:class:", *(_QWORD *)(a1 + 40), v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    else
    {
      v19 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 48));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v26 = 138543618;
        v27 = v20;
        v28 = 2114;
        v29 = v21;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "Not running %{public}@ request for entity with identifiers=%{public}@ as albumPersistentID is invalid", v26, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("albumPID of track is invalid"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD **)(a1 + 32);
      v24 = v23[36];
      if (v24)
      {
        (*(void (**)(_QWORD, void *))(v24 + 16))(v23[36], v22);
        v23 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v23, "finishWithError:", v22);

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Favoriting");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      MPNSStringForFavoriteEntityChangeRequestAction(*(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "Not running %{public}@ request for entity with identifiers=%{public}@ as no tracks were imported", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibraryFavoriteEntityChangeRequestErrorDomain"), 5, CFSTR("album import did not add any tracks"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD **)(a1 + 32);
    v18 = v17[36];
    if (v18)
    {
      (*(void (**)(_QWORD, void *))(v18 + 16))(v17[36], v16);
      v17 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v17, "finishWithError:", v16);

  }
}

void __134__MPModelLibraryFavoriteEntityChangeRequestOperation__runRequestWithIdentifiers_persistentID_favoriteEntityChangeRequestAction_class___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "valueForProperty:", CFSTR("albumPID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber() && objc_msgSend(v6, "longLongValue"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "longLongValue");
    *a4 = 1;
  }

}

@end
