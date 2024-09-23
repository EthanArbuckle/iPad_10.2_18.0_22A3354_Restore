@implementation MXCorePayloadConstructor

+ (id)buildDiagnosticPayloadForClient:(id)a3 fromClientDiagnosticsDictionary:(id)a4 withDateString:(id)a5
{
  id v7;
  id v8;
  id v9;
  os_log_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  objc_msgSend(&unk_24E2FF078, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_4;
  objc_msgSend(&unk_24E2FF090, "objectAtIndexedSubscript:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

LABEL_4:
LABEL_5:
    v14 = v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v98 = v15;
      _os_log_impl(&dword_21E837000, v14, OS_LOG_TYPE_DEFAULT, "Constructing payload for data sources: %@", buf, 0xCu);

    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.8();
    v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v16, "setLocale:");
    objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimeZone:", v17);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateFromString:", v19);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v16;
    objc_msgSend(v16, "dateFromString:", v21);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.7();
    v72 = v10;
    v73 = v9;
    v75 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.6();
    objc_msgSend(&unk_24E2FF0C0, "objectAtIndexedSubscript:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v80 = v23;
    if (v23)
    {
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v26 = v23;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v91 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
            objc_msgSend(v31, "cpuExceptionDiagnostic");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v31, "cpuExceptionDiagnostic");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v33);

            }
            objc_msgSend(v31, "diskWriteExceptionDiagnostic");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v31, "diskWriteExceptionDiagnostic");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v35);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
        }
        while (v28);
      }

    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.5();
    objc_msgSend(&unk_24E2FF0D8, "objectAtIndexedSubscript:", 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v81 = v24;
    v78 = v37;
    v79 = v14;
    if (v37)
    {
      v40 = v8;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v41 = v37;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v87 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
            objc_msgSend(v46, "hangDiagnostic");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              objc_msgSend(v46, "hangDiagnostic");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v48);

            }
            objc_msgSend(v46, "appLaunchDiagnostic");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v46, "appLaunchDiagnostic");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v50);

            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
        }
        while (v43);
      }

      v8 = v40;
      v37 = v78;
      v14 = v79;
      v24 = v81;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.4();
    objc_msgSend(&unk_24E2FF0F0, "objectAtIndexedSubscript:", 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v8;
    objc_msgSend(v8, "objectForKey:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v52)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v69 = v52;
      v54 = v52;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v83 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
            objc_msgSend(v59, "crashDiagnostic");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            {
              objc_msgSend(v59, "crashDiagnostic");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v61);

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        }
        while (v56);
      }

      v37 = v78;
      v14 = v79;
      v24 = v81;
      v52 = v69;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.3();
    v62 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v63 = objc_msgSend(v24, "count");
    v64 = v24;
    if (v63)
      objc_msgSend(v62, "setObject:forKey:", v24, CFSTR("cpuExceptionDiagnostics"));
    if (objc_msgSend(v25, "count", v64))
      objc_msgSend(v62, "setObject:forKey:", v25, CFSTR("diskWriteExceptionDiagnostics"));
    if (objc_msgSend(v38, "count"))
      objc_msgSend(v62, "setObject:forKey:", v38, CFSTR("hangDiagnostics"));
    if (objc_msgSend(v39, "count"))
      objc_msgSend(v62, "setObject:forKey:", v39, CFSTR("appLaunchDiagnostics"));
    if (objc_msgSend(v53, "count"))
      objc_msgSend(v62, "setObject:forKey:", v53, CFSTR("crashDiagnostics"));
    if (objc_msgSend(v62, "count"))
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.2();
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE600]), "initWithTimeStampBegin:withTimeStampEnd:withDiagnostics:", v77, v76, v62);
    }
    else
    {
      v65 = 0;
    }

    v8 = v74;
    v7 = v75;
    v10 = v72;
    v9 = v73;
    goto LABEL_72;
  }
  objc_msgSend(&unk_24E2FF0A8, "objectAtIndexedSubscript:", 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
    goto LABEL_5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.1();
  v65 = 0;
LABEL_72:

  return v65;
}

