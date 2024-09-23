@implementation SFSiteMetadataManager

id __65___SFSiteMetadataManager_scheduleLowPriorityRequestForBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") || objc_msgSend(v2, "isFolder"))
  {
    +[SFBookmarkTouchIconRequest requestWithBookmark:iconGenerationEnabled:](SFBookmarkTouchIconRequest, "requestWithBookmark:iconGenerationEnabled:", v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __104___SFSiteMetadataManager_initWithInjectedBundleURL_imageCacheDirectoryURL_cacheIsReadOnly_metadataType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("Favicons.db-journal"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

@end
