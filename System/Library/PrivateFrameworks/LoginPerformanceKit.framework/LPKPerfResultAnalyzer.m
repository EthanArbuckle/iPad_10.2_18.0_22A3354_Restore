@implementation LPKPerfResultAnalyzer

+ (id)analyzePerformanceTestResult:(id)a3 type:(unint64_t)a4 count:(int64_t)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v39;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  v55[4] = __Block_byref_object_dispose_;
  v56 = 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSSSS"));
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __65__LPKPerfResultAnalyzer_analyzePerformanceTestResult_type_count___block_invoke;
  v50[3] = &unk_24F0398C0;
  v40 = v8;
  v51 = v40;
  v9 = v6;
  v52 = v9;
  v54 = v55;
  v10 = v7;
  v53 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v50);
  v39 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (!v20)
            objc_msgSend(v11, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v14);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v25, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v25, "endDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
            objc_msgSend(v12, "addObject:", v25);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    }
    while (v22);
  }

  v29 = v11;
  v30 = v12;

  if (a4 - 2 < 2)
  {
    v32 = objc_msgSend(v30, "count");
    if (v32 >= a5)
      v33 = a5;
    else
      v33 = v32;
    objc_msgSend(v30, "subarrayWithRange:", 0, v33);
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      if (a4)
      {
        v34 = 0;
        goto LABEL_32;
      }
      +[LPKPerfResultAnalyzer _populateMigratorsData:](LPKPerfResultAnalyzer, "_populateMigratorsData:", v29);
    }
    objc_msgSend(a1, "_abstractUserSwitchsFromTheEnd:userSwitches:", a5, v29);
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v31;
LABEL_32:
  +[LPKPerfResultAnalyzer _perfResultsFromUserSwitches:](LPKPerfResultAnalyzer, "_perfResultsFromUserSwitches:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v55, 8);
  return v35;
}

void __65__LPKPerfResultAnalyzer_analyzePerformanceTestResult_type_count___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;

  v30 = a2;
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("eventname"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "containsString:", CFSTR("LGN")))
  {
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("walltime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "dateFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("S"));

    if (!v10)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("E"));

      if (!v16)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "signposts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setEndDate:", v6);
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Login"));

      if (v20)
      {
        v21 = (id *)(a1 + 40);
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("Logout"));

        if (!v29)
        {
LABEL_17:

          goto LABEL_18;
        }
        v21 = (id *)(a1 + 48);
      }
      objc_msgSend(*v21, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setEndDate:", v6);
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Login"));

    if (v12)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setStartDate:", v6);
      v14 = *(void **)(a1 + 40);
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Logout"));

      if (!v23)
      {
LABEL_12:
        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "setStartDate:", v6);
        objc_msgSend(v18, "setName:", v8);
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("execname"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setProcessName:", v26);

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "signposts");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, v8);
        goto LABEL_16;
      }
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setStartDate:", v6);
      v14 = *(void **)(a1 + 48);
    }
    objc_msgSend(v14, "addObject:", v13);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v13;

    goto LABEL_12;
  }
LABEL_19:

}

+ (id)_perfResultsFromUserSwitches:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "signposts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke;
      v12[3] = &unk_24F0398E8;
      v13 = v4;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

      ++v5;
    }
    while (objc_msgSend(v3, "count") > v5);
  }
  objc_msgSend(v4, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_77);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "duration");
    if (v7 <= 0.0)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setEntryName:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  objc_msgSend(v10, "addEntryValue:");

LABEL_7:
}

