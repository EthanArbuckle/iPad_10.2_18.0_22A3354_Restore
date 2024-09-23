@implementation VNUniqueObservationClassCompoundRequest

- (VNUniqueObservationClassCompoundRequest)initWithSubrequests:(id)a3 uniqueObservationClasses:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  VNUniqueObservationClassCompoundRequest *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v8 == objc_msgSend(v7, "count"), CFSTR("Unexpected number of unique observation classes"));
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = objc_msgSend(v7, "objectAtIndex:", i);
      objc_msgSend(v6, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v11, v12);

    }
  }
  v13 = -[VNUniqueObservationClassCompoundRequest initWithOriginalRequests:requestToObservationClassMap:](self, "initWithOriginalRequests:requestToObservationClassMap:", v6, v9);

  return v13;
}

- (VNUniqueObservationClassCompoundRequest)initWithOriginalRequests:(id)a3 requestToObservationClassMap:(id)a4
{
  id v7;
  VNUniqueObservationClassCompoundRequest *v8;
  VNUniqueObservationClassCompoundRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNUniqueObservationClassCompoundRequest;
  v8 = -[VNCompoundRequest initWithOriginalRequests:](&v11, sel_initWithOriginalRequests_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_requestToObservationClassMap, a4);

  return v9;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v15 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, "addObject:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v17, v15);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v27 = v9;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[VNCompoundRequest originalRequests](self, "originalRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    v22 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", -[NSMapTable objectForKey:](self->_requestToObservationClassMap, "objectForKey:", v24, v27));
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
          v26 = (void *)v25;
        else
          v26 = v22;
        objc_msgSend(v24, "setResults:", v26);
        objc_msgSend(v6, "cacheObservationsOfRequest:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToObservationClassMap, 0);
}

@end
