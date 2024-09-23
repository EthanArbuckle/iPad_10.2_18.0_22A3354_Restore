@implementation MKLocalSearchCompleter

- (MKLocalSearchCompleter)init
{
  MKLocalSearchCompleter *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t UInteger;
  NSString *queryFragment;
  uint64_t v9;
  NSMutableArray *inFlightTickets;
  uint64_t v11;
  NSMutableArray *pendingTickets;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearchCompleter;
  v2 = -[MKLocalSearchCompleter init](&v14, sel_init);
  if (v2)
  {
    v2->_region.center = CLLocationCoordinate2DMake(0.0, 0.0);
    v2->_region.span = ($2AEA816EAF9616B0E64737FB4BB06332)xmmword_18B2AEDD0;
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    v2->_source = 0;
    v2->_listType = 0;
    v2->_timeSinceLastInBoundingRegion = 0.0;
    UInteger = 1;
    v2->_resultsAreCurrent = 1;
    queryFragment = v2->_queryFragment;
    v2->_queryFragment = (NSString *)&stru_1E20DFC00;

    if (GEOConfigGetUInteger())
      UInteger = GEOConfigGetUInteger();
    v2->_maxNumberOfConcurrentRequests = UInteger;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", UInteger);
    v9 = objc_claimAutoreleasedReturnValue();
    inFlightTickets = v2->_inFlightTickets;
    v2->_inFlightTickets = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2->_maxNumberOfConcurrentRequests);
    v11 = objc_claimAutoreleasedReturnValue();
    pendingTickets = v2->_pendingTickets;
    v2->_pendingTickets = (NSMutableArray *)v11;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKLocalSearchCompleter cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MKLocalSearchCompleter;
  -[MKLocalSearchCompleter dealloc](&v3, sel_dealloc);
}

- (void)_handleCompletion:(id)a3 shouldDisplayNoResults:(BOOL)a4 shouldEnableRAPForNoResults:(BOOL)a5 forTicket:(id)a6
{
  id v8;
  GEOAutocompleteSessionData *v9;
  GEOAutocompleteSessionData *autocompleteSessionData;
  void *v11;
  uint64_t v12;
  MKLocalSearchCompleter *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  MKLocalSearchCompletion *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MKLocalSearchSection *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  MKLocalSearchSection *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *group;
  id v75;
  void *v76;
  void *v78;
  uint64_t v79;
  _QWORD block[4];
  id v81;
  id v82;
  id v83;
  id v84;
  BOOL v85;
  BOOL v86;
  id location;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  NSObject *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v64 = a6;
  objc_msgSend(v8, "sessionData");
  v9 = (GEOAutocompleteSessionData *)objc_claimAutoreleasedReturnValue();
  autocompleteSessionData = self->_autocompleteSessionData;
  self->_autocompleteSessionData = v9;

  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v67 = v8;
  objc_msgSend(v8, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
  if (v70)
  {
    v79 = 0;
    v11 = 0;
    v69 = *(_QWORD *)v99;
    do
    {
      v12 = 0;
      do
      {
        v73 = v11;
        v13 = self;
        if (*(_QWORD *)v99 != v69)
          objc_enumerationMutation(obj);
        v72 = v12;
        v14 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v12);
        objc_msgSend(v14, "localizedSectionHeader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v14, "items");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v71 = v14;
        objc_msgSend(v14, "items");
        v75 = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v95;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v95 != v22)
                objc_enumerationMutation(v75);
              v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
              v25 = -[MKLocalSearchCompletion initWithGeoCompletionItem:serverSectionIndex:serverItemIndexInSection:]([MKLocalSearchCompletion alloc], "initWithGeoCompletionItem:serverSectionIndex:serverItemIndexInSection:", v24, v79, v21 + i);
              if (-[MKLocalSearchCompleter _shouldPreloadTransitInfo](v13, "_shouldPreloadTransitInfo"))
              {
                -[MKLocalSearchCompletion mapItem](v25, "mapItem");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "_hasTransitLabels");

                if (v27)
                {
                  dispatch_group_enter(group);
                  -[MKLocalSearchCompletion mapItem](v25, "mapItem");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v92[0] = MEMORY[0x1E0C809B0];
                  v92[1] = 3221225472;
                  v92[2] = __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke;
                  v92[3] = &unk_1E20D7D98;
                  v93 = group;
                  objc_msgSend(v28, "preloadTransitInfoWithCompletion:", v92);

                }
              }
              if (objc_msgSend(v15, "length"))
                -[MKLocalSearchCompletion setLocalizedSectionHeader:](v25, "setLocalizedSectionHeader:", v15);
              v13 = self;
              -[MKLocalSearchCompleter identifier](self, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKLocalSearchCompletion setSourceID:](v25, "setSourceID:", v29);

              objc_msgSend(v78, "addObject:", v25);
              objc_msgSend(v18, "addObject:", v25);
              objc_msgSend(v24, "directionIntent");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
                objc_msgSend(v76, "addObject:", v25);

            }
            v20 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
            v21 += i;
          }
          while (v20);
        }

        v11 = v73;
        if (!v73)
        {
          v31 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v67, "groups");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "arrayWithCapacity:", objc_msgSend(v32, "count"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v33 = [MKLocalSearchSection alloc];
        v34 = objc_msgSend(v71, "shouldInterleaveClientResults");
        v35 = objc_msgSend(v71, "enforceServerResultsOrder");
        v36 = objc_msgSend(v71, "enableMapsSuggestServerReranking");
        v37 = objc_msgSend(v71, "isSectionForClientOnlyResults");
        objc_msgSend(v71, "includedClientResultTypes");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "excludedClientResultTypes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[MKLocalSearchSection initWithResults:title:shouldInterleaveClientResults:enforceServerResultsOrder:enableMapsSuggestServerReranking:isSectionForClientOnlyResults:includedClientResultTypes:excludedClientResultTypes:](v33, "initWithResults:title:shouldInterleaveClientResults:enforceServerResultsOrder:enableMapsSuggestServerReranking:isSectionForClientOnlyResults:includedClientResultTypes:excludedClientResultTypes:", v18, v15, v34, v35, v36, v37, v38, v39);
        objc_msgSend(v11, "addObject:", v40);

        ++v79;
        v12 = v72 + 1;
      }
      while (v72 + 1 != v70);
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
    }
    while (v70);
  }
  else
  {
    v11 = 0;
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v41 = v76;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v89 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
        objc_msgSend(v46, "directionIntent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "origin");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "resultIndex");

        objc_msgSend(v46, "directionIntent");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "origin");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "hasResultIndex"))
        {
          v52 = objc_msgSend(v78, "count");

          if (v49 >= v52)
            goto LABEL_36;
          objc_msgSend(v78, "objectAtIndex:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setDirectionIntentOrigin:", v50);
        }
        else
        {

        }
