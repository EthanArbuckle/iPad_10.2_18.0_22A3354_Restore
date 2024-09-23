@implementation VNRequestForensics

- (id)_humanReadableLabelForRequest:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_requestToHumanReadableLabelMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = -[NSMapTable count](self->_requestToHumanReadableLabelMap, "count") + 1;
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_opt_class();
      VNRequestRevisionString(v8, objc_msgSend(v4, "resolvedRevision"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ #%lu (%p)"), v9, v6, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_requestToHumanReadableLabelMap, "setObject:forKey:", v5, v4);
    }
    v10 = v5;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VNRequestForensics)initWithOriginalRequests:(id)a3
{
  id v4;
  VNRequestForensics *v5;
  uint64_t v6;
  NSArray *originalRequests;
  NSMutableArray *v8;
  NSMutableArray *implicitRequests;
  NSMutableArray *v10;
  NSMutableArray *performedRequests;
  NSMutableArray *v12;
  NSMutableArray *cachedRequestResults;
  NSMutableArray *v14;
  NSMutableArray *checkedCachedResultsOnBehalfOfRequest;
  NSMutableArray *v16;
  NSMutableArray *locatedCachedResultsOnBehalfOfRequest;
  NSMutableArray *v18;
  NSMutableArray *ledger;
  uint64_t v20;
  NSMapTable *requestToHumanReadableLabelMap;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  VNRequestForensics *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNRequestForensics;
  v5 = -[VNRequestForensics init](&v34, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    originalRequests = v5->_originalRequests;
    v5->_originalRequests = (NSArray *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    implicitRequests = v5->_implicitRequests;
    v5->_implicitRequests = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    performedRequests = v5->_performedRequests;
    v5->_performedRequests = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cachedRequestResults = v5->_cachedRequestResults;
    v5->_cachedRequestResults = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    checkedCachedResultsOnBehalfOfRequest = v5->_checkedCachedResultsOnBehalfOfRequest;
    v5->_checkedCachedResultsOnBehalfOfRequest = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    locatedCachedResultsOnBehalfOfRequest = v5->_locatedCachedResultsOnBehalfOfRequest;
    v5->_locatedCachedResultsOnBehalfOfRequest = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ledger = v5->_ledger;
    v5->_ledger = v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    requestToHumanReadableLabelMap = v5->_requestToHumanReadableLabelMap;
    v5->_requestToHumanReadableLabelMap = (NSMapTable *)v20;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v4;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = -[VNRequestForensics _humanReadableLabelForRequest:](v5, "_humanReadableLabelForRequest:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26++), (_QWORD)v30);
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }

    v28 = v5;
  }

  return v5;
}

- (void)setOrderedRequests:(id)a3
{
  VNRequestForensics *v4;
  uint64_t v5;
  NSArray *orderedRequests;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v4->_orderedRequests == 0, CFSTR("attempting to re-assign ordered requests"));
  v5 = objc_msgSend(v7, "copy");
  orderedRequests = v4->_orderedRequests;
  v4->_orderedRequests = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)performingOrderedDependentRequests:(id)a3 onBehalfOfRequest:(id)a4
{
  id v6;
  id v7;
  _VNRequestForensicsParentChildRequests *v8;
  id v9;
  VNRequestForensics *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[_VNRequestForensicsParentChildRequests initWithParentRequest:orderedChildRequests:]([_VNRequestForensicsParentChildRequests alloc], "initWithParentRequest:orderedChildRequests:", v7, v6);
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = self;
  objc_sync_enter(v10);
  -[VNRequestForensics _humanReadableLabelForRequest:](v10, "_humanReadableLabelForRequest:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("%@ created"), v11);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        -[VNRequestForensics _humanReadableLabelForRequest:](v10, "_humanReadableLabelForRequest:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendFormat:", CFSTR(" %@"), v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[NSMutableArray addObject:](v10->_implicitRequests, "addObject:", v8);
  -[NSMutableArray addObject:](v10->_ledger, "addObject:", v9);
  objc_sync_exit(v10);

}

- (void)performingRequest:(id)a3
{
  VNRequestForensics *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNRequestForensics _humanReadableLabelForRequest:](v4, "_humanReadableLabelForRequest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("performing %@"), v6);

  -[NSMutableArray addObject:](v4->_ledger, "addObject:", v7);
  objc_sync_exit(v4);

}

- (void)performedRequest:(id)a3 withError:(id)a4
{
  id v6;
  _VNRequestForensicsRequestAndErrorTuple *v7;
  id v8;
  VNRequestForensics *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = -[_VNRequestForensicsRequestAndErrorTuple initWithRequest:error:]([_VNRequestForensicsRequestAndErrorTuple alloc], "initWithRequest:error:", v14, v6);
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9 = self;
  objc_sync_enter(v9);
  -[_VNRequestForensicsRequestAndErrorTuple request](v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequestForensics _humanReadableLabelForRequest:](v9, "_humanReadableLabelForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("performed %@"), v11);

  -[_VNRequestForensicsRequestAndErrorTuple error](v7, "error");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v8, "appendFormat:", CFSTR(", failed with %@"), v12);
  -[NSMutableArray addObject:](v9->_performedRequests, "addObject:", v7);
  -[NSMutableArray addObject:](v9->_ledger, "addObject:", v8);

  objc_sync_exit(v9);
}

- (void)request:(id)a3 cachedResultsWithObservationsCacheKey:(id)a4
{
  id v6;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v7;
  VNRequestForensics *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple initWithRequest:observationsCacheKey:]([_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc], "initWithRequest:observationsCacheKey:", v15, v6);
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequestForensics _humanReadableLabelForRequest:](v8, "_humanReadableLabelForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](v7, "observationsCacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ cached %@"), v11, v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ was already recorded as a cached result"), v7);
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", -[NSMutableArray containsObject:](v8->_cachedRequestResults, "containsObject:", v7) ^ 1, v14);
  -[NSMutableArray addObject:](v8->_cachedRequestResults, "addObject:", v7);
  -[NSMutableArray addObject:](v8->_ledger, "addObject:", v13);

  objc_sync_exit(v8);
}

