@implementation SLSheetPlaceSearchController

- (SLSheetPlaceSearchController)initWithPlaceDataSource:(id)a3 searchDisplayController:(id)a4
{
  id v7;
  id v8;
  SLSheetPlaceSearchController *v9;
  SLSheetPlaceSearchController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLSheetPlaceSearchController;
  v9 = -[SLSheetPlaceSearchController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeDataSource, a3);
    -[SLPlaceDataSource setDelegate:](v10->_placeDataSource, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_searchDisplayController, a4);
  }

  return v10;
}

- (void)searchWithSearchString:(id)a3
{
  uint64_t v3;
  id v6;
  NSTimer *delayTimer;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _SLLog(v3, 6, CFSTR("Cancel previous fetch"));
  -[SLSheetPlaceSearchController cancelSearch](self, "cancelSearch");
  -[SLSheetPlaceSearchController placeDataSource](self, "placeDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 6, CFSTR("Initate new place search on %@ with search string %@"));

  objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 1, v12, v6);
  self->_isSearching = 1;
  objc_storeStrong((id *)&self->_searchString, a3);
  self->_retryCount = 0;
  if (objc_msgSend(v6, "length"))
  {
    -[UISearchDisplayController setNoResultsMessage:](self->_searchDisplayController, "setNoResultsMessage:", &stru_1E7592238);
    delayTimer = self->_delayTimer;
    if (delayTimer)
      -[NSTimer invalidate](delayTimer, "invalidate");
    _SLLog(v3, 6, CFSTR("Scheduling delayed place fetch"));
    v8 = (void *)MEMORY[0x1E0C99E88];
    v13 = CFSTR("searchString");
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_performDelayedFetch_, v9, 0, 0.5);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v11 = self->_delayTimer;
    self->_delayTimer = v10;

  }
  else
  {
    -[SLSheetPlaceSearchController placeManager:updatedPlaces:](self, "placeManager:updatedPlaces:", 0, MEMORY[0x1E0C9AA60]);
  }

}

- (void)cancelSearch
{
  NSTimer *delayTimer;
  void *v4;

  if (self->_isSearching)
  {
    delayTimer = self->_delayTimer;
    if (delayTimer)
      -[NSTimer invalidate](delayTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 0);
    -[SLSheetPlaceSearchController placeDataSource](self, "placeDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelPlaceFetch");

    self->_isSearching = 0;
  }
}

- (void)performDelayedFetch:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  _SLLog(v3, 6, CFSTR("Performing delayed place fetch"));
  objc_msgSend(v5, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SLSheetPlaceSearchController placeDataSource](self, "placeDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("searchString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchPlacesWithSearchString:", v7);

}

- (void)placeManager:(id)a3 updatedPlaces:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  self->_isSearching = 0;
  v6 = a4;
  _SLLog(v4, 6, CFSTR("Place manager updated places for search controller %@"));
  -[SLSheetPlaceSearchController setSearchResults:](self, "setSearchResults:", v6, v6);

  -[UISearchDisplayController searchResultsTableView](self->_searchDisplayController, "searchResultsTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  SLSocialFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FB_PLACE_SEARCH_NO_RESULTS"), &stru_1E7592238, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchDisplayController setNoResultsMessage:](self->_searchDisplayController, "setNoResultsMessage:", v9);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 0);
}

- (void)placeManager:(id)a3 failedWithError:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (self->_isSearching && self->_retryCount <= 2 && self->_searchString)
  {
    _SLLog(v4, 6, CFSTR("Retrycount is %i, retrying place fetch"));
    ++self->_retryCount;
    -[SLSheetPlaceSearchController placeDataSource](self, "placeDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchPlacesWithSearchString:", self->_searchString);

  }
  else
  {
    self->_retryCount = 0;
    self->_isSearching = 0;
    v11 = v6;
    _SLLog(v4, 3, CFSTR("Failed place search with error %{public}@"));
    -[SLSheetPlaceSearchController setSearchResults:](self, "setSearchResults:", MEMORY[0x1E0C9AA60], v11, v12);
    -[UISearchDisplayController searchResultsTableView](self->_searchDisplayController, "searchResultsTableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

    SLSocialFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FB_PLACE_SEARCH_SEARCH_FAILED"), &stru_1E7592238, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchDisplayController setNoResultsMessage:](self->_searchDisplayController, "setNoResultsMessage:", v10);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 0);
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SLSheetPlaceSearchController searchResults](self, "searchResults", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SLFacebookPlaceCell"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SLFacebookPlaceCell"));
  objc_msgSend(v4, "setAccessoryType:", 0);
  return v4;
}

- (SLPlaceDataSource)placeDataSource
{
  return (SLPlaceDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPlaceDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UISearchDisplayController)searchDisplayController
{
  return (UISearchDisplayController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSearchDisplayController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)searchResults
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSearchResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchDisplayController, 0);
  objc_storeStrong((id *)&self->_placeDataSource, 0);
  objc_storeStrong((id *)&self->_retryLock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
}

@end
