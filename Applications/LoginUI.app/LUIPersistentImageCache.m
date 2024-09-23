@implementation LUIPersistentImageCache

+ (id)sharedCache
{
  if (qword_100088D70 != -1)
    dispatch_once(&qword_100088D70, &stru_1000690C8);
  return (id)qword_100088D68;
}

- (LUIPersistentImageCache)init
{
  LUIPersistentImageCache *v2;
  CATOperationQueue *v3;
  CATOperationQueue *mCATOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIPersistentImageCache;
  v2 = -[LUIPersistentImageCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(CATOperationQueue);
    mCATOperationQueue = v2->mCATOperationQueue;
    v2->mCATOperationQueue = v3;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v2->mCATOperationQueue, "setMaxConcurrentOperationCount:", 10);
  }
  return v2;
}

- (NSURL)loginUIContainerURL
{
  NSURL *mLoginUIContainerURL;
  void *v4;
  void *v5;
  NSURL *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSURL *v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSFileAttributeKey v25;
  void *v26;

  mLoginUIContainerURL = self->mLoginUIContainerURL;
  if (mLoginUIContainerURL)
    return mLoginUIContainerURL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerLibraryDirectoryURL"));

  v6 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches/ImageCache"), 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v6, "path"));
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
LABEL_5:
    v15 = self->mLoginUIContainerURL;
    self->mLoginUIContainerURL = v6;

    mLoginUIContainerURL = self->mLoginUIContainerURL;
    return mLoginUIContainerURL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v25 = NSFilePosixPermissions;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 511));
  v26 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v24 = 0;
  v13 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 0, v12, &v24);
  v14 = v24;

  if ((v13 & 1) != 0)
  {

    goto LABEL_5;
  }
  v17 = qword_100088F28;
  if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_ERROR))
    sub_10003B630((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);

  return (NSURL *)0;
}

- (NSURL)systemGroupContainerURL
{
  NSURL *mSystemGroupContainerURL;
  void *v4;
  NSURL *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSURL *v14;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSFileAttributeKey v24;
  void *v25;

  mSystemGroupContainerURL = self->mSystemGroupContainerURL;
  if (mSystemGroupContainerURL)
    return mSystemGroupContainerURL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _systemGroupContainerURLWithGroupIdentifier:](self, "_systemGroupContainerURLWithGroupIdentifier:", CFSTR("systemgroup.com.apple.userimagecache")));
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches/ImageCache"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
LABEL_5:
    v14 = self->mSystemGroupContainerURL;
    self->mSystemGroupContainerURL = v5;

    mSystemGroupContainerURL = self->mSystemGroupContainerURL;
    return mSystemGroupContainerURL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v24 = NSFilePosixPermissions;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 511));
  v25 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v23 = 0;
  v12 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 0, v11, &v23);
  v13 = v23;

  if ((v12 & 1) != 0)
  {

    goto LABEL_5;
  }
  v16 = qword_100088F28;
  if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_ERROR))
    sub_10003B630((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);

  return (NSURL *)0;
}

- (SBFFileCache)mediumImageCache
{
  SBFFileCache *mMediumImageCache;
  id v4;
  void *v5;
  SBFFileCache *v6;
  SBFFileCache *v7;

  mMediumImageCache = self->mMediumImageCache;
  if (!mMediumImageCache)
  {
    v4 = objc_alloc((Class)SBFFileCache);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache downloadedMediumImageFileStore](self, "downloadedMediumImageFileStore"));
    v6 = (SBFFileCache *)objc_msgSend(v4, "initWithStore:faultHandler:", v5, self);
    v7 = self->mMediumImageCache;
    self->mMediumImageCache = v6;

    -[SBFFileCache setMaxTotalFileSize:](self->mMediumImageCache, "setMaxTotalFileSize:", 104857600);
    -[SBFFileCache setMaxTotalFileCount:](self->mMediumImageCache, "setMaxTotalFileCount:", 200);
    mMediumImageCache = self->mMediumImageCache;
  }
  return mMediumImageCache;
}

