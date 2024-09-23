@implementation WebBookmarkCollection

+ (void)observeDatabaseVacuumNotification
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v0 = objc_opt_self();
  if (!databaseVacuumDistributedNotificationToken)
  {
    v1 = v0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0DCCC08];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__WebBookmarkCollection_SafariExtras__observeDatabaseVacuumNotification__block_invoke;
    v7[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    v7[4] = v1;
    objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)databaseVacuumDistributedNotificationToken;
    databaseVacuumDistributedNotificationToken = v5;

  }
}

+ (void)_startBookmarkCollectionOpenRetryTimer
{
  uint64_t v0;
  uint64_t v1;
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  v0 = objc_opt_self();
  if (!bookmarkCollectionOpenRetryTimer)
  {
    v1 = v0;
    v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v3 = (void *)bookmarkCollectionOpenRetryTimer;
    bookmarkCollectionOpenRetryTimer = (uint64_t)v2;

    v4 = bookmarkCollectionOpenRetryTimer;
    v5 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v4, v5, 0x2540BE400uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __77__WebBookmarkCollection_SafariExtras___startBookmarkCollectionOpenRetryTimer__block_invoke;
    handler[3] = &__block_descriptor_40_e5_v8__0l;
    handler[4] = v1;
    dispatch_source_set_event_handler((dispatch_source_t)bookmarkCollectionOpenRetryTimer, handler);
    dispatch_resume((dispatch_object_t)bookmarkCollectionOpenRetryTimer);
  }
}

void __72__WebBookmarkCollection_SafariExtras__observeDatabaseVacuumNotification__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mainBookmarkCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v6 = v1;
    if ((postedBookmarkCollectionHasBecomeAvailableNotification & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = (const __CFString *)*MEMORY[0x1E0DCCC00];
      v5 = v6;
    }
    else
    {
      postedBookmarkCollectionHasBecomeAvailableNotification = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("bookmarkCollectionHasBecomeAvailableNotification");
      v5 = 0;
    }
    objc_msgSend(v2, "postNotificationName:object:", v4, v5);

    v1 = v6;
  }

}

+ (void)stopObservingDatabaseVacuumNotification
{
  void *v0;
  void *v1;

  objc_opt_self();
  if (databaseVacuumDistributedNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "removeObserver:name:object:", databaseVacuumDistributedNotificationToken, *MEMORY[0x1E0DCCC08], 0);

    v1 = (void *)databaseVacuumDistributedNotificationToken;
    databaseVacuumDistributedNotificationToken = 0;

  }
}

void __77__WebBookmarkCollection_SafariExtras___startBookmarkCollectionOpenRetryTimer__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mainBookmarkCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[WebBookmarkCollection _stopBookmarkCollectionOpenRetryTimer]();
    if ((postedBookmarkCollectionHasBecomeAvailableNotification & 1) == 0)
    {
      postedBookmarkCollectionHasBecomeAvailableNotification = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "postNotificationName:object:", CFSTR("bookmarkCollectionHasBecomeAvailableNotification"), 0);

    }
  }
}

+ (void)_stopBookmarkCollectionOpenRetryTimer
{
  void *v0;

  objc_opt_self();
  if (bookmarkCollectionOpenRetryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)bookmarkCollectionOpenRetryTimer);
    v0 = (void *)bookmarkCollectionOpenRetryTimer;
    bookmarkCollectionOpenRetryTimer = 0;

  }
}

+ (PPTWebBookmarkCollection)bookmarkCollectionForPPTTest
{
  PPTWebBookmarkCollection *v0;
  void *v1;
  PPTWebBookmarkCollection *v2;
  void *v3;
  uint64_t v4;
  BookmarkImporter *v5;

  objc_opt_self();
  objc_msgSend((id)objc_opt_class(), "lockSync");
  v0 = [PPTWebBookmarkCollection alloc];
  objc_msgSend(MEMORY[0x1E0DCCB18], "inMemoryBookmarkCollectionConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PPTWebBookmarkCollection initWithConfiguration:](v0, "initWithConfiguration:", v1);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DidImportBuiltinBookmarks"));
  objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("DidImportBuiltinBookmarks"));
  v5 = -[BookmarkImporter initWithBookmarkCollection:]([BookmarkImporter alloc], "initWithBookmarkCollection:", v2);
  -[BookmarkImporter importBuiltinBookmarks](v5, "importBuiltinBookmarks");
  objc_msgSend(v3, "setBool:forKey:", v4, CFSTR("DidImportBuiltinBookmarks"));
  -[PPTWebBookmarkCollection test_restoreMissingSpecialBookmarks](v2, "test_restoreMissingSpecialBookmarks");
  objc_msgSend((id)objc_opt_class(), "unlockSync");

  return v2;
}

