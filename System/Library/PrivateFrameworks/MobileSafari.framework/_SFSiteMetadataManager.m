@implementation _SFSiteMetadataManager

+ (id)sharedSiteMetadataManager
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;

  v2 = (void *)sharedSiteMetadataManager;
  if (!sharedSiteMetadataManager)
  {
    WeakRetained = objc_loadWeakRetained(&sharedSiteMetadataManagerProvider);
    objc_storeWeak(&sharedSiteMetadataManagerProvider, 0);
    v4 = objc_msgSend(WeakRetained, "newSharedSiteMetadataManager");
    v5 = (void *)sharedSiteMetadataManager;
    sharedSiteMetadataManager = v4;

    v2 = (void *)sharedSiteMetadataManager;
  }
  return v2;
}

- (WBSTabGroupTouchIconProvider)tabGroupIconProvider
{
  return self->_tabGroupIconProvider;
}

+ (void)setSharedSiteMetadataManager:(id)a3
{
  objc_storeStrong((id *)&sharedSiteMetadataManager, a3);
}

- (_SFSiteMetadataManager)initWithInjectedBundleURL:(id)a3 imageCacheDirectoryURL:(id)a4 cacheIsReadOnly:(BOOL)a5 metadataType:(unint64_t)a6
{
  __int16 v6;
  _BOOL8 v7;
  id v10;
  _SFSiteMetadataManager *v11;
  _SFBookmarkFolderTouchIconProvider *v12;
  WBSTabGroupTouchIconProvider *v13;
  WBSTabGroupTouchIconProvider *tabGroupIconProvider;
  WBSTabGroupTouchIconProvider *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  WBSLPLinkMetadataProvider *linkPresentationMetadataProvider;
  _SFSiteMetadataManager *v25;
  _SFTouchIconCache *v27;
  void *v28;
  uint64_t v29;
  _SFTouchIconCache *touchIconCache;
  id v31;
  void *v32;
  uint64_t v33;
  WBSLeadImageCache *leadImageCache;
  id v35;
  void *v36;
  uint64_t v37;
  WBSLinkPresentationIconCache *linkPresentationIconCache;
  _SFSavedAccountTouchIconCache *v39;
  void *v40;
  uint64_t v41;
  _SFSavedAccountTouchIconCache *savedAccountTouchIconCache;
  void *v43;
  void *v44;
  double v45;
  double v46;
  _SFFaviconProvider *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  _SFFaviconProvider *faviconProvider;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  id v61;
  objc_super v62;
  _QWORD block[4];
  id v64;
  _QWORD v65[2];

  v6 = a6;
  v7 = a5;
  v65[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)_SFSiteMetadataManager;
  v11 = -[WBSSiteMetadataManager initWithInjectedBundleURL:](&v62, sel_initWithInjectedBundleURL_, a3);
  if (v11)
  {
    if ((v6 & 1) != 0)
    {
      v12 = objc_alloc_init(_SFBookmarkFolderTouchIconProvider);
      -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v12);

    }
    if ((v6 & 0x40) != 0)
    {
      v13 = (WBSTabGroupTouchIconProvider *)objc_alloc_init(MEMORY[0x1E0D8AD10]);
      tabGroupIconProvider = v11->_tabGroupIconProvider;
      v11->_tabGroupIconProvider = v13;
      v15 = v13;

      -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v15);
    }
    v16 = v10;
    dispatch_get_global_queue(17, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ensureImageCacheDirectory_block_invoke;
    block[3] = &unk_1E21E2050;
    v64 = v16;
    dispatch_async(v17, block);

    if ((v6 & 2) != 0)
    {
      v27 = [_SFTouchIconCache alloc];
      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Touch Icons"), 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[WBSTouchIconCache initWithCacheDirectoryURL:isReadOnly:](v27, "initWithCacheDirectoryURL:isReadOnly:", v28, v7);
      touchIconCache = v11->_touchIconCache;
      v11->_touchIconCache = (_SFTouchIconCache *)v29;

      -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_touchIconCache);
      if ((v6 & 0x10) == 0)
      {
LABEL_8:
        if ((v6 & 0x20) == 0)
          goto LABEL_9;
        goto LABEL_17;
      }
    }
    else if ((v6 & 0x10) == 0)
    {
      goto LABEL_8;
    }
    v31 = objc_alloc(MEMORY[0x1E0D8A9F8]);
    objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Lead Images"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithImageDirectoryURL:", v32);
    leadImageCache = v11->_leadImageCache;
    v11->_leadImageCache = (WBSLeadImageCache *)v33;

    -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_leadImageCache);
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
LABEL_17:
    v35 = objc_alloc(MEMORY[0x1E0D8AA10]);
    objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("Link Presentation Icons"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "initWithImageDirectoryURL:", v36);
    linkPresentationIconCache = v11->_linkPresentationIconCache;
    v11->_linkPresentationIconCache = (WBSLinkPresentationIconCache *)v37;

    -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_linkPresentationIconCache);
    if ((v6 & 4) == 0)
    {
LABEL_10:
      if ((v6 & 8) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
LABEL_18:
    v39 = [_SFSavedAccountTouchIconCache alloc];
    objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Password Icons"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[WBSTouchIconCache initWithCacheDirectoryURL:isReadOnly:protectionType:allowFetchingOverCellularNetwork:fileMappingStyle:canFetchOutsideOfUserLoadedWebpage:](v39, "initWithCacheDirectoryURL:isReadOnly:protectionType:allowFetchingOverCellularNetwork:fileMappingStyle:canFetchOutsideOfUserLoadedWebpage:", v40, 0, 3, 0, 1, 1);
    savedAccountTouchIconCache = v11->_savedAccountTouchIconCache;
    v11->_savedAccountTouchIconCache = (_SFSavedAccountTouchIconCache *)v41;

    -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_savedAccountTouchIconCache);
    if ((v6 & 8) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
      {
LABEL_13:
        v25 = v11;
        goto LABEL_14;
      }
LABEL_12:
      v19 = objc_alloc(MEMORY[0x1E0D8A9E8]);
      v20 = (void *)MEMORY[0x1E0C99E98];
      _SFSafariMetadataCacheDirectoryPath();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fileURLWithPath:isDirectory:", v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "initWithCacheDirectoryURL:", v22);
      linkPresentationMetadataProvider = v11->_linkPresentationMetadataProvider;
      v11->_linkPresentationMetadataProvider = (WBSLPLinkMetadataProvider *)v23;

      -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_linkPresentationMetadataProvider);
      goto LABEL_13;
    }
