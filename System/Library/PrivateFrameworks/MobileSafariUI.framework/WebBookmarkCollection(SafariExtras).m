@implementation WebBookmarkCollection(SafariExtras)

- (id)bookmarksInFavoritesList
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend((id)bookmarksInFavoritesListCache, "objectForKey:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "favoritesFolderList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "bookmarkCount") > 7)
      {
        if (!bookmarksInFavoritesListCache)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
          v8 = (void *)bookmarksInFavoritesListCache;
          bookmarksInFavoritesListCache = (uint64_t)v7;

          objc_msgSend((id)bookmarksInFavoritesListCache, "setCountLimit:", 1);
        }
        objc_msgSend(a1, "fastFetchBookmarksInBookmarkList:", v6);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)bookmarksInFavoritesListCache, "setObject:forKey:", v4, a1);
      }
      else
      {
        objc_msgSend(v6, "bookmarkArray");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)mainBookmarkCollection
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)mainBookmarkCollection;
  if (!mainBookmarkCollection)
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "safariBookmarkCollection");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)mainBookmarkCollection;
    mainBookmarkCollection = v1;

    if (!mainBookmarkCollection
      || (objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "addObserver:selector:name:object:", mainBookmarkCollection, sel_receivedBookmarksDidChangeNotification_, *MEMORY[0x1E0DCCC00], 0), objc_msgSend(v3, "addObserver:selector:name:object:", mainBookmarkCollection, sel_receivedBookmarksDidChangeNotification_, *MEMORY[0x1E0DCCC10], 0), v3, (v0 = (void *)mainBookmarkCollection) == 0))
    {
      +[WebBookmarkCollection _startBookmarkCollectionOpenRetryTimer]();
      v0 = (void *)mainBookmarkCollection;
    }
  }
  return v0;
}

- (uint64_t)receivedBookmarksDidChangeNotification:()SafariExtras
{
  return objc_msgSend((id)bookmarksInFavoritesListCache, "removeAllObjects");
}

@end