+ (void)test_overrideMainBookmarkCollection
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E9CFDBB0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Safari/iOS/MobileSafari/SafariWebBookmarkCollectionExtras.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "[UIApplication sharedApplication].launchedToTest", "+[WebBookmarkCollection(SafariExtras) test_overrideMainBookmarkCollection]", v3, 185, v5);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "[UIApplication sharedApplication].launchedToTest", "+[WebBookmarkCollection(SafariExtras) test_overrideMainBookmarkCollection]", v3, 185, &stru_1E9CFDBB0);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog((NSString *)CFSTR("%@\n%@"), v4, v6);

  abort();
}

- (void)saveReadingListBookmarkWithTitle:(void *)a3 address:
{
  if (result)
    return (void *)-[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](result, a2, a3, 0, 0, 0, 0, 0, 0, 0, 1u);
  return result;
}

- (uint64_t)saveReadingListBookmarkWithTitle:(void *)a3 address:(void *)a4 previewText:(void *)a5 thumbnailURL:(void *)a6 siteName:(void *)a7 tabDocument:(int)a8 didFetchPage:(void *)a9 updateController:(_DWORD *)a10 savedBookmarkID:(unsigned __int8)a11 shouldFetchMetadata:
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  int v46;
  id v47;
  uint8_t buf[15];
  unsigned __int8 v49;

  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a9;
  if (!a1)
  {
    v49 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_opt_class(), "lockSync") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DCCB50], "defaultReadingList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v29, "addReadingListItemWithURL:title:previewText:error:", v19, v18, v20, 0);

LABEL_10:
    v25 = v18;
    goto LABEL_30;
  }
  v46 = a8;
  v47 = v22;
  objc_msgSend(MEMORY[0x1E0DCCB98], "_trimmedTitle:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DCCB98], "_trimmedPreviewText:", v20);
    v26 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v26;
  }
  objc_msgSend(v19, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstReadingListBookmarkWithURLMatchingString:prefixMatch:", v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[WebBookmarkCollection _markDuplicateReadingListBookmarkUnread:updatingController:](a1, v28, v24);
    objc_msgSend((id)objc_opt_class(), "unlockSync");
    if (a10)
      *a10 = objc_msgSend(v28, "identifier");
    v49 = 1;
  }
  else
  {
    v45 = v21;
    v30 = objc_alloc(MEMORY[0x1E0DCCB98]);
    objc_msgSend(v19, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initReadingListBookmarkWithTitle:address:previewText:", v25, v31, v20);

    objc_msgSend(a1, "readingListFolder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "moveBookmark:toFolderWithID:", v32, objc_msgSend(v33, "identifier"));

    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setDateLastFetched:", v34);

    }
    objc_msgSend(v32, "setAddedLocally:", 1);
    if (v45)
    {
      objc_msgSend(v45, "safari_originalDataAsString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setReadingListIconURL:", v35);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "_sf_shouldAutomaticallyDownloadReadingListItems");

    if (v23 && (objc_msgSend(v23, "isReaderAvailable") & 1) == 0 && ((v37 ^ 1) & 1) == 0)
      -[WebBookmarkCollection _saveWebArchiveForTabDocument:bookmark:]((uint64_t)a1, v23, v32);
    objc_msgSend(a1, "saveBookmark:", v32);
    if (((a11 ^ 1 | v37) & 1) == 0)
    {
      +[ReadingListMetadataFetcher sharedMetadataFetcher](ReadingListMetadataFetcher, "sharedMetadataFetcher");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v46)
        v40 = v23;
      else
        v40 = 0;
      objc_msgSend(v38, "fetchMetadataForReadingListBookmark:withProvider:", v32, v40);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "postNotificationName:object:", CFSTR("ReadingListBookmarkAddedNotification"), 0);

    +[Application sharedApplication](Application, "sharedApplication");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setReadingListWidgetNeedsReload");

    v43 = WBS_LOG_CHANNEL_PREFIXWidgets();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v43, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item addition", buf, 2u);
    }
    objc_msgSend((id)objc_opt_class(), "unlockSync");
    v22 = v47;
    if (a10)
      *a10 = objc_msgSend(v32, "identifier");
    v49 = 1;

    v21 = v45;
  }

