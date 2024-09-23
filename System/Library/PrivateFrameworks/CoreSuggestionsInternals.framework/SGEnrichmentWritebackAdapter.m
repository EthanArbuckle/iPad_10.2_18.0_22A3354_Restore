@implementation SGEnrichmentWritebackAdapter

- (id)_uniqueIdentifiersMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v35 = a5;
  if (v7 | v8)
  {
    v34 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setLowPriority:", qos_class_self() < QOS_CLASS_USER_INITIATED);
    v47[0] = *MEMORY[0x1E0CA6978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFetchAttributes:", v11);

    objc_msgSend(v10, "setReason:", CFSTR("reason:SGEnrichmentWritebackAdapter-1; code:8"));
    v12 = (void *)objc_opt_new();
    if (v7)
    {
      v13 = (void *)MEMORY[0x1C3BD4F6C]();
      spotlightEscaped((void *)v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("kMDItemEventGroupIdentifier == "), "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

      objc_autoreleasePoolPop(v13);
    }
    if (v8)
    {
      v16 = (void *)MEMORY[0x1C3BD4F6C]();
      spotlightEscaped((void *)v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("kMDItemEventGroupIdentifier == "), "stringByAppendingString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v18);

      objc_autoreleasePoolPop(v16);
    }
    objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(" || "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v35, "timeIntervalSinceReferenceDate");
      v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("(%@) && kMDItemContentCreationDate < %f"), v19, v21);

      v19 = (void *)v22;
    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v19, v10);
    objc_msgSend(v23, "setPrivateIndex:", 0);
    v46 = CFSTR("com.apple.spotlight.events");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBundleIDs:", v24);

    if (objc_msgSend(MEMORY[0x1E0D81590], "isDeviceFormattedForProtection"))
    {
      v45 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setProtectionClasses:", v25);

    }
    v26 = (void *)objc_opt_new();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815A0]), "initWithDomain:", CFSTR("CoreSuggestions"));
    v28 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke;
    v42[3] = &unk_1E7DB1330;
    v29 = v26;
    v43 = v29;
    v30 = v27;
    v44 = v30;
    objc_msgSend(v23, "setFoundItemsHandler:", v42);
    v39[0] = v28;
    v39[1] = 3221225472;
    v39[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_3;
    v39[3] = &unk_1E7DAFE08;
    v31 = v34;
    v40 = v31;
    v32 = v29;
    v41 = v32;
    objc_msgSend(v23, "setCompletionHandler:", v39);
    location = 0;
    objc_initWeak(&location, v23);
    v36[0] = v28;
    v36[1] = 3221225472;
    v36[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_4;
    v36[3] = &unk_1E7DAFE30;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v31, "wait:", v36);
    objc_msgSend(v23, "start");
    v9 = v31;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", MEMORY[0x1E0C9AA60]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_uniqueIdentifiersMatchingEvent:(id)a3 olderThanDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "heuristicUpdatingEnabled") & 1) != 0)
  {
    objc_msgSend(v6, "duplicateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pseudoEventKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extraKeyTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEnrichmentWritebackAdapter _uniqueIdentifiersMatchingGroupId:fallbackGroupId:olderThanDate:](self, "_uniqueIdentifiersMatchingGroupId:fallbackGroupId:olderThanDate:", v10, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", MEMORY[0x1E0C9AA60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_deleteEventsMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (v8 | v9)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke;
    block[3] = &unk_1E7DB57C8;
    block[4] = self;
    v18 = (id)v8;
    v19 = (id)v9;
    v20 = v10;
    v14 = v12;
    v21 = v14;
    dispatch_async(v13, block);

    v15 = v21;
    v11 = v14;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", MEMORY[0x1E0C9AAB0]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_deleteEventsMatchingEvent:(id)a3 keepingNewerEvents:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;

  v6 = a3;
  if ((objc_msgSend(v6, "heuristicUpdatingEnabled") & 1) != 0)
  {
    objc_msgSend(v6, "duplicateKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pseudoEventKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extraKeyTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(v6, "creationTimestamp");
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v12);
      -[SGEnrichmentWritebackAdapter _deleteEventsMatchingGroupId:fallbackGroupId:olderThanDate:](self, "_deleteEventsMatchingGroupId:fallbackGroupId:olderThanDate:", v9, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[SGEnrichmentWritebackAdapter _deleteEventsMatchingGroupId:fallbackGroupId:olderThanDate:](self, "_deleteEventsMatchingGroupId:fallbackGroupId:olderThanDate:", v9, v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", MEMORY[0x1E0C9AAB0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)addEvent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *context;
  void *contexta;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  _QWORD v53[4];
  id v54;
  dispatch_semaphore_t v55;
  void *v56;
  _QWORD v57[4];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  NSObject *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!+[SGEnrichmentWritebackAdapter _isEligibleEvent:](SGEnrichmentWritebackAdapter, "_isEligibleEvent:", v5))
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v59 = v5;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "addEvent:%{sensitive}@ skipping due to being ineligible", buf, 0xCu);
    }
    goto LABEL_37;
  }
  +[SGEnrichmentWritebackAdapter _bundleIdentifierFromEvent:](SGEnrichmentWritebackAdapter, "_bundleIdentifierFromEvent:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D19A28]))
  {
    objc_msgSend(v5, "duplicateKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emailKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageId");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (-[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D19A38]))
  {
    objc_msgSend(v5, "duplicateKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v10;

    if (v11)
    {
      -[SGEnrichmentWritebackAdapter _deleteEventsMatchingEvent:keepingNewerEvents:](self, "_deleteEventsMatchingEvent:keepingNewerEvents:", v5, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeout:", 60.0);
      v13 = (id)objc_msgSend(v12, "wait");
      objc_msgSend(v12, "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if ((v15 & 1) != 0)
      {
        -[SGEnrichmentWritebackAdapter _uniqueIdentifiersMatchingEvent:olderThanDate:](self, "_uniqueIdentifiersMatchingEvent:olderThanDate:", v5, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTimeout:", 60.0);
        v17 = (id)objc_msgSend(v16, "wait");
        objc_msgSend(v16, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          sgLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v16, "error");
            v42 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138740227;
            v59 = v5;
            v60 = 2112;
            v61 = v42;
            _os_log_fault_impl(&dword_1C3607000, v19, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because failed to query spotlight for newer events: %@", buf, 0x16u);

          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria())
            goto LABEL_22;
          goto LABEL_35;
        }
        objc_msgSend(v16, "result");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          sgLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "result");
            v25 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138740227;
            v59 = v5;
            v60 = 2117;
            v61 = v25;
            _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "addEvent:%{sensitive}@ bailing because newer events were found in spotlight: %{sensitive}@", buf, 0x16u);

          }
          goto LABEL_34;
        }
        +[SGEnrichmentWritebackAdapter _attributeSetForEvent:](SGEnrichmentWritebackAdapter, "_attributeSetForEvent:", v5);
        v52 = objc_claimAutoreleasedReturnValue();
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "duplicateKey");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "parentKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithLongLong:", objc_msgSend(v27, "entityType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = +[SGEnrichmentWritebackAdapter _isSupportedEntityTypes:](SGEnrichmentWritebackAdapter, "_isSupportedEntityTypes:", v28);

        if (!v47)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "duplicateKey");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "parentKey");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEnrichmentWritebackAdapter.m"), 255, CFSTR("unexpected entityType %lld (uniqueIdentifier logic only supports mail and message bundle ID)"), objc_msgSend(v44, "entityType"));

        }
        if (-[NSObject rangeOfString:options:](v6, "rangeOfString:options:", CFSTR("-"), 2) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[NSObject eventGroupIdentifier](v52, "eventGroupIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@-%@-default-%@-%@"), CFSTR("CoreSuggestions"), CFSTR("v3"), v30, v6);

          objc_autoreleasePoolPop(context);
          contexta = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%."));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "invertedSet");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v57[0] = CFSTR("CoreSuggestions");
          v57[1] = CFSTR("v3");
          v57[2] = CFSTR("default");
          objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v57[3] = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "_pas_componentsJoinedByString:", CFSTR("."));
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(contexta);
          v24 = v52;
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v50, v48, v52);
          v36 = dispatch_semaphore_create(0);
          +[SGEnrichmentWritebackAdapter _index](SGEnrichmentWritebackAdapter, "_index");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __41__SGEnrichmentWritebackAdapter_addEvent___block_invoke;
          v53[3] = &unk_1E7DAFE08;
          v54 = v5;
          v55 = v36;
          v39 = v36;
          objc_msgSend(v37, "indexSearchableItems:completionHandler:", v38, v53);

          dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
LABEL_34:

LABEL_35:
LABEL_36:

          goto LABEL_37;
        }
        sgLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138740227;
          v59 = v5;
          v60 = 2114;
          v61 = v6;
          _os_log_fault_impl(&dword_1C3607000, v40, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because bundleIdentifierForUniqueIdentifier contains '-': %{public}@", buf, 0x16u);
        }

        v24 = v52;
        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
        {
          objc_autoreleasePoolPop(context);
          goto LABEL_34;
        }
      }
      else
      {
        sgLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v12, "error");
          v41 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138740227;
          v59 = v5;
          v60 = 2112;
          v61 = v41;
          _os_log_fault_impl(&dword_1C3607000, v21, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because deletion timed out or failed: %@", buf, 0x16u);

        }
        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          goto LABEL_36;
      }
LABEL_22:
      abort();
    }
  }
  sgLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138739971;
    v59 = v5;
    _os_log_fault_impl(&dword_1C3607000, v20, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing due to nil messageId", buf, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_22;
LABEL_37:

}

- (void)orphanEvent:(id)a3
{
  id v3;
  id v4;

  -[SGEnrichmentWritebackAdapter _deleteEventsMatchingEvent:keepingNewerEvents:](self, "_deleteEventsMatchingEvent:keepingNewerEvents:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeout:", 60.0);
  v3 = (id)objc_msgSend(v4, "wait");

}

- (void)addEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD4F6C](v5);
        -[SGEnrichmentWritebackAdapter addEvent:](self, "addEvent:", v9, (_QWORD)v11);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
    }
    while (v5);
  }

}

- (void)cancelEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD4F6C](v5);
        -[SGEnrichmentWritebackAdapter cancelEvent:](self, "cancelEvent:", v9, (_QWORD)v11);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
    }
    while (v5);
  }

}

void __41__SGEnrichmentWritebackAdapter_addEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138740227;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ indexing failed with error %@", (uint8_t *)&v6, 0x16u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_uniqueIdentifiersMatchingGroupId:fallbackGroupId:olderThanDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "wait");
  if ((objc_msgSend(*(id *)(a1 + 64), "isComplete") & 1) == 0)
  {
    objc_msgSend(v2, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[SGEnrichmentWritebackAdapter _index](SGEnrichmentWritebackAdapter, "_index");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "result");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2;
      v14[3] = &unk_1E7DB71B8;
      v7 = &v15;
      v15 = *(id *)(a1 + 64);
      objc_msgSend(v5, "deleteSearchableItemsWithIdentifiers:completionHandler:", v6, v14);

    }
    else
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v2, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138740483;
        v17 = v9;
        v18 = 2117;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_fault_impl(&dword_1C3607000, v8, OS_LOG_TYPE_FAULT, "deleteEventsMatchingGroupId:%{sensitive}@ fallbackGroupId:%{sensitive}@ deleting all because we couldn't find existing stuff in Spotlight (%@)", buf, 0x20u);

      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      +[SGEnrichmentWritebackAdapter _index](SGEnrichmentWritebackAdapter, "_index");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_27;
      v12[3] = &unk_1E7DB71B8;
      v7 = &v13;
      v13 = *(id *)(a1 + 64);
      objc_msgSend(v5, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", &unk_1E7E107E8, v12);
    }

  }
}

uint64_t __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = MEMORY[0x1E0C9AAB0];
  return objc_msgSend(v2, "completeWithResult:error:", v3, a2);
}

uint64_t __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_27(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = MEMORY[0x1E0C9AAB0];
  return objc_msgSend(v2, "completeWithResult:error:", v3, a2);
}

void __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2;
  v5[3] = &unk_1E7DAC338;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "_pas_mappedArrayWithTransform:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

uint64_t __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "fail:", a2);
  else
    return objc_msgSend(v3, "succeed:", *(_QWORD *)(a1 + 40));
}

void __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "cancel");

  }
}

id __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsDomain:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_index
{
  if (_index__pasOnceToken5 != -1)
    dispatch_once(&_index__pasOnceToken5, &__block_literal_global_12119);
  return (id)_index__pasExprOnceResult;
}