LABEL_36:
        objc_msgSend(v46, "directionIntent");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "destination");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "resultIndex");

        objc_msgSend(v46, "directionIntent");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "destination");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "hasResultIndex"))
        {
          v58 = objc_msgSend(v78, "count");

          if (v55 >= v58)
            continue;
          objc_msgSend(v78, "objectAtIndex:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setDirectionIntentDestination:", v56);
        }
        else
        {

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v43);
  }

  -[NSMutableArray lastObject](self->_pendingTickets, "lastObject");
  v59 = (id)objc_claimAutoreleasedReturnValue();

  if (v59 == v64)
  {
    -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dirty = objc_msgSend(v64, "matchesFragment:", v60) ^ 1;

  }
  else
  {
    self->_dirty = 0;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke_2;
  block[3] = &unk_1E20DC248;
  objc_copyWeak(&v84, &location);
  v81 = v78;
  v82 = v11;
  v85 = a4;
  v86 = a5;
  v83 = v64;
  v61 = v64;
  v62 = v11;
  v63 = v78;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&location);

}

void __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__MKLocalSearchCompleter__handleCompletion_shouldDisplayNoResults_shouldEnableRAPForNoResults_forTicket___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(WeakRetained, "_notifyDelegatesWithResults:sections:shouldDisplayNoResults:shouldEnableRAPForNoResults:ticket:", v2, v3, *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 48));

  }
}

