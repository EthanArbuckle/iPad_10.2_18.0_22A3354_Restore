@implementation MKLocalSearchCompletion

- (MKLocalSearchCompletion)initWithGeoCompletionItem:(id)a3 serverSectionIndex:(unint64_t)a4 serverItemIndexInSection:(unint64_t)a5
{
  id v9;
  MKLocalSearchCompletion *v10;
  MKLocalSearchCompletion *v11;
  void *v12;
  uint64_t v13;
  MKMapItem *mapItem;
  MKLocalSearchCompletion *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKLocalSearchCompletion;
  v10 = -[MKLocalSearchCompletion init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    v11->_serverSectionIndex = a4;
    v11->_serverItemIndexInSection = a5;
    -[GEOCompletionItem geoMapItem](v11->_item, "geoMapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      mapItem = v11->_mapItem;
      v11->_mapItem = (MKMapItem *)v13;

    }
    v15 = v11;

  }
  return v11;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  if ((Class)objc_opt_class() == a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MKLocalSearchCompletion;
  return -[MKLocalSearchCompletion isKindOfClass:](&v6, sel_isKindOfClass_, a3);
}

- (NSString)title
{
  void *v2;
  __CFString *v3;

  -[GEOCompletionItem displayLines](self->_item, "displayLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E20DFC00;
  }

  return (NSString *)v3;
}

- (NSArray)titleHighlightRanges
{
  void *v3;
  void *v4;

  -[GEOCompletionItem displayLines](self->_item, "displayLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[GEOCompletionItem highlightsForLine:](self->_item, "highlightsForLine:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSString)subtitle
{
  void *v2;
  __CFString *v3;

  -[GEOCompletionItem displayLines](self->_item, "displayLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v3 = &stru_1E20DFC00;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSArray)subtitleHighlightRanges
{
  void *v3;
  void *v4;

  -[GEOCompletionItem displayLines](self->_item, "displayLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[GEOCompletionItem highlightsForLine:](self->_item, "highlightsForLine:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v4;
}

- (BOOL)getCoordinate:(CLLocationCoordinate2D *)a3
{
  __int128 v5;

  if (!a3)
    return 0;
  v5 = xmmword_18B2AEDE0;
  if (!-[GEOCompletionItem getCoordinate:](self->_item, "getCoordinate:", &v5)
    || fabs(*((double *)&v5 + 1) + 180.0) < 0.00000001 && fabs(*(double *)&v5 + 180.0) < 0.00000001)
  {
    return 0;
  }
  *a3 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&v5, *((CLLocationDegrees *)&v5 + 1));
  return 1;
}

- (id)queryLine
{
  return (id)-[GEOCompletionItem queryLine](self->_item, "queryLine");
}

- (id)calloutTitle
{
  return (id)-[GEOCompletionItem calloutTitle](self->_item, "calloutTitle");
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOSearchCategory)category
{
  return (GEOSearchCategory *)-[GEOCompletionItem searchCategory](self->_item, "searchCategory");
}

- (GEOResolvedItem)clientResolved
{
  return (GEOResolvedItem *)-[GEOCompletionItem clientResolved](self->_item, "clientResolved");
}

- (GEODirectionIntent)directionIntent
{
  return (GEODirectionIntent *)-[GEOCompletionItem directionIntent](self->_item, "directionIntent");
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return (GEORetainedSearchMetadata *)-[GEOCompletionItem retainedSearchMetadata](self->_item, "retainedSearchMetadata");
}

- (BOOL)hasSortPriority
{
  return -[GEOCompletionItem hasSortPriority](self->_item, "hasSortPriority");
}

- (int64_t)sortPriority
{
  return -[GEOCompletionItem sortPriority](self->_item, "sortPriority");
}

- (int64_t)entryTapBehavior
{
  return -[GEOCompletionItem entryTapBehavior](self->_item, "entryTapBehavior") != 0;
}

- (int64_t)autocompleteCellType
{
  int64_t result;

  result = -[GEOCompletionItem autocompleteCellType](self->_item, "autocompleteCellType");
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return (GEOServerResultScoreMetadata *)-[GEOCompletionItem serverResultScoreMetadata](self->_item, "serverResultScoreMetadata");
}

- (BOOL)hasQueryAcceleratorAffordanceEnabled
{
  return -[GEOCompletionItem hasQueryAcceleratorAffordanceEnabled](self->_item, "hasQueryAcceleratorAffordanceEnabled");
}

- (NSString)queryAcceleratorCompletionString
{
  return (NSString *)-[GEOCompletionItem queryAcceleratorCompletionString](self->_item, "queryAcceleratorCompletionString");
}

- (id)_geoCompletionItem
{
  return self->_item;
}

- (GEOCollectionResult)collectionResult
{
  return (GEOCollectionResult *)-[GEOCompletionItem collectionResult](self->_item, "collectionResult");
}

- (GEOPublisherResult)publisherResult
{
  return (GEOPublisherResult *)-[GEOCompletionItem publisherResult](self->_item, "publisherResult");
}

- (NSArray)childItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[MKLocalSearchCompletion publisherResult](self, "publisherResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D271A8]);
    -[MKLocalSearchCompletion publisherResult](self, "publisherResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithPublisherResult:", v5);
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v7;
  }
  else
  {
    -[MKLocalSearchCompletion mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_geoMapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_childItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v11;
  }
}

- (NSArray)resultRefinements
{
  return (NSArray *)-[GEOCompletionItem resultRefinements](self->_item, "resultRefinements");
}

- (GEOStyleAttributes)iconStyleAttributes
{
  return (GEOStyleAttributes *)-[GEOCompletionItem iconStyleAttributes](self->_item, "iconStyleAttributes");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLocalSearchCompletion title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKLocalSearchCompletion subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" (%@)"), v8);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[GEOCompletionItem isEqual:](self->_item, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[GEOCompletionItem hash](self->_item, "hash");
}

- (id)copyStorage
{
  objc_msgSend(MEMORY[0x1E0D27588], "storageForCompletionItem:", self->_item);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendFeedback
{
  if (!self->_alreadySentFeedback)
  {
    self->_alreadySentFeedback = 1;
    -[GEOCompletionItem sendFeedback](self->_item, "sendFeedback");
  }
}

- (int64_t)_type
{
  int64_t result;

  result = -[GEOCompletionItem type](self->_item, "type");
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

- (int)_placeType
{
  void *v4;
  void *v5;
  int v6;

  if (-[GEOCompletionItem placeType](self->_item, "placeType"))
    return -[GEOCompletionItem placeType](self->_item, "placeType");
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_placeType");

  return v6;
}

- (BOOL)_supportsOfflineDownload
{
  return -[GEOCompletionItem supportsOfflineDownload](self->_item, "supportsOfflineDownload");
}

- (float)_disambiguationRadiusMeters
{
  float result;

  if (!-[GEOCompletionItem hasDisambiguationRadiusMeters](self->_item, "hasDisambiguationRadiusMeters"))
    return 0.0;
  -[GEOCompletionItem disambiguationRadiusMeters](self->_item, "disambiguationRadiusMeters");
  return result;
}

- (BOOL)_hasDisambiguationRadiusMeters
{
  return -[GEOCompletionItem hasDisambiguationRadiusMeters](self->_item, "hasDisambiguationRadiusMeters");
}

- (NSArray)displayLines
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[MKLocalSearchCompletion title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[MKLocalSearchCompletion subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)highlightsForLine:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[MKLocalSearchCompletion subtitleHighlightRanges](self, "subtitleHighlightRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[MKLocalSearchCompletion titleHighlightRanges](self, "titleHighlightRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)iconWithScale:(double)a3
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (unint64_t)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedSectionHeader
{
  return self->_localizedSectionHeader;
}

- (void)setLocalizedSectionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)_alreadySentFeedback
{
  return self->_alreadySentFeedback;
}

- (MKLocalSearchCompletion)directionIntentOrigin
{
  return self->_directionIntentOrigin;
}

- (void)setDirectionIntentOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_directionIntentOrigin, a3);
}

- (MKLocalSearchCompletion)directionIntentDestination
{
  return self->_directionIntentDestination;
}

- (void)setDirectionIntentDestination:(id)a3
{
  objc_storeStrong((id *)&self->_directionIntentDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionIntentDestination, 0);
  objc_storeStrong((id *)&self->_directionIntentOrigin, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_localizedSectionHeader, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (GEOCompletionItem)geoCompletionItem
{
  return self->_item;
}

@end
