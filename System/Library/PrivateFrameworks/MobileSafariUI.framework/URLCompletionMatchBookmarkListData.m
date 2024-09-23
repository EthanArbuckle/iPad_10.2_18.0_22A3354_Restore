@implementation URLCompletionMatchBookmarkListData

- (BOOL)shouldPreload
{
  WBSURLCompletionMatchData *historyMatchData;
  void *v5;
  char v6;

  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
    return -[WBSURLCompletionMatchData shouldPreload](historyMatchData, "shouldPreload");
  -[NSMutableArray firstObject](self->_bookmarks, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBuiltinBookmark") ^ 1;

  return v6;
}

- (URLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 historyMatchData:(id)a4
{
  id v6;
  id v7;
  URLCompletionMatchBookmarkListData *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *bookmarks;
  URLCompletionMatchBookmarkListData *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)URLCompletionMatchBookmarkListData;
  v8 = -[URLCompletionMatchBookmarkListData init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);
    bookmarks = v8->_bookmarks;
    v8->_bookmarks = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v8->_historyMatchData, a4);
    v8->_onlyContainsCloudTab = 0;
    v8->_containsBookmark = objc_msgSend(v6, "onlyContainsCloudTab") ^ 1;
    v13 = v8;
  }

  return v8;
}

- (URLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 andBookmarkData:(id)a4
{
  id v6;
  id v7;
  URLCompletionMatchBookmarkListData *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *bookmarks;
  int v14;
  uint64_t v15;
  NSString *cloudTabDeviceName;
  URLCompletionMatchBookmarkListData *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)URLCompletionMatchBookmarkListData;
  v8 = -[URLCompletionMatchBookmarkListData init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bookmark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, 0);
    bookmarks = v8->_bookmarks;
    v8->_bookmarks = (NSMutableArray *)v12;

    v14 = objc_msgSend(v6, "onlyContainsCloudTab");
    if (v14)
      LOBYTE(v14) = objc_msgSend(v7, "onlyContainsCloudTab");
    v8->_onlyContainsCloudTab = v14;
    v8->_containsBookmark = v14 ^ 1;
    objc_msgSend(v6, "cloudTabDeviceName");
    v15 = objc_claimAutoreleasedReturnValue();
    cloudTabDeviceName = v8->_cloudTabDeviceName;
    v8->_cloudTabDeviceName = (NSString *)v15;

    v17 = v8;
  }

  return v8;
}

- (id)bookmark
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bookmarks, "objectAtIndex:", 0);
}