- (void)_notifyDelegatesWithResults:(id)a3 sections:(id)a4 shouldDisplayNoResults:(BOOL)a5 shouldEnableRAPForNoResults:(BOOL)a6 ticket:(id)a7
{
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  GEOClientRankingModel *v20;
  GEOClientRankingModel *clientRankingModel;
  GEOSortPriorityMapping *v22;
  GEOSortPriorityMapping *sortPriorityMapping;
  GEOPDPlaceSummaryLayoutMetadata *v24;
  GEOPDPlaceSummaryLayoutMetadata *placeSummaryLayoutMetadata;
  uint64_t v26;
  int64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  NSArray *sections;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  BOOL v42;
  id v43;
  id v44;

  v44 = a3;
  v13 = a4;
  v14 = a7;
  v15 = -[NSMutableArray indexOfObject:](self->_pendingTickets, "indexOfObject:", v14);
  v16 = v15;
  if (v15)
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_22;
    v42 = a6;
    v43 = v13;
    v17 = 0;
    v18 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pendingTickets, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "addObject:", v19);
      objc_msgSend(v19, "cancel");

      ++v18;
    }
    while (v16 != v18);
  }
  else
  {
    v42 = a6;
    v43 = v13;
    v17 = 0;
  }
  -[NSMutableArray removeObjectsInRange:](self->_pendingTickets, "removeObjectsInRange:", 0, v16 + 1);
  if (objc_msgSend(v17, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_inFlightTickets, "removeObjectsInArray:", v17);
  objc_storeStrong((id *)&self->_results, a3);
  objc_storeStrong((id *)&self->_sections, a4);
  self->_shouldDisplayNoResults = a5;
  self->_shouldEnableRAPForNoResults = v42;
  self->_resultsAreCurrent = !self->_dirty;
  objc_msgSend(v14, "clientRankingModel");
  v20 = (GEOClientRankingModel *)objc_claimAutoreleasedReturnValue();
  clientRankingModel = self->_clientRankingModel;
  self->_clientRankingModel = v20;

  objc_msgSend(v14, "sortPriorityMapping");
  v22 = (GEOSortPriorityMapping *)objc_claimAutoreleasedReturnValue();
  sortPriorityMapping = self->_sortPriorityMapping;
  self->_sortPriorityMapping = v22;

  self->_autocompleteTopSectionIsQuerySuggestions = objc_msgSend(v14, "autocompleteTopSectionIsQuerySuggestions");
  self->_showAutocompleteClientSource = objc_msgSend(v14, "showAutocompleteClientSource");
  self->_shouldEnableGrayscaleHighlighting = objc_msgSend(v14, "shouldEnableGrayscaleHighlighting");
  objc_msgSend(v14, "placeSummaryLayoutMetadata");
  v24 = (GEOPDPlaceSummaryLayoutMetadata *)objc_claimAutoreleasedReturnValue();
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  self->_placeSummaryLayoutMetadata = v24;

  self->_shouldUseDistanceFeatureServerResults = objc_msgSend(v14, "shouldUseDistanceFeatureServerResults");
  v26 = objc_msgSend(v14, "highlightType");
  v27 = v26 == 1;
  if (v26 == 2)
    v27 = 2;
  self->_highlightType = v27;
  self->_enableStructuredRAPAffordance = objc_msgSend(v14, "enableStructuredRAPAffordance");
  -[MKLocalSearchCompleter delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    -[MKLocalSearchCompleter delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLastTicket:", v14);

  }
  -[MKLocalSearchCompleter delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[MKLocalSearchCompleter delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "completerDidUpdateResults:finished:", self, 1);

  }
  -[MKLocalSearchCompleter delegate](self, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_respondsToSelector();

  if ((v35 & 1) != 0)
  {
    -[MKLocalSearchCompleter delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    sections = self->_sections;
    objc_msgSend(v14, "_searchQuery");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "completer:didUpdateResultsWithSections:forQueryFragment:", self, sections, v38);

  }
  -[MKLocalSearchCompleter delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_respondsToSelector();

  if ((v40 & 1) != 0)
  {
    -[MKLocalSearchCompleter delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "completerDidUpdateResults:", self);

  }
  v13 = v43;
LABEL_22:

}

- (void)_handleError:(id)a3 forTicket:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v28, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (objc_msgSend(v28, "code") == -2)
    {
      -[NSMutableArray removeObject:](self->_pendingTickets, "removeObject:", v6);
      goto LABEL_21;
    }
    if (objc_msgSend(v28, "code") == -8)
    {
      objc_msgSend(v28, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D26598]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = objc_msgSend(v11, "BOOLValue");
      else
        v12 = 0;
      objc_msgSend(v28, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D265A0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = objc_msgSend(v26, "BOOLValue");
      else
        v27 = 0;
      -[MKLocalSearchCompleter _handleCompletion:shouldDisplayNoResults:shouldEnableRAPForNoResults:forTicket:](self, "_handleCompletion:shouldDisplayNoResults:shouldEnableRAPForNoResults:forTicket:", 0, v12, v27, v6);

      goto LABEL_20;
    }
  }
  v13 = -[NSMutableArray indexOfObject:](self->_pendingTickets, "indexOfObject:", v6);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingTickets, "removeObjectAtIndex:", v13);
    *(_WORD *)&self->_shouldDisplayNoResults = 0;
    if (!-[NSMutableArray count](self->_pendingTickets, "count"))
    {
      -[MKLocalSearchCompleter delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[MKLocalSearchCompleter delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "completerDidFail:error:", self, v28);

      }
      -[MKLocalSearchCompleter delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        -[MKLocalSearchCompleter delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_mapkit_error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "completer:didFailWithError:", self, v20);

      }
      -[MKLocalSearchCompleter delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[MKLocalSearchCompleter delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_mapkit_error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_searchQuery");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "completer:didFailWithError:forQueryFragment:", self, v23, v24);

LABEL_20:
      }
    }
  }
LABEL_21:

}

- (void)_fireRequest
{
  void *v3;
  GEOMapServiceTraits *traits;
  GEOMapServiceTraits *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t privateFilterType;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  MKLocationManagerOperation *v31;
  MKLocationManagerOperation *singleLocationUpdate;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];

  -[MKLocalSearchCompleter _cancelTimer](self, "_cancelTimer");
  while (-[NSMutableArray count](self->_inFlightTickets, "count") >= self->_maxNumberOfConcurrentRequests)
  {
    -[NSMutableArray firstObject](self->_inFlightTickets, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_inFlightTickets, "removeObjectAtIndex:", 0);
    -[NSMutableArray removeObject:](self->_pendingTickets, "removeObject:", v3);
    objc_msgSend(v3, "cancel");

  }
  traits = self->_traits;
  if (traits)
  {
    v5 = traits;
  }
  else
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultTraits");
    v5 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue();

  }
  -[MKLocalSearchCompleter region](self, "region");
  if (fabs(v8) >= 0.00000000999999994 || fabs(v7) >= 0.00000000999999994)
  {
    objc_msgSend(MEMORY[0x1E0D27208], "_mapkit_mapRegionForCoordinateRegion:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapServiceTraits setMapRegion:](v5, "setMapRegion:", v9);

  }
  -[GEOMapServiceTraits setSource:](v5, "setSource:", -[MKLocalSearchCompleter source](self, "source"));
  -[MKLocalSearchCompleter timeSinceLastInBoundingRegion](self, "timeSinceLastInBoundingRegion");
  LODWORD(v11) = vcvtmd_u64_f64(v10);
  -[GEOMapServiceTraits setTimeSinceMapViewportChanged:](v5, "setTimeSinceMapViewportChanged:", v11);
  v12 = -[MKLocalSearchCompleter mapType](self, "mapType");
  v13 = 1;
  switch(v12)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
    case 3uLL:
      v13 = 2;
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      v13 = 3;
      goto LABEL_16;
    default:
      if (v12 == 102)
        goto LABEL_16;
      if (v12 == 104)
      {
        v13 = 4;
LABEL_16:
        -[GEOMapServiceTraits setMode:](v5, "setMode:", v13);
      }
      -[MKLocalSearchCompleter deviceLocation](self, "deviceLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0D27168]);
        -[MKLocalSearchCompleter deviceLocation](self, "deviceLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithCLLocation:", v16);
        -[GEOMapServiceTraits setDeviceLocation:](v5, "setDeviceLocation:", v17);

      }
      v18 = MEMORY[0x1E0C809B0];
      if (!traits)
      {
        -[GEOMapServiceTraits deviceLocation](v5, "deviceLocation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 || self->_singleLocationUpdate)
        {

        }
        else
        {
          +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isLocationServicesAvailable");

          if (v29)
          {
            +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v39[0] = v18;
            v39[1] = 3221225472;
            v39[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke;
            v39[3] = &unk_1E20DC270;
            v39[4] = self;
            objc_msgSend(v30, "singleLocationUpdateWithHandler:", v39);
            v31 = (MKLocationManagerOperation *)objc_claimAutoreleasedReturnValue();
            singleLocationUpdate = self->_singleLocationUpdate;
            self->_singleLocationUpdate = v31;

            -[MKLocationManagerOperation start](self->_singleLocationUpdate, "start");
          }
        }
      }
      -[GEOMapServiceTraits setPhotosCount:](v5, "setPhotosCount:", 0);
      privateFilterType = self->_privateFilterType;
      if (privateFilterType)
        -[MKLocalSearchCompleter _completionTicketForPrivateFilterType:traits:](self, "_completionTicketForPrivateFilterType:traits:", privateFilterType, v5);
      else
        -[MKLocalSearchCompleter _completionTicketForFilterTypeWithTraits:](self, "_completionTicketForFilterTypeWithTraits:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_pendingTickets, "addObject:", v21);
      -[NSMutableArray addObject:](self->_inFlightTickets, "addObject:", v21);
      self->_lastRequestTime = CACurrentMediaTime();
      v38[0] = v18;
      v38[1] = 3221225472;
      v38[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_2;
      v38[3] = &unk_1E20D82F8;
      v38[4] = self;
      v22 = (void *)MEMORY[0x18D778DB8](v38);
      -[MKLocalSearchCompleter analyticsProvider](self, "analyticsProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "captureNewMetrics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v22;
      v35[0] = v18;
      v35[1] = 3221225472;
      v35[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_3;
      v35[3] = &unk_1E20DC298;
      v35[4] = self;
      v36 = v21;
      v37 = v24;
      v33[0] = v18;
      v33[1] = 3221225472;
      v33[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_6;
      v33[3] = &unk_1E20D8688;
      v25 = v22;
      v26 = v24;
      v27 = v21;
      objc_msgSend(v27, "submitWithAutoCompletionHandler:networkActivity:", v35, v33);

      return;
  }
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  if (a2 && !a3)
    objc_msgSend(*(id *)(a1 + 32), "_markDirty");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = 0;

}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  char v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completerWillAccessNetwork:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completerDidAccessNetwork:", *(_QWORD *)(a1 + 32));
  }

}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  double v12;
  double v13;
  dispatch_time_t v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_4;
  v17[3] = &unk_1E20D9628;
  v8 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v9 = v6;
  v19 = v9;
  v20 = *(id *)(a1 + 48);
  v10 = v5;
  v21 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v17);
  GEOConfigGetDouble();
  if (v12 > 0.0 && (v13 = v12 - (CACurrentMediaTime() - *(double *)(*(_QWORD *)(a1 + 32) + 128)), v13 > 0.0))
  {
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_5;
    v15[3] = &unk_1E20D7EF8;
    v16 = v11;
    dispatch_after(v14, MEMORY[0x1E0C80D38], v15);

  }
  else if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v11[2](v11);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  }

}

_QWORD *__38__MKLocalSearchCompleter__fireRequest__block_invoke_4(uint64_t a1)
{
  _QWORD *result;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  result = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (result != (_QWORD *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "removeObject:", *(_QWORD *)(a1 + 40));
    v3 = *(id *)(a1 + 48);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        v7 = objc_msgSend(v4, "code");

        if (v7 == -3)
        {
          v8 = 2;
LABEL_9:

          objc_msgSend(*(id *)(a1 + 56), "submitWithStatus:", v8);
          v9 = *(void **)(a1 + 32);
          if (!*(_QWORD *)(a1 + 64) || *(_QWORD *)(a1 + 48))
          {
            objc_msgSend(v9, "_handleError:forTicket:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
            result = *(_QWORD **)(a1 + 32);
            if (!result[22])
              return result;
          }
          else
          {
            objc_msgSend(v9, "_handleCompletion:shouldDisplayNoResults:shouldEnableRAPForNoResults:forTicket:");
            result = *(_QWORD **)(a1 + 32);
          }
          return (_QWORD *)objc_msgSend(result, "_schedulePendingRequest");
        }
      }
      else
      {

      }
    }
    v8 = 1;
    goto LABEL_9;
  }
  return result;
}

