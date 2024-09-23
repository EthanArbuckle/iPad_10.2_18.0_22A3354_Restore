@implementation GDSServerConnection

void __38___GDSServerConnection_sharedInstance__block_invoke()
{
  _GDSServerConnection *v0;
  void *v1;

  if (!sharedInstance_instance)
  {
    v0 = objc_alloc_init(_GDSServerConnection);
    v1 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v0;

  }
}

void __37___GDSServerConnection_dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)dateFormatter_dateFormatter, "setLocale:", v3);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dateFormatter_dateFormatter, "setTimeZone:", v2);

  objc_msgSend((id)dateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
}

void *__44___GDSServerConnection_queryItemsMetaParams__block_invoke()
{
  return &unk_250E0F760;
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_23D1EF000, v2, OS_LOG_TYPE_DEFAULT, "Using test config URL %@", (uint8_t *)&v4, 0xCu);
  }
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke_101(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t **v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_23D1EF000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@, Error:%@, Data %@", buf, 0x20u);
  }
  if (v9)
  {
    v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_23D1EF000, v11, OS_LOG_TYPE_DEFAULT, "Error generated %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_23D1EF000, v13, OS_LOG_TYPE_DEFAULT, "Config Response is %@", buf, 0xCu);
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("error"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "code");
    if (v15)
      v16 = v15;
    else
      v16 = 700;
    if (v14 && (v17 = (uint64_t **)(a1 + 64), *(_QWORD *)(a1 + 64)))
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v22 = CFSTR("Error reason");
      v23 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.griddataservices"), v16, v19);
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

      v20 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __45___GDSServerConnection_fetchConfigWithError___block_invoke_101_cold_1(v17, v20, v21);
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v12);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void __60___GDSServerConnection_fetchBalancingAuthorityFromLocation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _GDSBalancingAuthorityOutput *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  NSObject *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = *(double *)&v8;
    _os_log_impl(&dword_23D1EF000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = *(double *)&v9;
    _os_log_impl(&dword_23D1EF000, v11, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = *(double *)&v7;
    _os_log_impl(&dword_23D1EF000, v12, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    v38 = v9;
    v39 = v8;
    v40 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = *(double *)&v13;
      _os_log_impl(&dword_23D1EF000, v14, OS_LOG_TYPE_DEFAULT, "Response is %@", buf, 0xCu);
    }

    v37 = v13;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("balancingAuthorities"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      v41 = v15;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("longitude"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v22;

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("latitude"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v26 = v25;

          objc_msgSend(*(id *)(a1 + 48), "coordinate");
          if (v23 == v27 && (objc_msgSend(*(id *)(a1 + 48), "coordinate"), v26 == v28))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("name"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("id"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
              v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v31);
            else
              v32 = 0;
            objc_msgSend(*(id *)(a1 + 32), "log");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v47 = *(double *)&v30;
              v48 = 2112;
              v49 = *(double *)&v32;
              v50 = 2112;
              v51 = v29;
              _os_log_impl(&dword_23D1EF000, v33, OS_LOG_TYPE_DEFAULT, "Name %@, UUID %@, Date %@", buf, 0x20u);
            }

            v34 = -[_GDSBalancingAuthorityOutput initWithID:name:updateDate:]([_GDSBalancingAuthorityOutput alloc], "initWithID:name:updateDate:", v32, v30, v29);
            v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v36 = *(void **)(v35 + 40);
            *(_QWORD *)(v35 + 40) = v34;

            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
            v15 = v41;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "log");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134283777;
              v47 = v23;
              v48 = 2049;
              v49 = v26;
              _os_log_impl(&dword_23D1EF000, v29, OS_LOG_TYPE_DEFAULT, "Non-matching co-ordinates %{private}f, %{private}f", buf, 0x16u);
            }
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v17);
    }

    v8 = v39;
    v7 = v40;
    v9 = v38;
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void __55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x242631E30]();
  objc_msgSend(*(id *)(a1 + 32), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_23D1EF000, v11, OS_LOG_TYPE_DEFAULT, "Response: %@, Error:%@, Data %@", (uint8_t *)&v18, 0x20u);
  }

  if (v7)
  {
    v12 = (void *)MEMORY[0x242631E30]();
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", CFSTR("error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_23D1EF000, v17, OS_LOG_TYPE_DEFAULT, "Error is %@", (uint8_t *)&v18, 0xCu);
    }

    objc_autoreleasePoolPop(v10);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    AnalyticsSendEventLazy();
    objc_autoreleasePoolPop(v10);
  }

}

