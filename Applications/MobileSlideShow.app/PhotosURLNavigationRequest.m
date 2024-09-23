@implementation PhotosURLNavigationRequest

- (PhotosURLNavigationRequest)initWithDestinationURL:(id)a3 rootController:(id)a4
{
  id v7;
  id v8;
  PhotosURLNavigationRequest *v9;
  uint64_t v10;
  PHPhotoLibrary *photoLibrary;
  NSURL *v12;
  NSURL *destinationURL;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PhotosURLNavigationRequest;
  v9 = -[PhotosURLNavigationRequest init](&v17, "init");
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoLibrary"));
        photoLibrary = v9->_photoLibrary;
        v9->_photoLibrary = (PHPhotoLibrary *)v10;

        v12 = (NSURL *)objc_msgSend(v7, "copy");
        destinationURL = v9->_destinationURL;
        v9->_destinationURL = v12;

        objc_storeStrong((id *)&v9->_rootController, a4);
        v9->_state = 0;
        goto LABEL_5;
      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PhotosURLNavigationRequest.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

      if (v8)
        goto LABEL_4;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PhotosURLNavigationRequest.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootController"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, PLManagedObjectContextFinishedRemoteMergeNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, PXRootLibraryNavigationControllerUpdatedAvailableDestinations, 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPendingNavigation", 0);

  v4.receiver = self;
  v4.super_class = (Class)PhotosURLNavigationRequest;
  -[PhotosURLNavigationRequest dealloc](&v4, "dealloc");
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  void *v8;

  state = self->_state;
  switch(a3)
  {
    case 1uLL:
      if (state > 3 || state == 1)
        goto LABEL_13;
      break;
    case 2uLL:
      if (state >= 2)
        goto LABEL_13;
      break;
    case 3uLL:
      if (state != 2)
        goto LABEL_13;
      break;
    case 4uLL:
      if (state >= 3)
        goto LABEL_13;
      break;
    case 5uLL:
      if (state != 1)
        goto LABEL_13;
      break;
    default:
LABEL_13:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosURLNavigationRequest.m"), 121, CFSTR("Invalid state transition %lu -> %lu"), state, a3);

      break;
  }
  self->_state = a3;
}

- (id)_albumForKnownName:(id)a3 orUUID:(id)a4 requestIsValid:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    if (!objc_msgSend(v8, "length"))
    {
      v11 = 0;
      v12 = 0;
      if (!a5)
        goto LABEL_19;
      goto LABEL_18;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "albumWithUuid:", v8));
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("camera-roll")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("recents")))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[PLGenericAlbum userLibraryAlbumInLibrary:](PLGenericAlbum, "userLibraryAlbumInLibrary:", v9));
LABEL_15:
    v12 = (void *)v10;
LABEL_16:
    v11 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("last-imported")))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastImportedPhotosAlbumCreateIfNeeded:", 0));
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("all-imported")))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allImportedPhotosAlbumCreateIfNeeded:", 0));
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("photo-library")))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[PLGenericAlbum iTunesLibraryAlbumInLibrary:](PLGenericAlbum, "iTunesLibraryAlbumInLibrary:", v9));
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("favorites")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v15 = 1609;
LABEL_24:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", v15, v14));

    goto LABEL_16;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("recently-deleted")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v15 = 1612;
    goto LABEL_24;
  }
  v11 = 0;
  v12 = 0;
LABEL_17:

  if (a5)
LABEL_18:
    *a5 = v11;
LABEL_19:

  return v12;
}

- (void)_navigateAllowingRetry:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  uint64_t v47;
  unsigned int v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  unsigned int v58;
  void *v59;
  unsigned int v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  unsigned int v72;
  void *v73;
  unsigned int v74;
  void *v75;
  void *v76;
  unsigned int v77;
  int v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  uint8_t buf[8];
  _QWORD v88[4];
  id v89;
  uint64_t *v90;
  BOOL v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;

  v86 = a3;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  v91 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest rootController](self, "rootController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest destinationURL](self, "destinationURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryKeysAndValues"));

  +[PXAnalyticsURLNavigationUtilities sendNavigationStartEventForURL:](PXAnalyticsURLNavigationUtilities, "sendNavigationStartEventForURL:", v5);
  -[PhotosURLNavigationRequest setState:](self, "setState:", 1);
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("oneyearago")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("contentmode")))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100071D00, "objectForKeyedSubscript:"));
      v12 = v11;
      if (v11)
      {
        v91 = 1;
        v13 = (uint64_t)objc_msgSend(v11, "integerValue");
        v14 = objc_msgSend(v4, "contentModeIsAvailableForNavigation:", v13);
        *((_BYTE *)v93 + 24) = v14;
        if ((v14 & 1) != 0)
        {
LABEL_9:
          objc_msgSend(v4, "navigateToContentMode:animated:completion:", v13, 0, 0);
          goto LABEL_10;
        }
        if ((_DWORD)v13 == 6)
        {
          v13 = 6;
          goto LABEL_9;
        }
      }