+ (id)_bundleIdentifierFromEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99D80];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", *MEMORY[0x1E0D19A28], &unk_1E7E0C0E0, *MEMORY[0x1E0D19A38], &unk_1E7E0C0F8, 0);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v9, "entityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)_isSupportedEntityTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E0C0E0, &unk_1E7E0C0F8, 0);
  objc_autoreleasePoolPop(v4);
  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v3);

  return (char)v4;
}

+ (BOOL)_isEligibleEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedHotel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFood");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedCarRental");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedTicket");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedMovie");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, v12, 0);

  objc_autoreleasePoolPop(v5);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "duplicateKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "entityType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_isSupportedEntityTypes:", v17))
  {
    objc_msgSend(v4, "tags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intersectsSet:", v13);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_attributeSetForEvent:(id)a3
{
  uint64_t v3;
  id i4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t isKindOfClass;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  uint64_t v82;
  __CFString *v83;
  void *v84;
  char v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  uint64_t v91;
  __CFString *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *i21;
  void *v97;
  char v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  char v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  char v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  void *v139;
  double v140;
  void *v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  char v148;
  void *v149;
  void *v150;
  double v151;
  void *v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  char v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  char v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  char v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *i22;
  void *v177;
  char v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  char v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  char v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  void *i23;
  void *v195;
  void *v196;
  char v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  char v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  char v208;
  void *v209;
  void *v210;
  double v211;
  void *v212;
  double v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  char v220;
  void *v221;
  void *v222;
  double v223;
  void *v224;
  double v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *i24;
  void *v232;
  char v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  char v238;
  uint64_t v239;
  void *v240;
  void *v241;
  void *v242;
  char v243;
  uint64_t v244;
  void *v245;
  void *v246;
  void *i25;
  void *v248;
  char v249;
  void *v250;
  void *v251;
  void *i26;
  void *v253;
  char v254;
  uint64_t v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  char v265;
  void *v266;
  void *v267;
  void *v268;
  void *i27;
  uint64_t v270;
  id v271;
  void *v272;
  id v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  void *i28;
  void *v281;
  char v282;
  void *v283;
  void *v284;
  void *i29;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *m;
  void *v299;
  void *v300;
  char v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  char v309;
  uint64_t v310;
  void *v311;
  void *v312;
  void *n;
  void *v314;
  char v315;
  uint64_t v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  char v321;
  uint64_t v322;
  void *v323;
  void *v324;
  void *v325;
  char v326;
  void *v327;
  void *jj;
  void *v329;
  char v330;
  void *v331;
  void *v332;
  void *v333;
  char v334;
  uint64_t v335;
  void *v336;
  void *ii;
  void *kk;
  void *v339;
  char v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  char v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  void *v349;
  char v350;
  char v351;
  void *v352;
  void *v353;
  int v354;
  void *v355;
  void *v356;
  char v357;
  void *v358;
  void *v359;
  void *v360;
  char v361;
  void *v362;
  char v363;
  void *v364;
  uint64_t v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  uint64_t v371;
  void *v372;
  void *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  id v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  double v392;
  void *v393;
  id result;
  void *v395;
  __CFString *v396;
  void *v397;
  void *v398;
  void *v399;
  void *mm;
  void *v401;
  void *v402;
  char v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  int v408;
  uint64_t v409;
  void *v410;
  uint64_t v411;
  void *v412;
  void *v413;
  void *v414;
  char v415;
  uint64_t v416;
  void *v417;
  uint64_t v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  char v423;
  uint64_t v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  char v429;
  uint64_t v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  char v435;
  uint64_t v436;
  void *v437;
  void *v438;
  void *v439;
  char v440;
  uint64_t v441;
  void *v442;
  void *v443;
  void *i1;
  void *v445;
  char v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  char v451;
  uint64_t v452;
  void *v453;
  void *v454;
  void *nn;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  unint64_t v461;
  const __CFString *v462;
  void *i2;
  void *v464;
  void *v465;
  void *v466;
  char v467;
  uint64_t v468;
  void *v469;
  void *i3;
  void *v471;
  char v472;
  uint64_t v473;
  void *v474;
  void *v475;
  char v476;
  uint64_t v477;
  void *v478;
  void *v479;
  void *v480;
  char v481;
  uint64_t v482;
  void *v483;
  void *v484;
  void *v485;
  char v486;
  uint64_t v487;
  void *v488;
  void *v489;
  void *v490;
  uint64_t v491;
  void *v492;
  void *v493;
  void *i5;
  char v495;
  void *v496;
  void *v497;
  void *i6;
  void *i7;
  void *v500;
  char v501;
  void *v502;
  uint64_t v503;
  void *v504;
  void *v505;
  void *i8;
  void *v507;
  char v508;
  void *v509;
  void *v510;
  void *v511;
  char v512;
  void *v513;
  void *v514;
  void *v515;
  char v516;
  void *v517;
  void *v518;
  void *i9;
  void *v520;
  void *v521;
  void *v522;
  char v523;
  uint64_t v524;
  void *v525;
  void *i10;
  void *v527;
  char v528;
  uint64_t v529;
  void *v530;
  void *v531;
  char v532;
  uint64_t v533;
  void *v534;
  void *v535;
  void *v536;
  char v537;
  uint64_t v538;
  void *v539;
  void *v540;
  void *v541;
  char v542;
  uint64_t v543;
  void *v544;
  void *v545;
  void *v546;
  uint64_t v547;
  void *v548;
  void *v549;
  void *i11;
  char v551;
  void *v552;
  void *v553;
  void *i12;
  void *i13;
  void *v556;
  char v557;
  void *v558;
  uint64_t v559;
  void *v560;
  void *v561;
  void *i14;
  void *v563;
  char v564;
  void *v565;
  void *v566;
  void *v567;
  char v568;
  void *v569;
  void *v570;
  void *v571;
  char v572;
  void *v573;
  void *v574;
  void *i15;
  char v576;
  void *v577;
  void *v578;
  void *v579;
  char v580;
  uint64_t v581;
  void *v582;
  void *v583;
  char v584;
  void *i16;
  void *v586;
  void *v587;
  void *v588;
  __CFString *v589;
  char v590;
  void *v591;
  void *v592;
  void *v593;
  uint64_t v594;
  char v595;
  uint64_t v596;
  void *v597;
  void *v598;
  void *v599;
  uint64_t v600;
  char v601;
  uint64_t v602;
  void *v603;
  void *v604;
  void *v605;
  void *i17;
  void *v607;
  char v608;
  void *v609;
  void *v610;
  void *v611;
  char v612;
  void *v613;
  void *v614;
  void *v615;
  char v616;
  void *v617;
  void *v618;
  void *v619;
  char v620;
  void *v621;
  void *v622;
  void *i18;
  uint64_t v624;
  char v625;
  uint64_t v626;
  void *v627;
  void *v628;
  void *v629;
  uint64_t v630;
  char v631;
  uint64_t v632;
  void *v633;
  void *v634;
  void *v635;
  void *i19;
  void *v637;
  char v638;
  void *v639;
  void *v640;
  void *v641;
  char v642;
  void *v643;
  void *v644;
  void *v645;
  char v646;
  void *v647;
  void *v648;
  void *v649;
  char v650;
  void *v651;
  void *v652;
  void *i20;
  uint64_t v654;
  void *v655;
  void *v656;
  void *v657;
  id v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  void *v674;
  void *v675;
  void *v676;
  void *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  void *v683;
  void *v684;
  void *v685;
  void *v686;
  void *v687;
  void *v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  void *v694;
  void *v695;
  void *v696;
  void *v697;
  void *v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  void *v705;
  void *v706;
  void *v707;
  void *v708;
  void *v709;
  void *v710;
  void *v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  id v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  id v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  _BYTE v734[128];
  _BYTE v735[128];
  void *v736;
  _BYTE v737[128];
  uint8_t v738[128];
  uint8_t buf[4];
  id v740;
  _BYTE v741[128];
  uint64_t v742;

  v742 = *MEMORY[0x1E0C80C00];
  v730 = 0u;
  v731 = 0u;
  v732 = 0u;
  v733 = 0u;
  v658 = a3;
  objc_msgSend(v658, "tags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v730, v741, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v731;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v731 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v730 + 1) + 8 * i);
        if (objc_msgSend(v12, "isSchemaOrg"))
        {
          v14 = (void *)MEMORY[0x1C3BD4F6C]();
          v15 = (void *)MEMORY[0x1E0CB36D8];
          objc_msgSend(v12, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dataUsingEncoding:", 4);
          v3 = objc_claimAutoreleasedReturnValue();
          v729 = 0;
          objc_msgSend(v15, "JSONObjectWithData:options:error:", v3, 0, &v729);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v729;

          if (v17)
          {
            sgLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v740 = v17;
              _os_log_fault_impl(&dword_1C3607000, v18, OS_LOG_TYPE_FAULT, "JSON decode error loading schemas: %@", buf, 0xCu);
            }

            if (_PASEvaluateLogFaultAndProbCrashCriteria())
              abort();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v13, "count"))
          {

            v13 = 0;
          }

          objc_autoreleasePoolPop(v14);
          goto LABEL_18;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v730, v741, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_18:

  v19 = v13;
  objc_msgSend(v19, "_pas_filteredArrayWithTest:", &__block_literal_global_53);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v20, "count"))
  {
    v25 = 0;
    v26 = v658;
    goto LABEL_479;
  }
  v655 = v20;
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setContentType:", CFSTR("com.apple.spotlight.events"));
  +[SGEnrichmentWritebackAdapter _bundleIdentifierFromEvent:](SGEnrichmentWritebackAdapter, "_bundleIdentifierFromEvent:", v658);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v654 = *MEMORY[0x1E0D19A28];
  if ((objc_msgSend(v23, "isEqualToString:") & 1) != 0)
  {
    v24 = CFSTR("com.apple.mobilemail");
  }
  else
  {
    if (!objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D19A38]))
      goto LABEL_25;
    v24 = CFSTR("com.apple.MobileSMS");
  }
  objc_msgSend(v22, "setEventSourceBundleIdentifier:", v24);
LABEL_25:
  v657 = v23;
  v659 = (void *)v21;
  v711 = v22;
  v674 = (void *)objc_opt_new();
  v673 = (void *)objc_opt_new();
  v725 = 0u;
  v726 = 0u;
  v727 = 0u;
  v728 = 0u;
  objc_msgSend(v658, "tags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v725, v738, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v726;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v726 != v30)
          objc_enumerationMutation(v27);
        v3 = *(_QWORD *)(*((_QWORD *)&v725 + 1) + 8 * j);
        if (objc_msgSend((id)v3, "isForwardedMailTag"))
        {
          objc_msgSend((id)v3, "isForwardedMail");
          i4 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setEventSourceIsForwarded:", i4);

        }
        if (objc_msgSend((id)v3, "isAuthorTag"))
        {
          objc_msgSend((id)v3, "value");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "dataUsingEncoding:", 4);
          v3 = objc_claimAutoreleasedReturnValue();

          v724 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v724);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          i4 = v724;
          if (v5)
          {
            objc_msgSend(v5, "valueForKey:", CFSTR("name"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v674, "addObject:", v33);

            objc_msgSend(v5, "valueForKey:", CFSTR("email"));
            v6 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v673, "addObject:", v6);

          }
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v725, v738, 16);
    }
    while (v29);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v674);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v711;
  objc_msgSend(v711, "setAuthorNames:", v34);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v673);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setAuthorEmailAddresses:", v35);

  objc_msgSend(v658, "when");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "startDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setStartDate:", v37);

  v656 = v36;
  objc_msgSend(v36, "endDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setEndDate:", v38);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v658, "isAllDay"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setEventIsAllDay:", v39);

  v722 = 0u;
  v723 = 0u;
  v720 = 0u;
  v721 = 0u;
  objc_msgSend(v658, "tags");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v720, v737, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v721;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v721 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v720 + 1) + 8 * k);
        if (objc_msgSend(v45, "isEventSourceMetadata"))
        {
          objc_msgSend(v45, "value");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setEventSourceMetadata:", v46);

        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v720, v737, 16);
    }
    while (v42);
  }

  objc_msgSend(v658, "tags");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "containsObject:", v48);

  if (!v49)
  {
    objc_msgSend(v658, "tags");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedHotel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "containsObject:", v55);

    if (v56)
    {
      objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E50]);
      v57 = v659;
      objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v711, "setHotelReservationId:", 0);
          goto LABEL_352;
        }
        v57 = v659;
      }
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "description");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v711, "setHotelReservationId:", v61);

      if ((isKindOfClass & 1) != 0)
      {
LABEL_353:

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        v294 = (void *)0x1E0C99000;
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("name"));
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v6 = objc_opt_isKindOfClass();
          if ((v6 & 1) == 0)
          {
            objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("name"));
            isKindOfClass = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v711, "setHotelUnderName:", 0);
