@implementation _HKSampleQueryUtility

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6 updateHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _HKSampleQueryUtility *v18;
  _HKSampleQueryUtility *v19;
  NSMutableArray *v20;
  NSMutableArray *samples;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_HKSampleQueryUtility;
  v18 = -[_HKSampleQueryUtility init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    objc_storeStrong((id *)&v19->_sampleType, a4);
    objc_storeStrong((id *)&v19->_predicate, a5);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    samples = v19->_samples;
    v19->_samples = v20;

    -[_HKSampleQueryUtility setupQueryWithCompletionHandler:](v19, "setupQueryWithCompletionHandler:", v16);
    -[_HKSampleQueryUtility setUpdateHandler:](v19, "setUpdateHandler:", v17);
  }

  return v19;
}

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 resultsHandler:(id)a6
{
  return -[_HKSampleQueryUtility initWithHealthStore:sampleType:predicate:completionHandler:updateHandler:](self, "initWithHealthStore:sampleType:predicate:completionHandler:updateHandler:", a3, a4, a5, a6, a6);
}

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6
{
  return -[_HKSampleQueryUtility initWithHealthStore:sampleType:predicate:completionHandler:updateHandler:](self, "initWithHealthStore:sampleType:predicate:completionHandler:updateHandler:", a3, a4, a5, a6, 0);
}

- (_HKSampleQueryUtility)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)setupQueryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HKAnchoredObjectQuery *v6;
  HKSampleType *sampleType;
  NSPredicate *predicate;
  HKQueryAnchor *queryAnchor;
  id v10;
  id v11;
  HKAnchoredObjectQuery *v12;
  HKAnchoredObjectQuery *query;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)-[HKSampleType copy](self->_sampleType, "copy");
  v6 = [HKAnchoredObjectQuery alloc];
  sampleType = self->_sampleType;
  predicate = self->_predicate;
  queryAnchor = self->_queryAnchor;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E37F7720;
  v10 = v5;
  v15 = v10;
  objc_copyWeak(&v17, &location);
  v11 = v4;
  v16 = v11;
  v12 = -[HKAnchoredObjectQuery initWithType:predicate:anchor:limit:resultsHandler:](v6, "initWithType:predicate:anchor:limit:resultsHandler:", sampleType, predicate, queryAnchor, 0, v14);
  query = self->_query;
  self->_query = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)setUpdateHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id updateHandler;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    v6 = _Block_copy(v4);
    updateHandler = self->_updateHandler;
    self->_updateHandler = v6;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42___HKSampleQueryUtility_setUpdateHandler___block_invoke;
    v8[3] = &unk_1E37F7748;
    objc_copyWeak(&v9, &location);
    -[HKAnchoredObjectQuery setUpdateHandler:](self->_query, "setUpdateHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)handleAddedObjects:(id)a3 deletedObjects:(id)a4 queryAnchor:(id)a5 error:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSMutableArray *samples;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  id obj;
  id v31;
  id v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  if (a6)
  {
    (*((void (**)(id, _HKSampleQueryUtility *, _QWORD, id))v15 + 2))(v15, self, 0, a6);
  }
  else
  {
    obj = a5;
    v31 = v15;
    v32 = v14;
    v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          samples = self->_samples;
          v33[0] = v22;
          v33[1] = 3221225472;
          v33[2] = __92___HKSampleQueryUtility_handleAddedObjects_deletedObjects_queryAnchor_error_resultsHandler___block_invoke;
          v33[3] = &unk_1E37F7770;
          v33[4] = v24;
          v26 = -[NSMutableArray indexOfObjectPassingTest:](samples, "indexOfObjectPassingTest:", v33, obj);
          if (v26 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v17, "addIndex:", v26);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v20);
    }

    -[NSMutableArray removeObjectsAtIndexes:](self->_samples, "removeObjectsAtIndexes:", v17);
    -[NSMutableArray addObjectsFromArray:](self->_samples, "addObjectsFromArray:", v12);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), self->_sortStartDateAscending);
    v28 = self->_samples;
    v38 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](v28, "sortUsingDescriptors:", v29);

    objc_storeStrong((id *)&self->_queryAnchor, obj);
    v16 = v31;
    (*((void (**)(id, _HKSampleQueryUtility *, NSMutableArray *, _QWORD))v31 + 2))(v31, self, self->_samples, 0);

    v14 = v32;
  }

}

- (void)execute
{
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_query);
}

- (void)stop
{
  HKAnchoredObjectQuery *query;

  if (self->_query)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    query = self->_query;
    self->_query = 0;

  }
}

- (BOOL)sortStartDateAscending
{
  return self->_sortStartDateAscending;
}

- (void)setSortStartDateAscending:(BOOL)a3
{
  self->_sortStartDateAscending = a3;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_queryAnchor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