uint64_t __38__MKLocalSearchCompleter__fireRequest__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__MKLocalSearchCompleter__fireRequest__block_invoke_6(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  char v6;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__MKLocalSearchCompleter__fireRequest__block_invoke_7;
    v4[3] = &unk_1E20DAAF8;
    v5 = *(id *)(a1 + 32);
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __38__MKLocalSearchCompleter__fireRequest__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_completionTicketForFilterTypeWithTraits:(id)a3
{
  id v4;
  GEOAutocompleteSessionData *autocompleteSessionData;
  GEOAutocompleteSessionData *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;

  v4 = a3;
  if (self->_statefulQueriesEnabled)
    autocompleteSessionData = self->_autocompleteSessionData;
  else
    autocompleteSessionData = 0;
  v6 = autocompleteSessionData;
  if (!-[MKLocalSearchCompleter resultTypes](self, "resultTypes")
    || (-[MKLocalSearchCompleter resultTypes](self, "resultTypes") & 4) != 0)
  {
    v11 = -[MKLocalSearchCompleter listType](self, "listType");
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ticketForSectionedAutoCompleteSearchFragment:filters:sessionData:traits:", v9, self->_filters, v6, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ticketForInterleavedAutoCompleteSearchFragment:filters:sessionData:traits:", v9, self->_filters, v6, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    v7 = -[MKLocalSearchCompleter listType](self, "listType");
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ticketForSectionedInstantSearchFragment:filters:sessionData:traits:", v9, self->_filters, v6, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ticketForInterleavedInstantSearchFragment:filters:sessionData:traits:", v9, self->_filters, v6, v4);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v12 = (void *)v10;

      goto LABEL_16;
    }
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)_completionTicketForPrivateFilterType:(int64_t)a3 traits:(id)a4
{
  id v6;
  GEOAutocompleteSessionData *autocompleteSessionData;
  GEOAutocompleteSessionData *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *filters;
  void *v15;
  void *v16;

  v6 = a4;
  if (self->_statefulQueriesEnabled)
    autocompleteSessionData = self->_autocompleteSessionData;
  else
    autocompleteSessionData = 0;
  v8 = autocompleteSessionData;
  switch(a3)
  {
    case 1000:
      v9 = -[MKLocalSearchCompleter listType](self, "listType");
      if (v9 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ticketForSectionedLocalitiesAndLandmarksSearchFragment:sessionData:traits:", v11, v8, v6);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9)
          goto LABEL_8;
        objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ticketForInterleavedLocalitiesAndLandmarksSearchFragment:sessionData:traits:", v11, v8, v6);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_13;
    case 1001:
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      filters = self->_filters;
      -[MKLocalSearchCompleter retainedSearchMetadata](self, "retainedSearchMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompletion _geoCompletionItem](self->_tappedQuerySuggestionCompletion, "_geoCompletionItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ticketForInterleavedAutoCompleteWithBrowseSearchFragment:filters:retainedSearch:tappedQuerySuggestion:sessionData:traits:", v11, filters, v15, v16, v8, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 1002:
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ticketForInterleavedAutoCompletePoiAddressOnly:sessionData:traits:", v11, v8, v6);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1003:
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ticketForOfflineRegionSearchFragment:sessionData:traits:", v11, v8, v6);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v13 = (void *)v12;
LABEL_14:

      break;
    default:
LABEL_8:
      v13 = 0;
      break;
  }

  return v13;
}

- (void)_schedulePendingRequest
{
  -[MKLocalSearchCompleter _cancelTimer](self, "_cancelTimer");
  if (self->_dirty)
  {
    -[MKLocalSearchCompleter timeToNextRequest](self, "timeToNextRequest");
    -[MKLocalSearchCompleter _scheduleRequestWithTimeToNextRequest:](self, "_scheduleRequestWithTimeToNextRequest:");
  }
}

- (void)_markDirty
{
  -[MKLocalSearchCompleter timeToNextRequest](self, "timeToNextRequest");
  -[MKLocalSearchCompleter _markDirtyAndScheduleRequestWithTimeToNextRequest:](self, "_markDirtyAndScheduleRequestWithTimeToNextRequest:");
}

- (void)_markDirtyAndScheduleRequestWithTimeToNextRequest:(double)a3
{
  void *v5;
  char v6;
  void *v7;

  -[MKLocalSearchCompleter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MKLocalSearchCompleter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completerWillUpdateResults:", self);

  }
  *(_WORD *)&self->_dirty = 1;
  -[MKLocalSearchCompleter _scheduleRequestWithTimeToNextRequest:](self, "_scheduleRequestWithTimeToNextRequest:", a3);
}

- (void)_scheduleRequestWithTimeToNextRequest:(double)a3
{
  NSTimer *v4;
  NSTimer *timer;

  if (!self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fireRequest, 0, 0, a3);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v4;

  }
}

- (double)timeToNextRequest
{
  double v3;
  double result;
  double RequestInterval;
  double v6;

  v3 = CACurrentMediaTime() - self->_lastRequestTime;
  if (-[NSMutableArray count](self->_inFlightTickets, "count") != self->_maxNumberOfConcurrentRequests)
  {
    v6 = searchNextRequestInterval() - v3;
    result = 0.0;
    if (v6 < 0.0)
      return result;
    RequestInterval = searchNextRequestInterval();
    return RequestInterval - v3;
  }
  if (qword_1ECE2DC68 != -1)
    dispatch_once(&qword_1ECE2DC68, &__block_literal_global_73);
  result = 0.0;
  if (*(double *)_MergedGlobals_159 - v3 >= 0.0)
  {
    RequestInterval = *(double *)_MergedGlobals_159;
    return RequestInterval - v3;
  }
  return result;
}

- (void)setQueryFragment:(NSString *)queryFragment
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = queryFragment;
  if (!-[NSString isEqualToString:](v4, "isEqualToString:", self->_queryFragment))
  {
    v24 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    v6 = self->_queryFragment;
    self->_queryFragment = v5;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_pendingTickets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v25 = 0;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v12, "_searchQuery");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            v15 = self->_queryFragment;
            objc_msgSend(v12, "_searchQuery");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString hasPrefix:](v15, "hasPrefix:", v16))
            {

            }
            else
            {
              v17 = self->_queryFragment;
              objc_msgSend(v12, "_searchQuery");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = -[NSString isEqualToString:](v17, "isEqualToString:", v18);

              if ((v17 & 1) == 0)
              {
                objc_msgSend(v12, "cancel");
                v19 = v25;
                if (!v25)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v25 = v19;
                objc_msgSend(v19, "addObject:", v12);
              }
            }
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }
    else
    {
      v25 = 0;
    }

    if (objc_msgSend(v25, "count"))
    {
      -[NSMutableArray removeObjectsInArray:](self->_inFlightTickets, "removeObjectsInArray:", v25);
      -[NSMutableArray removeObjectsInArray:](self->_pendingTickets, "removeObjectsInArray:", v25);
    }
    -[MKLocalSearchCompleter timeToNextRequest](self, "timeToNextRequest");
    v21 = v20;
    v4 = v24;
    if (v20 > 0.0)
    {
      -[MKLocalSearchCompleter analyticsProvider](self, "analyticsProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "captureNewMetrics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "submitWithStatus:", 3);
    }
    -[MKLocalSearchCompleter _markDirtyAndScheduleRequestWithTimeToNextRequest:](self, "_markDirtyAndScheduleRequestWithTimeToNextRequest:", v21);

  }
}