LABEL_360:

              goto LABEL_361;
            }
          }
          objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("name"));
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v296, "description");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setHotelUnderName:", v297);

          if ((v6 & 1) == 0)
            goto LABEL_360;
LABEL_361:

          v293 = 0;
        }

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
        for (m = (void *)objc_claimAutoreleasedReturnValue(); ; m = 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v711, "setHotelUnderName:", m);

        }
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v299 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_366:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("name"));
          v300 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v301 = objc_opt_isKindOfClass();
          v694 = v299;
          if ((v301 & 1) != 0)
            goto LABEL_370;
          objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("name"));
          v302 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v692 = (void *)v302;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v299 = v694;
LABEL_370:
            objc_msgSend(v299, "objectForKeyedSubscript:", CFSTR("name"));
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v303, "description");
            v304 = objc_claimAutoreleasedReturnValue();
            v305 = v25;
            v306 = (void *)v304;
            objc_msgSend(v305, "setHotelReservationForName:", v304);

            if ((v301 & 1) != 0)
            {
LABEL_374:

              v307 = v694;
              isKindOfClass = (uint64_t)CFSTR("telephone");
              objc_msgSend(v694, "objectForKeyedSubscript:", CFSTR("telephone"));
              v308 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v309 = objc_opt_isKindOfClass();
              if ((v309 & 1) != 0)
                goto LABEL_377;
              objc_msgSend(v694, "objectForKeyedSubscript:", CFSTR("telephone"));
              v310 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v689 = (void *)v310;
              v25 = v711;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v307 = v694;
LABEL_377:
                objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("telephone"));
                v311 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v311, "description");
                v312 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v711, "setHotelReservationForTelephone:", v312);

                v25 = v711;
                if ((v309 & 1) != 0)
                {
LABEL_381:

                  objc_msgSend(v694, "objectForKeyedSubscript:", CFSTR("address"));
                  for (n = (void *)objc_claimAutoreleasedReturnValue(); ; n = 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      objc_msgSend(v694, "objectForKeyedSubscript:", CFSTR("address"));
                      for (ii = (void *)objc_claimAutoreleasedReturnValue(); ; ii = 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          break;
                        objc_msgSend(v25, "setHotelReservationForAddress:", ii);

                      }
                      v299 = 0;
                      goto LABEL_366;
                    }
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                    v314 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v315 = objc_opt_isKindOfClass();
                    if ((v315 & 1) != 0
                      || (objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                          v316 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v705 = (void *)v316,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                      v317 = v25;
                      v318 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v318, "description");
                      v319 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v317, "setHotelReservationForStreetAddress:", v319);

                      if ((v315 & 1) != 0)
                        goto LABEL_389;
                    }
                    else
                    {
                      objc_msgSend(v25, "setHotelReservationForStreetAddress:", 0);
                    }

LABEL_389:
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                    v320 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v321 = objc_opt_isKindOfClass();
                    if ((v321 & 1) != 0
                      || (objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                          v322 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v700 = (void *)v322,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                      v323 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v323, "description");
                      v324 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v711, "setHotelReservationForAddressLocality:", v324);

                      if ((v321 & 1) != 0)
                        goto LABEL_395;
                    }
                    else
                    {
                      objc_msgSend(v711, "setHotelReservationForAddressLocality:", 0);
                    }

LABEL_395:
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                    v325 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v326 = objc_opt_isKindOfClass();
                    if ((v326 & 1) != 0
                      || (objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                          isKindOfClass = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v699 = (void *)isKindOfClass,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                      isKindOfClass = objc_claimAutoreleasedReturnValue();
                      objc_msgSend((id)isKindOfClass, "description");
                      v327 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v711, "setHotelReservationForAddressRegion:", v327);

                      if ((v326 & 1) != 0)
                        goto LABEL_401;
                    }
                    else
                    {
                      objc_msgSend(v711, "setHotelReservationForAddressRegion:", 0);
                    }

LABEL_401:
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                    for (jj = (void *)objc_claimAutoreleasedReturnValue(); ; jj = 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        break;
                      objc_msgSend(jj, "objectForKeyedSubscript:", CFSTR("name"));
                      v329 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v330 = objc_opt_isKindOfClass();
                      if ((v330 & 1) == 0)
                      {
                        objc_msgSend(jj, "objectForKeyedSubscript:", CFSTR("name"));
                        v6 = objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_msgSend(v711, "setHotelReservationForAddressCountry:", 0);
LABEL_408:

                          goto LABEL_409;
                        }
                      }
                      objc_msgSend(jj, "objectForKeyedSubscript:", CFSTR("name"));
                      isKindOfClass = objc_claimAutoreleasedReturnValue();
                      objc_msgSend((id)isKindOfClass, "description");
                      v331 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v711, "setHotelReservationForAddressCountry:", v331);

                      if ((v330 & 1) == 0)
                        goto LABEL_408;
LABEL_409:

                    }
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                    v332 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v711;
                    while (1)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        break;
                      objc_msgSend(v711, "setHotelReservationForAddressCountry:", v332);

                      v332 = 0;
                    }

                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("postalCode"));
                    v333 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v334 = objc_opt_isKindOfClass();
                    if ((v334 & 1) == 0)
                    {
                      objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("postalCode"));
                      v335 = objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v698 = (void *)v335;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_msgSend(v711, "setHotelReservationForAddressPostalCode:", 0);
LABEL_418:

                        goto LABEL_419;
                      }
                    }
                    objc_msgSend(n, "objectForKeyedSubscript:", CFSTR("postalCode"));
                    v336 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v336, "description");
                    isKindOfClass = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v711, "setHotelReservationForAddressPostalCode:", isKindOfClass);

                    if ((v334 & 1) == 0)
                      goto LABEL_418;
LABEL_419:

                  }
                }
              }
              else
              {
                objc_msgSend(v711, "setHotelReservationForTelephone:", 0);
              }

              goto LABEL_381;
            }
          }
          else
          {
            objc_msgSend(v25, "setHotelReservationForName:", 0);
          }

          goto LABEL_374;
        }

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("provider"));
        for (kk = (void *)objc_claimAutoreleasedReturnValue(); ; kk = 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v343 = v659;
            objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("modifyReservationUrl"));
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v345 = objc_opt_isKindOfClass();
            if ((v345 & 1) != 0)
              goto LABEL_436;
            objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("modifyReservationUrl"));
            v346 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v705 = (void *)v346;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v343 = v659;
LABEL_436:
              objc_msgSend(v343, "objectForKeyedSubscript:", CFSTR("modifyReservationUrl"));
              v343 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v343, "description");
              v347 = objc_claimAutoreleasedReturnValue();
              if (v347)
              {
                v348 = (void *)v347;
                objc_msgSend(v25, "setHotelModifyReservationUrl:", v347);

                v26 = v658;
                v349 = v705;
                if ((v345 & 1) != 0)
                  goto LABEL_458;
                goto LABEL_457;
              }
              v350 = v345 ^ 1;
              v351 = 1;
            }
            else
            {
              v351 = 0;
              v350 = 1;
            }
            v359 = v659;
            objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("url"));
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v361 = objc_opt_isKindOfClass();
            v26 = v658;
            if ((v361 & 1) != 0)
            {
LABEL_450:
              objc_msgSend(v359, "objectForKeyedSubscript:", CFSTR("url"));
              v362 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v362, "description");
              v363 = v350;
              v364 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setHotelModifyReservationUrl:", v364);

              v350 = v363;
              if ((v361 & 1) == 0)
                goto LABEL_453;
            }
            else
            {
              objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("url"));
              v294 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v359 = v659;
                goto LABEL_450;
              }
              objc_msgSend(v711, "setHotelModifyReservationUrl:", 0);
LABEL_453:

            }
            v349 = v705;
            if ((v351 & 1) != 0)

            v25 = v711;
            if ((v350 & 1) == 0)
              goto LABEL_458;
LABEL_457:

LABEL_458:
            objc_msgSend(v656, "startTimeZone");
            v706 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v706, "name");
            v286 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setHotelTimeZone:", v286);
            goto LABEL_459;
          }
          objc_msgSend(kk, "objectForKeyedSubscript:", CFSTR("name"));
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v340 = objc_opt_isKindOfClass();
          if ((v340 & 1) == 0)
          {
            objc_msgSend(kk, "objectForKeyedSubscript:", CFSTR("name"));
            isKindOfClass = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
          }
          objc_msgSend(kk, "objectForKeyedSubscript:", CFSTR("name"));
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v341, "description");
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setHotelProvider:", v342);

          if ((v340 & 1) == 0)
            goto LABEL_431;
LABEL_432:

        }
        objc_msgSend(v25, "setHotelProvider:", 0);
LABEL_431:

        goto LABEL_432;
      }
LABEL_352:

      goto LABEL_353;
    }
    objc_msgSend(v658, "tags");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedFood");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "containsObject:", v63);

    if (v64)
    {
      objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E60]);
      v65 = v659;
      objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v67 = objc_opt_isKindOfClass();
      if ((v67 & 1) == 0)
      {
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v711, "setRestaurantReservationId:", 0);
LABEL_481:

LABEL_482:
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
          v395 = (void *)objc_claimAutoreleasedReturnValue();
          v396 = CFSTR("name");
          while (1)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(v395, "objectForKeyedSubscript:", CFSTR("name"));
            v397 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v6 = objc_opt_isKindOfClass();
            if ((v6 & 1) == 0)
            {
              objc_msgSend(v395, "objectForKeyedSubscript:", CFSTR("name"));
              v67 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v711, "setRestaurantUnderName:", 0);
LABEL_489:

                goto LABEL_490;
              }
            }
            objc_msgSend(v395, "objectForKeyedSubscript:", CFSTR("name"));
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398, "description");
            v399 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setRestaurantUnderName:", v399);

            if ((v6 & 1) == 0)
              goto LABEL_489;
LABEL_490:

            v395 = 0;
          }

          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
          for (mm = (void *)objc_claimAutoreleasedReturnValue(); ; mm = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(v711, "setRestaurantUnderName:", mm);

          }
          v401 = v659;
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("partySize"));
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v403 = objc_opt_isKindOfClass();
          if ((v403 & 1) != 0)
          {
LABEL_497:
            objc_msgSend(v401, "objectForKeyedSubscript:", CFSTR("partySize"));
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v404, "description");
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setRestaurantPartySize:", v405);

            if ((v403 & 1) == 0)
              goto LABEL_506;
          }
          else
          {
            objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("partySize"));
            v396 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v401 = v659;
              goto LABEL_497;
            }
            objc_msgSend(v711, "setRestaurantPartySize:", 0);
LABEL_506:

          }
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          while (2)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              objc_msgSend(v656, "startTimeZone");
              v456 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v456, "name");
              v457 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setRestaurantTimeZone:", v457);

              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v458 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v656, "startTimeZone");
              v459 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v458, "setTimeZone:", v459);

              objc_msgSend(v656, "startDate");
              v460 = (void *)objc_claimAutoreleasedReturnValue();
              v706 = v458;
              objc_msgSend(v458, "components:fromDate:", 32, v460);
              v286 = (void *)objc_claimAutoreleasedReturnValue();

              v461 = objc_msgSend(v286, "hour") - 6;
              if (v461 >= 0x12)
                v462 = &stru_1E7DB83A8;
              else
                v462 = off_1E7DAC478[v461];
              v26 = v658;
              v365 = v654;
              objc_msgSend(v25, "setRestaurantMealType:", v462);
              goto LABEL_460;
            }
            objc_msgSend(v413, "objectForKeyedSubscript:", CFSTR("name"));
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v415 = objc_opt_isKindOfClass();
            v695 = v413;
            if ((v415 & 1) != 0)
            {
LABEL_512:
              objc_msgSend(v413, "objectForKeyedSubscript:", CFSTR("name"));
              v417 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v417, "description");
              v418 = objc_claimAutoreleasedReturnValue();
              v419 = v25;
              v420 = (void *)v418;
              objc_msgSend(v419, "setRestaurantReservationForName:", v418);

              if ((v415 & 1) == 0)
                goto LABEL_515;
            }
            else
            {
              objc_msgSend(v413, "objectForKeyedSubscript:", CFSTR("name"));
              v416 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v692 = (void *)v416;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v413 = v695;
                goto LABEL_512;
              }
              objc_msgSend(v25, "setRestaurantReservationForName:", 0);
