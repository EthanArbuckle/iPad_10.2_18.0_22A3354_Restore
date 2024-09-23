@implementation GEOAbstractMapServiceTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[GEOAbstractMapServiceTicket submitWithHandler:timeout:networkActivity:](self, "submitWithHandler:timeout:networkActivity:", a3, 0, a4);
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
  -[GEOAbstractMapServiceTicket submitWithHandler:auditToken:timeout:networkActivity:](self, "submitWithHandler:auditToken:timeout:networkActivity:", a3, 0, a4, a5);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  GEOAbstractMapServiceTicket *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GEOAbstractMapServiceTicket *v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!-[GEOAbstractTicket isCancelled](self, "isCancelled"))
  {
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke;
    v21[3] = &unk_1E1C064E0;
    v24 = v12;
    v22 = v15;
    v23 = self;
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_3;
    v17[3] = &unk_1E1C06530;
    v20 = v14;
    v18 = v22;
    v19 = self;
    -[GEOAbstractMapServiceTicket submitWithHandler:auditToken:timeout:networkActivity:](self, "submitWithHandler:auditToken:timeout:networkActivity:", v21, v13, a5, v17);

  }
}

void __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[6];
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_2;
    v9[3] = &unk_1E1C064B8;
    v8 = a1[4];
    v9[4] = a1[5];
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, v9);

  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
  -[GEOAbstractMapServiceTicket submitWithHandler:timeout:networkActivity:queue:](self, "submitWithHandler:timeout:networkActivity:queue:", a3, 0, a4, a5);
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6
{
  -[GEOAbstractMapServiceTicket submitWithHandler:auditToken:timeout:networkActivity:queue:](self, "submitWithHandler:auditToken:timeout:networkActivity:queue:", a3, 0, a4, a5, a6);
}

uint64_t __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return result;
}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4
{
  -[GEOAbstractMapServiceTicket submitWithRefinedHandler:timeout:networkActivity:](self, "submitWithRefinedHandler:timeout:networkActivity:", a3, 0, a4);
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
  -[GEOAbstractMapServiceTicket submitWithRefinedHandler:auditToken:timeout:networkActivity:](self, "submitWithRefinedHandler:auditToken:timeout:networkActivity:", a3, 0, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_geoMapItemIdentifierForSpotlight, 0);
  objc_storeStrong((id *)&self->_searchSectionList, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_searchRedoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_searchAutoRedoThreshold, 0);
  objc_storeStrong((id *)&self->_dotPlaces, 0);
  objc_storeStrong((id *)&self->_publisherResults, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);
  objc_storeStrong((id *)&self->_searchResultSections, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_displayHeaderSubstitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_resultSectionHeader, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSuggestion, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);
  objc_storeStrong((id *)&self->_resultBoundingRegion, 0);
}

- (GEOMapRegion)resultBoundingRegion
{
  return self->_resultBoundingRegion;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("-[%@ %@] not implemented"), v11, v10);

}

void __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_3(_QWORD *a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E1C06508;
    v4 = a1[4];
    block[4] = a1[5];
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, block);

  }
}

uint64_t __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("-[%@ %@] not implemented"), v11, v10);

}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
  -[GEOAbstractMapServiceTicket submitWithRefinedHandler:timeout:networkActivity:queue:](self, "submitWithRefinedHandler:timeout:networkActivity:queue:", a3, 0, a4, a5);
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6
{
  -[GEOAbstractMapServiceTicket submitWithRefinedHandler:auditToken:timeout:networkActivity:queue:](self, "submitWithRefinedHandler:auditToken:timeout:networkActivity:queue:", a3, 0, a4, a5, a6);
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  GEOAbstractMapServiceTicket *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  GEOAbstractMapServiceTicket *v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!-[GEOAbstractTicket isCancelled](self, "isCancelled"))
  {
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke;
    v21[3] = &unk_1E1C06580;
    v24 = v12;
    v22 = v15;
    v23 = self;
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_3;
    v17[3] = &unk_1E1C06530;
    v20 = v14;
    v18 = v22;
    v19 = self;
    -[GEOAbstractMapServiceTicket submitWithRefinedHandler:auditToken:timeout:networkActivity:](self, "submitWithRefinedHandler:auditToken:timeout:networkActivity:", v21, v13, a5, v17);

  }
}

void __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)a1[6];
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_2;
    block[3] = &unk_1E1C06558;
    v11 = a1[4];
    block[4] = a1[5];
    v16 = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    dispatch_async(v11, block);

  }
}

uint64_t __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return result;
}

void __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_3(_QWORD *a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E1C06508;
    v4 = a1[4];
    block[4] = a1[5];
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, block);

  }
}

uint64_t __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)0;
}

- (GEOResolvedItem)clientResolvedResult
{
  return self->_clientResolvedResult;
}

- (GEODirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (NSArray)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (BOOL)isChainResultSet
{
  return self->_chainResultSet;
}

- (NSArray)relatedSearchSuggestions
{
  return self->_relatedSearchSuggestions;
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (GEORelatedSearchSuggestion)defaultRelatedSuggestion
{
  return self->_defaultRelatedSuggestion;
}

- (NSString)resultSectionHeader
{
  return self->_resultSectionHeader;
}

- (int)searchResultType
{
  return self->_searchResultType;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (NSArray)displayHeaderSubstitutes
{
  return self->_displayHeaderSubstitutes;
}

- (BOOL)shouldEnableRedoSearch
{
  return self->_shouldEnableRedoSearch;
}

- (BOOL)shouldAllowManualRedoSearch
{
  return self->_shouldAllowManualRedoSearch;
}

- (unsigned)dymSuggestionVisibleTime
{
  return self->_dymSuggestionVisibleTime;
}

- (BOOL)showDymSuggestionCloseButton
{
  return self->_showDymSuggestionCloseButton;
}

- (NSArray)searchResultSections
{
  return self->_searchResultSections;
}

- (GEOPDMerchantLookupResult)merchantLookupResult
{
  return self->_merchantLookupResult;
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return self->_categorySearchResultSection;
}

- (NSArray)relatedEntitySections
{
  return self->_relatedEntitySections;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (NSArray)publisherResults
{
  return self->_publisherResults;
}

- (NSArray)dotPlaces
{
  return self->_dotPlaces;
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return self->_searchAutoRedoThreshold;
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return self->_searchRedoButtonThreshold;
}

- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata
{
  return self->_placeSummaryLayoutMetadata;
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return self->_resultRefinementGroup;
}

- (GEOSearchSectionList)searchSectionList
{
  return self->_searchSectionList;
}

- (BOOL)disableAdditionalViewportPadding
{
  return self->_disableAdditionalViewportPadding;
}

- (int)searchResultViewType
{
  return self->_searchResultViewType;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (GEOMapItemIdentifier)geoMapItemIdentifierForSpotlight
{
  return self->_geoMapItemIdentifierForSpotlight;
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

@end
