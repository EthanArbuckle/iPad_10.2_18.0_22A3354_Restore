@implementation _GEOPlaceSearchAutocompleteTicket

- (_GEOPlaceSearchAutocompleteTicket)initWithRequest:(id)a3 traits:(id)a4 searchQuery:(id)a5 sessionData:(id)a6
{
  id v10;
  id v11;
  _GEOPlaceSearchAutocompleteTicket *v12;
  uint64_t v13;
  NSString *searchQuery;
  _GEOPlaceSearchAutocompleteTicket *v15;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_GEOPlaceSearchAutocompleteTicket;
  v12 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:](&v17, sel_initWithRequest_traits_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    searchQuery = v12->_searchQuery;
    v12->_searchQuery = (NSString *)v13;

    objc_storeStrong((id *)&v12->_sessionData, a6);
    v15 = v12;
  }

  return v12;
}

- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4
{
  -[_GEOPlaceSearchAutocompleteTicket submitWithAutoCompletionHandler:auditToken:networkActivity:](self, "submitWithAutoCompletionHandler:auditToken:networkActivity:", a3, 0, a4);
}

- (void)submitWithAutoCompletionHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke;
  v10[3] = &unk_1E1C069B8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v10, a4, a5, 5.0);

}

- (BOOL)matchesFragment:(id)a3
{
  return -[NSString isEqualToString:](self->_searchQuery, "isEqualToString:", a3);
}

- (void)applyToSuggestionList:(id)a3
{
  GEOPDPlaceRequest *request;
  id v5;

  request = self->super._request;
  v5 = a3;
  objc_msgSend(v5, "setAutocompleteRequest:", request);
  objc_msgSend(v5, "setAutocompleteResponse:", self->super._response);

}

- (void)applyToSuggestionEntry:(id)a3 withAutocompleteSearchResultIdentifier:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  uint64_t i;
  id *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  _GEOPlaceSearchAutocompleteTicket *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = self;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v8);
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteResult sections](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v32)
  {
    v26 = v6;
    obj = v10;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v12 = *(id **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[GEOPDAutocompleteResultSection entries](v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v14)
        {
          v15 = v14;
          v33 = v12;
          v16 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v18, "business");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "muid");
              v21 = objc_msgSend(v7, "muid");

              if (v20 == v21)
              {
                -[GEOPDPlaceResponse globalResult](v28->super._response, "globalResult");
                v22 = (id *)objc_claimAutoreleasedReturnValue();
                -[GEOPDPlaceGlobalResult autocompleteResult](v22);
                v23 = (id *)objc_claimAutoreleasedReturnValue();
                -[GEOPDAutocompleteResult sections](v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v24, "indexOfObject:", v33);

                -[GEOPDAutocompleteResultSection entries](v33);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v25, "indexOfObject:", v18);

                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v32);

    v6 = v26;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v26, "setServerSearchCompletionSectionIndex:");
      objc_msgSend(v26, "setServerSearchCompletionEntryIndex:", v29);
    }
  }
  else
  {

  }
}

- (double)retainSearchTime
{
  int v3;
  double v4;
  id *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  char *v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;

  v3 = -[GEOPDPlaceResponse requestType](self->super._response, "requestType");
  if (v3 == 10)
  {
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v5);
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12;
    v4 = 0.0;
    if (!v12 || (*(_BYTE *)(v12 + 104) & 4) == 0)
      goto LABEL_13;
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v8);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_12;
    v11 = &OBJC_IVAR___GEOPDAutocompleteResult__retainSearchTime;
    goto LABEL_11;
  }
  v4 = 0.0;
  if (v3 == 1)
  {
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult searchResult](v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (!v6 || (*(_BYTE *)(v6 + 248) & 4) == 0)
      goto LABEL_13;
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult searchResult](v8);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_12:

LABEL_13:
      return v4;
    }
    v11 = &OBJC_IVAR___GEOPDSearchResult__retainSearchTime;
LABEL_11:
    LODWORD(v10) = *(_DWORD *)&v9[*v11];
    v4 = (double)v10;
    goto LABEL_12;
  }
  return v4;
}

- (BOOL)hasShouldDisplayNoResults
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") != 10)
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[105] & 1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldDisplayNoResults
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (!-[_GEOPlaceSearchAutocompleteTicket hasShouldDisplayNoResults](self, "hasShouldDisplayNoResults"))
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[101] != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)hasShouldEnableGrayscaleHighlighting
{
  id *v3;
  unsigned __int8 *v4;
  _BOOL4 v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") == 10)
  {
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v3);
    v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (v4[105] >> 1) & 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (!-[_GEOPlaceSearchAutocompleteTicket hasShouldEnableGrayscaleHighlighting](self, "hasShouldEnableGrayscaleHighlighting"))return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[102] != 0;
  else
    v5 = 0;

  return v5;
}

- (id)clientRankingModel
{
  id *v2;
  id *v3;
  void *v4;
  GEOClientRankingModel *v5;

  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteResult clientRankingFeatureMetadatas](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[GEOClientRankingModel initWithGEOPDClientRankingFeatureMetadata:]([GEOClientRankingModel alloc], "initWithGEOPDClientRankingFeatureMetadata:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)sortPriorityMapping
{
  id *v2;
  id *v3;
  void *v4;
  GEOSortPriorityMapping *v5;

  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteResult sortPriorityMappings](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[GEOSortPriorityMapping initWithAutocompleteResultSortPriorityMapping:]([GEOSortPriorityMapping alloc], "initWithAutocompleteResultSortPriorityMapping:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)autocompleteTopSectionIsQuerySuggestions
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") != 10)
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[99] != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)showAutocompleteClientSource
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") != 10)
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[100] != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  id *v3;
  _BYTE *v4;
  BOOL v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") != 10)
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[103] != 0;
  else
    v5 = 0;

  return v5;
}

- (id)placeSummaryLayoutMetadata
{
  id *v3;
  id *v4;
  void *v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") == 10)
  {
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult autocompleteResult](v3);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAutocompleteResult placeSummaryLayoutMetadata](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)highlightType
{
  id *v3;
  os_unfair_lock_s *v4;
  unsigned int v5;

  if (-[GEOPDPlaceResponse requestType](self->super._response, "requestType") != 10)
    return 0;
  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPDAutocompleteResult highlightType](v4);

  if (v5 == 2)
    return 2;
  else
    return v5 == 1;
}

- (BOOL)enableStructuredRAPAffordance
{
  id *v2;
  _BYTE *v3;
  BOOL v4;

  -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[97] != 0;
  else
    v4 = 0;

  return v4;
}

- (id)geoMapItemIdentifierForSpotlight
{
  return 0;
}

- (NSString)_searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
