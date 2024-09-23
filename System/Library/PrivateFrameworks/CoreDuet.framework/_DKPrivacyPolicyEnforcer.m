@implementation _DKPrivacyPolicyEnforcer

- (id)enforcePrivacy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _UNKNOWN **v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  _UNKNOWN **v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  +[_CDSiriLearningSettings sharedInstance](_CDSiriLearningSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allLearningDisabledBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("SELF.source.bundleID IN %@"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
  {
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("source.bundleID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v11;
        _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "Filtered objects for bundles with Siri Learning disabled: %@", buf, 0xCu);
      }

    }
  }
  v48 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v16)
  {
    v17 = v16;
    v55 = *(_QWORD *)v57;
    v18 = &off_1E26E0000;
    v49 = v15;
    do
    {
      v19 = 0;
      v50 = v17;
      do
      {
        if (*(_QWORD *)v57 != v55)
          objc_enumerationMutation(v15);
        v20 = *(id *)(*((_QWORD *)&v56 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v20;
          objc_msgSend(v20, "stream");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          +[_CDEventStreams privacyPolicyForEventStreamName:](_CDEventStreams, "privacyPolicyForEventStreamName:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            +[_CDPrivacyPolicy sharedPrivacyPolicy](_CDPrivacyPolicy, "sharedPrivacyPolicy");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (!objc_msgSend(v23, "canPersistOnStorage"))
          {

            goto LABEL_22;
          }
          objc_msgSend(v23, "temporalPrecision");
          v24 = v20;
          if (v25 != 0.0)
          {
            objc_msgSend(v20, "startDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "timeIntervalSinceReferenceDate");
            v28 = v27;

            objc_msgSend(v23, "temporalPrecision");
            v30 = v29 * floor(v28 / v29);
            objc_msgSend(v20, "endDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceReferenceDate");
            v33 = v32;

            objc_msgSend(v23, "temporalPrecision");
            v35 = v34 * floor(v33 / v34);
            v52 = v18[357];
            objc_msgSend(v20, "stream");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "source");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v22;
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v30);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "value");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "confidence");
            v41 = v40;
            objc_msgSend(v20, "metadata");
            v42 = v18;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "eventWithStream:source:startDate:endDate:value:confidence:metadata:", v51, v36, v37, v38, v39, v43, v41);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v42;
            v17 = v50;

            v15 = v49;
            objc_msgSend(v24, "setShouldSync:", objc_msgSend(v20, "shouldSync"));
            objc_msgSend(v20, "UUID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setUUID:", v44);

            objc_msgSend(v24, "setCompatibilityVersion:", objc_msgSend(v20, "compatibilityVersion"));
            objc_msgSend(v20, "timeZone");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setTimeZone:", v45);

            v22 = v53;
          }

          v20 = v24;
        }
        if (!v20)
          goto LABEL_23;
        objc_msgSend(v54, "addObject:", v20);
LABEL_22:

LABEL_23:
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v17);
  }

  v46 = (void *)objc_msgSend(v54, "copy");
  return v46;
}

+ (id)privacyPolicyEnforcer
{
  if (privacyPolicyEnforcer_onceToken != -1)
    dispatch_once(&privacyPolicyEnforcer_onceToken, &__block_literal_global_30);
  return (id)privacyPolicyEnforcer_enforcer;
}

@end