- (MKSearchCompletionFilterType)filterType
{
  MKSearchCompletionFilterType result;

  result = self->_privateFilterType;
  if (result == MKSearchCompletionFilterTypeLocationsAndQueries)
  {
    result = -[MKLocalSearchCompleter resultTypes](self, "resultTypes");
    if (result)
      return ~(-[MKLocalSearchCompleter resultTypes](self, "resultTypes") >> 2) & 1;
  }
  return result;
}

- (void)setFilterType:(MKSearchCompletionFilterType)filterType
{
  if ((unint64_t)(filterType - 1000) >= 4)
  {
    if (filterType)
    {
      if (filterType != MKSearchCompletionFilterTypeLocationsOnly)
        return;
      filterType = 3;
    }
    -[MKLocalSearchCompleter setResultTypes:](self, "setResultTypes:", filterType);
    filterType = MKSearchCompletionFilterTypeLocationsAndQueries;
  }
  -[MKLocalSearchCompleter _setPrivateFilterType:](self, "_setPrivateFilterType:", filterType);
}

- (void)setResultTypes:(MKLocalSearchCompleterResultType)resultTypes
{
  if (self->_resultTypes != resultTypes)
  {
    self->_resultTypes = resultTypes;
    -[MKLocalSearchCompleter _updateFilters](self, "_updateFilters");
  }
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  MKPointOfInterestFilter *v4;
  MKPointOfInterestFilter *v5;

  if (self->_pointOfInterestFilter != pointOfInterestFilter)
  {
    v4 = (MKPointOfInterestFilter *)-[MKPointOfInterestFilter copy](pointOfInterestFilter, "copy");
    v5 = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v4;

    -[MKLocalSearchCompleter _updateFilters](self, "_updateFilters");
  }
}

