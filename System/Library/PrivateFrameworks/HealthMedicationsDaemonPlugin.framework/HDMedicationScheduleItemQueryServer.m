@implementation HDMedicationScheduleItemQueryServer

- (HDMedicationScheduleItemQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDMedicationScheduleItemQueryServer *v12;
  HDMedicationScheduleItemQueryServer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMedicationScheduleItemQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_configuration, a4);

  return v13;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  HDMedicationScheduleItemQueryServer *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  HDMedicationScheduleItemQueryServer *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;

  v2 = self;
  v55 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)HDMedicationScheduleItemQueryServer;
  -[HDQueryServer _queue_start](&v53, sel__queue_start);
  -[HDQueryServer queryUUID](v2, "queryUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](v2, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMedicationScheduleItemQueryConfiguration fromDate](v2->_configuration, "fromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKMedicationScheduleItemQueryConfiguration fromDate](v2->_configuration, "fromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationScheduleItemPredicateForScheduledDateTime(6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[HKMedicationScheduleItemQueryConfiguration toDate](v2->_configuration, "toDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HKMedicationScheduleItemQueryConfiguration toDate](v2->_configuration, "toDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationScheduleItemPredicateForScheduledDateTime(3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
    }
    else
    {
      v8 = v11;
    }

  }
  -[HKMedicationScheduleItemQueryConfiguration identifier](v2->_configuration, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HKMedicationScheduleItemQueryConfiguration identifier](v2->_configuration, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationScheduleItemPredicateForIdentifier((uint64_t)v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v8, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v16;
    }
    else
    {
      v8 = v15;
    }

  }
  -[HKMedicationScheduleItemQueryConfiguration sortDescriptors](v2->_configuration, "sortDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0x1E0C99000uLL;
  if (v17)
  {
    v42 = v5;
    v43 = (void *)v3;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v41 = v2;
    -[HKMedicationScheduleItemQueryConfiguration sortDescriptors](v2->_configuration, "sortDescriptors");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v50;
      v24 = *MEMORY[0x1E0D2C258];
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v50 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v26, "key");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", v24);

          if (!v28)
          {
            v31 = (void *)MEMORY[0x1E0CB35C8];
            v32 = (void *)MEMORY[0x1E0CB3940];
            v33 = objc_opt_class();
            objc_msgSend(v26, "key");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ Invalid sort descriptor key passed: '%@"), v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "hk_error:description:", 3, v35);
            v36 = (id)objc_claimAutoreleasedReturnValue();

            v5 = v42;
            v37 = v43;
            objc_msgSend(v42, "client_deliverError:forQuery:", v36, v43);
            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("scheduled_date_time"), objc_opt_class(), objc_msgSend(v26, "ascending"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v29);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v22)
          continue;
        break;
      }
    }

    v5 = v42;
    v30 = v43;
    v2 = v41;
    v18 = 0x1E0C99000;
  }
  else
  {
    v30 = (void *)v3;
    v19 = 0;
  }
  v38 = objc_alloc_init(*(Class *)(v18 + 3560));
  -[HDQueryServer profile](v2, "profile");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "database");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke;
  v44[3] = &unk_1E6E01760;
  v45 = v8;
  v19 = v19;
  v46 = v19;
  v20 = v38;
  v47 = v20;
  LODWORD(v38) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performReadTransactionWithHealthDatabase:error:block:", v40, &v48, v44);
  v36 = v48;

  if ((_DWORD)v38)
  {
    v37 = v30;
    objc_msgSend(v5, "client_deliverScheduleItems:queryUUID:", v20, v30);
  }
  else
  {
    v37 = v30;
    objc_msgSend(v5, "client_deliverError:forQuery:", v36, v30);
  }

LABEL_30:
}

BOOL __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke_2;
  v9[3] = &unk_1E6E00290;
  v10 = *(id *)(a1 + 48);
  v7 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", v5, v6, a2, a3, v9);

  return v7;
}

uint64_t __51__HDMedicationScheduleItemQueryServer__queue_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