void *__55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke_139()
{
  return &unk_250E0F788;
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  _GDSEmissionForecast *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v69 = a4;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v84 = v8;
    _os_log_impl(&dword_23D1EF000, v9, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v84 = v69;
    _os_log_impl(&dword_23D1EF000, v10, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v84 = v7;
    _os_log_impl(&dword_23D1EF000, v11, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    v66 = v7;
    v67 = v8;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_3((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

    v68 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("forecasts"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v78;
      v70 = *(_QWORD *)v78;
      do
      {
        v23 = 0;
        v71 = v21;
        do
        {
          if (*(_QWORD *)v78 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v23);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("balancingAuthorityId"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if (v27)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("baseTime"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[_GDSServerConnection dateFromString:](_GDSServerConnection, "dateFromString:", v28);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v31 = *(void **)(v30 + 40);
            *(_QWORD *)(v30 + 40) = v29;

            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dataPoints"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
            if (v33)
            {
              v34 = v33;
              v35 = 0;
              v36 = *(_QWORD *)v74;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v74 != v36)
                    objc_enumerationMutation(v32);
                  v38 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "dateByAddingTimeInterval:", (double)(v35 + (int)i) * 900.0);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v38, v39);

                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
                v35 += i;
              }
              while (v34);
            }

            v22 = v70;
            v21 = v71;
          }

          ++v23;
        }
        while (v23 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v21);
    }
    v40 = v68;
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("refetchPeriod"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    if (v43 <= 14400.0)
      v43 = 14400.0;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      v44 = [_GDSEmissionForecast alloc];
      v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[_GDSEmissionForecast initWithForecast:generatedAt:fetchedAt:refetchInterval:](v44, "initWithForecast:generatedAt:fetchedAt:refetchInterval:", v45, v46, v47, v43);
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v50 = *(void **)(v49 + 40);
      *(_QWORD *)(v49 + 40) = v48;

      objc_msgSend(*(id *)(a1 + 32), "log");
      v51 = objc_claimAutoreleasedReturnValue();
      v8 = v67;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_2(v51, v52, v53, v54, v55, v56, v57, v58);
      v7 = v66;
      v40 = v68;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v51 = objc_claimAutoreleasedReturnValue();
      v8 = v67;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_1(v51, v59, v60, v61, v62, v63, v64, v65);
      v7 = v66;
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    AnalyticsSendEventLazy();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void *__57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_146()
{
  return &unk_250E0F7B0;
}

void __65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _GDSEmissionHistory *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v8;
    _os_log_impl(&dword_23D1EF000, v10, OS_LOG_TYPE_DEFAULT, "Response: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v9;
    _os_log_impl(&dword_23D1EF000, v11, OS_LOG_TYPE_DEFAULT, "Error:%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v7;
    _os_log_impl(&dword_23D1EF000, v12, OS_LOG_TYPE_DEFAULT, "Data %@", buf, 0xCu);
  }

  if (v7)
  {
    v34 = v9;
    v35 = v8;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v13;
      _os_log_impl(&dword_23D1EF000, v14, OS_LOG_TYPE_DEFAULT, "Historical data Response is %@", buf, 0xCu);
    }
    v36 = v7;

    v33 = v13;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dataPoints"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pointTime"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[_GDSServerConnection dateFromString:](_GDSServerConnection, "dateFromString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("systemwideValue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("marginalValue"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "log");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v21)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v45 = v21;
              v46 = 2112;
              v47 = v22;
              v48 = 2112;
              v49 = v23;
              _os_log_debug_impl(&dword_23D1EF000, v25, OS_LOG_TYPE_DEBUG, "Date %@, Avg Value %@, Marginal Value %@", buf, 0x20u);
            }

            v42[0] = CFSTR("average");
            v42[1] = CFSTR("marginal");
            v43[0] = v22;
            v43[1] = v23;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
            v25 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v25, v21);
          }
          else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pointTime"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v26;
            _os_log_impl(&dword_23D1EF000, v25, OS_LOG_TYPE_DEFAULT, "Error parsing date %@", buf, 0xCu);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v16);
    }
    v27 = [_GDSEmissionHistory alloc];
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[_GDSEmissionHistory initWithHistoricalData:fetchedAt:](v27, "initWithHistoricalData:fetchedAt:", v28, v29);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    v8 = v35;
    v7 = v36;
    v9 = v34;
  }
  else
  {
    AnalyticsSendEventLazy();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void *__65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke_169()
{
  return &unk_250E0F7D8;
}

void __45___GDSServerConnection_fetchConfigWithError___block_invoke_101_cold_1(uint64_t **a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = **a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_23D1EF000, a2, a3, "Config Response Error %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23D1EF000, a1, a3, "Error fetching/mapping forecast", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_23D1EF000, a1, a3, "Forecast refetch interval %lf", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_23D1EF000, a2, a3, "Forecast result %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

@end