LABEL_10:

      v15 = v10;
      goto LABEL_45;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("album")))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, 0));
      v84 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, CFSTR("revealasset")));
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_100044C74;
      v88[3] = &unk_10006D538;
      v90 = &v92;
      v19 = v4;
      v89 = v19;
      v20 = objc_retainBlock(v88);
      v81 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _albumForKnownName:orUUID:requestIsValid:](self, "_albumForKnownName:orUUID:requestIsValid:", v16, v17, &v91));
      if (v21 && objc_msgSend(v19, "albumIsAvailableForNavigation:", v21))
      {
        if (objc_msgSend(v18, "length"))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "assetWithUUID:", v18));

          if (v18)
          {
            v23 = objc_msgSend(v19, "assetIsAvailableForNavigation:inAlbum:", v79, v21);
            *((_BYTE *)v93 + 24) = v23;
            if (v23)
              objc_msgSend(v19, "navigateToRevealAsset:inAlbum:animated:", v79, v21, 0);
          }
          else
          {
            *((_BYTE *)v93 + 24) = 0;
          }

        }
        else
        {
          *((_BYTE *)v93 + 24) = 1;
          objc_msgSend(v19, "navigateToAlbum:animated:completion:", v21, 0, 0);
        }
      }
      else
      {
        ((void (*)(_QWORD *))v20[2])(v20);
      }

      v15 = v81;
      v8 = v84;
      goto LABEL_45;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("people")))
    {
      v15 = objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, 0));
      objc_msgSend(v4, "navigateToPeopleAlbumAnimated:revealPersonWithLocalIdentifier:completion:", 0, v15, 0);
      goto LABEL_45;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("places")))
    {
      objc_msgSend(v4, "navigateToPlacesAlbumAnimated:", 0);
      v24 = 0;
LABEL_105:
      -[PhotosURLNavigationRequest _finishNavigationSuccessfully:](self, "_finishNavigationSuccessfully:", v24);
      goto LABEL_106;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("asset")))
    {
      v15 = objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, 0));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumname")));
      v85 = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, CFSTR("album")));
      buf[0] = 1;
      if (objc_msgSend(v26, "length") || objc_msgSend(v27, "length"))
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _albumForKnownName:orUUID:requestIsValid:](self, "_albumForKnownName:orUUID:requestIsValid:", v26, v27, buf));
      else
        v28 = 0;
      if (buf[0])
      {
        v82 = v25;
        if (!-[NSObject length](v15, "length") && objc_msgSend(v25, "length"))
        {
          v29 = v15;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
          v31 = objc_claimAutoreleasedReturnValue(+[PLManagedAsset uuidFromAssetURL:](PLManagedAsset, "uuidFromAssetURL:", v30));

          v15 = v31;
        }
        v32 = v15;
        v91 = -[NSObject length](v15, "length") != 0;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "assetWithUUID:", v15));

        if (v34)
        {
          v35 = objc_msgSend(v4, "assetIsAvailableForNavigation:inAlbum:", v34, v28);
          *((_BYTE *)v93 + 24) = v35;
          if (v35)
            objc_msgSend(v4, "navigateToAsset:inAlbum:animated:", v34, v28, 0);
        }
        else
        {
          *((_BYTE *)v93 + 24) = 0;
        }

        v15 = v32;
        v25 = v82;
      }

      goto LABEL_60;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("comment")))
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudguid")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, CFSTR("asset")));
      v91 = 0;
      if (-[NSObject length](v15, "length") && objc_msgSend(v36, "length"))
      {
        v83 = v15;
        v91 = 1;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[PLCloudSharedComment cloudSharedCommentWithGUID:inLibrary:](PLCloudSharedComment, "cloudSharedCommentWithGUID:inLibrary:", v15, v37));

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "assetWithUUID:", v36));

        if (v40 && v38)
        {
          v41 = objc_msgSend(v4, "commentIsAvailableForNavigation:inAsset:", v38, v40);
          *((_BYTE *)v93 + 24) = v41;
          if (v41)
            objc_msgSend(v4, "navigateToComment:forAsset:animated:", v38, v40, 0);
        }
        else
        {
          *((_BYTE *)v93 + 24) = 0;
        }

        v15 = v83;
      }

      goto LABEL_45;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("cloudfeed")))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("memories")))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
        v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("photos-navigation"));

        if (v45)
        {
          objc_msgSend(v4, "navigateToRevealTheMostRecentMemoryAnimated:", 0);
          v24 = 0;
          goto LABEL_105;
        }
      }
      v46 = objc_msgSend(v6, "isEqualToString:", CFSTR("memory"));
      if ((_DWORD)v46)
      {
        v47 = PLUIGetLog(v46);
        v15 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "'memory' navigation URL scheme is now handled using PXProgrammaticNavigation", buf, 2u);
        }
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("featuredPhoto")))
      {
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier")));
        v91 = 1;
        v48 = objc_msgSend(v4, "contentModeIsAvailableForNavigation:", 11);
        *((_BYTE *)v93 + 24) = v48;
        if (v48)
          objc_msgSend(v4, "navigateToFeaturedPhotoWithSuggestionIdentifier:animated:", v15, 0);
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("search")))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
          v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("photos-navigation"));

          if (v60)
          {
            v91 = 1;
            v61 = objc_msgSend(v4, "contentModeIsAvailableForNavigation:", 12);
            *((_BYTE *)v93 + 24) = v61;
            if (!v61)
              goto LABEL_46;
            v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hashtag")));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("searchterm")));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("searchcategory")));
            if (objc_msgSend(v12, "length") && objc_msgSend(v62, "length"))
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(",")));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "componentsSeparatedByString:", CFSTR(",")));
              objc_msgSend(v4, "navigateToSearchWithTerms:searchCategories:", v63, v64);

            }
            else if (-[NSObject length](v10, "length"))
            {
              objc_msgSend(v4, "navigateToSearchWithHashtag:", v10);
            }

            goto LABEL_10;
          }
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("allAlbums"))
          && (v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme")),
              v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("photos-navigation")),
              v65,
              v66))
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest photoLibrary](self, "photoLibrary"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "px_virtualCollections"));
          v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "rootAlbumCollectionList"));

          v70 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithObject:revealMode:", v69, 0);
          objc_msgSend(v4, "navigateToDestination:options:completionHandler:", v70, 0, &stru_10006D578);
        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("allSharedAlbums")))
            goto LABEL_104;
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
          v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("photos-navigation"));

          if (!v74)
            goto LABEL_104;
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest photoLibrary](self, "photoLibrary"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "px_virtualCollections"));
          v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "sharedAlbumsCollectionList"));

          v70 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithObject:revealMode:", v69, 0);
          objc_msgSend(v4, "navigateToDestination:options:completionHandler:", v70, 0, &stru_10006D598);
        }

        v15 = v69;
      }