LABEL_515:

            }
            v421 = v695;
            objc_msgSend(v695, "objectForKeyedSubscript:", CFSTR("telephone"));
            v422 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v423 = objc_opt_isKindOfClass();
            if ((v423 & 1) != 0)
            {
LABEL_519:
              objc_msgSend(v421, "objectForKeyedSubscript:", CFSTR("telephone"));
              v425 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v425, "description");
              v426 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setRestaurantReservationForTelephone:", v426);

              v25 = v711;
              if ((v423 & 1) == 0)
                goto LABEL_522;
            }
            else
            {
              objc_msgSend(v695, "objectForKeyedSubscript:", CFSTR("telephone"));
              v424 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v689 = (void *)v424;
              v25 = v711;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v421 = v695;
                goto LABEL_519;
              }
              objc_msgSend(v711, "setRestaurantReservationForTelephone:", 0);
LABEL_522:

            }
            objc_msgSend(v695, "objectForKeyedSubscript:", CFSTR("address"));
            v427 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_524:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              objc_msgSend(v695, "objectForKeyedSubscript:", CFSTR("address"));
              for (nn = (void *)objc_claimAutoreleasedReturnValue(); ; nn = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(v25, "setRestaurantReservationForAddress:", nn);

              }
              v413 = 0;
              continue;
            }
            break;
          }
          objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("streetAddress"));
          v428 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v429 = objc_opt_isKindOfClass();
          if ((v429 & 1) != 0
            || (objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                v430 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v705 = (void *)v430,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("streetAddress"));
            v431 = v25;
            v432 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v432, "description");
            v433 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v431, "setRestaurantReservationForStreetAddress:", v433);

            if ((v429 & 1) != 0)
              goto LABEL_531;
          }
          else
          {
            objc_msgSend(v25, "setRestaurantReservationForStreetAddress:", 0);
          }

LABEL_531:
          objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressLocality"));
          v434 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v435 = objc_opt_isKindOfClass();
          if ((v435 & 1) != 0
            || (objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                v436 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v700 = (void *)v436,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressLocality"));
            v437 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v437, "description");
            v438 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setRestaurantReservationForAddressLocality:", v438);

            if ((v435 & 1) != 0)
              goto LABEL_537;
          }
          else
          {
            objc_msgSend(v711, "setRestaurantReservationForAddressLocality:", 0);
          }

LABEL_537:
          objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressRegion"));
          v439 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v440 = objc_opt_isKindOfClass();
          if ((v440 & 1) != 0
            || (objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                v441 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v699 = (void *)v441,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressRegion"));
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v442, "description");
            v443 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setRestaurantReservationForAddressRegion:", v443);

            if ((v440 & 1) != 0)
            {
LABEL_543:

              objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressCountry"));
              for (i1 = (void *)objc_claimAutoreleasedReturnValue(); ; i1 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                  v449 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v711;
                  while (1)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      break;
                    objc_msgSend(v711, "setRestaurantReservationForAddressCountry:", v449);

                    v449 = 0;
                  }

                  objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("postalCode"));
                  v450 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v451 = objc_opt_isKindOfClass();
                  if ((v451 & 1) == 0)
                  {
                    objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("postalCode"));
                    v452 = objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v698 = (void *)v452;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend(v711, "setRestaurantReservationForAddressPostalCode:", 0);
LABEL_560:

                      goto LABEL_561;
                    }
                  }
                  objc_msgSend(v427, "objectForKeyedSubscript:", CFSTR("postalCode"));
                  v453 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v453, "description");
                  v454 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setRestaurantReservationForAddressPostalCode:", v454);

                  if ((v451 & 1) == 0)
                    goto LABEL_560;
LABEL_561:

                  v427 = 0;
                  goto LABEL_524;
                }
                objc_msgSend(i1, "objectForKeyedSubscript:", CFSTR("name"));
                v445 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v446 = objc_opt_isKindOfClass();
                if ((v446 & 1) == 0)
                {
                  objc_msgSend(i1, "objectForKeyedSubscript:", CFSTR("name"));
                  v6 = objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    break;
                }
                objc_msgSend(i1, "objectForKeyedSubscript:", CFSTR("name"));
                v447 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v447, "description");
                v448 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v711, "setRestaurantReservationForAddressCountry:", v448);

                if ((v446 & 1) == 0)
                  goto LABEL_550;
LABEL_551:

              }
              objc_msgSend(v711, "setRestaurantReservationForAddressCountry:", 0);
LABEL_550:

              goto LABEL_551;
            }
          }
          else
          {
            objc_msgSend(v711, "setRestaurantReservationForAddressRegion:", 0);
          }

          goto LABEL_543;
        }
        v65 = v659;
      }
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "description");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v711, "setRestaurantReservationId:", v69);

      if ((v67 & 1) != 0)
        goto LABEL_482;
      goto LABEL_481;
    }
    objc_msgSend(v658, "tags");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedTicket");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "containsObject:", v75);

    if (v76)
    {
      objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E68]);
      v77 = v659;
      objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v79 = objc_opt_isKindOfClass();
      if ((v79 & 1) == 0)
      {
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v711, "setTicketReservationId:", 0);
LABEL_571:

LABEL_572:
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
          for (i2 = (void *)objc_claimAutoreleasedReturnValue(); ; i2 = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(i2, "objectForKeyedSubscript:", CFSTR("name"));
            v464 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v3 = objc_opt_isKindOfClass();
            if ((v3 & 1) == 0)
            {
              objc_msgSend(i2, "objectForKeyedSubscript:", CFSTR("name"));
              v6 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v711, "setTicketUnderName:", 0);
LABEL_579:

                goto LABEL_580;
              }
            }
            objc_msgSend(i2, "objectForKeyedSubscript:", CFSTR("name"));
            i4 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(i4, "description");
            v465 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setTicketUnderName:", v465);

            if ((v3 & 1) == 0)
              goto LABEL_579;
LABEL_580:

          }
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v466 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_582:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("name"));
            i4 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v467 = objc_opt_isKindOfClass();
            v690 = v466;
            if ((v467 & 1) != 0
              || (objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("name")),
                  v468 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v688 = (void *)v468,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("name"));
              v469 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v469, "description");
              v6 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setTicketReservationForName:", v6);

              v466 = v690;
              if ((v467 & 1) != 0)
                goto LABEL_589;
            }
            else
            {
              objc_msgSend(v25, "setTicketReservationForName:", 0);
            }

LABEL_589:
            objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("location"));
            for (i3 = (void *)objc_claimAutoreleasedReturnValue(); ; i3 = 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                v466 = 0;
                goto LABEL_582;
              }
              objc_msgSend(i3, "objectForKeyedSubscript:", CFSTR("name"));
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v472 = objc_opt_isKindOfClass();
              v696 = i3;
              if ((v472 & 1) != 0
                || (objc_msgSend(i3, "objectForKeyedSubscript:", CFSTR("name")),
                    v473 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    v692 = (void *)v473,
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_msgSend(i3, "objectForKeyedSubscript:", CFSTR("name"));
                v474 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v474, "description");
                v6 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setTicketReservationForLocationName:", v6);

                if ((v472 & 1) != 0)
                  goto LABEL_597;
              }
              else
              {
                objc_msgSend(v25, "setTicketReservationForLocationName:", 0);
              }

LABEL_597:
              objc_msgSend(i3, "objectForKeyedSubscript:", CFSTR("address"));
              for (i4 = (id)objc_claimAutoreleasedReturnValue(); ; i4 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                v475 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v476 = objc_opt_isKindOfClass();
                if ((v476 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                      v477 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v705 = (void *)v477,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                  v478 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v478, "description");
                  v479 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setTicketReservationForLocationAddressStreetAddress:", v479);

                  if ((v476 & 1) != 0)
                    goto LABEL_605;
                }
                else
                {
                  objc_msgSend(v25, "setTicketReservationForLocationAddressStreetAddress:", 0);
                }

LABEL_605:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                v480 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v481 = objc_opt_isKindOfClass();
                if ((v481 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                      v482 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v700 = (void *)v482,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                  v483 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v483, "description");
                  v484 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setTicketReservationForLocationAddressLocality:", v484);

                  if ((v481 & 1) != 0)
                    goto LABEL_611;
                }
                else
                {
                  objc_msgSend(v25, "setTicketReservationForLocationAddressLocality:", 0);
                }

LABEL_611:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                v485 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v486 = objc_opt_isKindOfClass();
                if ((v486 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                      v487 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v699 = (void *)v487,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                  v488 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "description");
                  v489 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setTicketReservationForLocationAddressRegion:", v489);

                  if ((v486 & 1) != 0)
                    goto LABEL_617;
                }
                else
                {
                  objc_msgSend(v25, "setTicketReservationForLocationAddressRegion:", 0);
                }

LABEL_617:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode"));
                v490 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v6 = objc_opt_isKindOfClass();
                if ((v6 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode")),
                      v491 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v698 = (void *)v491,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode"));
                  v492 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v492, "description");
                  v493 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setTicketReservationForLocationAddressPostalCode:", v493);

                  if ((v6 & 1) != 0)
                    goto LABEL_623;
                }
                else
                {
                  objc_msgSend(v25, "setTicketReservationForLocationAddressPostalCode:", 0);
                }

LABEL_623:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                for (i5 = (void *)objc_claimAutoreleasedReturnValue(); ; i5 = 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    break;
                  objc_msgSend(i5, "objectForKeyedSubscript:", CFSTR("name"));
                  v6 = objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v495 = objc_opt_isKindOfClass();
                  if ((v495 & 1) == 0)
                  {
                    objc_msgSend(i5, "objectForKeyedSubscript:", CFSTR("name"));
                    v3 = objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend(v25, "setTicketReservationForLocationAddressCountry:", 0);
LABEL_630:

                      goto LABEL_631;
                    }
                  }
                  objc_msgSend(i5, "objectForKeyedSubscript:", CFSTR("name"));
                  v496 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v496, "description");
                  v497 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setTicketReservationForLocationAddressCountry:", v497);

                  v25 = v711;
                  if ((v495 & 1) == 0)
                    goto LABEL_630;
LABEL_631:

                }
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                for (i6 = (void *)objc_claimAutoreleasedReturnValue(); ; i6 = 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    break;
                  objc_msgSend(v25, "setTicketReservationForLocationAddressCountry:", i6);

                }
              }

              objc_msgSend(v696, "objectForKeyedSubscript:", CFSTR("address"));
              for (i7 = (void *)objc_claimAutoreleasedReturnValue(); ; i7 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(v25, "setTicketReservationForLocationAddress:", i7);

              }
              v466 = v690;
            }
          }

          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
          v366 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_642:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_908;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
          v500 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v501 = objc_opt_isKindOfClass();
          v707 = v366;
          if ((v501 & 1) == 0)
          {
            v502 = v500;
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
            v503 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v700 = (void *)v503;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v711, "setTicketReservedTicketNumber:", 0);
              v500 = v502;
LABEL_649:

LABEL_650:
              objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
              for (i8 = (void *)objc_claimAutoreleasedReturnValue(); ; i8 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v366 = 0;
                  goto LABEL_642;
                }
                objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatRow"));
                v507 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v508 = objc_opt_isKindOfClass();
                if ((v508 & 1) != 0
                  || (objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatRow")),
                      v6 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatRow"));
                  v509 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v509, "description");
                  v510 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setTicketReservedTicketSeatRow:", v510);

                  if ((v508 & 1) != 0)
                    goto LABEL_658;
                }
                else
                {
                  objc_msgSend(v711, "setTicketReservedTicketSeatRow:", 0);
                }

LABEL_658:
                objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatNumber"));
                v511 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v512 = objc_opt_isKindOfClass();
                if ((v512 & 1) != 0
                  || (objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatNumber")),
                      v25 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatNumber"));
                  v513 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v513, "description");
                  v514 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setTicketReservedTicketSeatNumber:", v514);

                  if ((v512 & 1) != 0)
                    goto LABEL_664;
                }
                else
                {
                  objc_msgSend(v711, "setTicketReservedTicketSeatNumber:", 0);
                }

LABEL_664:
                objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatSection"));
                v515 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v516 = objc_opt_isKindOfClass();
                if ((v516 & 1) == 0)
                {
                  objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatSection"));
                  i4 = (id)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(v711, "setTicketReservedTicketSeatSection:", 0);
LABEL_669:

                    goto LABEL_670;
                  }
                }
                objc_msgSend(i8, "objectForKeyedSubscript:", CFSTR("seatSection"));
                v517 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v517, "description");
                v518 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v711, "setTicketReservedTicketSeatSection:", v518);

                if ((v516 & 1) == 0)
                  goto LABEL_669;
LABEL_670:

              }
            }
            v500 = v502;
          }
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
          v504 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v504, "description");
          v505 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setTicketReservedTicketNumber:", v505);

          v366 = v707;
          if ((v501 & 1) != 0)
            goto LABEL_650;
          goto LABEL_649;
        }
        v77 = v659;
      }
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "description");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v711, "setTicketReservationId:", v3);

      if ((v79 & 1) != 0)
        goto LABEL_572;
      goto LABEL_571;
    }
    objc_msgSend(v658, "tags");
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedMovie");
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    v354 = objc_msgSend(v352, "containsObject:", v353);

    if (v354)
    {
      objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E58]);
      v355 = v659;
      objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v357 = objc_opt_isKindOfClass();
      if ((v357 & 1) == 0)
      {
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
        v353 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v711, "setMovieReservationId:", 0);