- (SBFFileCache)largeImageCache
{
  SBFFileCache *mLargeImageCache;
  id v4;
  void *v5;
  SBFFileCache *v6;
  SBFFileCache *v7;

  mLargeImageCache = self->mLargeImageCache;
  if (!mLargeImageCache)
  {
    v4 = objc_alloc((Class)SBFFileCache);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache downloadedLargeImageFileStore](self, "downloadedLargeImageFileStore"));
    v6 = (SBFFileCache *)objc_msgSend(v4, "initWithStore:faultHandler:", v5, self);
    v7 = self->mLargeImageCache;
    self->mLargeImageCache = v6;

    -[SBFFileCache setMaxTotalFileSize:](self->mLargeImageCache, "setMaxTotalFileSize:", 104857600);
    -[SBFFileCache setMaxTotalFileCount:](self->mLargeImageCache, "setMaxTotalFileCount:", 200);
    mLargeImageCache = self->mLargeImageCache;
  }
  return mLargeImageCache;
}

- (SBFFileCacheFileStore)downloadedMediumImageFileStore
{
  SBFFileCacheFileStore *mDownloadedMediumImageFileStore;
  id v4;
  void *v5;
  SBFFileCacheFileStore *v6;
  SBFFileCacheFileStore *v7;

  mDownloadedMediumImageFileStore = self->mDownloadedMediumImageFileStore;
  if (!mDownloadedMediumImageFileStore)
  {
    v4 = objc_alloc((Class)SBFFileCacheFileStore);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache systemGroupContainerURL](self, "systemGroupContainerURL"));
    v6 = (SBFFileCacheFileStore *)objc_msgSend(v4, "initWithDirectoryURL:", v5);
    v7 = self->mDownloadedMediumImageFileStore;
    self->mDownloadedMediumImageFileStore = v6;

    mDownloadedMediumImageFileStore = self->mDownloadedMediumImageFileStore;
  }
  return mDownloadedMediumImageFileStore;
}

- (SBFFileCacheFileStore)downloadedLargeImageFileStore
{
  SBFFileCacheFileStore *mDownloadedLargeImageFileStore;
  id v4;
  void *v5;
  SBFFileCacheFileStore *v6;
  SBFFileCacheFileStore *v7;

  mDownloadedLargeImageFileStore = self->mDownloadedLargeImageFileStore;
  if (!mDownloadedLargeImageFileStore)
  {
    v4 = objc_alloc((Class)SBFFileCacheFileStore);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache loginUIContainerURL](self, "loginUIContainerURL"));
    v6 = (SBFFileCacheFileStore *)objc_msgSend(v4, "initWithDirectoryURL:", v5);
    v7 = self->mDownloadedLargeImageFileStore;
    self->mDownloadedLargeImageFileStore = v6;

    mDownloadedLargeImageFileStore = self->mDownloadedLargeImageFileStore;
  }
  return mDownloadedLargeImageFileStore;
}

- (LUIReachability)reachability
{
  LUIReachability *reachability;
  LUIReachability *v4;
  LUIReachability *v5;

  reachability = self->_reachability;
  if (!reachability)
  {
    v4 = (LUIReachability *)objc_claimAutoreleasedReturnValue(+[LUIReachability reachabilityForInternetConnection](LUIReachability, "reachabilityForInternetConnection"));
    v5 = self->_reachability;
    self->_reachability = v4;

    reachability = self->_reachability;
  }
  return reachability;
}

- (id)_systemGroupContainerURLWithGroupIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 1;
  v3 = container_system_group_path_for_identifier(0, objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &v15);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));

    free(v4);
  }
  else
  {
    v7 = qword_100088F28;
    if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_ERROR))
      sub_10003B694((uint64_t)&v15, v7, v8, v9, v10, v11, v12, v13);
    v6 = 0;
  }
  return v6;
}

- (id)_urlForDestination:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache systemGroupContainerURL](self, "systemGroupContainerURL"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache loginUIContainerURL](self, "loginUIContainerURL"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_fileStoreForDestination:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache downloadedMediumImageFileStore](self, "downloadedMediumImageFileStore"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache downloadedLargeImageFileStore](self, "downloadedLargeImageFileStore"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_cacheForDestination:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache mediumImageCache](self, "mediumImageCache"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache largeImageCache](self, "largeImageCache"));
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_imageFromFileWrapper:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "regularFileContents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v3));

  return v4;
}