LABEL_45:

      if (v91)
        goto LABEL_46;
LABEL_104:
      v24 = 0;
      goto LABEL_105;
    }
    v91 = 1;
    v15 = objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, CFSTR("asset")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("commentguid")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v8, CFSTR("revealasset")));
    if (objc_msgSend(v43, "length"))
    {
      if (-[NSObject length](v15, "length"))
      {
        v78 = 0;
        v91 = 0;
      }
      else
      {
        v49 = v43;

        v78 = 1;
        v15 = v49;
      }
    }
    else
    {
      v78 = 0;
    }
    v85 = v8;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("revealcommentguid")));
    if (objc_msgSend(v50, "length"))
    {
      if (objc_msgSend(v42, "length"))
      {
        v91 = 0;
      }
      else
      {
        v51 = v50;

        v78 = 1;
        v42 = v51;
      }
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosURLNavigationRequest _uuidFromURLParams:prefix:](self, "_uuidFromURLParams:prefix:", v85, CFSTR("invitationalbum")));
    v80 = v43;
    if (objc_msgSend(v42, "length"))
    {
      v53 = v15;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[PLCloudSharedComment cloudSharedCommentWithGUID:inLibrary:](PLCloudSharedComment, "cloudSharedCommentWithGUID:inLibrary:", v42, v54));

      if (v55)
      {
        v56 = objc_msgSend(v4, "cloudFeedCommentIsAvailableForNavigation:", v55);
        *((_BYTE *)v93 + 24) = v56;
        if (v56)
        {
          if (v78)
            objc_msgSend(v4, "navigateToRevealCloudFeedComment:completion:", v55, 0);
          else
            objc_msgSend(v4, "navigateToCloudFeedComment:completion:", v55, 0);
        }
        goto LABEL_111;
      }
    }
    else
    {
      if (!-[NSObject length](v15, "length"))
      {
        if (!objc_msgSend(v52, "length"))
        {
          v77 = objc_msgSend(v4, "cloudFeedIsAvailableForNavigation");
          *((_BYTE *)v93 + 24) = v77;
          if (v77)
            objc_msgSend(v4, "navigateToCloudFeedWithCompletion:", 0);
          goto LABEL_112;
        }
        v53 = v15;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "albumWithUuid:", v52));

        v72 = objc_msgSend(v4, "cloudFeedInvitationForAlbumIsAvailableForNavigation:", v55);
        *((_BYTE *)v93 + 24) = v72;
        if (v72)
          objc_msgSend(v4, "navigateToRevealCloudFeedInvitationForAlbum:completion:", v55, 0);
