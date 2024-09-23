@implementation SGMINicknameManager

+ (void)lookForNicknamesInSentMailsAndStore:(id)a3 shouldContinue:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  uint64_t (**v16)(_QWORD);
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(_QWORD))a4;
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("en"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sgmiFeatureStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getNSDateForKey:", CFSTR("lastSGMINicknameProcessingDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v9;
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10368000.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v10;
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = (unint64_t)fmax(v11 / -86400.0 + 1.0, 0.0);
  if (v12)
  {
    while (1)
    {
      sgMailIntelligenceLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v30 = v12;
        _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager: Processing mails sent %tu days ago", buf, 0xCu);
      }

      v14 = v12 - 1;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __74__SGMINicknameManager_lookForNicknamesInSentMailsAndStore_shouldContinue___block_invoke;
      v24[3] = &unk_1E7DB0E38;
      v25 = v7;
      v28 = v12;
      v15 = v5;
      v26 = v15;
      v16 = v6;
      v27 = v16;
      +[SGMISpotlightUtility querySentMailsForNicknameMatchingFromDaysAgo:throughDaysAgo:limit:handler:](SGMISpotlightUtility, "querySentMailsForNicknameMatchingFromDaysAgo:throughDaysAgo:limit:handler:", v12, v12 - 1, 100, v24);
      objc_msgSend(v15, "sgmiFeatureStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v12 * 24.0 * -3600.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNSDate:forKey:", v18, CFSTR("lastSGMINicknameProcessingDate"));

      if ((v6[2](v16) & 1) == 0)
        break;

      --v12;
      if (!v14)
        goto LABEL_13;
    }
    sgMailIntelligenceLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v12;
      _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager received signal to not continue after processing mails sent %tu days ago", buf, 0xCu);
    }

  }
LABEL_13:
  objc_msgSend(v5, "sgmiFeatureStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "purgeOldNicknameMappingRecords");

}

void __74__SGMINicknameManager_lookForNicknamesInSentMailsAndStore_shouldContinue___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeForKey:", *MEMORY[0x1E0CA66F8]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = (void *)v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  objc_msgSend(v5, "attributeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E0CA5F58]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v9;
  v16 = v15;

  objc_msgSend(v5, "attributeSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributeForKey:", *MEMORY[0x1E0CA68B8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributeSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "contentCreationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && v18 && objc_msgSend(v11, "count") == 1 && !objc_msgSend(v16, "count"))
  {
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("\n"), 2, 0, objc_msgSend(v18, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "nickname");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "body");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "matchForString:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_msgSend(v24, "coreRange");
      objc_msgSend(v21, "substringWithRange:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sgMailIntelligenceLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(a1 + 56);
        v32 = 134218499;
        v33 = v30;
        v34 = 2117;
        v35 = v27;
        v36 = 2117;
        v37 = v28;
        _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEFAULT, "SGMINicknameManager: A match got identified in a mail from ~%tu days ago: %{sensitive}@ -> %{sensitive}@.", (uint8_t *)&v32, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "sgmiFeatureStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "recordMappingFromNickname:toEmailAddress:withDateOfMatch:", v27, v28, v20);

    }
  }
  else
  {
    v21 = v18;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
    *a3 = 1;

}

@end