- (void)setCategoryFilter:(id)a3
{
  GEOSearchCategory *v5;
  GEOSearchCategory *v6;

  v5 = (GEOSearchCategory *)a3;
  if (self->_categoryFilter != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_categoryFilter, a3);
    -[MKLocalSearchCompleter _updateFilters](self, "_updateFilters");
    v5 = v6;
  }

}

- (void)setAddressFilter:(id)a3
{
  MKAddressFilter *v4;
  MKAddressFilter *addressFilter;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_addressFilter) & 1) == 0)
  {
    v4 = (MKAddressFilter *)objc_msgSend(v6, "copy");
    addressFilter = self->_addressFilter;
    self->_addressFilter = v4;

    -[MKLocalSearchCompleter _updateFilters](self, "_updateFilters");
  }

}

- (void)_updateFilters
{
  NSArray *v3;
  void *v4;
  MKPointOfInterestFilter *pointOfInterestFilter;
  void *v6;
  MKAddressFilter *addressFilter;
  void *v8;
  unint64_t resultTypes;
  _BOOL4 v10;
  void *v12;
  id v13;
  NSArray *filters;
  NSArray *v15;
  NSUInteger v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (self->_categoryFilter)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F20]), "initWithCategory:", self->_categoryFilter);
    if (v4)
      -[NSArray addObject:](v3, "addObject:", v4);

  }
  pointOfInterestFilter = self->_pointOfInterestFilter;
  if (pointOfInterestFilter)
  {
    -[MKPointOfInterestFilter _geoPOICategoryFilter](pointOfInterestFilter, "_geoPOICategoryFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSArray addObject:](v3, "addObject:", v6);

  }
  addressFilter = self->_addressFilter;
  if (addressFilter)
  {
    -[MKAddressFilter _geoAddressFilter](addressFilter, "_geoAddressFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NSArray addObject:](v3, "addObject:", v8);

  }
  resultTypes = self->_resultTypes;
  if (resultTypes)
  {
    v10 = _MKLinkedOnOrAfterReleaseSet(3852);
    if ((resultTypes & 2) != 0 && !v10)
      resultTypes |= 8uLL;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27438]), "initWithResultTypes:", resultTypes);
    -[NSArray addObject:](v3, "addObject:", v12);

  }
  if (self->_regionPriority == 1)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D27598]);
    -[NSArray addObject:](v3, "addObject:", v13);

  }
  filters = self->_filters;
  self->_filters = v3;
  v15 = v3;

  v16 = -[NSString length](self->_queryFragment, "length");
  if (v16)
    -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
}