- (void)cachedObservationsWithKey:(id)a3 wereCheckedOnBehalfOfRequest:(id)a4
{
  id v6;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v7;
  VNRequestForensics *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple initWithRequest:observationsCacheKey:]([_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc], "initWithRequest:observationsCacheKey:", v6, v14);
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequestForensics _humanReadableLabelForRequest:](v8, "_humanReadableLabelForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](v7, "observationsCacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ looked up %@"), v11, v12);

  -[NSMutableArray addObject:](v8->_checkedCachedResultsOnBehalfOfRequest, "addObject:", v7);
  -[NSMutableArray addObject:](v8->_ledger, "addObject:", v13);

  objc_sync_exit(v8);
}

- (void)cachedObservationsWithKey:(id)a3 wereLocatedOnBehalfOfRequest:(id)a4
{
  id v6;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v7;
  VNRequestForensics *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple initWithRequest:observationsCacheKey:]([_VNRequestForensicsRequestAndObservationsCacheKeyTuple alloc], "initWithRequest:observationsCacheKey:", v6, v14);
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRequestForensics _humanReadableLabelForRequest:](v8, "_humanReadableLabelForRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](v7, "observationsCacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@ hit %@"), v11, v12);

  -[NSMutableArray addObject:](v8->_locatedCachedResultsOnBehalfOfRequest, "addObject:", v7);
  -[NSMutableArray addObject:](v8->_ledger, "addObject:", v13);

  objc_sync_exit(v8);
}

- (NSArray)originalRequests
{
  return 0;
}

- (NSArray)orderedRequests
{
  return 0;
}

- (NSArray)performedRequests
{
  return 0;
}

- (id)keyUsedToCacheResultsOfRequest:(id)a3
{
  return 0;
}

- (id)requestsThatLookedUpCachedResultsKey:(id)a3
{
  return 0;
}

- (id)_childRequestsImplicitlyPerformedOnBehalfOfParentRequest:(id)a3
{
  return 0;
}

- (id)requestsImplicitlyPerformedOnBehalfOfRequest:(id)a3
{
  return 0;
}

- (id)requestThatProvidedObservationsForRequest:(id)a3
{
  return 0;
}

- (BOOL)resultsObtainedFromObservationsCacheForRequest:(id)a3
{
  return 0;
}

- (id)description
{
  return &stru_1E4549388;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToHumanReadableLabelMap, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_locatedCachedResultsOnBehalfOfRequest, 0);
  objc_storeStrong((id *)&self->_checkedCachedResultsOnBehalfOfRequest, 0);
  objc_storeStrong((id *)&self->_cachedRequestResults, 0);
  objc_storeStrong((id *)&self->_performedRequests, 0);
  objc_storeStrong((id *)&self->_implicitRequests, 0);
  objc_storeStrong((id *)&self->_orderedRequests, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
}

@end
