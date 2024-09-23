@implementation WKBackForwardListItem

- (uint64_t)safari_bookmarkID
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_getAssociatedObject(a1, (const void *)bookmarkIDKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (void)safari_setBookmarkID:(void *)a1
{
  const void *v3;
  id v4;

  if (a1)
  {
    v3 = (const void *)bookmarkIDKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v3, v4, (void *)1);

  }
}

- (uint64_t)safari_navigationSnapshotRequiresBars
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_getAssociatedObject(a1, (const void *)navigationSnapshotRequiresBarsKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)safari_setNavigationSnapshotRequiresBars:(void *)a1
{
  const void *v3;
  id v4;

  if (a1)
  {
    v3 = (const void *)navigationSnapshotRequiresBarsKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v3, v4, (void *)3);

  }
}

- (id)safari_urlForDisplay
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    objc_msgSend(a1, "URL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bookmarkWithID:", -[WKBackForwardListItem safari_bookmarkID](a1));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "isReadingListItem"))
      {
        objc_msgSend(v4, "nextPageURLs");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "resourceSpecifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allKeysForObject:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
          objc_msgSend(v7, "firstObject");
        else
          objc_msgSend(v4, "address");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_bestURLForUserTypedString");
        v9 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v9;
      }

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
