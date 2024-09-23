@implementation GEOGuideLocationSuggestionResults

- (GEOGuideLocationSuggestionResults)initWithGuideLocationSuggestionResult:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  GEOGuideLocationSuggestionResults *v9;
  void *v10;
  void *v11;
  GEOGuideLocationSuggestionResults *v12;
  GEOGuideLocationSuggestionResults *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v6 = (id *)a3;
  v7 = a4;
  -[GEOPDGuidesLocationsSuggestionResult entrys](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (GEOGuideLocationSuggestionResults *)objc_msgSend(v8, "count");

  if (v9)
  {
    -[GEOPDGuidesLocationsSuggestionResult entrys](v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOGuideLocation guideLocationsForEntries:mapsResults:](GEOGuideLocation, "guideLocationsForEntries:mapsResults:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v16.receiver = self;
      v16.super_class = (Class)GEOGuideLocationSuggestionResults;
      v12 = -[GEOGuideLocationSuggestionResults init](&v16, sel_init);
      v13 = v12;
      if (v12)
        objc_storeStrong((id *)&v12->_guideLocations, v11);
      self = v13;
      v9 = self;
    }
    else
    {
      GEOGetCuratedCollectionsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Guide Location suggestion is not valid.", buf, 2u);
      }

      v9 = 0;
    }

  }
  return v9;
}

- (NSArray)guideLocations
{
  return self->_guideLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocations, 0);
}

@end
