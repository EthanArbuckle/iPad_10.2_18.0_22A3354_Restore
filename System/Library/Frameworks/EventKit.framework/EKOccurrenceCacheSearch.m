@implementation EKOccurrenceCacheSearch

+ (id)searchWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCalendars:searchTerm:store:callback:", v13, v12, v11, v10);

  return v14;
}

- (EKOccurrenceCacheSearch)initWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EKOccurrenceCacheSearch *v15;
  uint64_t v16;
  NSSet *calendars;
  uint64_t v18;
  NSString *searchTerm;
  uint64_t v20;
  id callback;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)EKOccurrenceCacheSearch;
  v15 = -[EKOccurrenceCacheSearch init](&v27, sel_init);
  if (v15)
  {
    if (v11)
    {
      if (v12)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EKOccurrenceCacheSearch.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendars != nil"));

      if (v12)
      {
LABEL_4:
        if (v13)
          goto LABEL_5;
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EKOccurrenceCacheSearch.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTerm != nil"));

    if (v13)
    {
LABEL_5:
      if (v14)
      {
LABEL_6:
        v16 = objc_msgSend(v11, "copy");
        calendars = v15->_calendars;
        v15->_calendars = (NSSet *)v16;

        v18 = objc_msgSend(v12, "copy");
        searchTerm = v15->_searchTerm;
        v15->_searchTerm = (NSString *)v18;

        objc_storeStrong((id *)&v15->_store, a5);
        v20 = objc_msgSend(v14, "copy");
        callback = v15->_callback;
        v15->_callback = (id)v20;

        goto LABEL_7;
      }
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EKOccurrenceCacheSearch.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback != nil"));

      goto LABEL_6;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EKOccurrenceCacheSearch.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store != nil"));

    if (v14)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_7:

  return v15;
}

- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1007;
  objc_msgSend(v10, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADOperationProxySync");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__EKOccurrenceCacheSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke;
  v15[3] = &unk_1E4784F70;
  v15[4] = &v16;
  objc_msgSend(v13, "CADOccurrenceCacheSearchWithTerm:inCalendars:responseToken:reply:", v11, v9, v8, v15);

  LODWORD(v8) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __91__EKOccurrenceCacheSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)run
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1A2318000, v4, OS_LOG_TYPE_ERROR, "Call to calendar daemon failed: %@", (uint8_t *)&v6, 0xCu);

}

- (void)cancel
{
  void *v3;
  id v4;

  self->_canceled = 1;
  if (self->_replyID)
  {
    -[EKEventStore connection](self->_store, "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CADOccurrenceCacheCancelSearchWithReplyID:", -[NSNumber unsignedIntValue](self->_replyID, "unsignedIntValue"));

  }
}

- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  void *v8;
  NSString *searchTerm;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSNumber *replyID;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  EKOccurrenceCacheSearch *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t v33[128];
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  NSNumber *v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    searchTerm = self->_searchTerm;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v8;
    objc_msgSend(v10, "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    replyID = self->_replyID;
    *(_DWORD *)buf = 138413058;
    v35 = searchTerm;
    v36 = 2114;
    v37 = v12;
    v38 = 2114;
    v39 = v13;
    v40 = 2114;
    v41 = replyID;
    _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Received batch results from server for search term = %@, results = %{public}@/2, finished = %{public}@, reply ID = %{public}@", buf, 0x2Au);

  }
  v26 = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7 >> 1);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v19)
        {
          v31[0] = CFSTR("occurrenceDate");
          v31[1] = CFSTR("objectID");
          v32[0] = v22;
          v23 = v22;
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32[1] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v25);
          v19 = 0;
        }
        else
        {
          v19 = v22;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  (*((void (**)(void))v26->_callback + 2))();
}

- (id)searchTerm
{
  return (id)-[NSString copy](self->_searchTerm, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyID, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
}

@end
