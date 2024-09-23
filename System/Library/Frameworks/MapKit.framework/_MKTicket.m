@implementation _MKTicket

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 queue:(id)a5 networkActivity:(id)a6
{
  id v10;
  id v11;
  void *v12;
  GEOMapServiceTicket *ticket;
  _QWORD v14[5];
  id v15;
  id v16;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    ticket = self->_ticket;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke;
    v14[3] = &unk_1E20DAAA8;
    v14[4] = self;
    v15 = v11;
    v16 = v10;
    -[GEOMapServiceTicket submitWithHandler:timeout:networkActivity:](ticket, "submitWithHandler:timeout:networkActivity:", v14, a4, a6);

  }
}

- (void)submitWithHandler:(id)a3 queue:(id)a4 networkActivity:(id)a5
{
  -[_MKTicket submitWithHandler:timeout:queue:networkActivity:](self, "submitWithHandler:timeout:queue:networkActivity:", a3, 0, a4, a5);
}

- (_MKTicket)initWithTicket:(id)a3
{
  id v5;
  _MKTicket *v6;
  _MKTicket *v7;
  _MKTicket *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKTicket;
  v6 = -[_MKTicket init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapRegion)boundingRegion
{
  return (GEOMapRegion *)-[GEOMapServiceTicket resultBoundingRegion](self->_ticket, "resultBoundingRegion");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_refinedMapItems, 0);
  objc_storeStrong((id *)&self->_exactMapItems, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_MKTicket;
  -[_MKTicket description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, self->_ticket);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
  -[_MKTicket submitWithHandler:timeout:queue:networkActivity:](self, "submitWithHandler:timeout:queue:networkActivity:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
  id v8;
  void *v9;
  GEOMapServiceTicket *ticket;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    ticket = self->_ticket;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke;
    v11[3] = &unk_1E20DAA80;
    v11[4] = self;
    v12 = v8;
    -[GEOMapServiceTicket submitWithRefinedHandler:timeout:networkActivity:](ticket, "submitWithRefinedHandler:timeout:networkActivity:", v11, a4, a5);

  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_MKTicket submitWithHandler:timeout:queue:networkActivity:](self, "submitWithHandler:timeout:queue:networkActivity:", a3, 0, MEMORY[0x1E0C80D38], a4);
}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4
{
  -[_MKTicket submitWithRefinedHandler:timeout:networkActivity:](self, "submitWithRefinedHandler:timeout:networkActivity:", a3, 0, a4);
}

- (void)cancel
{
  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTicket traits](self->_ticket, "traits");
}

- (void)applyToCorrectedSearch:(id)a3
{
  -[GEOMapServiceTicket applyToCorrectedSearch:](self->_ticket, "applyToCorrectedSearch:", a3);
}

- (void)applyToPlaceInfo:(id)a3
{
  -[GEOMapServiceTicket applyToPlaceInfo:](self->_ticket, "applyToPlaceInfo:", a3);
}

- (NSArray)exactMapItems
{
  return self->_exactMapItems;
}

- (NSArray)refinedMapItems
{
  return self->_refinedMapItems;
}

- (BOOL)isChainResultSet
{
  return -[GEOMapServiceTicket isChainResultSet](self->_ticket, "isChainResultSet");
}

- (NSArray)relatedSearchSuggestions
{
  return (NSArray *)-[GEOMapServiceTicket relatedSearchSuggestions](self->_ticket, "relatedSearchSuggestions");
}

- (GEORelatedSearchSuggestion)defaultRelatedSuggestion
{
  return (GEORelatedSearchSuggestion *)-[GEOMapServiceTicket defaultRelatedSuggestion](self->_ticket, "defaultRelatedSuggestion");
}

- (NSArray)browseCategories
{
  return (NSArray *)-[GEOMapServiceTicket browseCategories](self->_ticket, "browseCategories");
}

- (int)searchResultType
{
  return -[GEOMapServiceTicket searchResultType](self->_ticket, "searchResultType");
}

- (GEOResolvedItem)clientResolvedResult
{
  return (GEOResolvedItem *)-[GEOMapServiceTicket clientResolvedResult](self->_ticket, "clientResolvedResult");
}

- (NSArray)retainedSearchMetadata
{
  return (NSArray *)-[GEOMapServiceTicket retainedSearchMetadata](self->_ticket, "retainedSearchMetadata");
}

- (GEODirectionIntent)directionIntent
{
  return (GEODirectionIntent *)-[GEOMapServiceTicket directionIntent](self->_ticket, "directionIntent");
}

