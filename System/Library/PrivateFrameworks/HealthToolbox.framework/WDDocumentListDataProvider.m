@implementation WDDocumentListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "documentTypeForIdentifier:", *MEMORY[0x24BDD2BC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") < 1)
  {
    v5 = &stru_24D38E7C8;
  }
  else
  {
    WDBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CCD_PROVIDER_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  int IsLargerThanSizeCategory;
  double result;

  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory();
  result = *MEMORY[0x24BDF7DE0];
  if (!IsLargerThanSizeCategory)
    return 114.0;
  return result;
}

- (double)customEstimatedCellHeight
{
  return 114.0;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a5, "dequeueReusableCellWithIdentifier:", CFSTR("DocumentTableViewCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A2E0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DocumentTableViewCell"));
  objc_msgSend(v7, "setCellValuesForDocumentSample:", v6);

  return v7;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, char, void *);
  void *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __102__WDDocumentListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke;
  v24 = &unk_24D38DDB0;
  v26 = v27;
  v15 = v14;
  v25 = v15;
  v16 = (void *)MEMORY[0x2199E6E80](&v21);
  v17 = objc_alloc(MEMORY[0x24BDD3B58]);
  objc_msgSend(MEMORY[0x24BDD3DC0], "documentTypeForIdentifier:", *MEMORY[0x24BDD2BC0], v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithDocumentType:predicate:limit:sortDescriptors:includeDocumentData:resultsHandler:", v18, v12, a5, v13, 0, v16);

  _Block_object_dispose(v27, 8);
  return v19;
}

void __102__WDDocumentListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  void (*v11)(void);
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if ((a4 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v9);
      goto LABEL_7;
    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v11();
LABEL_7:

}

- (void)refineSamplesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[WDSampleListDataProvider samples](self, "samples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "document");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(v11, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke;
    v23[3] = &unk_24D38DDD8;
    v24 = v14;
    v26 = v4;
    v15 = v5;
    v25 = v15;
    v16 = v14;
    v17 = (void *)MEMORY[0x2199E6E80](v23);
    objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsWithUUIDs:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3B60], "documentTypeForIdentifier:", *MEMORY[0x24BDD2BC0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3B58]), "initWithDocumentType:predicate:limit:sortDescriptors:includeDocumentData:resultsHandler:", v19, v18, 0, 0, 0, v17);
    -[WDSampleListDataProvider profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "healthStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "executeQuery:", v20);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    if ((a4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);
      goto LABEL_9;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke_cold_1((uint64_t)v11, v13);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v12();
LABEL_9:

}

void __58__WDDocumentListDataProvider_refineSamplesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "Unable to populate revised CDA document samples: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
