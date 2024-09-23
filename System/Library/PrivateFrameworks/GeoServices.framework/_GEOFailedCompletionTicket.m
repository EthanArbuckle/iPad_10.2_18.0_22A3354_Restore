@implementation _GEOFailedCompletionTicket

- (_GEOFailedCompletionTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5
{
  id v8;
  _GEOFailedCompletionTicket *v9;
  uint64_t v10;
  NSString *searchQuery;
  _GEOFailedCompletionTicket *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOFailedCompletionTicket;
  v9 = -[_GEOFailedTicket initWithError:traits:](&v14, sel_initWithError_traits_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    searchQuery = v9->_searchQuery;
    v9->_searchQuery = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (BOOL)matchesFragment:(id)a3
{
  return -[NSString isEqualToString:](self->_searchQuery, "isEqualToString:", a3);
}

- (double)retainSearchTime
{
  return 0.0;
}

- (BOOL)hasShouldDisplayNoResults
{
  return 0;
}

- (BOOL)shouldDisplayNoResults
{
  return 0;
}

- (BOOL)hasShouldEnableGrayscaleHighlighting
{
  return 0;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return 0;
}

- (id)clientRankingModel
{
  return 0;
}

- (id)sortPriorityMapping
{
  return 0;
}

- (BOOL)autocompleteTopSectionIsQuerySuggestions
{
  return 0;
}

- (BOOL)showAutocompleteClientSource
{
  return 0;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  return 0;
}

- (id)placeSummaryLayoutMetadata
{
  return 0;
}

- (id)guideSummaryLayoutMetadata
{
  return 0;
}

- (int64_t)highlightType
{
  return 0;
}

- (BOOL)enableStructuredRAPAffordance
{
  return 0;
}

- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    qos_class_self();
    v5 = v4;
    geo_dispatch_async_qos();

  }
}

- (NSString)_searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->searchQuery, 0);
}

@end