LABEL_30:
  return v49;
}

- (void)_saveWebArchiveForTabDocument:(void *)a3 bookmark:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "webarchivePathInReaderForm:fileExists:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v10, 0);

    if (v11)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = *MEMORY[0x1E0DC4878];
      v12 = MEMORY[0x1E0C809B0];
      v13 = (void *)*MEMORY[0x1E0DC4730];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke;
      v19[3] = &unk_1E9CF1780;
      v19[4] = &v20;
      v14 = objc_msgSend(v13, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.SaveWebArchive"), v19);
      v21[3] = v14;
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke_2;
      v15[3] = &unk_1E9CF9DD8;
      v16 = v7;
      v17 = a1;
      v18 = &v20;
      objc_msgSend(v5, "saveWebArchiveToPath:completion:", v8, v15);

      _Block_object_dispose(&v20, 8);
    }

  }
}

void __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke(uint64_t a1)
{
  NSLog((NSString *)CFSTR("Background task expired while waiting for current page's webarchive to save."));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
}

uint64_t __78__WebBookmarkCollection_SafariExtras___saveWebArchiveForTabDocument_bookmark___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setArchiveStatus:", 1);
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateLastArchived:", v4);

    if (objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync"))
    {
      objc_msgSend(*(id *)(a1 + 40), "saveBookmark:", *(_QWORD *)(a1 + 32));
    }
    else if (objc_msgSend((id)objc_opt_class(), "lockSync"))
    {
      objc_msgSend(*(id *)(a1 + 40), "saveBookmark:", *(_QWORD *)(a1 + 32));
      objc_msgSend((id)objc_opt_class(), "unlockSync");
    }
  }
  result = objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *MEMORY[0x1E0DC4878];
  return result;
}

- (void)_markDuplicateReadingListBookmarkUnread:(void *)a3 updatingController:
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  if (a1)
  {
    v12 = v5;
    v6 = a3;
    v7 = objc_msgSend(v6, "showingAllBookmarks");
    if ((v7 & 1) != 0
      || v6
      && (objc_msgSend(v12, "dateLastViewed"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      v9 = objc_msgSend(a1, "indexOfReadingListBookmark:countingOnlyUnread:", v12, v7 ^ 1u);
    }
    else
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateAdded:", v10);

    objc_msgSend(v12, "setReadingListDateLastViewed:", 0);
    objc_msgSend(a1, "saveBookmark:", v12);
    objc_msgSend(a1, "readingListWithUnreadOnly:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reorderBookmark:toIndex:", v12, objc_msgSend(v11, "bookmarkCount") - 1);

    objc_msgSend(v6, "didMarkBookmarkUnreadAtIndex:", v9);
    v5 = v12;
  }

}

- (uint64_t)updateBookmark:(void *)a3 withLeadImageURL:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "localAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "safari_originalDataAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("leadImageURL"));

    objc_msgSend(v5, "setLocalAttributes:", v8);
    if (objc_msgSend((id)objc_opt_class(), "lockSync"))
    {
      v10 = objc_msgSend(a1, "saveBookmark:", v5);
      objc_msgSend((id)objc_opt_class(), "unlockSync");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)leadImageURLForBookmark:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "localAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leadImageURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)markReadingListBookmark:(int)a3 asRead:(int)a4 postNotification:
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  int v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (!a1)
    goto LABEL_27;
  objc_msgSend(v7, "dateLastViewed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v9 == 0) ^ a3;

  if ((v10 & 1) != 0)
  {
LABEL_3:
    v11 = 1;
    goto LABEL_4;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReadingListDateLastViewed:", v13);

  }
  else
  {
    objc_msgSend(v8, "setReadingListDateLastViewed:", 0);
  }
  if ((objc_msgSend((id)objc_opt_class(), "lockSync") & 1) == 0)
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInMemoryBookmarkChangeTrackingAvailable");

    if (v18)
    {
      objc_msgSend(a1, "modifyBookmarkInMemory:", v8);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "postNotificationName:object:", CFSTR("ReadingListBookmarkDidUpdateNotification"), v8);

      }
      +[Application sharedApplication](Application, "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setReadingListWidgetNeedsReload");

      v21 = WBS_LOG_CHANNEL_PREFIXWidgets();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFSTR("unread");
        if (a3)
          v22 = CFSTR("read");
        v26 = 138477827;
        v27 = v22;
        _os_log_impl(&dword_1D7CA3000, v21, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_3;
    }
    +[Application sharedApplication](Application, "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setReadingListWidgetNeedsReload");

    v24 = WBS_LOG_CHANNEL_PREFIXWidgets();
    v11 = 0;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v25 = CFSTR("unread");
    if (a3)
      v25 = CFSTR("read");
    v26 = 138477827;
    v27 = v25;
    _os_log_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
