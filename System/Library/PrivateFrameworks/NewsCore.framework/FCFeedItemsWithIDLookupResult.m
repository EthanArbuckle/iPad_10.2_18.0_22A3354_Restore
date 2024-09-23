@implementation FCFeedItemsWithIDLookupResult

- (FCFeedItemsWithIDLookupResult)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemsWithIDLookupResult init]";
    v9 = 2080;
    v10 = "FCChannelSectionHeadlinesFetchOperation.m";
    v11 = 1024;
    v12 = 88;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedItemsWithIDLookupResult init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCFeedItemsWithIDLookupResult)initWithSectionIDByFeedID:(id)a3 feedItems:(id)a4
{
  id v6;
  id v7;
  FCFeedItemsWithIDLookupResult *v8;
  uint64_t v9;
  NSDictionary *sectionIDsByFeedID;
  uint64_t v11;
  NSArray *feedItems;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCFeedItemsWithIDLookupResult;
  v8 = -[FCFeedItemsWithIDLookupResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sectionIDsByFeedID = v8->_sectionIDsByFeedID;
    v8->_sectionIDsByFeedID = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    feedItems = v8->_feedItems;
    v8->_feedItems = (NSArray *)v11;

  }
  return v8;
}

- (NSDictionary)sectionIDsByFeedID
{
  return self->_sectionIDsByFeedID;
}

- (void)setSectionIDsByFeedID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIDsByFeedID, a3);
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
  objc_storeStrong((id *)&self->_feedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_sectionIDsByFeedID, 0);
}

@end