uint64_t __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "medianValue");
  v7 = v6;
  objc_msgSend(v5, "medianValue");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "medianValue");
    v11 = v10;
    objc_msgSend(v5, "medianValue");
    if (v11 == v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (void)_populateMigratorsData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];
  _QWORD v41[5];
  id v42;
  id v43[2];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    NSLog(CFSTR("Analyzing migrator data..."));
    v43[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\((.*?)\\)"), 16, v43);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v43[0];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy_;
    v41[4] = __Block_byref_object_dispose_;
    objc_msgSend(v3, "firstObject");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v40[3] = 0;
    objc_msgSend(MEMORY[0x24BE60C78], "localStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v7 = MEMORY[0x24BDAC760];
    v39 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke;
    v33[3] = &unk_24F039950;
    v33[4] = &v34;
    objc_msgSend(v6, "prepareWithCompletionHandler:", v33);
    v8 = dispatch_semaphore_create(0);
    v9 = objc_alloc(MEMORY[0x24BE60C80]);
    v10 = objc_msgSend(v9, "initWithSource:", v35[5]);
    v11 = (void *)_populateMigratorsData__stream;
    _populateMigratorsData__stream = v10;

    objc_msgSend((id)_populateMigratorsData__stream, "setFlags:", 20);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("process==%@"), CFSTR("com.apple.datamigrator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_populateMigratorsData__stream, "setFilterPredicate:", v12);
    v13 = (void *)_populateMigratorsData__stream;
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_2;
    v28[3] = &unk_24F0399A0;
    v31 = v40;
    v14 = v3;
    v29 = v14;
    v32 = v41;
    v15 = v4;
    v30 = v15;
    objc_msgSend(v13, "setEventHandler:", v28);
    v16 = (void *)_populateMigratorsData__stream;
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_4;
    v26[3] = &unk_24F0399C8;
    v17 = v8;
    v27 = v17;
    objc_msgSend(v16, "setInvalidationHandler:", v26);
    objc_msgSend(v14, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)_populateMigratorsData__stream;
      v21 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v14, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSince1970");
      objc_msgSend(v21, "dateWithTimeIntervalSince1970:", v24 + -1.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateStreamFromDate:", v25);

      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v41, 8);

  }
}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 1024)
  {
    objc_msgSend(v3, "composedMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsString:", CFSTR("completed migration"));

    if (v5)
    {
      objc_msgSend(v3, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v7 >= objc_msgSend(*(id *)(a1 + 32), "count"))
          break;
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "compare:", v11);

        if (v12 == -1)
          goto LABEL_16;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "compare:", v13) == -1)
        {

        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "compare:", v14);

          if (v15 != 1)
            break;
        }
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v16 != objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        objc_msgSend(v3, "composedMessage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy_;
        v37 = __Block_byref_object_dispose_;
        v38 = 0;
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy_;
        v31 = __Block_byref_object_dispose_;
        v32 = 0;
        v18 = *(void **)(a1 + 40);
        v19 = objc_msgSend(v17, "length");
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_3;
        v23[3] = &unk_24F039978;
        v20 = v17;
        v24 = v20;
        v25 = &v33;
        v26 = &v27;
        objc_msgSend(v18, "enumerateMatchesInString:options:range:usingBlock:", v20, 16, 0, v19, v23);
        if (v34[5] && v28[5])
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "setName:", v34[5]);
          objc_msgSend(v21, "setProcessName:", CFSTR("com.apple.datamigrator"));
          +[LPKPerfResultAnalyzer _durationFromString:](LPKPerfResultAnalyzer, "_durationFromString:", v28[5]);
          objc_msgSend(v21, "setDuration:");
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "signposts");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v34[5]);

        }
        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(&v33, 8);
      }
LABEL_16:

    }
  }

}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (unint64_t)objc_msgSend(v13, "numberOfRanges") >= 2;
  v4 = v13;
  if (v3)
  {
    v5 = objc_msgSend(v13, "rangeAtIndex:", 1);
    v7 = v6;
    v8 = v5 + v6 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length");
    v4 = v13;
    if (!v8)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        goto LABEL_8;
      }
      v4 = v13;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 48);
LABEL_8:
        v11 = *(_QWORD *)(v10 + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v9;

        v4 = v13;
      }
    }
  }

}

intptr_t __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (double)_durationFromString:(id)a3
{
  double result;

  objc_msgSend(a3, "doubleValue");
  return result;
}

+ (id)_abstractUserSwitchsFromTheEnd:(int64_t)a3 userSwitches:(id)a4
{
  id v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  v8 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "subarrayWithRange:", (v8 - a3) & ~((v8 - a3) >> 63), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
