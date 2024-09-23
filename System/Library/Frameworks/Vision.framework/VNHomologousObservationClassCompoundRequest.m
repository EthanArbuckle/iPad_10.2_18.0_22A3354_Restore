@implementation VNHomologousObservationClassCompoundRequest

- (id)originalRequestsOfClass:(Class)a3
{
  return -[NSMapTable objectForKey:](self->_requestsClassMapping, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsClassMapping, 0);
}

- (VNHomologousObservationClassCompoundRequest)initWithSubrequests:(id)a3
{
  id v4;
  VNHomologousObservationClassCompoundRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSMapTable *requestsClassMapping;
  VNHomologousObservationClassCompoundRequest *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSMapTable *v24;
  void *v25;
  VNHomologousObservationClassCompoundRequest *v26;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VNHomologousObservationClassCompoundRequest;
  v5 = -[VNCompoundRequest initWithOriginalRequests:](&v38, sel_initWithOriginalRequests_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "frameworkClass", v28);
          objc_msgSend(v6, "objectForKey:", v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "setObject:forKey:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    requestsClassMapping = v5->_requestsClassMapping;
    v17 = v5;
    v5->_requestsClassMapping = (NSMapTable *)v15;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKey:", v22, v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v17->_requestsClassMapping;
          v25 = (void *)objc_msgSend(v23, "copy");
          -[NSMapTable setObject:forKey:](v24, "setObject:forKey:", v25, v22);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v19);
    }

    v5 = v17;
    v26 = v17;

    v4 = v28;
  }

  return v5;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ does not override %@"), v9, v8);

}

@end