LABEL_673:

LABEL_674:
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
          for (i9 = (void *)objc_claimAutoreleasedReturnValue(); ; i9 = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(i9, "objectForKeyedSubscript:", CFSTR("name"));
            v520 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v3 = objc_opt_isKindOfClass();
            if ((v3 & 1) == 0)
            {
              objc_msgSend(i9, "objectForKeyedSubscript:", CFSTR("name"));
              v6 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v711, "setMovieUnderName:", 0);
LABEL_681:

                goto LABEL_682;
              }
            }
            objc_msgSend(i9, "objectForKeyedSubscript:", CFSTR("name"));
            i4 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(i4, "description");
            v521 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setMovieUnderName:", v521);

            if ((v3 & 1) == 0)
              goto LABEL_681;
LABEL_682:

          }
          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v522 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_684:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v522, "objectForKeyedSubscript:", CFSTR("name"));
            i4 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v523 = objc_opt_isKindOfClass();
            v691 = v522;
            if ((v523 & 1) != 0
              || (objc_msgSend(v522, "objectForKeyedSubscript:", CFSTR("name")),
                  v524 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v688 = (void *)v524,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v522, "objectForKeyedSubscript:", CFSTR("name"));
              v525 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v525, "description");
              v6 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setMovieReservationForName:", v6);

              v522 = v691;
              if ((v523 & 1) != 0)
                goto LABEL_691;
            }
            else
            {
              objc_msgSend(v25, "setMovieReservationForName:", 0);
            }

LABEL_691:
            objc_msgSend(v522, "objectForKeyedSubscript:", CFSTR("location"));
            for (i10 = (void *)objc_claimAutoreleasedReturnValue(); ; i10 = 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                v522 = 0;
                goto LABEL_684;
              }
              objc_msgSend(i10, "objectForKeyedSubscript:", CFSTR("name"));
              v527 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v528 = objc_opt_isKindOfClass();
              v697 = i10;
              if ((v528 & 1) != 0
                || (objc_msgSend(i10, "objectForKeyedSubscript:", CFSTR("name")),
                    v529 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    v692 = (void *)v529,
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_msgSend(i10, "objectForKeyedSubscript:", CFSTR("name"));
                v530 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v530, "description");
                v6 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setMovieReservationForLocationName:", v6);

                if ((v528 & 1) != 0)
                  goto LABEL_699;
              }
              else
              {
                objc_msgSend(v25, "setMovieReservationForLocationName:", 0);
              }

LABEL_699:
              objc_msgSend(i10, "objectForKeyedSubscript:", CFSTR("address"));
              for (i4 = (id)objc_claimAutoreleasedReturnValue(); ; i4 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                v531 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v532 = objc_opt_isKindOfClass();
                if ((v532 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                      v533 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v705 = (void *)v533,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                  v534 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v534, "description");
                  v535 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setMovieReservationForLocationAddressStreetAddress:", v535);

                  if ((v532 & 1) != 0)
                    goto LABEL_707;
                }
                else
                {
                  objc_msgSend(v25, "setMovieReservationForLocationAddressStreetAddress:", 0);
                }

LABEL_707:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                v536 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v537 = objc_opt_isKindOfClass();
                if ((v537 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                      v538 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v700 = (void *)v538,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                  v539 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v539, "description");
                  v540 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setMovieReservationForLocationAddressLocality:", v540);

                  if ((v537 & 1) != 0)
                    goto LABEL_713;
                }
                else
                {
                  objc_msgSend(v25, "setMovieReservationForLocationAddressLocality:", 0);
                }

LABEL_713:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                v541 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v542 = objc_opt_isKindOfClass();
                if ((v542 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                      v543 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v699 = (void *)v543,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                  v544 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v544, "description");
                  v545 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setMovieReservationForLocationAddressRegion:", v545);

                  if ((v542 & 1) != 0)
                    goto LABEL_719;
                }
                else
                {
                  objc_msgSend(v25, "setMovieReservationForLocationAddressRegion:", 0);
                }

LABEL_719:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode"));
                v546 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v6 = objc_opt_isKindOfClass();
                if ((v6 & 1) != 0
                  || (objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode")),
                      v547 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v698 = (void *)v547,
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("postalCode"));
                  v548 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v548, "description");
                  v549 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setMovieReservationForLocationAddressPostalCode:", v549);

                  if ((v6 & 1) != 0)
                    goto LABEL_725;
                }
                else
                {
                  objc_msgSend(v25, "setMovieReservationForLocationAddressPostalCode:", 0);
                }

LABEL_725:
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                for (i11 = (void *)objc_claimAutoreleasedReturnValue(); ; i11 = 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    break;
                  objc_msgSend(i11, "objectForKeyedSubscript:", CFSTR("name"));
                  v6 = objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v551 = objc_opt_isKindOfClass();
                  if ((v551 & 1) == 0)
                  {
                    objc_msgSend(i11, "objectForKeyedSubscript:", CFSTR("name"));
                    v3 = objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_msgSend(v25, "setMovieReservationForLocationAddressCountry:", 0);
LABEL_732:

                      goto LABEL_733;
                    }
                  }
                  objc_msgSend(i11, "objectForKeyedSubscript:", CFSTR("name"));
                  v552 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v552, "description");
                  v553 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setMovieReservationForLocationAddressCountry:", v553);

                  v25 = v711;
                  if ((v551 & 1) == 0)
                    goto LABEL_732;
LABEL_733:

                }
                objc_msgSend(i4, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                for (i12 = (void *)objc_claimAutoreleasedReturnValue(); ; i12 = 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    break;
                  objc_msgSend(v25, "setMovieReservationForLocationAddressCountry:", i12);

                }
              }

              objc_msgSend(v697, "objectForKeyedSubscript:", CFSTR("address"));
              for (i13 = (void *)objc_claimAutoreleasedReturnValue(); ; i13 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(v25, "setMovieReservationForLocationAddress:", i13);

              }
              v522 = v691;
            }
          }

          objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
          v366 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_744:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_908;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
          v556 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v557 = objc_opt_isKindOfClass();
          v708 = v366;
          if ((v557 & 1) == 0)
          {
            v558 = v556;
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
            v559 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v700 = (void *)v559;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v711, "setMovieReservedTicketNumber:", 0);
              v556 = v558;
LABEL_751:

LABEL_752:
              objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
              for (i14 = (void *)objc_claimAutoreleasedReturnValue(); ; i14 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v366 = 0;
                  goto LABEL_744;
                }
                objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatRow"));
                v563 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v564 = objc_opt_isKindOfClass();
                if ((v564 & 1) != 0
                  || (objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatRow")),
                      v6 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatRow"));
                  v565 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v565, "description");
                  v566 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setMovieReservedTicketSeatRow:", v566);

                  if ((v564 & 1) != 0)
                    goto LABEL_760;
                }
                else
                {
                  objc_msgSend(v711, "setMovieReservedTicketSeatRow:", 0);
                }

LABEL_760:
                objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatNumber"));
                v567 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v568 = objc_opt_isKindOfClass();
                if ((v568 & 1) != 0
                  || (objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatNumber")),
                      v25 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatNumber"));
                  v569 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v569, "description");
                  v570 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setMovieReservedTicketSeatNumber:", v570);

                  if ((v568 & 1) != 0)
                    goto LABEL_766;
                }
                else
                {
                  objc_msgSend(v711, "setMovieReservedTicketSeatNumber:", 0);
                }

LABEL_766:
                objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatSection"));
                v571 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v572 = objc_opt_isKindOfClass();
                if ((v572 & 1) == 0)
                {
                  objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatSection"));
                  i4 = (id)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(v711, "setMovieReservedTicketSeatSection:", 0);
LABEL_771:

                    goto LABEL_772;
                  }
                }
                objc_msgSend(i14, "objectForKeyedSubscript:", CFSTR("seatSection"));
                v573 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v573, "description");
                v574 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v711, "setMovieReservedTicketSeatSection:", v574);

                if ((v572 & 1) == 0)
                  goto LABEL_771;
LABEL_772:

              }
            }
            v556 = v558;
          }
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("ticketNumber"));
          v560 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v560, "description");
          v561 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setMovieReservedTicketNumber:", v561);

          v366 = v708;
          if ((v557 & 1) != 0)
            goto LABEL_752;
          goto LABEL_751;
        }
        v355 = v659;
      }
      objc_msgSend(v355, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v358, "description");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v711, "setMovieReservationId:", v3);

      if ((v357 & 1) != 0)
        goto LABEL_674;
      goto LABEL_673;
    }
    objc_msgSend(v658, "tags");
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedCarRental");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    v408 = objc_msgSend(v406, "containsObject:", v407);

    if (!v408)
    {
      __break(1u);
      return result;
    }
    objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E40]);
    v409 = (uint64_t)v659;
    objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v411 = objc_opt_isKindOfClass();
    if ((v411 & 1) == 0)
    {
      objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v711, "setCarReservationId:", 0);
LABEL_775:

LABEL_776:
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("underName"));
        for (i15 = (void *)objc_claimAutoreleasedReturnValue(); ; i15 = 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(i15, "objectForKeyedSubscript:", CFSTR("name"));
          v409 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v576 = objc_opt_isKindOfClass();
          if ((v576 & 1) == 0)
          {
            objc_msgSend(i15, "objectForKeyedSubscript:", CFSTR("name"));
            v411 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v711, "setCarUnderName:", 0);
LABEL_783:

              goto LABEL_784;
            }
          }
          objc_msgSend(i15, "objectForKeyedSubscript:", CFSTR("name"));
          v577 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v577, "description");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setCarUnderName:", v5);

          if ((v576 & 1) == 0)
            goto LABEL_783;
LABEL_784:

        }
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v578 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_786:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("name"));
          v579 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v580 = objc_opt_isKindOfClass();
          if ((v580 & 1) != 0
            || (objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("name")),
                v581 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v705 = (void *)v581,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("name"));
            v409 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v409, "description");
            v582 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarReservationForName:", v582);

            if ((v580 & 1) != 0)
              goto LABEL_793;
          }
          else
          {
            objc_msgSend(v711, "setCarReservationForName:", 0);
          }

LABEL_793:
          objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("model"));
          v583 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v584 = objc_opt_isKindOfClass();
          if ((v584 & 1) != 0
            || (objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("model")),
                v411 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v700 = (void *)v411,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("model"));
            v411 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v411, "description");
            v409 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarReservationForModel:", v409);

            if ((v584 & 1) != 0)
              goto LABEL_799;
          }
          else
          {
            objc_msgSend(v711, "setCarReservationForModel:", 0);
          }

LABEL_799:
          objc_msgSend(v578, "objectForKeyedSubscript:", CFSTR("brand"));
          for (i16 = (void *)objc_claimAutoreleasedReturnValue(); ; i16 = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v578 = 0;
              v25 = v711;
              goto LABEL_786;
            }
            objc_msgSend(i16, "objectForKeyedSubscript:", CFSTR("name"));
            v586 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v409 = objc_opt_isKindOfClass();
            if ((v409 & 1) == 0)
            {
              objc_msgSend(i16, "objectForKeyedSubscript:", CFSTR("name"));
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
            }
            objc_msgSend(i16, "objectForKeyedSubscript:", CFSTR("name"));
            v411 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v411, "description");
            v587 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarReservationForBrandName:", v587);

            if ((v409 & 1) == 0)
              goto LABEL_806;
LABEL_807:

          }
          objc_msgSend(v711, "setCarReservationForBrandName:", 0);
LABEL_806:

          goto LABEL_807;
        }

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("provider"));
        v588 = (void *)objc_claimAutoreleasedReturnValue();
        v589 = CFSTR("name");
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v588, "objectForKeyedSubscript:", CFSTR("name"));
          v409 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v590 = objc_opt_isKindOfClass();
          if ((v590 & 1) == 0)
          {
            objc_msgSend(v588, "objectForKeyedSubscript:", CFSTR("name"));
            v411 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v25, "setCarProviderName:", 0);
LABEL_816:

              goto LABEL_817;
            }
          }
          objc_msgSend(v588, "objectForKeyedSubscript:", CFSTR("name"));
          v591 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v591, "description");
          v592 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCarProviderName:", v592);

          if ((v590 & 1) == 0)
            goto LABEL_816;