+ (id)buildPayloadForClient:(id)a3 fromClientMetricsDictionary:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v5 = a4;
  v6 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  objc_msgSend(&unk_24E2FF108, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v5;
    obj = v5;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v37;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(obj);
          v29 = v10;
          v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v10);
          objc_msgSend(obj, "objectForKeyedSubscript:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v11;
            _os_log_debug_impl(&dword_21E837000, v6, OS_LOG_TYPE_DEBUG, "Service data to parse: %@", buf, 0xCu);
          }
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v33 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v9, "objectForKeyedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v41 = v19;
                    v42 = 2112;
                    v43 = v17;
                    _os_log_debug_impl(&dword_21E837000, v6, OS_LOG_TYPE_DEBUG, "Payload: %@ exists for date string: %@", buf, 0x16u);
                  }
                  objc_msgSend(v12, "objectForKeyedSubscript:", v17);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MXCorePayloadConstructor updatePayload:withServiceString:withSourceData:withDateString:forClient:](MXCorePayloadConstructor, "updatePayload:withServiceString:withSourceData:withDateString:forClient:", v19, v31, v20, v17, v30);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v17);

                }
                else
                {
                  objc_msgSend(v12, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:](MXCorePayloadConstructor, "constructPayloadWithServiceString:withSourceData:withDateString:forClient:", v31, v19, v17, v30);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v17);
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            }
            while (v14);
          }

          v10 = v29 + 1;
        }
        while (v29 + 1 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }

    v22 = v6;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor buildPayloadForClient:fromClientMetricsDictionary:].cold.2(v9, v22);

    objc_msgSend(v9, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v25;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MXCorePayloadConstructor buildPayloadForClient:fromClientMetricsDictionary:].cold.1();
    v23 = 0;
  }

  return v23;
}

+ (id)updatePayload:(id)a3 withServiceString:(id)a4 withSourceData:(id)a5 withDateString:(id)a6 forClient:(id)a7
{
  return a3;
}

+ (id)constructPayloadWithServiceString:(id)a3 withSourceData:(id)a4 withDateString:(id)a5 forClient:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;

  v50 = a3;
  v48 = a4;
  v47 = a5;
  v9 = a6;
  v10 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  objc_msgSend(&unk_24E2FF120, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v50, "isEqualToString:", v11);

  if ((_DWORD)a5)
  {
    v12 = objc_alloc(MEMORY[0x24BDDE658]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.11();
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v9);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shortVersionString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v49, "shortVersionString");
    else
      objc_msgSend(v49, "bundleVersion");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.10();
    objc_msgSend(v49, "bundleVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.9();
    v15 = v48;
    if (v15)
    {
      v16 = v10;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.8(v15, v16);

      v17 = v12;
      v18 = objc_msgSend(v15, "includesMultipleApplicationVersions");
      objc_msgSend(v15, "beginDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NSObject initWithAppVersion:withMutipleAppVersions:withTimeStampBegin:withTimeStampEnd:](v17, "initWithAppVersion:withMutipleAppVersions:withTimeStampBegin:withTimeStampEnd:", v46, v18, v19, v20);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.7();
      v22 = objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v9, v45);
      v23 = objc_alloc(MEMORY[0x24BDDE650]);
      objc_msgSend(MEMORY[0x24BE668E8], "regionFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE668E8], "osVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE668E8], "modelIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BE668E8], "platformArchitecture");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v23, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:", v24, v25, v26, v45, v27);

        -[NSObject setMetaData:](v21, "setMetaData:", v28);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.5();
      }
      else
      {
        v28 = (void *)objc_msgSend(v23, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:", v24, v25, v26, v45);

        -[NSObject setMetaData:](v21, "setMetaData:", v28);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.6();
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.4(v16, v21);
      if ((objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v9) & 1) == 0)
      {
        objc_msgSend(v15, "cpuMetrics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", 0, CFSTR("cumulativeCPUInstructions"));

      }
      objc_msgSend(v15, "cpuMetrics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCpuMetrics:](v21, "setCpuMetrics:", v30);

      objc_msgSend(v15, "gpuMetrics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setGpuMetrics:](v21, "setGpuMetrics:", v31);

      objc_msgSend(v15, "cellularConditionMetrics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCellularConditionMetrics:](v21, "setCellularConditionMetrics:", v32);

      objc_msgSend(v15, "applicationTimeMetrics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplicationTimeMetrics:](v21, "setApplicationTimeMetrics:", v33);

      objc_msgSend(v15, "locationActivityMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLocationActivityMetrics:](v21, "setLocationActivityMetrics:", v34);

      objc_msgSend(v15, "networkTransferMetrics");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setNetworkTransferMetrics:](v21, "setNetworkTransferMetrics:", v35);

      objc_msgSend(v15, "applicationLaunchMetrics");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplicationLaunchMetrics:](v21, "setApplicationLaunchMetrics:", v36);

      objc_msgSend(v15, "applicationResponsivenessMetrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplicationResponsivenessMetrics:](v21, "setApplicationResponsivenessMetrics:", v37);

      objc_msgSend(v15, "diskIOMetrics");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setDiskIOMetrics:](v21, "setDiskIOMetrics:", v38);

      objc_msgSend(v15, "displayMetrics");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setDisplayMetrics:](v21, "setDisplayMetrics:", v39);

      objc_msgSend(v15, "memoryMetrics");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setMemoryMetrics:](v21, "setMemoryMetrics:", v40);

      objc_msgSend(v15, "signpostMetrics");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSignpostMetrics:](v21, "setSignpostMetrics:", v41);

      if (objc_msgSend(MEMORY[0x24BE668E8], "verifySDKVersionForClient:", v9))
      {
        objc_msgSend(v15, "animationMetrics");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAnimationMetrics:](v21, "setAnimationMetrics:", v42);

        objc_msgSend(v15, "applicationExitMetrics");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setApplicationExitMetrics:](v21, "setApplicationExitMetrics:", v43);

      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.2();
      v12 = v21;
      v14 = v12;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.1();
      v14 = 0;
    }

  }
  else
  {
    v12 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.12((uint64_t)v50, v12);
    v14 = 0;
  }

  return v14;
}

