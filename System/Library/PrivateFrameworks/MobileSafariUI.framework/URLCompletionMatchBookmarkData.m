@implementation URLCompletionMatchBookmarkData

- (URLCompletionMatchBookmarkData)initWithBookmark:(id)a3
{
  id v5;
  URLCompletionMatchBookmarkData *v6;
  URLCompletionMatchBookmarkData *v7;
  URLCompletionMatchBookmarkData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)URLCompletionMatchBookmarkData;
  v6 = -[URLCompletionMatchBookmarkData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmark, a3);
    v7->_shouldPreload = -[WebBookmark isBuiltinBookmark](v7->_bookmark, "isBuiltinBookmark") ^ 1;
    v7->_onlyContainsCloudTab = 0;
    v8 = v7;
  }

  return v7;
}

- (URLCompletionMatchBookmarkData)initWithCloudTab:(id)a3 deviceName:(id)a4
{
  id v7;
  URLCompletionMatchBookmarkData *v8;
  URLCompletionMatchBookmarkData *v9;
  URLCompletionMatchBookmarkData *v10;

  v7 = a4;
  v8 = -[URLCompletionMatchBookmarkData initWithBookmark:](self, "initWithBookmark:", a3);
  v9 = v8;
  if (v8)
  {
    v8->_onlyContainsCloudTab = 1;
    objc_storeStrong((id *)&v8->_cloudTabDeviceName, a4);
    v10 = v9;
  }

  return v9;
}

- (URLCompletionMatchBookmarkData)initWithBookmark:(id)a3 shouldPreload:(BOOL)a4
{
  URLCompletionMatchBookmarkData *v5;
  URLCompletionMatchBookmarkData *v6;
  URLCompletionMatchBookmarkData *v7;

  v5 = -[URLCompletionMatchBookmarkData initWithBookmark:](self, "initWithBookmark:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_shouldPreload |= a4;
    v7 = v5;
  }

  return v6;
}

- (id)_userVisibleURLString
{
  void *v2;
  id v3;
  void *v4;

  -[WebBookmark address](self->_bookmark, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_web_isUserVisibleURL"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_web_userVisibleString");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)originalURLString
{
  return (NSString *)-[WebBookmark address](self->_bookmark, "address");
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  return (id)-[WebBookmark title](self->_bookmark, "title", a3);
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  return (id)-[WebBookmark title](self->_bookmark, "title", a3);
}

- (BOOL)containsBookmark
{
  return !self->_onlyContainsCloudTab;
}

- (double)lastVisitedTimeInterval
{
  void *v3;
  double v4;
  double v5;

  if (!-[WebBookmark isReadingListItem](self->_bookmark, "isReadingListItem"))
    return 0.0;
  -[WebBookmark dateLastViewed](self->_bookmark, "dateLastViewed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (BOOL)lastVisitWasFailure
{
  return -[WebBookmark isReadingListItem](self->_bookmark, "isReadingListItem");
}

- (BOOL)visitWasClientError
{
  return 0;
}

- (id)matchDataByMergingWithMatchData:(id)a3
{
  id v4;
  char isKindOfClass;
  URLCompletionMatchBookmarkListData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = [URLCompletionMatchBookmarkListData alloc];
  if ((isKindOfClass & 1) != 0)
    v7 = -[URLCompletionMatchBookmarkListData initWithBookmarkData:andBookmarkData:](v6, "initWithBookmarkData:andBookmarkData:", self, v4);
  else
    v7 = -[URLCompletionMatchBookmarkListData initWithBookmarkData:historyMatchData:](v6, "initWithBookmarkData:historyMatchData:", self, v4);
  v8 = (void *)v7;

  return v8;
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  WebBookmark *bookmark;
  id v5;
  void *v6;
  char v7;

  v7 = 0;
  bookmark = self->_bookmark;
  v5 = a3;
  -[WebBookmark title](bookmark, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, char *))a3 + 2))(v5, v6, 0, &v7);

}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  id v5;
  void *v6;
  char v7;

  v7 = 0;
  v5 = a3;
  -[URLCompletionMatchBookmarkData _userVisibleURLString](self, "_userVisibleURLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, char *))a3 + 2))(v5, v6, 0, &v7);

}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  WebBookmark *bookmark;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v9 = 0;
  bookmark = self->_bookmark;
  v6 = a3;
  -[WebBookmark title](bookmark, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[URLCompletionMatchBookmarkData _userVisibleURLString](self, "_userVisibleURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, void *, _QWORD, char *))a3 + 2))(v6, v7, 0, v8, 0, &v9);

}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  return 0;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  return -1;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return -1;
}

- (float)_topSitesScoreAtTime:(double)a3
{
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  v4 = 0.0;
  if (-[WebBookmark isReadingListItem](self->_bookmark, "isReadingListItem"))
  {
    -[WebBookmark dateLastViewed](self->_bookmark, "dateLastViewed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    }
    else
    {
      -[WebBookmark dateAdded](self->_bookmark, "dateAdded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_7:

        return v4;
      }
      v8 = v7;
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");

    }
    -[WebBookmark address](self->_bookmark, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WBSTopSitesScore();
    v4 = v10;

    goto LABEL_7;
  }
  return v4;
}

- (BOOL)shouldPreload
{
  return self->_shouldPreload;
}

- (BOOL)onlyContainsCloudTab
{
  return self->_onlyContainsCloudTab;
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
}

@end