- (NSString)resultDisplayHeader
{
  return (NSString *)-[GEOMapServiceTicket resultDisplayHeader](self->_ticket, "resultDisplayHeader");
}

- (NSArray)displayHeaderSubstitutes
{
  return (NSArray *)-[GEOMapServiceTicket displayHeaderSubstitutes](self->_ticket, "displayHeaderSubstitutes");
}

- (BOOL)shouldEnableRedoSearch
{
  return -[GEOMapServiceTicket shouldEnableRedoSearch](self->_ticket, "shouldEnableRedoSearch");
}

- (BOOL)shouldAllowManualRedoButton
{
  return -[GEOMapServiceTicket shouldAllowManualRedoSearch](self->_ticket, "shouldAllowManualRedoSearch");
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)dymSuggestionVisibleTime
{
  return -[GEOMapServiceTicket dymSuggestionVisibleTime](self->_ticket, "dymSuggestionVisibleTime");
}

- (BOOL)showDymSuggestionCloseButton
{
  return -[GEOMapServiceTicket showDymSuggestionCloseButton](self->_ticket, "showDymSuggestionCloseButton");
}

- (NSString)sectionHeader
{
  return (NSString *)-[GEOMapServiceTicket resultSectionHeader](self->_ticket, "resultSectionHeader");
}

- (NSArray)searchResultSections
{
  return (NSArray *)-[GEOMapServiceTicket searchResultSections](self->_ticket, "searchResultSections");
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return (GEOCategorySearchResultSection *)-[GEOMapServiceTicket categorySearchResultSection](self->_ticket, "categorySearchResultSection");
}

- (NSArray)relatedEntitySections
{
  return (NSArray *)-[GEOMapServiceTicket relatedEntitySections](self->_ticket, "relatedEntitySections");
}

- (NSArray)collectionResults
{
  return (NSArray *)-[GEOMapServiceTicket collectionResults](self->_ticket, "collectionResults");
}

- (NSArray)publisherResults
{
  return (NSArray *)-[GEOMapServiceTicket publisherResults](self->_ticket, "publisherResults");
}

- (NSArray)dotPlaces
{
  return (NSArray *)-[GEOMapServiceTicket dotPlaces](self->_ticket, "dotPlaces");
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return (GEOSearchAutoRedoThreshold *)-[GEOMapServiceTicket searchAutoRedoThreshold](self->_ticket, "searchAutoRedoThreshold");
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return (GEOSearchRedoButtonThreshold *)-[GEOMapServiceTicket searchRedoButtonThreshold](self->_ticket, "searchRedoButtonThreshold");
}

- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata
{
  return (GEOPDPlaceSummaryLayoutMetadata *)-[GEOMapServiceTicket placeSummaryLayoutMetadata](self->_ticket, "placeSummaryLayoutMetadata");
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return (GEOGuideSummaryLayoutMetadata *)-[GEOMapServiceTicket guideSummaryLayoutMetadata](self->_ticket, "guideSummaryLayoutMetadata");
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return (GEOResultRefinementGroup *)-[GEOMapServiceTicket resultRefinementGroup](self->_ticket, "resultRefinementGroup");
}

- (GEOSearchSectionList)searchSectionList
{
  return (GEOSearchSectionList *)-[GEOMapServiceTicket searchSectionList](self->_ticket, "searchSectionList");
}

- (BOOL)disableAdditionalViewportPadding
{
  return -[GEOMapServiceTicket disableAdditionalViewportPadding](self->_ticket, "disableAdditionalViewportPadding");
}

- (int)searchResultViewType
{
  return -[GEOMapServiceTicket searchResultViewType](self->_ticket, "searchResultViewType");
}

- (BOOL)enableStructuredRAPAffordance
{
  return -[GEOMapServiceTicket enableStructuredRAPAffordance](self->_ticket, "enableStructuredRAPAffordance");
}

- (MKMapItemIdentifier)mapItemIdentifierForSpotlight
{
  void *v2;
  MKMapItemIdentifier *v3;

  -[GEOMapServiceTicket geoMapItemIdentifierForSpotlight](self->_ticket, "geoMapItemIdentifierForSpotlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:]([MKMapItemIdentifier alloc], "initWithGEOMapItemIdentifier:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOSearchSessionData)searchSessionData
{
  return (GEOSearchSessionData *)-[GEOMapServiceTicket searchSessionData](self->_ticket, "searchSessionData");
}

- (int)mapDisplayType
{
  return -[GEOMapServiceTicket mapDisplayType](self->_ticket, "mapDisplayType");
}

@end