LABEL_817:

          v588 = 0;
        }

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
        v593 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_819:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("name"));
          v594 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v701 = (void *)v594;
          v595 = objc_opt_isKindOfClass();
          v709 = v593;
          if ((v595 & 1) != 0
            || (objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("name")),
                v596 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v699 = (void *)v596,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("name"));
            v597 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v597, "description");
            v598 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarPickupLocationName:", v598);

            v593 = v709;
            v599 = v701;
            if ((v595 & 1) != 0)
              goto LABEL_826;
          }
          else
          {
            objc_msgSend(v711, "setCarPickupLocationName:", 0);
            v599 = v701;
          }

LABEL_826:
          objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("telephone"));
          v600 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v702 = (void *)v600;
          v601 = objc_opt_isKindOfClass();
          if ((v601 & 1) != 0
            || (objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("telephone")),
                v602 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                v698 = (void *)v602,
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("telephone"));
            v603 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v603, "description");
            v604 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarPickupLocationTelephone:", v604);

            v593 = v709;
            v605 = v702;
            if ((v601 & 1) != 0)
              goto LABEL_832;
          }
          else
          {
            objc_msgSend(v711, "setCarPickupLocationTelephone:", 0);
            v605 = v702;
          }

LABEL_832:
          objc_msgSend(v593, "objectForKeyedSubscript:", CFSTR("address"));
          for (i17 = (void *)objc_claimAutoreleasedReturnValue(); ; i17 = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("address"));
              for (i18 = (void *)objc_claimAutoreleasedReturnValue(); ; i18 = 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  break;
                objc_msgSend(v711, "setCarPickupLocationAddress:", i18);

              }
              v593 = 0;
              goto LABEL_819;
            }
            objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("streetAddress"));
            v607 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v608 = objc_opt_isKindOfClass();
            if ((v608 & 1) != 0
              || (objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                  v589 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("streetAddress"));
              v609 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v609, "description");
              v610 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setCarPickupLocationAddressStreetAddress:", v610);

              if ((v608 & 1) != 0)
                goto LABEL_840;
            }
            else
            {
              objc_msgSend(v711, "setCarPickupLocationAddressStreetAddress:", 0);
            }

LABEL_840:
            objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressLocality"));
            v611 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v612 = objc_opt_isKindOfClass();
            if ((v612 & 1) != 0
              || (objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                  v411 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressLocality"));
              v613 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v613, "description");
              v614 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setCarPickupLocationAddressLocality:", v614);

              if ((v612 & 1) != 0)
                goto LABEL_846;
            }
            else
            {
              objc_msgSend(v711, "setCarPickupLocationAddressLocality:", 0);
            }

LABEL_846:
            objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressRegion"));
            v615 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v616 = objc_opt_isKindOfClass();
            if ((v616 & 1) != 0
              || (objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("addressRegion"));
              v617 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v617, "description");
              v618 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setCarPickupLocationAddressRegion:", v618);

              if ((v616 & 1) != 0)
                goto LABEL_852;
            }
            else
            {
              objc_msgSend(v711, "setCarPickupLocationAddressRegion:", 0);
            }

LABEL_852:
            objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v619 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v620 = objc_opt_isKindOfClass();
            if ((v620 & 1) == 0)
            {
              objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("postalCode"));
              v409 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v711, "setCarPickupLocationAddressPostalCode:", 0);
LABEL_857:

                goto LABEL_858;
              }
            }
            objc_msgSend(i17, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v621 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v621, "description");
            v622 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarPickupLocationAddressPostalCode:", v622);

            if ((v620 & 1) == 0)
              goto LABEL_857;
LABEL_858:

          }
        }

        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
        v366 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_864:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_908:
          v26 = v658;
          v25 = v711;
          v365 = v654;
          goto LABEL_461;
        }
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("name"));
        v624 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v703 = (void *)v624;
        v625 = objc_opt_isKindOfClass();
        v710 = v366;
        if ((v625 & 1) != 0
          || (objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("name")),
              v626 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v699 = (void *)v626,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("name"));
          v627 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v627, "description");
          v628 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setCarDropoffLocationName:", v628);

          v366 = v710;
          v629 = v703;
          if ((v625 & 1) != 0)
            goto LABEL_871;
        }
        else
        {
          objc_msgSend(v711, "setCarDropoffLocationName:", 0);
          v629 = v703;
        }

LABEL_871:
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("telephone"));
        v630 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v704 = (void *)v630;
        v631 = objc_opt_isKindOfClass();
        if ((v631 & 1) != 0
          || (objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("telephone")),
              v632 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v698 = (void *)v632,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("telephone"));
          v633 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v633, "description");
          v634 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setCarDropoffLocationTelephone:", v634);

          v366 = v710;
          v635 = v704;
          if ((v631 & 1) != 0)
            goto LABEL_877;
        }
        else
        {
          objc_msgSend(v711, "setCarDropoffLocationTelephone:", 0);
          v635 = v704;
        }

LABEL_877:
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("address"));
        for (i19 = (void *)objc_claimAutoreleasedReturnValue(); ; i19 = 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            objc_msgSend(v710, "objectForKeyedSubscript:", CFSTR("address"));
            for (i20 = (void *)objc_claimAutoreleasedReturnValue(); ; i20 = 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              objc_msgSend(v711, "setCarDropoffLocationAddress:", i20);

            }
            v366 = 0;
            goto LABEL_864;
          }
          objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("streetAddress"));
          v637 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v638 = objc_opt_isKindOfClass();
          if ((v638 & 1) != 0
            || (objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                v589 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("streetAddress"));
            v639 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v639, "description");
            v640 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarDropoffLocationAddressStreetAddress:", v640);

            if ((v638 & 1) != 0)
              goto LABEL_885;
          }
          else
          {
            objc_msgSend(v711, "setCarDropoffLocationAddressStreetAddress:", 0);
          }

LABEL_885:
          objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressLocality"));
          v641 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v642 = objc_opt_isKindOfClass();
          if ((v642 & 1) != 0
            || (objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                v411 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressLocality"));
            v643 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v643, "description");
            v644 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarDropoffLocationAddressLocality:", v644);

            if ((v642 & 1) != 0)
              goto LABEL_891;
          }
          else
          {
            objc_msgSend(v711, "setCarDropoffLocationAddressLocality:", 0);
          }

LABEL_891:
          objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressRegion"));
          v645 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v646 = objc_opt_isKindOfClass();
          if ((v646 & 1) != 0
            || (objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("addressRegion"));
            v647 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v647, "description");
            v648 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setCarDropoffLocationAddressRegion:", v648);

            if ((v646 & 1) != 0)
              goto LABEL_897;
          }
          else
          {
            objc_msgSend(v711, "setCarDropoffLocationAddressRegion:", 0);
          }

LABEL_897:
          objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("postalCode"));
          v649 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v650 = objc_opt_isKindOfClass();
          if ((v650 & 1) == 0)
          {
            objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v409 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v711, "setCarDropoffLocationAddressPostalCode:", 0);
LABEL_902:

              goto LABEL_903;
            }
          }
          objc_msgSend(i19, "objectForKeyedSubscript:", CFSTR("postalCode"));
          v651 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v651, "description");
          v652 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "setCarDropoffLocationAddressPostalCode:", v652);

          if ((v650 & 1) == 0)
            goto LABEL_902;
LABEL_903:

        }
      }
      v409 = (uint64_t)v659;
    }
    objc_msgSend((id)v409, "objectForKeyedSubscript:", CFSTR("reservationId"));
    v409 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v409, "description");
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v711, "setCarReservationId:", v412);

    if ((v411 & 1) != 0)
      goto LABEL_776;
    goto LABEL_775;
  }
  objc_msgSend(v711, "setEventType:", *MEMORY[0x1E0CA5E48]);
  v50 = v659;
  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationStatus"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v52 = objc_opt_isKindOfClass();
  if ((v52 & 1) == 0)
  {
    objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationStatus"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v711, "setFlightStatus:", 0);
      goto LABEL_66;
    }
    v50 = v659;
  }
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("reservationStatus"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setFlightStatus:", v3);

  if ((v52 & 1) == 0)
LABEL_66:

  v70 = v659;
  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v72 = objc_opt_isKindOfClass();
  if ((v72 & 1) == 0)
  {
    objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationId"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v711, "setFlightConfirmationNumber:", 0);
      goto LABEL_79;
    }
    v70 = v659;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("reservationId"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v711, "setFlightConfirmationNumber:", v3);

  if ((v72 & 1) == 0)
LABEL_79:

  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("provider"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (uint64_t)CFSTR("name");
  v83 = CFSTR("iataCode");
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v81, "objectForKeyedSubscript:", v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = objc_opt_isKindOfClass();
    if ((v85 & 1) != 0
      || (objc_msgSend(v81, "objectForKeyedSubscript:", v82),
          v3 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v81, "objectForKeyedSubscript:", v82);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "description");
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = v25;
      v88 = (void *)v86;
      objc_msgSend(v87, "setFlightCarrier:", v86);

      if ((v85 & 1) != 0)
        goto LABEL_88;
    }
    else
    {
      objc_msgSend(v25, "setFlightCarrier:", 0);
    }

LABEL_88:
    objc_msgSend(v81, "objectForKeyedSubscript:", v83);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = objc_opt_isKindOfClass();
    if ((v90 & 1) == 0)
    {
      objc_msgSend(v81, "objectForKeyedSubscript:", v83);
      v91 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v705 = (void *)v91;
      v25 = v711;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v711, "setFlightCarrierCode:", 0);
LABEL_93:

        goto LABEL_94;
      }
    }
    objc_msgSend(v81, "objectForKeyedSubscript:", v83);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "description");
    v92 = v83;
    v93 = v82;
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v711;
    objc_msgSend(v711, "setFlightCarrierCode:", v94);

    v82 = v93;
    v83 = v92;

    if ((v90 & 1) == 0)
      goto LABEL_93;
LABEL_94:

    v81 = 0;
  }

  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_96:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v685 = v95;
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("provider"));
    for (i21 = (void *)objc_claimAutoreleasedReturnValue(); ; i21 = 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("name"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v98 = objc_opt_isKindOfClass();
      if ((v98 & 1) != 0
        || (objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("name")),
            v99 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v680 = (void *)v99,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("name"));
        v100 = v25;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "description");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setFlightCarrier:", v102);

        if ((v98 & 1) != 0)
          goto LABEL_105;
      }
      else
      {
        objc_msgSend(v25, "setFlightCarrier:", 0);
      }

LABEL_105:
      objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("iataCode"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v104 = objc_opt_isKindOfClass();
      if ((v104 & 1) == 0)
      {
        objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("iataCode"));
        v105 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v679 = (void *)v105;
        v25 = v711;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v711, "setFlightCarrierCode:", 0);
LABEL_110:

          goto LABEL_111;
        }
      }
      objc_msgSend(i21, "objectForKeyedSubscript:", CFSTR("iataCode"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "description");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v711, "setFlightCarrierCode:", v107);

      v25 = v711;
      if ((v104 & 1) == 0)
        goto LABEL_110;