- (id)_bookmarkUserVisibleURLString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSMutableArray lastObject](self->_bookmarks, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "_web_isUserVisibleURL"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_web_userVisibleString");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_historyItemUserVisibleURLString
{
  return (id)-[WBSURLCompletionMatchData userVisibleURLStringAtIndex:](self->_historyMatchData, "userVisibleURLStringAtIndex:", 0);
}

- (NSString)originalURLString
{
  WBSURLCompletionMatchData *historyMatchData;
  void *v4;
  void *v5;

  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
  {
    -[WBSURLCompletionMatchData originalURLString](historyMatchData, "originalURLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray lastObject](self->_bookmarks, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  if (v5 <= a3)
  {
    if (v5 == a3)
    {
      -[WBSURLCompletionMatchData pageTitleAtIndex:](self->_historyMatchData, "pageTitleAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_bookmarks, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;

  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  if (v5 <= a3)
  {
    if (v5 == a3 && self->_historyMatchData)
    {
      -[URLCompletionMatchBookmarkListData _historyItemUserVisibleURLString](self, "_historyItemUserVisibleURLString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[URLCompletionMatchBookmarkListData _bookmarkUserVisibleURLString](self, "_bookmarkUserVisibleURLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  uint64_t v5;
  WBSURLCompletionMatchData *historyMatchData;
  void *v7;

  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  if (a3)
  {
    historyMatchData = self->_historyMatchData;
  }
  else
  {
    if (v5)
    {
      -[URLCompletionMatchBookmarkListData _bookmarkUserVisibleURLString](self, "_bookmarkUserVisibleURLString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    if (self->_historyMatchData)
    {
      -[URLCompletionMatchBookmarkListData _historyItemUserVisibleURLString](self, "_historyItemUserVisibleURLString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    historyMatchData = 0;
  }
  -[WBSURLCompletionMatchData userVisibleURLStringAtIndex:](historyMatchData, "userVisibleURLStringAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (a3 || !-[NSMutableArray count](self->_bookmarks, "count"))
  {
    -[WBSURLCompletionMatchData pageTitleAtIndex:](self->_historyMatchData, "pageTitleAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray firstObject](self->_bookmarks, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)lastVisitedTimeInterval
{
  WBSURLCompletionMatchData *historyMatchData;
  double result;

  historyMatchData = self->_historyMatchData;
  if (!historyMatchData)
    return 0.0;
  -[WBSURLCompletionMatchData lastVisitedTimeInterval](historyMatchData, "lastVisitedTimeInterval");
  return result;
}

- (BOOL)lastVisitWasFailure
{
  WBSURLCompletionMatchData *historyMatchData;

  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
    LOBYTE(historyMatchData) = -[WBSURLCompletionMatchData lastVisitWasFailure](historyMatchData, "lastVisitWasFailure");
  return (char)historyMatchData;
}

- (BOOL)visitWasClientError
{
  WBSURLCompletionMatchData *historyMatchData;

  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
    LOBYTE(historyMatchData) = -[WBSURLCompletionMatchData visitWasClientError](historyMatchData, "visitWasClientError");
  return (char)historyMatchData;
}

- (id)matchDataByMergingWithMatchData:(id)a3
{
  id v5;
  id v6;
  NSMutableArray *bookmarks;
  void *v8;
  char v9;
  URLCompletionMatchBookmarkListData *v10;
  char v11;
  URLCompletionMatchBookmarkListData *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    bookmarks = self->_bookmarks;
    objc_msgSend(v6, "bookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](bookmarks, "addObject:", v8);

    if (self->_containsBookmark)
      v9 = 1;
    else
      v9 = objc_msgSend(v6, "containsBookmark");
    self->_containsBookmark = v9;
    if (self->_onlyContainsCloudTab)
      v11 = objc_msgSend(v6, "onlyContainsCloudTab");
    else
      v11 = 0;
    self->_onlyContainsCloudTab = v11;
    v12 = self;

  }
  else
  {
    if (!self->_historyMatchData)
    {
      objc_storeStrong((id *)&self->_historyMatchData, a3);
      self->_onlyContainsCloudTab = 0;
    }
    v10 = self;
  }

  return self;
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, char *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  v10 = 0;
  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_bookmarks, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v6, &v10);

      if (v10)
        break;
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    -[WBSURLCompletionMatchData pageTitleAtIndex:](self->_historyMatchData, "pageTitleAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v4[2](v4, v9, v5, &v10);

  }
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD, char *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = (void (**)(id, uint64_t, _QWORD, char *))a3;
  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  v8 = 0;
  if (v5)
  {
    -[URLCompletionMatchBookmarkListData _bookmarkUserVisibleURLString](self, "_bookmarkUserVisibleURLString");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_historyMatchData)
      goto LABEL_6;
    -[URLCompletionMatchBookmarkListData _historyItemUserVisibleURLString](self, "_historyItemUserVisibleURLString");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  v4[2](v4, v6, 0, &v8);

LABEL_6:
  if (!v8)
    -[WBSURLCompletionMatchData enumerateUserVisibleURLsUsingBlock:](self->_historyMatchData, "enumerateUserVisibleURLsUsingBlock:", v4);

}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, void *, _QWORD, char *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  WBSURLCompletionMatchData *historyMatchData;
  _QWORD v11[5];
  void (**v12)(id, void *, uint64_t, void *, _QWORD, char *);
  uint64_t v13;
  char v14;

  v4 = (void (**)(id, void *, uint64_t, void *, _QWORD, char *))a3;
  v14 = 0;
  v5 = -[NSMutableArray count](self->_bookmarks, "count");
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_bookmarks, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[URLCompletionMatchBookmarkListData _bookmarkUserVisibleURLString](self, "_bookmarkUserVisibleURLString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v6, v9, 0, &v14);

      if (v14)
        break;
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    historyMatchData = self->_historyMatchData;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__URLCompletionMatchBookmarkListData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
    v11[3] = &unk_1E9CF51D8;
    v11[4] = self;
    v12 = v4;
    v13 = v5;
    -[WBSURLCompletionMatchData enumeratePageTitlesAndUserVisibleURLsUsingBlock:](historyMatchData, "enumeratePageTitlesAndUserVisibleURLsUsingBlock:", v11);

  }
}

void __86__URLCompletionMatchBookmarkListData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v9 = a1[5];
  v10 = *(void **)(a1[4] + 16);
  v11 = a4;
  objc_msgSend(v10, "pageTitleAtIndex:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id, uint64_t, uint64_t))(v9 + 16))(v9, v12, a1[6], v11, a5, a6);

}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  return -[WBSURLCompletionMatchData matchesAutocompleteTrigger:isStrengthened:](self->_historyMatchData, "matchesAutocompleteTrigger:isStrengthened:", a3, a4);
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  WBSURLCompletionMatchData *historyMatchData;
  unint64_t v5;
  float result;

  historyMatchData = self->_historyMatchData;
  if (a3)
  {
    v5 = a3 - 1;
LABEL_3:
    -[WBSURLCompletionMatchData topSitesScoreForURLStringAtIndex:atTime:](historyMatchData, "topSitesScoreForURLStringAtIndex:atTime:", v5, a4);
    return result;
  }
  if (historyMatchData)
  {
    v5 = 0;
    goto LABEL_3;
  }
  return 0.0;
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  float result;

  -[WBSURLCompletionMatchData topSitesScoreForPageTitleAtTime:](self->_historyMatchData, "topSitesScoreForPageTitleAtTime:", a3);
  return result;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  WBSURLCompletionMatchData *historyMatchData;
  unint64_t v4;

  historyMatchData = self->_historyMatchData;
  if (a3)
  {
    v4 = a3 - 1;
    return -[WBSURLCompletionMatchData visitCountScoreForURLStringAtIndex:](historyMatchData, "visitCountScoreForURLStringAtIndex:", v4);
  }
  if (historyMatchData)
  {
    v4 = 0;
    return -[WBSURLCompletionMatchData visitCountScoreForURLStringAtIndex:](historyMatchData, "visitCountScoreForURLStringAtIndex:", v4);
  }
  return -1;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return -[WBSURLCompletionMatchData visitCountScoreForPageTitleAtTime](self->_historyMatchData, "visitCountScoreForPageTitleAtTime");
}

- (BOOL)onlyContainsCloudTab
{
  return self->_onlyContainsCloudTab;
}

- (BOOL)containsBookmark
{
  return self->_containsBookmark;
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
  objc_storeStrong((id *)&self->_historyMatchData, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end
