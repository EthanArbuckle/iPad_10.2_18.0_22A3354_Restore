@implementation SGMailIntelligenceDissector

+ (float)computeContactConnectionScoreFromEmailAddress:(id)a3 usingEntityStore:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  float v23;
  float v24;
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[16];

  v6 = a3;
  v7 = a4;
  sgMailIntelligenceLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v28 = 0;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGMailIntelligenceDissector: Searching for contact matching provided e-mail address.", v28, 2u);
  }

  objc_msgSend(v6, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getContactIdentifierForEmail:usingEntityStore:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_opt_new();
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    v13 = (void *)MEMORY[0x1C3BD4F6C]();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E0CAB8, &unk_1E7E0CAD0, &unk_1E7E0CAE8, &unk_1E7E0CB00, &unk_1E7E0CB18, 0);
    objc_autoreleasePoolPop(v13);
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_autoreleasePoolPop(v12);
    v16 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v16);
    v18 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v18);
    -[NSObject computeContactPriorsForContactIdentifiers:withTimeConstant:withInteractionMechanisms:asOf:overLookbackOf:](v11, "computeContactPriorsForContactIdentifiers:withTimeConstant:withInteractionMechanisms:asOf:overLookbackOf:", v17, 259200, v15, v19, 28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKey:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", v10);
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject priorScore](v22, "priorScore");
      v24 = v23;
    }
    else
    {
      sgMailIntelligenceLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v24 = 0.0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: No interactions with contact found.", v26, 2u);
      }
    }

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Could not map e-mail address to contact.", buf, 2u);
    }
  }

  return v24;
}

+ (id)getContactIdentifierForEmail:(id)a3 usingEntityStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[7];
  char v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C966A8];
  v28[0] = *MEMORY[0x1E0C966E8];
  v28[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__SGMailIntelligenceDissector_getContactIdentifierForEmail_usingEntityStore___block_invoke;
  v25[3] = &unk_1E7DB4A90;
  v11 = v7;
  v26 = v11;
  +[SGContactsInterface enumerateContactsMatchingEmailAddress:withKeysToFetch:usingContactStore:error:usingBlock:](SGContactsInterface, "enumerateContactsMatchingEmailAddress:withKeysToFetch:usingContactStore:error:usingBlock:", v5, v10, v8, &v27, v25);
  v12 = v27;

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "suggestContactMatchesByEmailAddress:isMaybe:onlySignificant:", v5, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (objc_msgSend(v13, "count"))
    {
      v22 = v12;
      v16 = 0;
      while (1)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "contact");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cnContactMatchesForRecordId:found:", v19, &v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "count"))
          break;

        if (++v16 >= (unint64_t)objc_msgSend(v13, "count"))
        {
          v14 = 0;
          v12 = v22;
          goto LABEL_3;
        }
      }
      sgMailIntelligenceLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v12 = v22;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Fuzzy contact match succeeded.", buf, 2u);
      }

      objc_msgSend(v20, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
LABEL_3:

  return v14;
}

uint64_t __77__SGMailIntelligenceDissector_getContactIdentifierForEmail_usingEntityStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  float v15;
  float v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  double v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint8_t buf[4];
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a5, "serviceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SGMIEnablementConfig detectSalientMails](SGMIEnablementConfig, "detectSalientMails"))
  {
    objc_msgSend(v6, "messageId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    sgMailIntelligenceLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = os_signpost_id_generate(v10);

      sgMailIntelligenceLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C3607000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Dissector.SocialConnectionScore", " enableTelemetry=YES ", buf, 2u);
      }

      objc_msgSend(v6, "from");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend((id)objc_opt_class(), "computeContactConnectionScoreFromEmailAddress:usingEntityStore:", v11, v8);
        v16 = v15;
      }
      else
      {
        v16 = 0.0;
      }
      sgMailIntelligenceLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C3607000, v18, OS_SIGNPOST_INTERVAL_END, v12, "Dissector.SocialConnectionScore", " enableTelemetry=YES ", buf, 2u);
      }

      sgMailIntelligenceLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v16;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: computed sender connection score of %f", buf, 0xCu);
      }

      objc_msgSend(v6, "messageId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spotlightBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spotlightDomainIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spotlightUniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commitSpotlightMapping:bundleIdentifier:domainIdentifier:uniqueIdentifier:", v20, v21, v22, v23);

      sgMailIntelligenceLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_signpost_id_generate(v24);

      sgMailIntelligenceLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C3607000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "Dissector.SaliencyScore", " enableTelemetry=YES ", buf, 2u);
      }

      *(float *)&v28 = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v30 = +[SGMISaliencyAnalyzer analyzeSimpleMailMessage:senderConnectionScore:store:logOrStageSaliency:commitSaliency:error:](SGMISaliencyAnalyzer, "analyzeSimpleMailMessage:senderConnectionScore:store:logOrStageSaliency:commitSaliency:error:", v6, v29, v8, 1, 1, &v33);

      sgMailIntelligenceLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C3607000, v32, OS_SIGNPOST_INTERVAL_END, v25, "Dissector.SaliencyScore", " enableTelemetry=YES ", buf, 2u);
      }

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGMailIntelligenceDissector: a nil message ID, skipping", buf, 2u);
    }
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGMailIntelligenceDissector: Mail saliency inference is off", buf, 2u);
    }
  }

}

@end