+ (id)buildDummyPayloadForClient:(id)a3 withDateString:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  uint64_t v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  id v203;
  id v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  id v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v215;
  id v216;
  id v217;
  void *v218;
  void *v219;
  id v220;
  void *v221;
  void *v222;
  id v223;
  id v224;
  void *v225;
  void *v226;
  id v227;
  void *v228;
  void *v229;
  id v230;
  id v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  id v237;
  id v238;
  void *v239;
  void *v240;
  id v241;
  void *v242;
  void *v243;
  id v244;
  id v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  void *v250;
  id v251;
  id v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  id v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  id v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  _QWORD v315[2];
  _QWORD v316[3];
  _QWORD v317[3];
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[3];
  _QWORD v321[3];
  _QWORD v322[3];
  _QWORD v323[5];

  v323[3] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDDE658];
  v6 = a4;
  v7 = a3;
  v283 = [v5 alloc];
  v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v286 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v8, "setLocale:");
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(" 00:00"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromString:", v10);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(" 23:59"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v287 = v8;
  objc_msgSend(v8, "dateFromString:", v11);
  v313 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "shortVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "shortVersionString");
  else
    objc_msgSend(v12, "bundleVersion");
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bundleVersion");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDDE650]);
  objc_msgSend(MEMORY[0x24BE668E8], "regionFormat");
  v285 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "osVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "modelIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "platformArchitecture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v311 = (void *)objc_msgSend(v14, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:", v15, v16, v17, v284, v18);

  v19 = objc_alloc(MEMORY[0x24BDDE5D0]);
  v20 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithDoubleValue:unit:", v21, 100.0);
  v23 = objc_alloc(MEMORY[0x24BDD1660]);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18A0]), "initWithSymbol:", CFSTR("kiloinstructions"));
  v25 = (void *)objc_msgSend(v23, "initWithDoubleValue:unit:", v24, 100.0);
  v310 = (void *)objc_msgSend(v19, "initWithCumulativeCPUTimeMeasurement:withCumulativeCPUInstructions:", v22, v25);

  v26 = objc_alloc(MEMORY[0x24BDDE628]);
  v27 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithDoubleValue:unit:", v28, 20.0);
  v309 = (void *)objc_msgSend(v26, "initWithCumulativeGPUTimeMeasurement:", v29);

  v30 = objc_alloc(MEMORY[0x24BDDE638]);
  v31 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithDoubleValue:unit:", v32, 1.0);
  v34 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithDoubleValue:unit:", v35, 1.0);
  v282 = (void *)objc_msgSend(v30, "initWithBucketStart:bucketEnd:bucketCount:", v33, v36, 20);

  v37 = objc_alloc(MEMORY[0x24BDDE638]);
  v38 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithDoubleValue:unit:", v39, 2.0);
  v41 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithDoubleValue:unit:", v42, 2.0);
  v281 = (void *)objc_msgSend(v37, "initWithBucketStart:bucketEnd:bucketCount:", v40, v43, 30);

  v44 = objc_alloc(MEMORY[0x24BDDE638]);
  v45 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v45, "initWithDoubleValue:unit:", v46, 3.0);
  v48 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE688], "bars");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v48, "initWithDoubleValue:unit:", v49, 3.0);
  v280 = (void *)objc_msgSend(v44, "initWithBucketStart:bucketEnd:bucketCount:", v47, v50, 50);

  v51 = objc_alloc(MEMORY[0x24BDDE5F0]);
  v323[0] = v282;
  v323[1] = v281;
  v323[2] = v280;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v323, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v308 = (void *)objc_msgSend(v51, "initWithCellularConditionTime:", v52);

  v53 = objc_alloc(MEMORY[0x24BDDE5B0]);
  v54 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v54, "initWithDoubleValue:unit:", v55, 700.0);
  v57 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v57, "initWithDoubleValue:unit:", v58, 40.0);
  v60 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v60, "initWithDoubleValue:unit:", v61, 30.0);
  v63 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v63, "initWithDoubleValue:unit:", v64, 30.0);
  v307 = (void *)objc_msgSend(v53, "initWithCumulativeForegroundTimeMeasurement:cumulativeBackgroundTimeMeasurement:cumulativeBackgroundAudioTimeMeasurement:cumulativeBackgroundLocationTimeMeasurement:", v56, v59, v62, v65);

  v305 = objc_alloc(MEMORY[0x24BDDE640]);
  v66 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = (void *)objc_msgSend(v66, "initWithDoubleValue:unit:", v303, 30.0);
  v67 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "initWithDoubleValue:unit:", v301, 20.0);
  v69 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v69, "initWithDoubleValue:unit:", v70, 30.0);
  v72 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v72, "initWithDoubleValue:unit:", v73, 30.0);
  v75 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v75, "initWithDoubleValue:unit:", v76, 20.0);
  v78 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v78, "initWithDoubleValue:unit:", v79, 20.0);
  v306 = (void *)objc_msgSend(v305, "initWithCumulativeBestAccuracyTimeMeasurement:cumulativeBestAccuracyForNavigationTimeMeasurement:nearestTenMetersAccuracyTimeMeasurement:hundredMetersAccuracyTimeMeasurement:kilometerAccuracyTimeMeasurement:threeKilometerAccuracyTimeMeasurement:", v299, v68, v71, v74, v77, v80);

  v81 = objc_alloc(MEMORY[0x24BDDE660]);
  v82 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v82, "initWithDoubleValue:unit:", v83, 50000.0);
  v85 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v85, "initWithDoubleValue:unit:", v86, 60000.0);
  v88 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v88, "initWithDoubleValue:unit:", v89, 70000.0);
  v91 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)objc_msgSend(v91, "initWithDoubleValue:unit:", v92, 80000.0);
  v304 = (void *)objc_msgSend(v81, "initWithCumulativeWifiUploadMeasurement:cumulativeWifiDownloadMeasurement:cumulativeCellularUploadMeasurement:cumulativeCellularDownloadMeasurement:", v84, v87, v90, v93);

  v94 = objc_alloc(MEMORY[0x24BDDE638]);
  v95 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend(v95, "initWithDoubleValue:unit:", v96, 0.0);
  v98 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v98, "initWithDoubleValue:unit:", v99, 100.0);
  v279 = (void *)objc_msgSend(v94, "initWithBucketStart:bucketEnd:bucketCount:", v97, v100, 50);

  v101 = objc_alloc(MEMORY[0x24BDDE638]);
  v102 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v102, "initWithDoubleValue:unit:", v103, 100.0);
  v105 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)objc_msgSend(v105, "initWithDoubleValue:unit:", v106, 400.0);
  v278 = (void *)objc_msgSend(v101, "initWithBucketStart:bucketEnd:bucketCount:", v104, v107, 60);

  v108 = objc_alloc(MEMORY[0x24BDDE638]);
  v109 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)objc_msgSend(v109, "initWithDoubleValue:unit:", v110, 400.0);
  v112 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)objc_msgSend(v112, "initWithDoubleValue:unit:", v113, 700.0);
  v277 = (void *)objc_msgSend(v108, "initWithBucketStart:bucketEnd:bucketCount:", v111, v114, 30);

  v115 = objc_alloc(MEMORY[0x24BDDE5A8]);
  v322[0] = v279;
  v322[1] = v278;
  v322[2] = v277;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v322, 3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v302 = (void *)objc_msgSend(v115, "initWithAppResponsivenessData:", v116);

  v117 = objc_alloc(MEMORY[0x24BDDE608]);
  v118 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)objc_msgSend(v118, "initWithDoubleValue:unit:", v119, 1300.0);
  v276 = (void *)objc_msgSend(v117, "initWithCumulativeLogicalWritesMeasurement:", v120);

  v121 = objc_alloc(MEMORY[0x24BDDE648]);
  v122 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)objc_msgSend(v122, "initWithDoubleValue:unit:", v123, 200000.0);
  v125 = objc_alloc(MEMORY[0x24BDDE5B8]);
  v126 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)objc_msgSend(v126, "initWithDoubleValue:unit:", v127, 100000.0);
  v129 = (void *)objc_msgSend(v125, "initWithMeasurement:sampleCount:standardDeviation:", v128, 500, 0.0);
  v275 = (void *)objc_msgSend(v121, "initWithPeakMemoryUsageMeasurement:averageMemoryUsageMeasurement:", v124, v129);

  v130 = objc_alloc(MEMORY[0x24BDDE638]);
  v131 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)objc_msgSend(v131, "initWithDoubleValue:unit:", v132, 0.0);
  v134 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)objc_msgSend(v134, "initWithDoubleValue:unit:", v135, 100.0);
  v296 = (void *)objc_msgSend(v130, "initWithBucketStart:bucketEnd:bucketCount:", v133, v136, 50);

  v137 = objc_alloc(MEMORY[0x24BDDE638]);
  v138 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)objc_msgSend(v138, "initWithDoubleValue:unit:", v139, 100.0);
  v141 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend(v141, "initWithDoubleValue:unit:", v142, 400.0);
  v274 = (void *)objc_msgSend(v137, "initWithBucketStart:bucketEnd:bucketCount:", v140, v143, 60);

  v144 = objc_alloc(MEMORY[0x24BDDE638]);
  v145 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)objc_msgSend(v145, "initWithDoubleValue:unit:", v146, 400.0);
  v148 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)objc_msgSend(v148, "initWithDoubleValue:unit:", v149, 700.0);
  v273 = (void *)objc_msgSend(v144, "initWithBucketStart:bucketEnd:bucketCount:", v147, v150, 30);

  v151 = objc_alloc(MEMORY[0x24BDDE638]);
  v152 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = (void *)objc_msgSend(v152, "initWithDoubleValue:unit:", v153, 0.0);
  v155 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = (void *)objc_msgSend(v155, "initWithDoubleValue:unit:", v156, 200.0);
  v300 = (void *)objc_msgSend(v151, "initWithBucketStart:bucketEnd:bucketCount:", v154, v157, 60);

  v158 = objc_alloc(MEMORY[0x24BDDE638]);
  v159 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)objc_msgSend(v159, "initWithDoubleValue:unit:", v160, 201.0);
  v162 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)objc_msgSend(v162, "initWithDoubleValue:unit:", v163, 300.0);
  v298 = (void *)objc_msgSend(v158, "initWithBucketStart:bucketEnd:bucketCount:", v161, v164, 70);

  v165 = objc_alloc(MEMORY[0x24BDDE638]);
  v166 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (void *)objc_msgSend(v166, "initWithDoubleValue:unit:", v167, 301.0);
  v169 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = (void *)objc_msgSend(v169, "initWithDoubleValue:unit:", v170, 500.0);
  v297 = (void *)objc_msgSend(v165, "initWithBucketStart:bucketEnd:bucketCount:", v168, v171, 80);

  v292 = objc_alloc(MEMORY[0x24BDDE670]);
  v290 = objc_alloc(MEMORY[0x24BDDE668]);
  v321[0] = v296;
  v321[1] = v274;
  v321[2] = v273;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v321, 3);
  v172 = objc_claimAutoreleasedReturnValue();
  v173 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)objc_msgSend(v173, "initWithDoubleValue:unit:", v294, 30000.0);
  v175 = objc_alloc(MEMORY[0x24BDDE5B8]);
  v176 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = (void *)objc_msgSend(v176, "initWithDoubleValue:unit:", v177, 100000.0);
  v179 = (void *)objc_msgSend(v175, "initWithMeasurement:sampleCount:standardDeviation:", v178, 2, 0.0);
  v180 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)objc_msgSend(v180, "initWithDoubleValue:unit:", v181, 600.0);
  v183 = objc_alloc(MEMORY[0x24BDD1660]);
  v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18A0]), "initWithSymbol:", CFSTR("ms per s"));
  v185 = (void *)objc_msgSend(v183, "initWithDoubleValue:unit:", v184, 50.0);
  v186 = (void *)v172;
  v187 = (void *)objc_msgSend(v290, "initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:withCumulativeHitchTimeRatio:", v172, v174, v179, v182, v185);
  v272 = (void *)objc_msgSend(v292, "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", CFSTR("TestSignpostName1"), CFSTR("TestSignpostCategory1"), 30, v187);

  v188 = objc_alloc(MEMORY[0x24BDDE670]);
  v189 = objc_alloc(MEMORY[0x24BDDE668]);
  v320[0] = v300;
  v320[1] = v298;
  v320[2] = v297;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v320, 3);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = (void *)objc_msgSend(v191, "initWithDoubleValue:unit:", v192, 50000.0);
  v194 = objc_alloc(MEMORY[0x24BDDE5B8]);
  v195 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = (void *)objc_msgSend(v195, "initWithDoubleValue:unit:", v196, 60000.0);
  v198 = (void *)objc_msgSend(v194, "initWithMeasurement:sampleCount:standardDeviation:", v197, 2, 0.0);
  v199 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "kilobytes");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = (void *)objc_msgSend(v199, "initWithDoubleValue:unit:", v200, 700.0);
  v202 = (void *)objc_msgSend(v189, "initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:", v190, v193, v198, v201);
  v271 = (void *)objc_msgSend(v188, "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", CFSTR("TestSignpostName2"), CFSTR("TestSignpostCategory2"), 40, v202);

  v203 = objc_alloc(MEMORY[0x24BDDE618]);
  v204 = objc_alloc(MEMORY[0x24BDDE5B8]);
  v205 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDDE680], "apl");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = (void *)objc_msgSend(v205, "initWithDoubleValue:unit:", v206, 50.0);
  v208 = (void *)objc_msgSend(v204, "initWithMeasurement:sampleCount:standardDeviation:", v207, 500, 0.0);
  v270 = (void *)objc_msgSend(v203, "initWithAveragePictureLevel:", v208);

  v209 = objc_alloc(MEMORY[0x24BDDE588]);
  v210 = objc_alloc(MEMORY[0x24BDD1660]);
  v211 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18A0]), "initWithSymbol:", CFSTR("ms per s"));
  v212 = (void *)objc_msgSend(v210, "initWithDoubleValue:unit:", v211, 1000.0);
  v269 = (void *)objc_msgSend(v209, "initWithGlitchTimeRatio:", v212);

  v213 = objc_alloc(MEMORY[0x24BDDE590]);
  v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE620]), "initWithNormalAppExitCount:withMemoryResourceLimitExitCount:withCPUResourceLimitExitCount:withBadAccessExitCount:withAbnormalExitCount:withIllegalInstructionExitCount:withAppWatchDogExitCount:", 1, 1, 1, 1, 1, 1, 1);
  v215 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE5C0]), "initWithNormalAppExitCount:memoryResourceLimitExitCount:cpuResourceLimitExitCount:memoryPressureExitCount:badAccessExitCount:abnormalExitCount:illegalInstructionExitCount:appWatchDogExitCount:cumulativeSuspendedWithLockedFileExitCount:cumulativeBackgroundTaskAssertionTimeoutExitCount:cumulativeBackgroundURLSessionCompletionTimeoutExitCount:cumulativeBackgroundFetchCompletionTimeoutExitCount:", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  v268 = (void *)objc_msgSend(v213, "initWithForegroundExitData:backgroundExitData:", v214, v215);

  v216 = objc_alloc(MEMORY[0x24BDDE638]);
  v217 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = (void *)objc_msgSend(v217, "initWithDoubleValue:unit:", v218, 1000.0);
  v220 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = (void *)objc_msgSend(v220, "initWithDoubleValue:unit:", v221, 1010.0);
  v295 = (void *)objc_msgSend(v216, "initWithBucketStart:bucketEnd:bucketCount:", v219, v222, 50);

  v223 = objc_alloc(MEMORY[0x24BDDE638]);
  v224 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = (void *)objc_msgSend(v224, "initWithDoubleValue:unit:", v225, 2000.0);
  v227 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = (void *)objc_msgSend(v227, "initWithDoubleValue:unit:", v228, 2010.0);
  v291 = (void *)objc_msgSend(v223, "initWithBucketStart:bucketEnd:bucketCount:", v226, v229, 60);

  v230 = objc_alloc(MEMORY[0x24BDDE638]);
  v231 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = (void *)objc_msgSend(v231, "initWithDoubleValue:unit:", v232, 3000.0);
  v234 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = (void *)objc_msgSend(v234, "initWithDoubleValue:unit:", v235, 3010.0);
  v289 = (void *)objc_msgSend(v230, "initWithBucketStart:bucketEnd:bucketCount:", v233, v236, 30);

  v237 = objc_alloc(MEMORY[0x24BDDE638]);
  v238 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = (void *)objc_msgSend(v238, "initWithDoubleValue:unit:", v239, 200.0);
  v241 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = (void *)objc_msgSend(v241, "initWithDoubleValue:unit:", v242, 210.0);
  v293 = (void *)objc_msgSend(v237, "initWithBucketStart:bucketEnd:bucketCount:", v240, v243, 60);

  v244 = objc_alloc(MEMORY[0x24BDDE638]);
  v245 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = (void *)objc_msgSend(v245, "initWithDoubleValue:unit:", v246, 300.0);
  v248 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v250 = (void *)objc_msgSend(v248, "initWithDoubleValue:unit:", v249, 310.0);
  v288 = (void *)objc_msgSend(v244, "initWithBucketStart:bucketEnd:bucketCount:", v247, v250, 70);

  v251 = objc_alloc(MEMORY[0x24BDDE638]);
  v252 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = (void *)objc_msgSend(v252, "initWithDoubleValue:unit:", v253, 500.0);
  v255 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = (void *)objc_msgSend(v255, "initWithDoubleValue:unit:", v256, 510.0);
  v267 = (void *)objc_msgSend(v251, "initWithBucketStart:bucketEnd:bucketCount:", v254, v257, 80);

  v258 = objc_alloc(MEMORY[0x24BDDE5A0]);
  v319[0] = v295;
  v319[1] = v291;
  v319[2] = v289;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v319, 3);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v318[0] = v293;
  v318[1] = v288;
  v318[2] = v267;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v318, 3);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v317[0] = v295;
  v317[1] = v291;
  v317[2] = v289;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v317, 3);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v316[0] = v295;
  v316[1] = v291;
  v316[2] = v289;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v316, 3);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = (void *)objc_msgSend(v258, "initWithLaunchTimeData:withResumeTimeData:withActivationTimeData:withExtendedLaunchTimeData:", v259, v260, v261, v262);

  v264 = (void *)objc_msgSend(v283, "initWithAppVersion:withMutipleAppVersions:withTimeStampBegin:withTimeStampEnd:", v312, 0, v314, v313);
  objc_msgSend(v264, "setMetaData:", v311);
  objc_msgSend(v264, "setCpuMetrics:", v310);
  objc_msgSend(v264, "setGpuMetrics:", v309);
  objc_msgSend(v264, "setCellularConditionMetrics:", v308);
  objc_msgSend(v264, "setApplicationTimeMetrics:", v307);
  objc_msgSend(v264, "setLocationActivityMetrics:", v306);
  objc_msgSend(v264, "setNetworkTransferMetrics:", v304);
  objc_msgSend(v264, "setApplicationLaunchMetrics:", v263);
  objc_msgSend(v264, "setApplicationResponsivenessMetrics:", v302);
  objc_msgSend(v264, "setDiskIOMetrics:", v276);
  objc_msgSend(v264, "setDisplayMetrics:", v270);
  objc_msgSend(v264, "setAnimationMetrics:", v269);
  objc_msgSend(v264, "setApplicationExitMetrics:", v268);
  objc_msgSend(v264, "setMemoryMetrics:", v275);
  v315[0] = v272;
  v315[1] = v271;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v315, 2);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setSignpostMetrics:", v265);

  return v264;
}

