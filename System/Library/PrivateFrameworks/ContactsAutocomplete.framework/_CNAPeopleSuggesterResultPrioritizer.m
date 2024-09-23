@implementation _CNAPeopleSuggesterResultPrioritizer

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_23);
  return (id)os_log_cn_once_object_1;
}

- (_CNAPeopleSuggesterResultPrioritizer)init
{
  _CNAPeopleSuggesterResultPrioritizer *v2;
  uint64_t v3;
  CNHandleStringClassifier *handleStringClassifier;
  _CNAPeopleSuggesterResultPrioritizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAPeopleSuggesterResultPrioritizer;
  v2 = -[_CNAPeopleSuggesterResultPrioritizer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13A70]), "initWithClassificationQuality:", 0);
    handleStringClassifier = v2->_handleStringClassifier;
    v2->_handleStringClassifier = (CNHandleStringClassifier *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)applyPriorityOrderToResults:(id)a3 fetchRequest:(id)a4 andCompletePriorityResultsPromise:(id)a5
{
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  dispatch_block_t v43;
  void (**v44)(_QWORD);
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id obj;
  void *v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  void *v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  _CNAPeopleSuggesterResultPrioritizer *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  _BYTE *v112;
  _BYTE v113[128];
  uint8_t v114[128];
  _BYTE buf[24];
  uint64_t (*v116)(uint64_t, uint64_t);
  __int128 v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v84 = a4;
  v80 = a5;
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  CNALoggingContextTriage();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v84, "triageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will sort", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "searchNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAPeopleSuggesterResultPrioritizer partitionCandidatesForRanking:givenPrefixes:](self, "partitionCandidatesForRanking:givenPrefixes:", v81, v12);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "first");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "second");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v88, "count"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = v13;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v92)
  {
    v90 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v92; ++i)
      {
        if (*(_QWORD *)v107 != v90)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_CNAPeopleSuggesterResultPrioritizer resultIdentifierIsValidMessagesChatGuid:](self, "resultIdentifierIsValidMessagesChatGuid:", v15))
        {
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = 0;
          objc_msgSend(v15, "members:", &v105);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v105;
          if (v18)
          {
            objc_msgSend(v18, "_cn_compactMap:", &__block_literal_global_10_0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            CNALoggingContextDebug();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v19;
              _os_log_impl(&dword_1B9950000, v25, OS_LOG_TYPE_DEFAULT, "Error retrieving chat recipients from %@ : %@", buf, 0x16u);
            }

            v20 = 0;
          }

          v24 = 0;
        }
        else
        {
          if (objc_msgSend(v16, "addressType") == 2)
          {
            v21 = (void *)MEMORY[0x1E0C97398];
            objc_msgSend(v16, "address");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "phoneNumberWithStringValue:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "unformattedInternationalStringValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v16, "address");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v20 = 0;
          v17 = 0;
        }
        if (v17)
          v26 = v17;
        else
          v26 = v24;
        v27 = v26;
        if (v27)
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v15, v27);
        v28 = objc_alloc(get_PSAutocompleteSuggestionClass());
        objc_msgSend(v15, "displayName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v28, "initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:", v17, v20, v29, v24, v30, objc_msgSend(v15, "sourceType"), 0);

        if (v31)
        {
          objc_msgSend(v88, "addObject:", v31);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "os_log");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v15;
            _os_log_error_impl(&dword_1B9950000, v32, OS_LOG_TYPE_ERROR, "Could not create suggestion from result: %{public}@", buf, 0xCu);
          }

        }
      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    }
    while (v92);
  }

  CNALoggingContextTriage();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v84, "triageIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v34;
    _os_log_impl(&dword_1B9950000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will re-rank with PSSuggester", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "bundleIdentifierOfCurrentProcess");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "fetchContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sendingAddressAccountIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v84, "shouldIncludeGroupResults"))
  {
    objc_msgSend(v84, "searchString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  v39 = MEMORY[0x1E0C809B0];
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke_12;
  v99[3] = &unk_1E70DFCA0;
  v85 = v35;
  v100 = v85;
  v86 = v37;
  v101 = v86;
  v91 = v38;
  v102 = v91;
  v89 = v88;
  v103 = v89;
  v104 = self;
  v40 = v99;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v116 = __Block_byref_object_copy__2;
  *(_QWORD *)&v117 = __Block_byref_object_dispose__2;
  *((_QWORD *)&v117 + 1) = 0;
  v110[0] = v39;
  v110[1] = 3221225472;
  v110[2] = __CNResultWithQoS_block_invoke;
  v110[3] = &unk_1E70DFD58;
  v112 = buf;
  v41 = v40;
  v111 = v41;
  v42 = v110;
  v43 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, v42);
  objc_opt_self();
  v44 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  v44[2](v44);
  v45 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  CNALoggingContextTriage();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v84, "triageIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v47;
    _os_log_impl(&dword_1B9950000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will convert to autocomplete results", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v50 = v45;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v96 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(v54, "chatGuid");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          v57 = v55;
        }
        else
        {
          objc_msgSend(v54, "handle");
          v57 = (id)objc_claimAutoreleasedReturnValue();
        }
        v58 = v57;

        objc_msgSend(v93, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v59)
        {
          objc_msgSend(v59, "setSourceType:", objc_msgSend(v54, "resultSourceType") | objc_msgSend(v59, "sourceType"));
          objc_msgSend(v48, "addObject:", v60);
          if ((objc_msgSend(v60, "sourceType") & 0x10) != 0)
            objc_msgSend(v49, "addObject:", v60);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "os_log");
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v54;
            _os_log_error_impl(&dword_1B9950000, v61, OS_LOG_TYPE_ERROR, "Suggestion from PS has no identifier; this result may be ranked lower than it should be: %{public}@",
              buf,
              0xCu);
          }

        }
      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
    }
    while (v51);
  }

  objc_msgSend((id)objc_opt_class(), "os_log");
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:].cold.3();

  objc_msgSend((id)objc_opt_class(), "os_log");
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:].cold.2();

  objc_msgSend((id)objc_opt_class(), "os_log");
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:].cold.1();

  objc_msgSend(v48, "addObjectsFromArray:", obj);
  objc_msgSend(v48, "addObjectsFromArray:", v82);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAPeopleSuggesterResultPrioritizer partitionStewieResults:](self, "partitionStewieResults:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "first");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObjectsFromArray:", v68);

  objc_msgSend(v67, "second");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addObjectsFromArray:", v69);

  objc_msgSend(v80, "finishWithResult:", v49);
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "timestamp");
  v72 = v71;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v72 - v9);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v84, "triageIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v65, "count");
    v77 = objc_msgSend(v65, "count");
    v78 = "results";
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v75;
    *(_WORD *)&buf[12] = 2048;
    if (v77 == 1)
      v78 = "result";
    *(_QWORD *)&buf[14] = v76;
    *(_WORD *)&buf[22] = 2080;
    v116 = (uint64_t (*)(uint64_t, uint64_t))v78;
    LOWORD(v117) = 2114;
    *(_QWORD *)((char *)&v117 + 2) = v73;
    _os_log_impl(&dword_1B9950000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Sort complete (%lu %s, %{public}@)", buf, 0x2Au);

  }
  return v65;
}