LABEL_19:
    objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Favicons"), 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "scale");
    v46 = v45;

    v47 = [_SFFaviconProvider alloc];
    objc_msgSend(MEMORY[0x1E0D8A8E0], "defaultFaviconSize");
    v49 = v48;
    v51 = v50;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v18;
    v58 = 3221225472;
    v59 = __104___SFSiteMetadataManager_initWithInjectedBundleURL_imageCacheDirectoryURL_cacheIsReadOnly_metadataType___block_invoke;
    v60 = &unk_1E21E5AA8;
    v61 = v43;
    v54 = v43;
    v55 = -[_SFFaviconProvider initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:](v47, "initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:", v54, CFSTR("Favicons"), v53, v7, &v57, v49, v51, v46);
    faviconProvider = v11->_faviconProvider;
    v11->_faviconProvider = (_SFFaviconProvider *)v55;

    -[WBSFaviconProvider setUpWithCompletionHandler:](v11->_faviconProvider, "setUpWithCompletionHandler:", 0, v57, v58, v59, v60);
    -[WBSSiteMetadataManager registerSiteMetadataProvider:](v11, "registerSiteMetadataProvider:", v11->_faviconProvider);

    if ((v6 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_14:

  return v11;
}

- (void)scheduleLowPriorityRequestForBookmarks:(id)a3
{
  id v4;

  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_40);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[WBSSiteMetadataManager preloadRequests:withPriority:responseHandler:](self, "preloadRequests:withPriority:responseHandler:", v4, 0, 0);

}

+ (void)setSharedSiteMetadataManagerProvider:(id)a3
{
  objc_storeWeak(&sharedSiteMetadataManagerProvider, a3);
}

+ (BOOL)hasSharedSiteMetadataManager
{
  return sharedSiteMetadataManager != 0;
}

- (_SFFaviconProvider)faviconProvider
{
  return self->_faviconProvider;
}

- (_SFSavedAccountTouchIconCache)savedAccountTouchIconCache
{
  return self->_savedAccountTouchIconCache;
}

- (_SFTouchIconCache)touchIconCache
{
  return self->_touchIconCache;
}

- (WBSLeadImageCache)leadImageCache
{
  return self->_leadImageCache;
}

- (WBSLinkPresentationIconCache)linkPresentationIconCache
{
  return self->_linkPresentationIconCache;
}

- (WBSLPLinkMetadataProvider)linkPresentationMetadataProvider
{
  return self->_linkPresentationMetadataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationMetadataProvider, 0);
  objc_storeStrong((id *)&self->_linkPresentationIconCache, 0);
  objc_storeStrong((id *)&self->_leadImageCache, 0);
  objc_storeStrong((id *)&self->_touchIconCache, 0);
  objc_storeStrong((id *)&self->_savedAccountTouchIconCache, 0);
  objc_storeStrong((id *)&self->_faviconProvider, 0);
  objc_storeStrong((id *)&self->_tabGroupIconProvider, 0);
}

@end
