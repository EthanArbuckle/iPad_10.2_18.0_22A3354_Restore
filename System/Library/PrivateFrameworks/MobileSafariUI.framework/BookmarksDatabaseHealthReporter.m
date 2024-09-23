@implementation BookmarksDatabaseHealthReporter

- (id)_userDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

- (BOOL)_shouldReportDatabaseHealth
{
  double lastReportTimeInterval;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  lastReportTimeInterval = self->_lastReportTimeInterval;
  if (lastReportTimeInterval == 0.0)
  {
    -[BookmarksDatabaseHealthReporter _userDefaults](self, "_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sf_dateForKey:", CFSTR("LastBookmarksDatabaseHealthReportDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    self->_lastReportTimeInterval = v6;

    lastReportTimeInterval = self->_lastReportTimeInterval;
  }
  v7 = lastReportTimeInterval + 604800.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v7 < v9;

  return v10;
}

- (void)reportDatabaseHealth
{
  void *v3;
  uint64_t *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[5];

  if (-[BookmarksDatabaseHealthReporter _shouldReportDatabaseHealth](self, "_shouldReportDatabaseHealth"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v4 = (uint64_t *)MEMORY[0x1E0DC4878];
    self->_lastReportTimeInterval = v5;
    v6 = *v4;
    v7 = MEMORY[0x1E0C809B0];
    v8 = (void *)*MEMORY[0x1E0DC4730];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke;
    v15[3] = &__block_descriptor_40_e5_v8__0l;
    v15[4] = v6;
    v9 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.BookmarksDatabaseHealthReporter"), v15);
    dispatch_get_global_queue(17, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke_2;
    v12[3] = &unk_1E9CF2A58;
    v12[4] = self;
    v13 = v3;
    v14 = v9;
    v11 = v3;
    dispatch_async(v10, v12);

  }
}

uint64_t __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

void __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA8]), "initReadonlySafariBookmarkCollection");
  objc_msgSend(v7, "databaseHealthInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "topLevelDuplicateBookmarksCount");
  v4 = objc_msgSend(v2, "allDuplicateBookmarksCount");
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount:allDuplicatesCount:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("LastBookmarksDatabaseHealthReportDate"));
  objc_msgSend(v6, "synchronize");
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 48));

}

@end
