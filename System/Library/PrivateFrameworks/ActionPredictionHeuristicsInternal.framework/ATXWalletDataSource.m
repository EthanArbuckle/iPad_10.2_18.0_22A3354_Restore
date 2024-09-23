@implementation ATXWalletDataSource

- (ATXWalletDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXWalletDataSource *v6;
  ATXWalletDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWalletDataSource;
  v6 = -[ATXWalletDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)passesWithStyle:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _BYTE v56[16];
  uint8_t buf[16];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5428) & 1) == 0)
  {
LABEL_6:
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
    goto LABEL_31;
  }
  +[ATXWalletDataSourceSharedData sharedInstance](ATXWalletDataSourceSharedData, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEmptyWalletPasses");

  if (v8)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "Heuristics have cached no Wallet passes", buf, 2u);
    }

    goto LABEL_6;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0D66F08], "isPassLibraryAvailable"))
    goto LABEL_30;
  v45 = v6;
  v46 = v5;
  v11 = -[ATXWalletDataSource _getPassStyleMaskForString:](self, "_getPassStyleMaskForString:", v5);
  +[ATXHeuristicResultCache sharedPassLibrary](ATXHeuristicResultCache, "sharedPassLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "passesOfStyles:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (!v14)
    goto LABEL_29;
  v15 = v14;
  v16 = *(_QWORD *)v52;
  v48 = *MEMORY[0x1E0D6A858];
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v52 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      v19 = (void *)MEMORY[0x1CAA46CBC]();
      v20 = (void *)objc_opt_new();
      objc_msgSend(v18, "relevantDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "relevantDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        objc_msgSend(v22, "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("date"));

      }
      objc_msgSend(v18, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("description"));

      objc_msgSend(v18, "embeddedLocationsArray");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("locations"));

      objc_msgSend(v18, "localizedName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("name"));

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("pass"));
      objc_msgSend(v18, "serialNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("serial"));

      objc_msgSend(v18, "organizationName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("organization"));

      objc_msgSend(v18, "passURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "absoluteString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("url"));

      objc_msgSend(v18, "allSemantics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        -[ATXWalletDataSource _extractRelevantSemanticTagsFromPass:](self, "_extractRelevantSemanticTagsFromPass:", v18);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setValuesForKeysWithDictionary:", v35);

      }
      if ((v11 & 0x10) == 0)
        goto LABEL_21;
      objc_msgSend(v20, "objectForKeyedSubscript:", v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        objc_msgSend(v36, "earlierDate:", v47);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38 != v37)
        {

LABEL_21:
          objc_msgSend(v10, "addObject:", v20);
          goto LABEL_27;
        }
        __atxlog_handle_heuristic();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[ATXWalletDataSource passesWithStyle:callback:].cold.2((uint64_t)v56, (uint64_t)v18);
      }
      else
      {
        __atxlog_handle_heuristic();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[ATXWalletDataSource passesWithStyle:callback:].cold.1((uint64_t)buf, (uint64_t)v18);
      }

LABEL_27:
      objc_autoreleasePoolPop(v19);
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  }
  while (v15);
LABEL_29:

  v6 = v45;
  v5 = v46;
LABEL_30:
  v40 = objc_msgSend(v10, "count") == 0;
  +[ATXWalletDataSourceSharedData sharedInstance](ATXWalletDataSourceSharedData, "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHasEmptyWalletPasses:", v40);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v42;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("serial"), 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortUsingDescriptors:", v44);

  (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v10, 0);
LABEL_31:

}

- (unint64_t)_getPassStyleMaskForString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ticket")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("boardingPass")) & 1) != 0)
    {
      v5 = 16;
      goto LABEL_9;
    }
  }
  __atxlog_handle_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ATXWalletDataSource _getPassStyleMaskForString:].cold.1(v6);

  v5 = 0;
LABEL_9:

  return v5;
}

- (id)_extractRelevantSemanticTagsFromPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[3];

  v94[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0D6A9F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v6);

  v9 = *MEMORY[0x1E0D6A9E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);

  v12 = *MEMORY[0x1E0D6A840];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A840]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);

  v15 = *MEMORY[0x1E0D6A838];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A838]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v15);

  v18 = *MEMORY[0x1E0D6A8C8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8C8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v18);

  v21 = *MEMORY[0x1E0D6AAA8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAA8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v21);

  v24 = *MEMORY[0x1E0D6AAC0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAC0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v24);

  v27 = *MEMORY[0x1E0D6AA88];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AA88]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, v27);

  v30 = *MEMORY[0x1E0D6AAB0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAB0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, v30);

  v33 = *MEMORY[0x1E0D6A8B8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8B8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "locationValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v93[0] = CFSTR("lat");
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "coordinate");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = CFSTR("lon");
    v94[0] = v37;
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "coordinate");
    objc_msgSend(v38, "numberWithDouble:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, v33);

  }
  v42 = *MEMORY[0x1E0D6A858];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A858]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "dateValue");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, v42);

  v45 = *MEMORY[0x1E0D6A848];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A848]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dateValue");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, v45);

  v48 = *MEMORY[0x1E0D6A980];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A980]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringValue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, v48);

  v51 = *MEMORY[0x1E0D6A8A8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8A8]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "locationValue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v91[0] = CFSTR("lat");
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v53, "coordinate");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = CFSTR("lon");
    v92[0] = v55;
    v56 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v53, "coordinate");
    objc_msgSend(v56, "numberWithDouble:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, v51);

  }
  v60 = *MEMORY[0x1E0D6A8B0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8B0]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "locationValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v89[0] = CFSTR("lat");
    v63 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v62, "coordinate");
    objc_msgSend(v63, "numberWithDouble:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = CFSTR("lon");
    v90[0] = v64;
    v65 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v62, "coordinate");
    objc_msgSend(v65, "numberWithDouble:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, v60);

  }
  v69 = *MEMORY[0x1E0D6A9B8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9B8]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "stringValue");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, v69);

  v72 = *MEMORY[0x1E0D6A9F8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9F8]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "stringValue");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, v72);

  v75 = *MEMORY[0x1E0D6A8C0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8C0]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "numberValue");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, v75);

  v78 = *MEMORY[0x1E0D6A920];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A920]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "stringValue");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v80, v78);

  v81 = *MEMORY[0x1E0D6A968];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A968]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "stringValue");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v83, v81);

  v84 = *MEMORY[0x1E0D6A9A0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9A0]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "stringValue");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v86, v84);

  __atxlog_handle_heuristic();
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    -[ATXWalletDataSource _extractRelevantSemanticTagsFromPass:].cold.1((uint64_t)v4, v87);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)passesWithStyle:(uint64_t)a1 callback:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1C99DF000, v5, v6, "ATXWalletDataSource: ignoring pass without departure date: %@");

  OUTLINED_FUNCTION_2_1();
}

- (void)passesWithStyle:(uint64_t)a1 callback:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1C99DF000, v5, v6, "ATXWalletDataSource: ignoring old pass: %@");

  OUTLINED_FUNCTION_2_1();
}

- (void)_getPassStyleMaskForString:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "Unsupported pass style requested from Wallet data source", v1, 2u);
}

- (void)_extractRelevantSemanticTagsFromPass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "Extracted relevant semantic tags from pass: %@", (uint8_t *)&v2, 0xCu);
}

@end