- (id)_fileWrapperFromImage:(id)a3
{
  UIImage *v3;
  NSData *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (UIImage *)a3;
  v4 = UIImagePNGRepresentation(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(objc_alloc((Class)NSFileWrapper), "initRegularFileWithContents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage accessibilityIdentifier](v3, "accessibilityIdentifier"));

  objc_msgSend(v6, "setPreferredFilename:", v7);
  return v6;
}

- (void)_cachedImageForURL:(id)a3 fromDestionation:(int64_t)a4 scaleToSquareImage:(BOOL)a5 withCompletionHandler:(id)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void (**v19)(id, id);

  v6 = a5;
  v19 = (void (**)(id, id))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sha1Hash"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _fileStoreForDestination:](self, "_fileStoreForDestination:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _cacheForDestination:](self, "_cacheForDestination:", a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fileCache:loadFileWrapperNamed:", v13, v11));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _imageFromFileWrapper:](self, "_imageFromFileWrapper:", v14));
      v16 = v15;
      if (v6 && v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageManipulation sharedInstance](LUIImageManipulation, "sharedInstance"));
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "squareImageFromImage:", v16));

      }
      else
      {
        v18 = v15;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  v19[2](v19, v18);

}

- (void)_cacheDownloadedImage:(id)a3 toDestionation:(int64_t)a4 forURL:(id)a5 scaleToSquareImage:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v18 = a3;
  v10 = a5;
  if (v18 && v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageManipulation sharedInstance](LUIImageManipulation, "sharedInstance"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "squareImageFromImage:", v18));

    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
  v12 = v18;
  if (v12)
  {
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sha1Hash"));

    objc_msgSend(v12, "setAccessibilityIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _fileWrapperFromImage:](self, "_fileWrapperFromImage:", v12));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _fileStoreForDestination:](self, "_fileStoreForDestination:", a4));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _cacheForDestination:](self, "_cacheForDestination:", a4));
    objc_msgSend(v16, "fileCache:storeFileWrapper:", v17, v15);

  }
LABEL_7:

}

- (void)_downloadImageInURL:(id)a3 toDestination:(int64_t)a4 scaleToSquareImage:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  BOOL v22;

  v10 = a3;
  v11 = a6;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _urlForDestination:](self, "_urlForDestination:", a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sha1Hash"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v14));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001385C;
    v17[3] = &unk_1000690F0;
    v17[4] = self;
    v21 = a4;
    v18 = v10;
    v22 = a5;
    v19 = v15;
    v20 = v11;
    v16 = v15;
    +[CRKStudentDaemonProxy fetchResourceFromURL:completion:](CRKStudentDaemonProxy, "fetchResourceFromURL:completion:", v18, v17);

  }
}

- (void)fetchImageForURL:(id)a3 toDestination:(int64_t)a4 scaleToSquareImage:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  LUIPersistentImageCache *v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (v10 && v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _urlForDestination:](self, "_urlForDestination:", a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sha1Hash"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v15));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100013AD0;
    v18[3] = &unk_100069118;
    v22 = v12;
    v19 = v16;
    v20 = self;
    v21 = v10;
    v23 = a4;
    v24 = v7;
    v17 = v16;
    -[LUIPersistentImageCache _cachedImageForURL:fromDestionation:scaleToSquareImage:withCompletionHandler:](self, "_cachedImageForURL:fromDestionation:scaleToSquareImage:withCompletionHandler:", v21, a4, v7, v18);

  }
}