- (void)setRetainedSearchMetadata:(id)a3
{
  GEORetainedSearchMetadata *v5;

  v5 = (GEORetainedSearchMetadata *)a3;
  if (self->_retainedSearchMetadata != v5)
  {
    objc_storeStrong((id *)&self->_retainedSearchMetadata, a3);
    if (-[NSString length](self->_queryFragment, "length"))
      -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
  }

}

- (void)setSource:(int)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    if (-[NSString length](self->_queryFragment, "length"))
      -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
  }
}

- (int)source
{
  return self->_source;
}

- (void)setRegion:(MKCoordinateRegion)region
{
  void *v4;
  uint64_t v5;

  self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)region;
  -[MKLocalSearchCompleter queryFragment](self, "queryFragment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
}

- (void)setRegionPriority:(int64_t)a3
{
  if (self->_regionPriority != a3)
  {
    self->_regionPriority = a3;
    -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
  }
}

- (BOOL)isSearching
{
  return self->_timer || -[NSMutableArray count](self->_pendingTickets, "count") != 0;
}

- (BOOL)resultsAreCurrent
{
  return self->_resultsAreCurrent;
}

- (void)_cancelTimer
{
  NSTimer *timer;
  NSTimer *v4;

  timer = self->_timer;
  if (timer)
  {
    -[NSTimer invalidate](timer, "invalidate");
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)cancel
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MKLocationManagerOperation *singleLocationUpdate;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MKLocalSearchCompleter _cancelTimer](self, "_cancelTimer");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_inFlightTickets;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_inFlightTickets, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingTickets, "removeAllObjects");
  -[MKLocationManagerOperation cancel](self->_singleLocationUpdate, "cancel");
  singleLocationUpdate = self->_singleLocationUpdate;
  self->_singleLocationUpdate = 0;

}

- (void)retry
{
  if (!-[MKLocalSearchCompleter isSearching](self, "isSearching") && self->_dirty)
    -[MKLocalSearchCompleter _markDirty](self, "_markDirty");
}

- (NSArray)results
{
  return self->_results;
}

- (GEOAutocompleteSessionData)_recentAutocompleteSessionData
{
  return self->_autocompleteSessionData;
}

- (void)clearQueryState
{
  GEOAutocompleteSessionData *v3;
  GEOAutocompleteSessionData *autocompleteSessionData;

  v3 = (GEOAutocompleteSessionData *)objc_alloc_init(MEMORY[0x1E0D26F10]);
  autocompleteSessionData = self->_autocompleteSessionData;
  self->_autocompleteSessionData = v3;

}

- (BOOL)statefulQueriesEnabled
{
  return self->_statefulQueriesEnabled;
}

