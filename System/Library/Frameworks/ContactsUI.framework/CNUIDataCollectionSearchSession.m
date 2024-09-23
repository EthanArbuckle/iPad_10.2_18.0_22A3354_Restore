@implementation CNUIDataCollectionSearchSession

- (void)searchStringDidChange
{
  -[CNUIDataCollectionSearchSession setPendingResults:](self, "setPendingResults:", 1);
  -[CNUIDataCollectionSearchSession setPendingSuggestionsResults:](self, "setPendingSuggestionsResults:", 1);
}

- (void)didFetchResultSuggested:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[CNUIDataCollectionSearchSession pendingResults](self, "pendingResults"))
  {
    -[CNUIDataCollectionSearchSession setPendingResults:](self, "setPendingResults:", 0);
    +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logSearchResultsFetchedSuggested:", 0);

  }
  if (v3)
  {
    if (-[CNUIDataCollectionSearchSession pendingSuggestionsResults](self, "pendingSuggestionsResults"))
    {
      -[CNUIDataCollectionSearchSession setPendingSuggestionsResults:](self, "setPendingSuggestionsResults:", 0);
      +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logSearchResultsFetchedSuggested:", 1);

    }
  }
}

- (void)didSelectResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSearchResultSelected:", v3);

}

- (BOOL)pendingResults
{
  return self->_pendingResults;
}

- (void)setPendingResults:(BOOL)a3
{
  self->_pendingResults = a3;
}

- (BOOL)pendingSuggestionsResults
{
  return self->_pendingSuggestionsResults;
}

- (void)setPendingSuggestionsResults:(BOOL)a3
{
  self->_pendingSuggestionsResults = a3;
}

+ (void)begin
{
  CNUIDataCollectionSearchSession *v2;
  void *v3;
  id v4;

  if (!s_currentInstance)
  {
    v2 = objc_alloc_init(CNUIDataCollectionSearchSession);
    v3 = (void *)s_currentInstance;
    s_currentInstance = (uint64_t)v2;

    +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSearchUsage");

  }
}

+ (void)end
{
  void *v2;

  v2 = (void *)s_currentInstance;
  s_currentInstance = 0;

}

+ (id)currentSession
{
  return (id)s_currentInstance;
}

@end
