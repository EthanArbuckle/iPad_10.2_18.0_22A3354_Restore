@implementation FCReadingListFeedDescriptor

- (FCReadingListFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCReadingListFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    v15 = 2080;
    v16 = "FCPrivateZoneFeedDescriptor.m";
    v17 = 1024;
    v18 = 130;
    v19 = 2114;
    v20 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCReadingListFeedDescriptor initWithPrivateDataController:identifier:feedType:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (FCReadingListFeedDescriptor)initWithReadingList:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCReadingListFeedDescriptor;
  return -[FCPrivateZoneFeedDescriptor initWithPrivateDataController:identifier:feedType:](&v4, sel_initWithPrivateDataController_identifier_feedType_, a3, CFSTR("FCReading-List"), 4);
}

- (id)name
{
  return CFSTR("Saved");
}

- (id)backingHeadlineIDs
{
  void *v2;
  void *v3;

  -[FCReadingListFeedDescriptor readingList](self, "readingList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSortedArticleIDsInReadingList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