- (void)fetchImagesAsyncForUsers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[LUIPersistentImageCache _addImageFetchOperationToQueueForUser:imageSize:](self, "_addImageFetchOperationToQueueForUser:imageSize:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cancelAllPendingImageFetchOperations
{
  -[CATOperationQueue cancelAllOperations](self->mCATOperationQueue, "cancelAllOperations");
}

- (void)_addImageFetchOperationToQueueForUser:(id)a3 imageSize:(unint64_t)a4
{
  id v6;
  LUIFetchUserImageOperation *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v6 = a3;
  v7 = -[LUIFetchUserImageOperation initWithUser:imageSize:]([LUIFetchUserImageOperation alloc], "initWithUser:imageSize:", v6, a4);
  v8 = (void *)objc_opt_new(CATBlockOperationObserver);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013CD8;
  v10[3] = &unk_100069140;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  objc_msgSend(v8, "setDidFinish:", v10);
  -[LUIFetchUserImageOperation addObserver:](v7, "addObserver:", v8);
  -[CATOperationQueue addOperation:](self->mCATOperationQueue, "addOperation:", v7);

}

- (void)_imageFetchDidFinishForOperation:(id)a3 user:(id)a4 imageSize:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  if (-[LUIPersistentImageCache _isNSURLDomainTimeoutError:](self, "_isNSURLDomainTimeoutError:", v10))
  {
    v11 = (uint64_t)objc_msgSend(v9, "retryCount");

    if (v11 <= 9)
    {
      v12 = qword_100088F28;
      if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Image Fetch request timed out. Retrying...", buf, 2u);
      }
      -[LUIPersistentImageCache _addImageFetchOperationToQueueForUser:imageSize:](self, "_addImageFetchOperationToQueueForUser:imageSize:", v9, a5);
      objc_msgSend(v9, "setRetryCount:", (char *)objc_msgSend(v9, "retryCount") + 1);
      goto LABEL_22;
    }
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
  if (-[LUIPersistentImageCache _isNSURLDomainNoInternetError:](self, "_isNSURLDomainNoInternetError:", v13))
  {
    v14 = (uint64_t)objc_msgSend(v9, "retryCount");

    if (v14 <= 9)
    {
      v15 = (void *)qword_100088F28;
      if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
        *(_DWORD *)buf = 138412290;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Image Fetch request failed due to no network: %@. Will retry after network is back", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache reachability](self, "reachability"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000140D4;
      v28[3] = &unk_100069168;
      objc_copyWeak(v30, (id *)buf);
      v19 = v9;
      v29 = v19;
      v30[1] = (id)a5;
      objc_msgSend(v18, "waitForNetworkAndExecuteBlock:", v28);

      objc_msgSend(v19, "setRetryCount:", (char *)objc_msgSend(v19, "retryCount") + 1);
      objc_destroyWeak(v30);
      objc_destroyWeak((id *)buf);
      goto LABEL_22;
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

  v21 = (void *)qword_100088F28;
  if (v20)
  {
    if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
      *(_DWORD *)buf = 138478083;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetch image operation finished for user: %{private}@ with error: %@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEBUG))
  {
    sub_10003B834(v21, v9);
  }
  v25 = a5 == 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resultObject"));
  if (v25)
    objc_msgSend(v9, "setLocalMediumImageURL:", v26);
  else
    objc_msgSend(v9, "setLocalLargeImageURL:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
  objc_msgSend(v27, "updateContactImageDataForUser:", v9);

  objc_msgSend(v9, "setRetryCount:", 0);
LABEL_22:

}

- (BOOL)_isNSURLDomainTimeoutError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", NSURLErrorDomain))
      v6 = objc_msgSend(v4, "code") == (id)-1001;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isNSURLDomainNoInternetError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", NSURLErrorDomain))
      v6 = objc_msgSend(v4, "code") == (id)-1009;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fileCache:(id)a3 loadFileForIdentifier:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->mCATOperationQueue, 0);
  objc_storeStrong((id *)&self->mLoginUIContainerURL, 0);
  objc_storeStrong((id *)&self->mSystemGroupContainerURL, 0);
  objc_storeStrong((id *)&self->mLargeImageCache, 0);
  objc_storeStrong((id *)&self->mMediumImageCache, 0);
  objc_storeStrong((id *)&self->mDownloadedLargeImageFileStore, 0);
  objc_storeStrong((id *)&self->mDownloadedMediumImageFileStore, 0);
}

- (id)urlForAnonymousUserAvatar
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  LUIPersistentImageCache *v13;
  id v14;

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001439C;
  v12 = &unk_100068C30;
  v13 = self;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("AnonymousUserAvatarURL")));
  v3 = qword_100088D78;
  v4 = v14;
  if (v3 != -1)
    dispatch_once(&qword_100088D78, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPersistentImageCache _urlForDestination:](self, "_urlForDestination:", 1, v9, v10, v11, v12, v13));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("AnonymousUserAvatarURL"), "sha1Hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v6));

  return v7;
}

@end
