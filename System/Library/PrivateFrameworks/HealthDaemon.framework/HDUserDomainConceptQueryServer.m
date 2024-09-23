@implementation HDUserDomainConceptQueryServer

- (HDUserDomainConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDUserDomainConceptQueryServer *v11;
  uint64_t v12;
  NSArray *sortDescriptors;
  uint64_t v14;
  HKQueryAnchor *anchor;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDUserDomainConceptQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v11->_limit = objc_msgSend(v10, "limit");
    objc_msgSend(v10, "sortDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    objc_msgSend(v10, "anchor");
    v14 = objc_claimAutoreleasedReturnValue();
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v14;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKQueryAnchor *anchor;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *sortDescriptors;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  int64_t limit;
  id v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  HDUserDomainConceptQueryServer *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)HDUserDomainConceptQueryServer;
  -[HDQueryServer _queue_start](&v30, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDomainConceptManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProfile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  anchor = self->_anchor;
  if (anchor)
  {
    v11 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HKQueryAnchor _rowid](anchor, "_rowid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForConceptsWithAnchorAfter((uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "compoundPredicateWithPredicate:otherPredicate:", v9, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors)
  {
    v29 = 0;
    objc_msgSend(v6, "orderingTermsForSortDescriptors:error:", sortDescriptors, &v29);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v29;
    v18 = v17;
    if (!v16)
    {
      objc_msgSend(v4, "client_deliverError:forQuery:", v17, v3);
      goto LABEL_14;
    }

    v18 = (void *)v16;
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  limit = self->_limit;
  v28 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46__HDUserDomainConceptQueryServer__queue_start__block_invoke;
  v26[3] = &unk_1E6CEC4E0;
  v21 = v19;
  v27 = v21;
  v22 = objc_msgSend(v6, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:error:enumerationHandler:", v9, limit, v18, &v28, v26);
  v23 = v28;
  if (v22)
  {
    objc_msgSend(v4, "client_deliverResults:queryUUID:", v21, v3);
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 2114;
      v34 = self;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v23, v3);
  }

LABEL_14:
}

uint64_t __46__HDUserDomainConceptQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB6D30];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithUserConcept:rawAnchor:", v6, a3);

  objc_msgSend(v4, "addObject:", v7);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