- (void)setStatefulQueriesEnabled:(BOOL)a3
{
  GEOAutocompleteSessionData *v4;
  GEOAutocompleteSessionData *autocompleteSessionData;
  GEOAutocompleteSessionData *v6;

  if (self->_statefulQueriesEnabled != a3)
  {
    self->_statefulQueriesEnabled = a3;
    if (a3)
    {
      v4 = (GEOAutocompleteSessionData *)objc_alloc_init(MEMORY[0x1E0D26F10]);
      autocompleteSessionData = self->_autocompleteSessionData;
      self->_autocompleteSessionData = v4;

    }
    else
    {
      v6 = self->_autocompleteSessionData;
      self->_autocompleteSessionData = 0;

    }
  }
}

- (int64_t)entriesType
{
  unint64_t v3;

  if (-[MKLocalSearchCompleter _privateFilterType](self, "_privateFilterType"))
  {
    v3 = -[MKLocalSearchCompleter _privateFilterType](self, "_privateFilterType") - 1000;
    if (v3 < 3)
      return qword_18B2AEE00[v3];
  }
  return !-[MKLocalSearchCompleter resultTypes](self, "resultTypes")
      || (-[MKLocalSearchCompleter resultTypes](self, "resultTypes") & 4) != 0;
}

- (void)setEntriesType:(int64_t)a3
{
  uint64_t v4;

  if ((unint64_t)a3 <= 5 && ((0x33u >> a3) & 1) != 0)
  {
    v4 = qword_18B2AEE48[a3];
    -[MKLocalSearchCompleter setResultTypes:](self, "setResultTypes:", qword_18B2AEE18[a3]);
    -[MKLocalSearchCompleter _setPrivateFilterType:](self, "_setPrivateFilterType:", v4);
  }
}

- (NSString)queryFragment
{
  return self->_queryFragment;
}

- (MKCoordinateRegion)region
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_region.center.latitude;
  longitude = self->_region.center.longitude;
  latitudeDelta = self->_region.span.latitudeDelta;
  longitudeDelta = self->_region.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (GEOSearchCategory)categoryFilter
{
  return self->_categoryFilter;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak(&self->_context, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)listType
{
  return self->_listType;
}

- (void)setListType:(int64_t)a3
{
  self->_listType = a3;
}

- (double)timeSinceLastInBoundingRegion
{
  return self->_timeSinceLastInBoundingRegion;
}

- (void)setTimeSinceLastInBoundingRegion:(double)a3
{
  self->_timeSinceLastInBoundingRegion = a3;
}

- (CLLocation)deviceLocation
{
  return self->_deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (int64_t)regionPriority
{
  return self->_regionPriority;
}

- (MKLocalSearchCompleterResultType)resultTypes
{
  return self->_resultTypes;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (MKAddressFilter)addressFilter
{
  return self->_addressFilter;
}

- (MKAutocompleteAnalyticsProvider)analyticsProvider
{
  return self->_analyticsProvider;
}

- (void)setAnalyticsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsProvider, a3);
}

- (BOOL)_shouldDisplayNoResults
{
  return self->_shouldDisplayNoResults;
}

- (BOOL)_shouldEnableRAPForNoResults
{
  return self->_shouldEnableRAPForNoResults;
}

- (GEOClientRankingModel)_clientRankingModel
{
  return self->_clientRankingModel;
}

- (GEOSortPriorityMapping)_sortPriorityMapping
{
  return self->_sortPriorityMapping;
}

- (BOOL)_autocompleteTopSectionIsQuerySuggestions
{
  return self->_autocompleteTopSectionIsQuerySuggestions;
}

- (MKLocalSearchCompletion)_tappedQuerySuggestionCompletion
{
  return self->_tappedQuerySuggestionCompletion;
}

- (void)_setTappedQuerySuggestionCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_tappedQuerySuggestionCompletion, a3);
}

- (BOOL)_showAutocompleteClientSource
{
  return self->_showAutocompleteClientSource;
}

- (BOOL)_shouldPreloadTransitInfo
{
  return self->_shouldPreloadTransitInfo;
}

- (void)_setShouldPreloadTransitInfo:(BOOL)a3
{
  self->_shouldPreloadTransitInfo = a3;
}

- (NSArray)_sections
{
  return self->_sections;
}

- (int64_t)_privateFilterType
{
  return self->_privateFilterType;
}

- (void)_setPrivateFilterType:(int64_t)a3
{
  self->_privateFilterType = a3;
}

- (BOOL)_shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (BOOL)_shouldUseDistanceFeatureServerResults
{
  return self->_shouldUseDistanceFeatureServerResults;
}

- (GEOPDPlaceSummaryLayoutMetadata)_placeSummaryLayoutMetadata
{
  return self->_placeSummaryLayoutMetadata;
}

- (int64_t)_highlightType
{
  return self->_highlightType;
}

- (BOOL)_enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_tappedQuerySuggestionCompletion, 0);
  objc_storeStrong((id *)&self->_analyticsProvider, 0);
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_pendingTickets, 0);
  objc_storeStrong((id *)&self->_inFlightTickets, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_singleLocationUpdate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_sortPriorityMapping, 0);
  objc_storeStrong((id *)&self->_clientRankingModel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak(&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_categoryFilter, 0);
  objc_storeStrong((id *)&self->_queryFragment, 0);
}

void *MapKitConfig_MKLocalSearchCompleter_MaxConcurrentRequests_Metadata_block_invoke_5()
{
  return &unk_1E2159130;
}

@end