LABEL_111:

        v15 = v53;
        v43 = v80;
LABEL_112:

LABEL_60:
        v8 = v85;
        goto LABEL_45;
      }
      v53 = v15;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "assetWithUUID:", v53));

      if (v55)
      {
        v58 = objc_msgSend(v4, "cloudFeedAssetIsAvailableForNavigation:", v55);
        *((_BYTE *)v93 + 24) = v58;
        if (v58)
        {
          if (v78)
            objc_msgSend(v4, "navigateToRevealCloudFeedAsset:completion:", v55, 0);
          else
            objc_msgSend(v4, "navigateToCloudFeedAsset:completion:", v55, 0);
        }
        goto LABEL_111;
      }
    }
    v55 = 0;
    *((_BYTE *)v93 + 24) = 0;
    goto LABEL_111;
  }
  v91 = 1;
  v9 = objc_msgSend(v4, "contentModeIsAvailableForNavigation:", 12);
  *((_BYTE *)v93 + 24) = v9;
  if (v9)
    objc_msgSend(v4, "navigateToOneYearAgoSearch");
LABEL_46:
  if (*((_BYTE *)v93 + 24) || !v86)
  {
    v24 = *((unsigned __int8 *)v93 + 24) != 0;
    goto LABEL_105;
  }
  -[PhotosURLNavigationRequest _schedulePendingNavigation](self, "_schedulePendingNavigation");
LABEL_106:
  +[PXAnalyticsURLNavigationUtilities sendNavigationEndEventForURL:](PXAnalyticsURLNavigationUtilities, "sendNavigationEndEventForURL:", v5);

  _Block_object_dispose(&v92, 8);
}

- (id)_uuidFromURLParams:(id)a3 prefix:(id)a4
{
  id v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_10006E450;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("identifier")));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("localidentifier")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
    v8 = (void *)v11;
  }
  if (objc_msgSend(v10, "length"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v10));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("uuid")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13));

  }
  return v12;
}

- (void)navigateAllowingRetry:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id navigationCompletionHandler;

  v4 = a3;
  v6 = objc_msgSend(a4, "copy");
  navigationCompletionHandler = self->_navigationCompletionHandler;
  self->_navigationCompletionHandler = v6;

  -[PhotosURLNavigationRequest _navigateAllowingRetry:](self, "_navigateAllowingRetry:", v4);
}

- (void)cancelPendingNavigation
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPendingNavigation", 0);
  if ((id)-[PhotosURLNavigationRequest state](self, "state") == (id)2)
    -[PhotosURLNavigationRequest _finishNavigationSuccessfully:](self, "_finishNavigationSuccessfully:", 0);
}

- (void)_schedulePendingNavigation
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[PhotosURLNavigationRequest setState:](self, "setState:", 2);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPendingNavigation", 0);
  -[PhotosURLNavigationRequest performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "cancelPendingNavigation", 0, 3.0);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = PLManagedObjectContextFinishedRemoteMergeNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_contextDidFinishMerge:", v3, v5);

  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_rootUpdatedAvailableDestinations:", PXRootLibraryNavigationControllerUpdatedAvailableDestinations, self->_rootController);
}

- (void)_processPendingNavigation
{
  if ((id)-[PhotosURLNavigationRequest state](self, "state") == (id)2)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "cancelPendingNavigation", 0);
    -[PhotosURLNavigationRequest setState:](self, "setState:", 3);
    -[PhotosURLNavigationRequest _navigateAllowingRetry:](self, "_navigateAllowingRetry:", 0);
  }
}

- (void)_finishNavigationSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id navigationCompletionHandler;
  id v7;
  void (**v8)(id, _BOOL8);

  v3 = a3;
  if (a3)
    v5 = 5;
  else
    v5 = 4;
  -[PhotosURLNavigationRequest setState:](self, "setState:", v5);
  navigationCompletionHandler = self->_navigationCompletionHandler;
  if (navigationCompletionHandler)
  {
    v8 = (void (**)(id, _BOOL8))objc_retainBlock(navigationCompletionHandler);
    v7 = self->_navigationCompletionHandler;
    self->_navigationCompletionHandler = 0;

    v8[2](v8, v3);
  }
}

- (void)_contextDidFinishMerge:(id)a3
{
  -[PhotosURLNavigationRequest _processPendingNavigation](self, "_processPendingNavigation", a3);
}

- (void)_rootUpdatedAvailableDestinations:(id)a3
{
  -[PhotosURLNavigationRequest _processPendingNavigation](self, "_processPendingNavigation", a3);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (PXRootLibraryNavigationController)rootController
{
  return self->_rootController;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong(&self->_navigationCompletionHandler, 0);
}

@end