LABEL_111:

    }
    objc_msgSend(v685, "objectForKeyedSubscript:", CFSTR("flightNumber"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = objc_opt_isKindOfClass();
    if ((v109 & 1) != 0
      || (objc_msgSend(v685, "objectForKeyedSubscript:", CFSTR("flightNumber")),
          v110 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v662 = (void *)v110,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v685, "objectForKeyedSubscript:", CFSTR("flightNumber"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "description");
      v112 = (id)objc_claimAutoreleasedReturnValue();

      if ((v109 & 1) != 0)
        goto LABEL_118;
    }
    else
    {
      v112 = 0;
    }

LABEL_118:
    v113 = (void *)objc_msgSend(v112, "mutableCopy");
    v25 = v711;
    objc_msgSend(v711, "flightCarrierCode");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {
      objc_msgSend(v711, "flightCarrierCode");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "replaceOccurrencesOfString:withString:options:range:", v115, &stru_1E7DB83A8, 10, 0, 2);

    }
    objc_msgSend(v113, "replaceOccurrencesOfString:withString:options:range:", CFSTR("[^0-9]"), &stru_1E7DB83A8, 1026, 0, objc_msgSend(v113, "length"));
    v116 = v113;

    objc_msgSend(v711, "setFlightNumber:", v116);
    objc_msgSend(v711, "flightCarrierCode");
    v117 = objc_claimAutoreleasedReturnValue();
    if (v117)
    {
      v118 = (void *)v117;
      objc_msgSend(v711, "flightNumber");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      if (v119)
      {
        objc_msgSend(v711, "flightCarrierCode");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v711, "flightNumber");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "stringByAppendingString:", v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v711, "setFlightDesignator:", v122);

      }
    }
    v123 = v685;
    objc_msgSend(v685, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    while (2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("iataCode"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v126 = objc_opt_isKindOfClass();
        v686 = v124;
        if ((v126 & 1) != 0
          || (objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("iataCode")),
              v127 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v678 = (void *)v127,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("iataCode"));
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "description");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFlightArrivalAirportCode:", v129);

          v124 = v686;
          if ((v126 & 1) != 0)
            goto LABEL_131;
        }
        else
        {
          objc_msgSend(v25, "setFlightArrivalAirportCode:", 0);
        }

LABEL_131:
        objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("name"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v131 = objc_opt_isKindOfClass();
        if ((v131 & 1) != 0
          || (objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("name")),
              v132 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v677 = (void *)v132,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("name"));
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "description");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFlightArrivalAirportName:", v134);

          v124 = v686;
          if ((v131 & 1) != 0)
          {
LABEL_137:

            objc_msgSend(v124, "objectForKeyedSubscript:", CFSTR("latitude"));
            v135 = v124;
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v137 = objc_opt_isKindOfClass();
            if ((v137 & 1) == 0)
            {
              objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("latitude"));
              v684 = (void *)objc_claimAutoreleasedReturnValue();
              if (v684)
              {
                objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("latitude"));
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "description");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "doubleValue");
                if (v140 == 0.0)
                {
                  objc_msgSend(v711, "setFlightArrivalAirportLatitude:", 0);
                }
                else
                {
                  objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("latitude"));
                  v669 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v669, "description");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "doubleValue");
                  if (fabs(v142) == INFINITY)
                  {
                    objc_msgSend(v711, "setFlightArrivalAirportLatitude:", 0);
                  }
                  else
                  {
                    v663 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("latitude"));
                    v665 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v665, "description");
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "doubleValue");
                    objc_msgSend(v663, "numberWithDouble:");
                    v144 = v138;
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v711, "setFlightArrivalAirportLatitude:", v145);

                    v138 = v144;
                  }

                }
                v25 = v711;
LABEL_149:

LABEL_150:
                objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v148 = objc_opt_isKindOfClass();
                if ((v148 & 1) == 0)
                {
                  objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                  v683 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v683)
                  {
                    objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                    v149 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v149, "description");
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v150, "doubleValue");
                    if (v151 == 0.0)
                    {
                      objc_msgSend(v711, "setFlightArrivalAirportLongitude:", 0);
                    }
                    else
                    {
                      objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                      v670 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v670, "description");
                      v152 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v152, "doubleValue");
                      if (fabs(v153) == INFINITY)
                      {
                        objc_msgSend(v711, "setFlightArrivalAirportLongitude:", 0);
                      }
                      else
                      {
                        v664 = (void *)MEMORY[0x1E0CB37E8];
                        objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                        v666 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v666, "description");
                        v154 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v154, "doubleValue");
                        objc_msgSend(v664, "numberWithDouble:");
                        v155 = v149;
                        v156 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v711, "setFlightArrivalAirportLongitude:", v156);

                        v149 = v155;
                      }

                    }
                    v25 = v711;
LABEL_162:

LABEL_163:
                    objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("address"));
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_164:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("address"));
                      v187 = (void *)objc_claimAutoreleasedReturnValue();
                      v123 = v685;
                      while (1)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          break;
                        objc_msgSend(v25, "setFlightArrivalAirportAddress:", v187);

                        v187 = 0;
                      }

                      v124 = 0;
                      continue;
                    }
                    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v160 = objc_opt_isKindOfClass();
                    if ((v160 & 1) != 0
                      || (objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                          v161 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v705 = (void *)v161,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("streetAddress"));
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v162, "description");
                      v163 = objc_claimAutoreleasedReturnValue();
                      v164 = v25;
                      v165 = (void *)v163;
                      objc_msgSend(v164, "setFlightArrivalAirportStreetAddress:", v163);

                      if ((v160 & 1) != 0)
                        goto LABEL_171;
                    }
                    else
                    {
                      objc_msgSend(v25, "setFlightArrivalAirportStreetAddress:", 0);
                    }

LABEL_171:
                    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v167 = objc_opt_isKindOfClass();
                    if ((v167 & 1) != 0
                      || (objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                          v168 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v700 = (void *)v168,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressLocality"));
                      v169 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v169, "description");
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v711, "setFlightArrivalAirportLocality:", v170);

                      if ((v167 & 1) != 0)
                        goto LABEL_177;
                    }
                    else
                    {
                      objc_msgSend(v711, "setFlightArrivalAirportLocality:", 0);
                    }

LABEL_177:
                    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                    v171 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v172 = objc_opt_isKindOfClass();
                    if ((v172 & 1) != 0
                      || (objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                          v173 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          v699 = (void *)v173,
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressRegion"));
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v174, "description");
                      v175 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v711, "setFlightArrivalAirportRegion:", v175);

                      if ((v172 & 1) != 0)
                      {
LABEL_183:

                        objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                        for (i22 = (void *)objc_claimAutoreleasedReturnValue(); ; i22 = 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {

                            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("addressCountry"));
                            v181 = (void *)objc_claimAutoreleasedReturnValue();
                            v25 = v711;
                            while (1)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                break;
                              objc_msgSend(v711, "setFlightArrivalAirportCountry:", v181);

                              v181 = 0;
                            }

                            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("postalCode"));
                            v182 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            v183 = objc_opt_isKindOfClass();
                            if ((v183 & 1) == 0)
                            {
                              objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("postalCode"));
                              v184 = objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v698 = (void *)v184;
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_msgSend(v711, "setFlightArrivalAirportPostalCode:", 0);
LABEL_200:

                                goto LABEL_201;
                              }
                            }
                            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("postalCode"));
                            v185 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v185, "description");
                            v186 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v711, "setFlightArrivalAirportPostalCode:", v186);

                            if ((v183 & 1) == 0)
                              goto LABEL_200;
LABEL_201:

                            v158 = 0;
                            goto LABEL_164;
                          }
                          objc_msgSend(i22, "objectForKeyedSubscript:", CFSTR("name"));
                          v177 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          v178 = objc_opt_isKindOfClass();
                          if ((v178 & 1) == 0)
                          {
                            objc_msgSend(i22, "objectForKeyedSubscript:", CFSTR("name"));
                            v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                              break;
                          }
                          objc_msgSend(i22, "objectForKeyedSubscript:", CFSTR("name"));
                          v179 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v179, "description");
                          v180 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v711, "setFlightArrivalAirportCountry:", v180);

                          if ((v178 & 1) == 0)
                            goto LABEL_190;
LABEL_191:

                        }
                        objc_msgSend(v711, "setFlightArrivalAirportCountry:", 0);
LABEL_190:

                        goto LABEL_191;
                      }
                    }
                    else
                    {
                      objc_msgSend(v711, "setFlightArrivalAirportRegion:", 0);
                    }

                    goto LABEL_183;
                  }
                  v683 = 0;
                }
                objc_msgSend(v686, "objectForKeyedSubscript:", CFSTR("longitude"));
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setFlightArrivalAirportLongitude:", v157);

                if ((v148 & 1) == 0)
                  goto LABEL_162;
                goto LABEL_163;
              }
              v684 = 0;
            }
            objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("latitude"));
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setFlightArrivalAirportLatitude:", v146);

            if ((v137 & 1) == 0)
              goto LABEL_149;
            goto LABEL_150;
          }
        }
        else
        {
          objc_msgSend(v25, "setFlightArrivalAirportName:", 0);
        }

        goto LABEL_137;
      }
      break;
    }

    objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v189 = objc_opt_isKindOfClass();
    if ((v189 & 1) == 0)
    {
      objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
      v190 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v661 = (void *)v190;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v25, "setFlightArrivalTerminal:", 0);
LABEL_212:

LABEL_213:
        v193 = v685;
        objc_msgSend(v685, "objectForKeyedSubscript:", CFSTR("departureAirport"));
        for (i23 = (void *)objc_claimAutoreleasedReturnValue(); ; i23 = 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v82 = objc_opt_isKindOfClass();
            if ((v82 & 1) != 0)
              goto LABEL_301;
            objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
            v260 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v660 = (void *)v260;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v25, "setFlightDepartureTerminal:", 0);
LABEL_304:

              goto LABEL_305;
            }
            v193 = v685;
LABEL_301:
            objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "description");
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setFlightDepartureTerminal:", v262);

            if ((v82 & 1) == 0)
              goto LABEL_304;
LABEL_305:

            v95 = 0;
            goto LABEL_96;
          }
          objc_msgSend(i23, "objectForKeyedSubscript:", CFSTR("iataCode"));
          v195 = i23;
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v197 = objc_opt_isKindOfClass();
          v687 = v195;
          if ((v197 & 1) == 0)
          {
            objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("iataCode"));
            v198 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v676 = (void *)v198;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v25, "setFlightDepartureAirportCode:", 0);
LABEL_221:

              goto LABEL_222;
            }
            v195 = v687;
          }
          objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("iataCode"));
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "description");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFlightDepartureAirportCode:", v200);

          if ((v197 & 1) == 0)
            goto LABEL_221;
LABEL_222:

          v201 = v687;
          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("name"));
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v203 = objc_opt_isKindOfClass();
          if ((v203 & 1) == 0)
          {
            objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("name"));
            v204 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v675 = (void *)v204;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v25, "setFlightDepartureAirportName:", 0);
LABEL_228:

              goto LABEL_229;
            }
            v201 = v687;
          }
          objc_msgSend(v201, "objectForKeyedSubscript:", CFSTR("name"));
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "description");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFlightDepartureAirportName:", v206);

          if ((v203 & 1) == 0)
            goto LABEL_228;
LABEL_229:

          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v208 = objc_opt_isKindOfClass();
          if ((v208 & 1) == 0)
          {
            objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
            v682 = (void *)objc_claimAutoreleasedReturnValue();
            if (v682)
            {
              objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
              v209 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v209, "description");
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v210, "doubleValue");
              if (v211 == 0.0)
              {
                objc_msgSend(v711, "setFlightDepartureAirportLatitude:", 0);
              }
              else
              {
                v671 = v209;
                objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
                v667 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v667, "description");
                v212 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v212, "doubleValue");
                if (fabs(v213) == INFINITY)
                {
                  objc_msgSend(v711, "setFlightDepartureAirportLatitude:", 0);
                }
                else
                {
                  v214 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v215, "description");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v216, "doubleValue");
                  objc_msgSend(v214, "numberWithDouble:");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v711, "setFlightDepartureAirportLatitude:", v217);

                }
                v209 = v671;
              }

              v25 = v711;
LABEL_241:

              goto LABEL_242;
            }
            v682 = 0;
          }
          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("latitude"));
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFlightDepartureAirportLatitude:", v218);

          if ((v208 & 1) == 0)
            goto LABEL_241;
LABEL_242:

          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v220 = objc_opt_isKindOfClass();
          if ((v220 & 1) != 0)
            goto LABEL_248;
          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
          v681 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v681)
          {
            v681 = 0;
LABEL_248:
            objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setFlightDepartureAirportLongitude:", v230);

            if ((v220 & 1) != 0)
              goto LABEL_255;
            goto LABEL_254;
          }
          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "description");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "doubleValue");
          if (v223 == 0.0)
          {
            objc_msgSend(v711, "setFlightDepartureAirportLongitude:", 0);
          }
          else
          {
            v672 = v221;
            objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
            v668 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v668, "description");
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v224, "doubleValue");
            if (fabs(v225) == INFINITY)
            {
              objc_msgSend(v711, "setFlightDepartureAirportLongitude:", 0);
            }
            else
            {
              v226 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("longitude"));
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v227, "description");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v228, "doubleValue");
              objc_msgSend(v226, "numberWithDouble:");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setFlightDepartureAirportLongitude:", v229);

            }
            v221 = v672;
          }

          v25 = v711;
LABEL_254:

LABEL_255:
          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("address"));
          for (i24 = (void *)objc_claimAutoreleasedReturnValue(); ; i24 = 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("streetAddress"));
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v233 = objc_opt_isKindOfClass();
            if ((v233 & 1) != 0
              || (objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("streetAddress")),
                  v234 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v693 = (void *)v234,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("streetAddress"));
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v235, "description");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setFlightDepartureAirportStreetAddress:", v236);

              if ((v233 & 1) != 0)
                goto LABEL_263;
            }
            else
            {
              objc_msgSend(v711, "setFlightDepartureAirportStreetAddress:", 0);
            }

