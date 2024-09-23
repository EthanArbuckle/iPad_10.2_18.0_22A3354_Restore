@implementation CNChangeHistoryFetchExecutor

+ (id)os_log
{
  if (os_log_cn_once_token_0_7 != -1)
    dispatch_once(&os_log_cn_once_token_0_7, &__block_literal_global_46);
  return (id)os_log_cn_once_object_0_7;
}

void __38__CNChangeHistoryFetchExecutor_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "fetching");
  v1 = (void *)os_log_cn_once_object_0_7;
  os_log_cn_once_object_0_7 = (uint64_t)v0;

}

- (CNChangeHistoryFetchExecutor)initWithRequest:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  CNChangeHistoryFetchExecutor *v9;
  CNChangeHistoryFetchExecutor *v10;
  CNChangeHistoryFetchExecutor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNChangeHistoryFetchExecutor;
  v9 = -[CNChangeHistoryFetchExecutor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("request"), v4);

  -[CNChangeHistoryFetchExecutor store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("store"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)run:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (!-[CNChangeHistoryFetchExecutor validateFetchRequest](self, "validateFetchRequest")
    || (-[CNChangeHistoryFetchExecutor request](self, "request"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "resultType"),
        v5,
        v6 == 2))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 605);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

LABEL_9:
    v7 = 0;
    return v7;
  }
  if (v6 == 1)
  {
    -[CNChangeHistoryFetchExecutor fetchCount:](self, "fetchCount:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (v6)
    goto LABEL_9;
  -[CNChangeHistoryFetchExecutor fetchEvents:](self, "fetchEvents:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)fetchEvents:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNFetchResult *v18;
  void *v19;

  -[CNChangeHistoryFetchExecutor request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startingToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[CNContactStore isAccessLimitedForEntityType:](CNContactStore, "isAccessLimitedForEntityType:", 0);
  if (v7)
    goto LABEL_4;
  if (!v6)
  {
    v11 = 0;
    goto LABEL_8;
  }
  +[CNChangeHistoryAnchor limitedAccessHistoryAnchor](CNChangeHistoryAnchor, "limitedAccessHistoryAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "historyToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToData:", v6);

  if ((v10 & 1) != 0)
  {
LABEL_4:

    v11 = 0;
    v6 = 0;
LABEL_8:
    -[CNChangeHistoryFetchExecutor fullSync](self, "fullSync");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  -[CNChangeHistoryFetchExecutor deltaSync](self, "deltaSync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (!v12)
    goto LABEL_8;
  v13 = v12;
  if ((objc_msgSend(v12, "isFailure") & 1) != 0)
    goto LABEL_8;
LABEL_9:
  if ((objc_msgSend(v13, "isSuccess") & 1) != 0)
  {
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "events");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[CNChangeHistoryAnchor limitedAccessHistoryAnchor](CNChangeHistoryAnchor, "limitedAccessHistoryAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "historyToken");
    }
    else
    {
      objc_msgSend(v13, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "token");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[CNFetchResult initWithValue:currentHistoryToken:]([CNFetchResult alloc], "initWithValue:currentHistoryToken:", v15, v19);
  }
  else
  {
    objc_msgSend(v13, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v18 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v17);
  }

  return v18;
}

- (id)fetchCount:(id *)a3
{
  void *v5;
  void *v6;
  CNFetchResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (+[CNContactStore isAccessLimitedForEntityType:](CNContactStore, "isAccessLimitedForEntityType:", 0))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 603);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    -[CNChangeHistoryFetchExecutor countOfDeltaSync](self, "countOfDeltaSync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSuccess") & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "token");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = -[CNFetchResult initWithValue:currentHistoryToken:]([CNFetchResult alloc], "initWithValue:currentHistoryToken:", v10, v12);
    }
    else
    {
      objc_msgSend(v6, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v7 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v13);
    }

  }
  return v7;
}

- (BOOL)validateFetchRequest
{
  void *v3;
  void *v4;
  int v5;

  -[CNChangeHistoryFetchExecutor request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldUnifyResults"))
  {
    -[CNChangeHistoryFetchExecutor request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "includeLinkingChanges") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)fullSync
{
  void *v3;
  CNContactFetchRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNChangeHistoryEventFactory *v14;
  uint64_t v15;
  CNChangeHistoryEventFactory *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _CNChangeHistoryFetchExecutionResponse *v25;
  void *v26;
  void *v28;
  void *v29;
  CNChangeHistoryEventFactory *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  CNChangeHistoryEventFactory *v34;
  _QWORD v35[4];
  CNChangeHistoryEventFactory *v36;
  id v37;
  id v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  -[CNChangeHistoryFetchExecutor keysToFetch](self, "keysToFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v3);
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest setUnifyResults:](v4, "setUnifyResults:", objc_msgSend(v5, "shouldUnifyResults"));

  -[CNChangeHistoryFetchExecutor request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest setMutableObjects:](v4, "setMutableObjects:", objc_msgSend(v6, "mutableObjects"));

  -[CNChangeHistoryFetchExecutor store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v7, "enumeratorForContactFetchRequest:error:", v4, &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;

  objc_msgSend(v8, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNChangeHistoryFetchExecutor store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v12, "groupsMatchingPredicate:error:", 0, &v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v37;

    if (v13)
    {
      v14 = objc_alloc_init(CNChangeHistoryEventFactory);
      v31 = v3;
      v15 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke;
      v35[3] = &unk_1E29F95F8;
      v16 = v14;
      v36 = v16;
      objc_msgSend(v11, "_cn_map:", v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke_2;
      v33[3] = &unk_1E29F9620;
      v34 = v16;
      v30 = v16;
      objc_msgSend(v13, "_cn_map:", v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNChangeHistoryFetchExecutor contactLinkingEventsForContacts:withFactory:](self, "contactLinkingEventsForContacts:withFactory:", v11, v30);
      v17 = objc_claimAutoreleasedReturnValue();
      -[CNChangeHistoryEventFactory dropEverythingEvent](v30, "dropEverythingEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v18;
      v39[1] = v29;
      v39[2] = v17;
      v39[3] = v28;
      v19 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_cn_flatten");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "currentHistoryToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v13;
      v24 = v9;
      v25 = -[_CNChangeHistoryFetchExecutionResponse initWithEvents:count:token:]([_CNChangeHistoryFetchExecutionResponse alloc], "initWithEvents:count:token:", v21, objc_msgSend(v21, "count"), v22);
      objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v24;
      v13 = v23;

      v3 = v31;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

uint64_t __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContactEventWithContact:containerIdentifier:", a2, 0);
}

uint64_t __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGroupEventWithGroup:containerIdentifier:", a2, 0);
}

- (id)deltaSync
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CNChangeHistoryLegacyResultConverter *v7;
  void *v8;
  void *v9;
  void *v10;
  CNChangeHistoryLegacyResultConverter *v11;
  void *v12;
  void *v13;
  void *v14;
  _CNChangeHistoryFetchExecutionResponse *v15;
  void *v16;
  void *v17;
  _CNChangeHistoryFetchExecutionResponse *v18;
  void *v19;
  void *v20;
  id v22;

  -[CNChangeHistoryFetchExecutor store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v3, "changeHistoryWithFetchRequest:error:", v4, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;

  if (v5)
  {
    v7 = [CNChangeHistoryLegacyResultConverter alloc];
    -[CNChangeHistoryFetchExecutor store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNChangeHistoryFetchExecutor request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "additionalContactKeyDescriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNChangeHistoryLegacyResultConverter initWithContactStore:additionalContactKeyDescriptors:](v7, "initWithContactStore:additionalContactKeyDescriptors:", v8, v10);

    -[CNChangeHistoryLegacyResultConverter eventsFromResult:](v11, "eventsFromResult:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isSuccess") & 1) != 0)
    {
      objc_msgSend(v5, "latestChangeAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "historyToken");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [_CNChangeHistoryFetchExecutionResponse alloc];
      objc_msgSend(v12, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_CNChangeHistoryFetchExecutionResponse initWithEvents:count:token:](v15, "initWithEvents:count:token:", v16, objc_msgSend(v17, "count"), v14);

      objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0D13B60];
      objc_msgSend(v12, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "failureWithError:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)countOfDeltaSync
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _CNChangeHistoryFetchExecutionResponse *v10;
  void *v11;
  id v13;

  -[CNChangeHistoryFetchExecutor store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "changeHistoryWithFetchRequest:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v5)
  {
    v7 = objc_msgSend(v5, "changesCount");
    objc_msgSend(v5, "latestChangeAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "historyToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[_CNChangeHistoryFetchExecutionResponse initWithEvents:count:token:]([_CNChangeHistoryFetchExecutionResponse alloc], "initWithEvents:count:token:", 0, v7, v9);
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)keysToFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  +[CNContact alwaysFetchedKeys](CNContact, "alwaysFetchedKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNChangeHistoryFetchExecutor request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "additionalContactKeyDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(v6, "addObjectsFromArray:", v8);
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "includeLinkingChanges");

  if (v10)
  {
    v14[0] = CFSTR("linkIdentifier");
    v14[1] = CFSTR("preferredForName");
    v14[2] = CFSTR("preferredForImage");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  objc_msgSend(v6, "_cn_flatten");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)contactLinkingEventsForContacts:(id)a3 withFactory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[CNChangeHistoryFetchExecutor request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "includeLinkingChanges"))
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_6:

    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "count");

  if (v9 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_filter:", &__block_literal_global_22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_groupBy:", &__block_literal_global_24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_3;
    v16[3] = &unk_1E29F9690;
    v13 = v11;
    v17 = v13;
    v18 = v7;
    objc_msgSend(v12, "_cn_each:", v16);
    v14 = v18;
    v10 = v13;

    goto LABEL_6;
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_7:

  return v10;
}

uint64_t __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *MEMORY[0x1E0D13850];
  objc_msgSend(a2, "linkIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "linkIdentifier");
}

void __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContact contactWithIdentifierOnly:](CNContact, "contactWithIdentifierOnly:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__11;
    v38 = __Block_byref_object_dispose__11;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__11;
    v32 = __Block_byref_object_dispose__11;
    v33 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_25;
    v21 = &unk_1E29F9668;
    v10 = v7;
    v22 = v10;
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v11 = v9;
    v25 = v11;
    v26 = &v34;
    v27 = &v28;
    objc_msgSend(v6, "_cn_each:", &v18);
    v12 = v35[5];
    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "preferredContactForNameEventWithPreferredContact:unifiedContact:", v12, 0, v18, v19, v20, v21, v22, v23, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    v15 = v29[5];
    if (v15)
    {
      v16 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "preferredContactForImageEventWithPreferredContact:unifiedContact:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }

}

void __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "linkContactsEventWithFromContact:toContact:unifiedContact:", *(_QWORD *)(a1 + 32), v13, *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = objc_msgSend(v13, "isPreferredForName");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = v13;
  if ((v7 & 1) == 0)
    v9 = *(void **)(v8 + 40);
  objc_storeStrong((id *)(v8 + 40), v9);
  v10 = objc_msgSend(v13, "isPreferredForImage");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = v13;
  if ((v10 & 1) == 0)
    v12 = *(void **)(v11 + 40);
  objc_storeStrong((id *)(v11 + 40), v12);

}

- (CNChangeHistoryFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