- (id)partitionCandidatesForRanking:(id)a3 givenPrefixes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke;
  v10[3] = &unk_1E70DFCF0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "_cn_partition:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)partitionStewieResults:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_partition:", &__block_literal_global_23);
}

- (BOOL)resultMatchesPrefix:(id)a3 inNameComponentsOfResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_cn_hasPrefix:", v5) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v7, "lastName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "_cn_hasPrefix:", v5) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v7, "nickname");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "_cn_hasPrefix:", v5) & 1) != 0)
        {
          v9 = 1;
        }
        else
        {
          objc_msgSend(v7, "nameSuffix");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "_cn_hasPrefix:", v5);

        }
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)resultIdentifierIsValidMessagesChatGuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v3 = a3;
  if (objc_msgSend(v3, "resultType") == 1)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsString:", CFSTR("iMessage")))
    {
LABEL_5:

LABEL_10:
      v8 = 1;
      goto LABEL_11;
    }
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsString:", CFSTR("SMS")))
    {

      goto LABEL_5;
    }
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("urn:biz:"));

    if ((v7 & 1) != 0)
      goto LABEL_10;
  }
  if (objc_msgSend(v3, "resultType") == 1 && (objc_msgSend(v3, "sourceType") & 0x10) != 0)
    goto LABEL_10;
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)bundleIdentifierOfCurrentProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___CNAPeopleSuggesterResultPrioritizer_bundleIdentifierOfCurrentProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundleIdentifierOfCurrentProcess_cn_once_token_20 != -1)
    dispatch_once(&bundleIdentifierOfCurrentProcess_cn_once_token_20, block);
  return (id)bundleIdentifierOfCurrentProcess_cn_once_object_20;
}

+ (id)makeBundleIdentifierOfCurrentProcess
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleStringClassifier, 0);
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Final assembly 3. nonCandidates: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Final assembly 2. candidatesToRank: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Final assembly 1. finalResults: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