LABEL_263:
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressLocality"));
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v238 = objc_opt_isKindOfClass();
            if ((v238 & 1) != 0
              || (objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressLocality")),
                  v239 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v692 = (void *)v239,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressLocality"));
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v240, "description");
              v241 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setFlightDepartureAirportLocality:", v241);

              if ((v238 & 1) != 0)
                goto LABEL_269;
            }
            else
            {
              objc_msgSend(v711, "setFlightDepartureAirportLocality:", 0);
            }

LABEL_269:
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressRegion"));
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v243 = objc_opt_isKindOfClass();
            if ((v243 & 1) != 0
              || (objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressRegion")),
                  v244 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v689 = (void *)v244,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressRegion"));
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v245, "description");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setFlightDepartureAirportRegion:", v246);

              if ((v243 & 1) != 0)
                goto LABEL_275;
            }
            else
            {
              objc_msgSend(v711, "setFlightDepartureAirportRegion:", 0);
            }

LABEL_275:
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressCountry"));
            for (i25 = (void *)objc_claimAutoreleasedReturnValue(); ; i25 = 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              objc_msgSend(i25, "objectForKeyedSubscript:", CFSTR("name"));
              v248 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v249 = objc_opt_isKindOfClass();
              if ((v249 & 1) == 0)
              {
                objc_msgSend(i25, "objectForKeyedSubscript:", CFSTR("name"));
                v6 = objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(v711, "setFlightDepartureAirportCountry:", 0);
LABEL_282:

                  goto LABEL_283;
                }
              }
              objc_msgSend(i25, "objectForKeyedSubscript:", CFSTR("name"));
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v250, "description");
              v251 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v711, "setFlightDepartureAirportCountry:", v251);

              if ((v249 & 1) == 0)
                goto LABEL_282;
LABEL_283:

            }
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("addressCountry"));
            for (i26 = (void *)objc_claimAutoreleasedReturnValue(); ; i26 = 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              objc_msgSend(v711, "setFlightDepartureAirportCountry:", i26);

            }
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v254 = objc_opt_isKindOfClass();
            if ((v254 & 1) == 0)
            {
              objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("postalCode"));
              v255 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v688 = (void *)v255;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v711, "setFlightDepartureAirportPostalCode:", 0);
LABEL_292:

                goto LABEL_293;
              }
            }
            objc_msgSend(i24, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "description");
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v711, "setFlightDepartureAirportPostalCode:", v257);

            if ((v254 & 1) == 0)
              goto LABEL_292;
LABEL_293:

            v25 = v711;
          }

          objc_msgSend(v687, "objectForKeyedSubscript:", CFSTR("address"));
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = v685;
          while (1)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(v25, "setFlightDepartureAirportAddress:", v258);

            v258 = 0;
          }

        }
      }
      v123 = v685;
    }
    objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "description");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFlightArrivalTerminal:", v192);

    if ((v189 & 1) != 0)
      goto LABEL_213;
    goto LABEL_212;
  }

  v263 = v659;
  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("checkinUrl"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v265 = objc_opt_isKindOfClass();
  if ((v265 & 1) == 0)
  {
    objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("checkinUrl"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v25, "setFlightCheckInUrl:", 0);
      goto LABEL_312;
    }
    v263 = v659;
  }
  objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("checkinUrl"));
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "description");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFlightCheckInUrl:", v267);

  if ((v265 & 1) == 0)
LABEL_312:

  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("potentialAction"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v268)
  {
    objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    for (i27 = (void *)objc_claimAutoreleasedReturnValue(); ; i27 = 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(i27, "objectForKeyedSubscript:", CFSTR("potentialAction"));
      v270 = objc_claimAutoreleasedReturnValue();

      v268 = (void *)v270;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v271 = v268;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v272 = 0;
      goto LABEL_324;
    }
    v736 = v268;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v736, 1);
    v271 = (id)objc_claimAutoreleasedReturnValue();
  }
  v272 = v271;
LABEL_324:

  v718 = 0u;
  v719 = 0u;
  v716 = 0u;
  v717 = 0u;
  v273 = v272;
  v274 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v716, v735, 16);
  v706 = v273;
  if (!v274)
    goto LABEL_348;
  v275 = (void *)v274;
  v276 = *(_QWORD *)v717;
LABEL_326:
  v277 = 0;
  while (1)
  {
    if (*(_QWORD *)v717 != v276)
      objc_enumerationMutation(v273);
    v278 = *(void **)(*((_QWORD *)&v716 + 1) + 8 * v277);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_332;
    objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("@type"));
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v279, "isEqual:", CFSTR("CheckInAction")) & 1) != 0)
      break;

    v273 = v706;
LABEL_332:
    if (v275 == (void *)++v277)
    {
      v275 = (void *)objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v716, v735, 16);
      if (!v275)
        goto LABEL_348;
      goto LABEL_326;
    }
  }
  objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("target"));
  for (i28 = (void *)objc_claimAutoreleasedReturnValue(); ; i28 = 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(i28, "objectForKeyedSubscript:", CFSTR("url"));
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v282 = objc_opt_isKindOfClass();
    if ((v282 & 1) == 0)
    {
      objc_msgSend(i28, "objectForKeyedSubscript:", CFSTR("url"));
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v25, "setFlightCheckInUrl:", 0);
LABEL_342:

        goto LABEL_343;
      }
    }
    objc_msgSend(i28, "objectForKeyedSubscript:", CFSTR("url"));
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "description");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v711, "setFlightCheckInUrl:", v284);

    v25 = v711;
    if ((v282 & 1) == 0)
      goto LABEL_342;
LABEL_343:

  }
  objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("target"));
  for (i29 = (void *)objc_claimAutoreleasedReturnValue(); ; i29 = 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v25, "setFlightCheckInUrl:", i29);

  }
  v273 = v706;
LABEL_348:

  objc_msgSend(v655, "_pas_mappedArrayWithTransform:", &__block_literal_global_116);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v286, "count"))
  {
    objc_msgSend(v286, "_pas_mappedArrayWithTransform:", &__block_literal_global_135);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFlightPassengerNames:", v287);

    objc_msgSend(v286, "_pas_mappedArrayWithTransform:", &__block_literal_global_136);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFlightPassengerSeatNumbers:", v288);

  }
  objc_msgSend(v656, "startTimeZone");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "name");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFlightDepartureTimeZone:", v290);

  objc_msgSend(v656, "endTimeZone");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "name");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFlightArrivalTimeZone:", v292);

  v26 = v658;
LABEL_459:
  v365 = v654;
LABEL_460:

  v366 = v706;
LABEL_461:

  objc_msgSend(v26, "title");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v367);

  if (objc_msgSend(v657, "isEqualToString:", v365))
  {
    objc_msgSend(v26, "duplicateKey");
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v368, "parentKey");
    v369 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v369, "emailKey");
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v370, "messageId");
    v371 = objc_claimAutoreleasedReturnValue();
    goto LABEL_465;
  }
  if (objc_msgSend(v657, "isEqualToString:", *MEMORY[0x1E0D19A38]))
  {
    objc_msgSend(v26, "duplicateKey");
    v368 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v368, "parentKey");
    v369 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v369, "messageKey");
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v370, "uniqueIdentifier");
    v371 = objc_claimAutoreleasedReturnValue();
LABEL_465:
    v372 = (void *)v371;
    objc_msgSend(v25, "setEventMessageIdentifier:", v371);

  }
  v714 = 0u;
  v715 = 0u;
  v712 = 0u;
  v713 = 0u;
  objc_msgSend(v26, "tags");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v374 = objc_msgSend(v373, "countByEnumeratingWithState:objects:count:", &v712, v734, 16);
  if (v374)
  {
    v375 = v374;
    v376 = *(_QWORD *)v713;
LABEL_468:
    v377 = 0;
    while (1)
    {
      if (*(_QWORD *)v713 != v376)
        objc_enumerationMutation(v373);
      v378 = *(void **)(*((_QWORD *)&v712 + 1) + 8 * v377);
      if ((objc_msgSend(v378, "isAppleMailMessageId") & 1) != 0)
        break;
      if (v375 == ++v377)
      {
        v375 = objc_msgSend(v373, "countByEnumeratingWithState:objects:count:", &v712, v734, 16);
        if (v375)
          goto LABEL_468;
        v26 = v658;
        goto LABEL_477;
      }
    }
    v379 = v378;

    v26 = v658;
    if (!v379)
      goto LABEL_478;
    objc_msgSend(v379, "value");
    v380 = (void *)objc_claimAutoreleasedReturnValue();
    SGDelimitedStringsDeserialize();
    v381 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v381, "firstObject");
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccountIdentifier:", v382);

    objc_msgSend(v381, "lastObject");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMailMessageID:", v383);

    v373 = v379;
  }
LABEL_477:

LABEL_478:
  objc_msgSend(v26, "tags");
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v384, "_pas_mappedSetWithTransform:", &__block_literal_global_163);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v385, "allObjects");
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMailboxIdentifiers:", v386);

  objc_msgSend(v26, "duplicateKey");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v387, "pseudoEventKey");
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v388, "groupId");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEventGroupIdentifier:", v389);

  objc_msgSend(v26, "extraKeyTag");
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "value");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEventFallbackGroupIdentifier:", v391);

  objc_msgSend(v26, "creationTimestamp");
  v393 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v392);
  objc_msgSend(v25, "setContentCreationDate:", v393);

  v20 = v655;
LABEL_479:

  return v25;
}

id __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isMailboxIdentifier"))
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

uint64_t __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

id __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  __CFString *v4;
  unint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  __CFString *i;
  void *v11;
  __CFString *v12;
  void *j;
  void *v14;
  char v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  char v19;
  uint64_t v20;
  char v21;
  int v22;
  const __CFString *v23;
  void *v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  id v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  char v51;
  __CFString *v52;
  _QWORD v53[4];

  v53[3] = *MEMORY[0x1E0C80C00];
  v38 = a2;
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("underName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0x1E0CB3000uLL;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = objc_claimAutoreleasedReturnValue();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
LABEL_9:

    v3 = 0;
    v4 = (__CFString *)v9;
  }

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("underName"));
  for (i = (__CFString *)objc_claimAutoreleasedReturnValue(); ; i = 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;

    v4 = i;
  }

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v39 = v4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v40 = v11;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
    for (j = (void *)objc_claimAutoreleasedReturnValue(); ; j = 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatSection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();
      v52 = v12;
      if ((v15 & 1) != 0
        || (objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatSection")),
            v16 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v43 = (void *)v16,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v51 = v15 ^ 1;
        objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatSection"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "description");
        v50 = 1;
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v17 = v46;
      }
      else
      {
        v17 = 0;
        v50 = 0;
        v51 = 1;
      }
      if (!v17)
        v17 = &stru_1E7DB83A8;
      v53[0] = v17;
      objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatRow"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();
      if ((v19 & 1) != 0
        || (objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatRow")),
            v20 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v42 = (void *)v20,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v21 = v19 ^ 1;
        objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatRow"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "description");
        v22 = 1;
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = v45;
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v21 = 1;
      }
      if (!v23)
        v23 = &stru_1E7DB83A8;
      v53[1] = v23;
      objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatNumber"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v5;
      objc_opt_class();
      v26 = objc_opt_isKindOfClass();
      if ((v26 & 1) != 0
        || (objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatNumber")),
            v27 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v41 = (void *)v27,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v28 = v26 ^ 1;
        objc_msgSend(j, "objectForKeyedSubscript:", CFSTR("seatNumber"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "description");
        v29 = 1;
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v30 = v44;
      }
      else
      {
        v29 = 0;
        v30 = 0;
        v28 = 1;
      }
      if (!v30)
        v30 = &stru_1E7DB83A8;
      v53[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

      }
      if ((v28 & 1) != 0)

      if (v22)
      {

      }
      if ((v21 & 1) != 0)

      if (v50)
      {

      }
      if ((v51 & 1) != 0)

      objc_msgSend(v31, "_pas_filteredArrayWithTest:", &__block_literal_global_130);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "_pas_componentsJoinedByString:", CFSTR(" "));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v5 = v25;
    }

    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = v39;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;

      v12 = v33;
      v33 = 0;
    }

    v11 = 0;
  }

  if (-[__CFString length](v4, "length") || -[__CFString length](v12, "length"))
  {
    if (v4)
      v34 = v4;
    else
      v34 = &stru_1E7DB83A8;
    if (v12)
      v35 = v12;
    else
      v35 = &stru_1E7DB83A8;
    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

BOOL __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

uint64_t __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __38__SGEnrichmentWritebackAdapter__index__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0CA6B38]);
  v2 = objc_msgSend(v1, "initWithName:protectionClass:bundleIdentifier:", CFSTR("com.apple.spotlight.events"), *MEMORY[0x1E0CB2AC0], CFSTR("com.apple.spotlight.events"));
  v3 = (void *)_index__pasExprOnceResult;
  _index__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