+ (id)buildDummyDiagnosticPayloadForClient:(id)a3 withDateString:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[5];
  _QWORD v95[7];

  v95[5] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDD1500];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:");
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromString:", v9);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v6;
  objc_msgSend(v6, "dateFromString:", v11);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);
  objc_msgSend(v12, "shortVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "shortVersionString");
  else
    objc_msgSend(v12, "bundleVersion");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bundleVersion");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDDE650]);
  objc_msgSend(MEMORY[0x24BE668E8], "regionFormat");
  v78 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "osVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "modelIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE668E8], "platformArchitecture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:platformArchitecture:", v15, v16, v17, v77, v18);

  v87 = v19;
  objc_msgSend(v19, "setLowPowerModeEnabled:", 1);
  objc_msgSend(v19, "setIsTestFlightApp:", 0);
  objc_msgSend(v19, "setPid:", 123);
  v20 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v20, "initWithDoubleValue:unit:", v21, 20.0);

  v22 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "bytes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v22, "initWithDoubleValue:unit:", v23, 2000.0);

  v24 = objc_alloc(MEMORY[0x24BDDE5E8]);
  v25 = objc_alloc(MEMORY[0x24BDBCE30]);
  v26 = objc_alloc(MEMORY[0x24BDDE5E0]);
  v27 = objc_alloc(MEMORY[0x24BDBCE30]);
  v28 = objc_alloc(MEMORY[0x24BDDE5D8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 74565);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v32 = (void *)objc_msgSend(v28, "initWithBinaryName:binaryUUID:address:binaryOffset:sampleCount:withDepth:subFrameArray:", CFSTR("testBinaryName"), v29, v30, &unk_24E2FF168, &unk_24E2FF180, 0, v31);
  v33 = (void *)objc_msgSend(v27, "initWithObjects:", v32, 0);
  v34 = (void *)objc_msgSend(v26, "initWithTopCallStackFrames:isAttributedThread:", v33, 1);
  v35 = (void *)objc_msgSend(v25, "initWithObjects:", v34);
  v85 = (void *)objc_msgSend(v24, "initWithThreadArray:aggregatedByProcess:", v35, 1);

  v36 = objc_alloc(MEMORY[0x24BDDE5E8]);
  v37 = objc_alloc(MEMORY[0x24BDBCE30]);
  v38 = objc_alloc(MEMORY[0x24BDDE5E0]);
  v39 = objc_alloc(MEMORY[0x24BDBCE30]);
  v40 = objc_alloc(MEMORY[0x24BDDE5D8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 74565);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v44 = (void *)objc_msgSend(v40, "initWithBinaryName:binaryUUID:address:binaryOffset:sampleCount:withDepth:subFrameArray:", CFSTR("testBinaryName"), v41, v42, &unk_24E2FF168, &unk_24E2FF180, 0, v43);
  v45 = (void *)objc_msgSend(v39, "initWithObjects:", v44, 0);
  v46 = (void *)objc_msgSend(v38, "initWithTopCallStackFrames:isAttributedThread:", v45, 1);
  v47 = (void *)objc_msgSend(v37, "initWithObjects:", v46);
  v48 = objc_msgSend(v36, "initWithThreadArray:aggregatedByProcess:", v47, 0);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v64) = 0;
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE678]), "initWithSubSystem:category:name:beginTimeStamp:endTimeStamp:duration:isInterval:", CFSTR("testEventSubsystem"), CFSTR("testEventCategory"), CFSTR("testEventName"), v49, 0, 0, v64);
  v50 = objc_alloc(MEMORY[0x24BDDE678]);
  v76 = v49;
  objc_msgSend(v49, "addTimeInterval:", -5.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v52, "initWithDoubleValue:unit:", v53, 5000.0);
  LOBYTE(v65) = 1;
  v74 = (void *)objc_msgSend(v50, "initWithSubSystem:category:name:beginTimeStamp:endTimeStamp:duration:isInterval:", CFSTR("testIntervalSubsystem"), CFSTR("testIntervalCategory"), CFSTR("testIntervalName"), v51, v49, v54, v65);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v75);
  objc_msgSend(v55, "addObject:", v74);
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE5C8]), "initWithMetaData:applicationVersion:signpostData:pid:callStack:totalCpuTime:totalSampledTime:", v87, v79, v55, 123, v85, v86, v86);
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE630]), "initWithMetaData:applicationVersion:signpostData:pid:callStack:hangDuration:", v87, v79, v55, 123, v48, v86);
  v73 = (void *)v48;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE598]), "initWithMetaData:applicationVersion:signpostData:pid:callStack:launchDuration:", v87, v79, v55, 123, v48, v86);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE610]), "initWithMetaData:applicationVersion:signpostData:pid:totalWritesCaused:stackTrace:", v87, v79, v55, 123, v88, v85);
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE5F8]), "initWithMetaData:applicationVersion:signpostData:pid:terminationReason:applicationSpecificInfo:virtualMemoryRegionInfo:exceptionType:exceptionCode:signal:stackTrace:", v87, v79, v55, 123, CFSTR("Namespace SIGNAL, Code 0xb"), &unk_24E2FF150, CFSTR("0 is not in any region.  Bytes before following region: 4000000000 REGION TYPE                      START - END             [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL UNUSED SPACE AT START ---> __TEXT                 0000000000000000-0000000000000000 [   32K] r-x/r-x SM=COW  ...pp/Test"), &unk_24E2FF198, &unk_24E2FF1B0, &unk_24E2FF1C8, v48);
  v68 = objc_alloc(MEMORY[0x24BDDE600]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v72;
  v94[0] = CFSTR("diskWriteExceptionDiagnostics");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v57;
  v94[1] = CFSTR("hangDiagnostics");
  v92 = v71;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v58;
  v94[2] = CFSTR("appLaunchDiagnostics");
  v91 = v70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v59;
  v94[3] = CFSTR("cpuExceptionDiagnostics");
  v90 = v84;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v60;
  v94[4] = CFSTR("crashDiagnostics");
  v89 = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v95[4] = v61;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 5);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (id)objc_msgSend(v68, "initWithTimeStampBegin:withTimeStampEnd:withDiagnostics:", v56, v67, v62);

  return v69;
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_21E837000, v0, (uint64_t)v0, "No diagnostic service payloads found for client: %@ date: %@", v1);
  OUTLINED_FUNCTION_5();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: Finalize diagnostic payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: Dictionary of Array of Diagnostics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: ReportCrash Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: HangTracer Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: SpinTracer Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.7()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_12_0(&dword_21E837000, v0, (uint64_t)v0, "Construction Step: Date Data: %@, %@", v1);
  OUTLINED_FUNCTION_5();
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Construction Step: Date Data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)buildPayloadForClient:fromClientMetricsDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Required service payloads not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)buildPayloadForClient:(void *)a1 fromClientMetricsDictionary:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, a2, v4, "Payload Construction complete: %@", v5);

  OUTLINED_FUNCTION_4_2();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E837000, v0, v1, "Failed to retrieve powerlog data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Construction Step: Powerlog Data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithServiceString:(os_log_t)log withSourceData:withDateString:forClient:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21E837000, log, OS_LOG_TYPE_ERROR, "Error in payload constructor: %@", buf, 0xCu);

}

+ (void)constructPayloadWithServiceString:(void *)a1 withSourceData:(void *)a2 withDateString:forClient:.cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_21E837000, v3, v5, "Payload Meta Data:%@", v6);

  OUTLINED_FUNCTION_4_2();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Meta Data V2: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Meta Data V1: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: Meta Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)constructPayloadWithServiceString:(void *)a1 withSourceData:(NSObject *)a2 withDateString:forClient:.cold.8(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "beginDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_12_0(&dword_21E837000, a2, v6, "Construction Step: Date Data: %@, %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_10();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Bundle Version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_21E837000, v0, v1, "Latest App Version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_21E837000, v0, v1, "Construction Step: Powerlog Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)constructPayloadWithServiceString:(uint64_t)a1 withSourceData:(NSObject *)a2 withDateString:forClient:.cold.12(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(&unk_24E2FF138, "objectAtIndexedSubscript:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_4(&dword_21E837000, a2, v5, "Compatible service string not found. Expected: %@, Received: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_10();
}

@end