LABEL_27:
    v11 = 0;
    goto LABEL_4;
  }
  v11 = objc_msgSend(a1, "saveBookmark:", v8);
  if ((_DWORD)v11 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("ReadingListBookmarkDidUpdateNotification"), v8);

  }
  objc_msgSend((id)objc_opt_class(), "unlockSync");
  WBSReloadReadingListWidget();
  v15 = WBS_LOG_CHANNEL_PREFIXWidgets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("unread");
    if (a3)
      v16 = CFSTR("read");
    v26 = 138477827;
    v27 = v16;
    _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item being marked %{private}@", (uint8_t *)&v26, 0xCu);
  }
LABEL_4:

  return v11;
}

- (uint64_t)updateReadingListBookmarkWithID:(void *)a3 setTitle:(void *)a4 address:(void *)a5 previewText:(void *)a6 thumbnailURL:(void *)a7 siteName:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a1 && objc_msgSend((id)objc_opt_class(), "lockSync"))
  {
    objc_msgSend(a1, "bookmarkWithID:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v28 = 0;
      objc_msgSend(v18, "webarchivePathInReaderForm:fileExists:", 0, &v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByDeletingPathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28
        && (objc_msgSend(v21, "stringByRemovingPercentEncoding"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v14, "containsString:", v22),
            v22,
            (v23 & 1) != 0))
      {
        v24 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTitle:previewText:dateLastFetched:", v13, v15, v25);

        objc_msgSend(v19, "setAddress:", v14);
        if (v16)
          objc_msgSend(v19, "setReadingListIconURL:", v16);
        v24 = objc_msgSend(a1, "saveBookmark:", v19);
        if ((_DWORD)v24)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "postNotificationName:object:", CFSTR("ReadingListBookmarkDidUpdateNotification"), v19);

        }
      }
      objc_msgSend((id)objc_opt_class(), "unlockSync");

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "unlockSync");
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)dropBookmarks:(uint64_t)a3 inFolderWithID:(void *)a4 presentingViewController:(int)a5 isAddingBookmark:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  if (a1 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "lockBookmarks") & 1) != 0)
    {
      if ((objc_msgSend(v10, "isEditing") & 1) == 0)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0D89D00]);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __110__WebBookmarkCollection_SafariExtras__dropBookmarks_inFolderWithID_presentingViewController_isAddingBookmark___block_invoke;
        v23[3] = &unk_1E9CF1900;
        v24 = v11;
        objc_msgSend(v12, "setHandler:", v23);

      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(a1, "saveAndMoveBookmark:toFolderID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), a3, (_QWORD)v19);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v15);
      }

      if (!a5)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didAddBookmarkWithMethod:", 2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, v10);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didPreventBookmarkActionWithBookmarkType:actionType:", 0, 3);
    }

LABEL_17:
  }

}

uint64_t __110__WebBookmarkCollection_SafariExtras__dropBookmarks_inFolderWithID_presentingViewController_isAddingBookmark___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockBookmarksSoon");
}

- (uint64_t)dropOperationForReadingListDropSession:(uint64_t)result
{
  void *v2;
  int v3;

  if (result)
  {
    objc_msgSend(a2, "items");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_56);

    if (v3)
      return 2;
    else
      return 0;
  }
  return result;
}

- (void)dropDragItemsInReadingList:(void *)a3 updatingController:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_68_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__WebBookmarkCollection_SafariExtras__dropDragItemsInReadingList_updatingController___block_invoke;
    v8[3] = &unk_1E9CF58F8;
    v8[4] = a1;
    v9 = v5;
    objc_msgSend(v6, "_sf_urlsFromDragItems:completionHandler:", v7, v8);

  }
}

void __85__WebBookmarkCollection_SafariExtras__dropDragItemsInReadingList_updatingController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "_title");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (__CFString *)v10;
        else
          v12 = &stru_1E9CFDBB0;
        v13 = -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](v9, v12, v8, 0, 0, 0, 0, 0, *(void **)(a1 + 40), 0, 1u);

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "didAddReadingListItemWithMethod:", 1);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

@end
