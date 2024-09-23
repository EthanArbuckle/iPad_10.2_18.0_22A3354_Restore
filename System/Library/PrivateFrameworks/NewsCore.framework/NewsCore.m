double FCAppConfigurationDoubleValue(void *a1, uint64_t a2, double a3)
{
  void *v4;
  void *v5;
  double v6;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5)
      {
        objc_msgSend(v4, "doubleValue");
        a3 = v6;
      }
    }

  }
  return a3;
}

uint64_t FCAppConfigurationBoolValue(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5)
        a3 = objc_msgSend(v4, "BOOLValue");
    }

  }
  return a3;
}

id FCAppConfigurationDictionaryValueWithDefaultValue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v9 = v7,
          v7 == v8))
    {
      v9 = v6;
    }
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

uint64_t FCAppConfigurationIntegerValue(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5)
        a3 = objc_msgSend(v4, "longLongValue");
    }

  }
  return a3;
}

id FCAppConfigurationStringValue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v9 = v7,
          v7 == v8))
    {
      v9 = v6;
    }
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

void FCAppleAccountDetermineContentStoreFrontID(void *a1, void *a2, void *a3, void *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v24 = v11;
  v15 = v13;
  v16 = v15;
  if (!v15
    || (v17 = v15, v18 = v24, v12)
    && (v17 = v15, v18 = v24, (objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v24, v12) & 1) == 0))
  {
    v17 = v14;

    v18 = v12;
  }
  v19 = objc_retainAutorelease(v18);
  *a5 = v19;
  NewsCoreUserDefaults();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("storefront"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (NFInternalBuild()
    && v21
    && (objc_msgSend(v21, "isEqualToString:", CFSTR("default-storefront")) & 1) == 0)
  {
    v22 = v21;

    v17 = v22;
  }
  v23 = objc_retainAutorelease(v17);
  *a6 = v23;

}

id FCThumbnailForHeadlineMinimumSize(void *a1, double a2, double a3, double a4)
{
  return FCThumbnailForHeadlineMinimumSizeInPixels(a1, a2 * a4, a3 * a4);
}

FCArticleHeadline *FCHeadlineWithHeldRecords(void *a1, void *a2, void *a3, void *a4, void *a5, char a6, void *a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  FCArticleHeadline *v30;
  char v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  FCArticleHeadline *v41;
  id v42;
  void *v43;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v47 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v50 = "id<FCHeadlineProviding> FCHeadlineWithHeldRecords(__strong id<FCCoreConfiguration>, FCAssetManager *__strong, "
          "NSString *__strong, FCHeldRecords<NTPBArticleRecord *> *__strong, NSDictionary<NSString *,id<FCChannelProvidin"
          "g>> *__strong, BOOL, NSDictionary<NSString *,FCIssue *> *__strong, FCHeadlineExperimentalTitleProvider *__strong)";
    v51 = 2080;
    v52 = "FCArticleHeadlineUtilities.m";
    v53 = 1024;
    v54 = 26;
    v55 = 2114;
    v56 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager");
    *(_DWORD *)buf = 136315906;
    v50 = "id<FCHeadlineProviding> FCHeadlineWithHeldRecords(__strong id<FCCoreConfiguration>, FCAssetManager *__strong, "
          "NSString *__strong, FCHeldRecords<NTPBArticleRecord *> *__strong, NSDictionary<NSString *,id<FCChannelProvidin"
          "g>> *__strong, BOOL, NSDictionary<NSString *,FCIssue *> *__strong, FCHeadlineExperimentalTitleProvider *__strong)";
    v51 = 2080;
    v52 = "FCArticleHeadlineUtilities.m";
    v53 = 1024;
    v54 = 27;
    v55 = 2114;
    v56 = v39;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID");
    *(_DWORD *)buf = 136315906;
    v50 = "id<FCHeadlineProviding> FCHeadlineWithHeldRecords(__strong id<FCCoreConfiguration>, FCAssetManager *__strong, "
          "NSString *__strong, FCHeldRecords<NTPBArticleRecord *> *__strong, NSDictionary<NSString *,id<FCChannelProvidin"
          "g>> *__strong, BOOL, NSDictionary<NSString *,FCIssue *> *__strong, FCHeadlineExperimentalTitleProvider *__strong)";
    v51 = 2080;
    v52 = "FCArticleHeadlineUtilities.m";
    v53 = 1024;
    v54 = 28;
    v55 = 2114;
    v56 = v40;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v17, "recordsByID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "interestTokenForID:", v16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sourceChannelTagID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v20, "sourceChannelTagID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  v46 = v18;
  objc_msgSend(v20, "parentIssueID");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24
    && (v25 = (void *)v24,
        objc_msgSend(v14, "paidBundleConfig"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "areMagazinesEnabled"),
        v26,
        v25,
        v27))
  {
    objc_msgSend(v20, "parentIssueID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  v30 = 0;
  v31 = a6;
  if (v23)
    v31 = 0;
  if (v20 && v48 && (v31 & 1) == 0)
  {
    v41 = [FCArticleHeadline alloc];
    objc_msgSend(v14, "topStoriesConfig");
    v45 = v17;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "styleConfigurations");
    v42 = v19;
    v33 = v15;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topStoriesConfig");
    v35 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:](v41, "initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:", v20, v48, v23, v29, v34, objc_msgSend(v36, "storyTypeTimeout"), objc_msgSend(v14, "articleRapidUpdatesTimeout"), v33, v47);

    v16 = v35;
    v15 = v33;
    v19 = v42;

    v17 = v45;
  }

  return v30;
}

void sub_1A1B9D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1B9D2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCDeconstructHexStringWithBlock(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, double, double, double, double);
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE buf[12];
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "void FCDeconstructHexStringWithBlock(NSString * _Nullable __strong, void (^__strong _Nonnull)(C"
                         "GFloat, CGFloat, CGFloat, CGFloat))";
    v17 = 2080;
    v18 = "FCColor.m";
    v19 = 1024;
    v20 = 17;
    v21 = 2114;
    v22 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(v3, "length") == 9)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (objc_msgSend(v3, "length") == 8)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scanHexLongLong:", buf);
    v9 = (double)buf[3] / 255.0;
    v6 = (double)buf[2] / 255.0;
    v7 = (double)buf[1] / 255.0;
    v8 = (double)buf[0] / 255.0;

  }
  if (objc_msgSend(v3, "length") == 7)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v11;
  }
  if (objc_msgSend(v3, "length") == 6)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scanHexLongLong:", buf);
    v9 = (double)buf[2] / 255.0;
    v6 = (double)buf[1] / 255.0;
    v7 = (double)buf[0] / 255.0;

    v8 = 1.0;
  }
  if (objc_msgSend(v3, "length") == 4)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v13;
  }
  if (objc_msgSend(v3, "length") == 3)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scanHexLongLong:", buf);
    v9 = (double)((*(_QWORD *)buf >> 8) & 0xFLL) / 15.0;
    v6 = (double)(buf[0] >> 4) / 15.0;
    v7 = (double)(buf[0] & 0xF) / 15.0;

    v8 = 1.0;
  }
  v4[2](v4, v9, v6, v7, v8);

}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

{

}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

void __Block_byref_object_dispose__36(uint64_t a1)
{

}

void __Block_byref_object_dispose__37(uint64_t a1)
{

}

void __Block_byref_object_dispose__38(uint64_t a1)
{

}

void __Block_byref_object_dispose__39(uint64_t a1)
{

}

void __Block_byref_object_dispose__40(uint64_t a1)
{

}

void __Block_byref_object_dispose__41(uint64_t a1)
{

}

void __Block_byref_object_dispose__42(uint64_t a1)
{

}

void __Block_byref_object_dispose__43(uint64_t a1)
{

}

void __Block_byref_object_dispose__44(uint64_t a1)
{

}

void __Block_byref_object_dispose__45(uint64_t a1)
{

}

void __Block_byref_object_dispose__46(uint64_t a1)
{

}

void __Block_byref_object_dispose__47(uint64_t a1)
{

}

void __Block_byref_object_dispose__48(uint64_t a1)
{

}

void __Block_byref_object_dispose__49(uint64_t a1)
{

}

void __Block_byref_object_dispose__50(uint64_t a1)
{

}

void __Block_byref_object_dispose__51(uint64_t a1)
{

}

void __Block_byref_object_dispose__52(uint64_t a1)
{

}

void __Block_byref_object_dispose__53(uint64_t a1)
{

}

void __Block_byref_object_dispose__54(uint64_t a1)
{

}

void __Block_byref_object_dispose__55(uint64_t a1)
{

}

void __Block_byref_object_dispose__56(uint64_t a1)
{

}

void __Block_byref_object_dispose__57(uint64_t a1)
{

}

void __Block_byref_object_dispose__58(uint64_t a1)
{

}

void __Block_byref_object_dispose__59(uint64_t a1)
{

}

void __Block_byref_object_dispose__60(uint64_t a1)
{

}

void __Block_byref_object_dispose__61(uint64_t a1)
{

}

void __Block_byref_object_dispose__62(uint64_t a1)
{

}

void __Block_byref_object_dispose__63(uint64_t a1)
{

}

void __Block_byref_object_dispose__64(uint64_t a1)
{

}

void __Block_byref_object_dispose__65(uint64_t a1)
{

}

void __Block_byref_object_dispose__66(uint64_t a1)
{

}

void __Block_byref_object_dispose__67(uint64_t a1)
{

}

void __Block_byref_object_dispose__68(uint64_t a1)
{

}

void __Block_byref_object_dispose__69(uint64_t a1)
{

}

void __Block_byref_object_dispose__70(uint64_t a1)
{

}

void __Block_byref_object_dispose__71(uint64_t a1)
{

}

void __Block_byref_object_dispose__72(uint64_t a1)
{

}

void __Block_byref_object_dispose__73(uint64_t a1)
{

}

void __Block_byref_object_dispose__74(uint64_t a1)
{

}

void __Block_byref_object_dispose__75(uint64_t a1)
{

}

void __Block_byref_object_dispose__76(uint64_t a1)
{

}

void __Block_byref_object_dispose__77(uint64_t a1)
{

}

void __Block_byref_object_dispose__78(uint64_t a1)
{

}

void __Block_byref_object_dispose__79(uint64_t a1)
{

}

void __Block_byref_object_dispose__80(uint64_t a1)
{

}

void __Block_byref_object_dispose__81(uint64_t a1)
{

}

void __Block_byref_object_dispose__82(uint64_t a1)
{

}

void __Block_byref_object_dispose__83(uint64_t a1)
{

}

void __Block_byref_object_dispose__84(uint64_t a1)
{

}

void __Block_byref_object_dispose__85(uint64_t a1)
{

}

void __Block_byref_object_dispose__86(uint64_t a1)
{

}

void __Block_byref_object_dispose__87(uint64_t a1)
{

}

void __Block_byref_object_dispose__88(uint64_t a1)
{

}

void __Block_byref_object_dispose__89(uint64_t a1)
{

}

void __Block_byref_object_dispose__90(uint64_t a1)
{

}

void __Block_byref_object_dispose__91(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void *__Block_byref_object_copy__32(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__43(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__45(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__48(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__49(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__50(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__51(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__52(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__53(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__54(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__55(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__57(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__59(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__60(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__62(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__63(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__67(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__69(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void *__Block_byref_object_copy__70(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__71(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__72(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__73(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__76(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__77(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__79(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__81(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__82(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__83(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__85(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__86(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__89(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__91(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A1BA2610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCIntegerRepresentationOfBundleShortVersionString(void *a1)
{
  void *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1000000 * objc_msgSend(v4, "integerValue");

    if (v3 != 1)
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 += 1000 * objc_msgSend(v6, "integerValue");

      if (v3 >= 3)
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v7, "integerValue");

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t PBTagTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("topic")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("channel")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("section")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("list")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("issue")))
            v2 = 0;
          else
            v2 = 5;
        }
        else
        {
          v2 = 4;
        }
      }
      else
      {
        v2 = 3;
      }
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t FCContentModeFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (v1
    && (objc_msgSend(&unk_1E470D2B8, "objectForKeyedSubscript:", v1),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    objc_msgSend(&unk_1E470D2B8, "objectForKeyedSubscript:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

id FCTagAdjustName(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    FCBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Sports"), &stru_1E464BC40, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

uint64_t FCCheckedDynamicCast(objc_class *a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  NSString *v6;
  objc_class *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a2;
  v16 = *MEMORY[0x1E0C80C00];
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      v6 = NSStringFromClass(a1);
      v7 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136315906;
      v9 = "id FCCheckedDynamicCast(Class, id<NSObject>)";
      v10 = 2080;
      v11 = "FCCast.m";
      v12 = 1024;
      v13 = 98;
      v14 = 2114;
      v15 = objc_msgSend(v5, "initWithFormat:", CFSTR("Unexpected object type in checked dynamic cast - Expected %@, Got %@"), v6, NSStringFromClass(v7));
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    return 0;
  }
  return v2;
}

void sub_1A1BA82D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BA83BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BA86E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (!NFInternalBuild())
    return 1;
  NewsCoreUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("content_environment"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("staging")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("qa")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("test")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("icloud1")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("devel")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sandbox")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("demo1")) & 1) != 0)
  {
    v2 = 8;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("demo2")))
  {
    v2 = 9;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

id NewsCoreUserDefaults()
{
  if (qword_1ED0F8540 != -1)
    dispatch_once(&qword_1ED0F8540, &__block_literal_global_120);
  return (id)_MergedGlobals_188;
}

id FCPermanentURLForRecordID(void *a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  id v8;
  char v9;
  char v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  char v22;
  char v23;
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v24 = 2;
  v23 = 0;
  v22 = 0;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news.public")))
  {
    v9 = 1;
LABEL_11:
    v22 = v9;
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news.public.staging")))
  {
    v9 = 2;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news.public.qa")))
  {
    v9 = 3;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news.public.demo1")))
  {
    v9 = 12;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.news.public.demo2")))
  {
    v9 = 13;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown container identifier for permanent URLs: %@"), v8);
    *(_DWORD *)buf = 136315906;
    v26 = "NSURL *FCPermanentURLForRecordID(NSString *__strong, FCCKRecordAssetField, NSString *__strong, BOOL)";
    v27 = 2080;
    v28 = "FCAssetURLUtilities.m";
    v29 = 1024;
    v30 = 58;
    v31 = 2114;
    v32 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_12:
  switch(a2)
  {
    case 0:
      v10 = 0;
      v11 = "0";
      break;
    case 1:
      v10 = 0;
      v11 = "3";
      break;
    case 2:
      v10 = 0;
      v11 = "19";
      break;
    case 3:
      v10 = 0;
      v11 = "17";
      break;
    default:
      v11 = 0;
      v10 = 1;
      break;
  }
  buf[0] = objc_msgSend(v7, "length");
  if (qword_1ED0F8830 == -1)
  {
    if ((v10 & 1) != 0)
    {
LABEL_20:
      v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    dispatch_once(&qword_1ED0F8830, &__block_literal_global_170);
    if ((v10 & 1) != 0)
      goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendBytes:length:", &v24, 1);
  objc_msgSend(v14, "appendBytes:length:", &v22, 1);
  objc_msgSend(v14, "appendBytes:length:", buf, 1);
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendData:", v15);

  objc_msgSend(v14, "appendBytes:length:", &v23, 1);
  objc_msgSend(v14, "appendBytes:length:", v11, strlen(v11));
  objc_msgSend(v14, "fc_URLSafeBase64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  v18 = v17;
  if (a4)
    v19 = CFSTR("https");
  else
    v19 = CFSTR("http");
  objc_msgSend(v17, "setScheme:", v19);
  objc_msgSend(v18, "setHost:", CFSTR("c.apple.news"));
  FCUpdateAssetURLHostIfNeededWithParameters(v18, v8, _MergedGlobals_214);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPath:", v20);

  objc_msgSend(v18, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v12;
}

void FCUpdateAssetURLHostIfNeededWithParameters(void *a1, void *a2, int a3)
{
  id v5;
  int v6;
  const __CFString *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  if (FCAllowedToRewriteAssetURLComponents(v8))
  {
    v6 = FCShouldReroutePermanentURLsForContainerIdentifier(v5);
    if ((v6 & 1) != 0 || a3)
    {
      if (v6)
        v7 = CFSTR("cvws-internal.icloud.com");
      else
        v7 = CFSTR("cvws.icloud-content.com");
      objc_msgSend(v8, "setHost:", v7);
    }
  }

}

uint64_t FCShouldReroutePermanentURLsForContainerIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news.public.staging")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news.public.qa")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news.public.demo1")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news.public.demo2"));
  }

  return v2;
}

uint64_t FCAllowedToRewriteAssetURLComponents(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (+[FCRecordFieldURLProtocol canHandleURLWithComponents:](FCRecordFieldURLProtocol, "canHandleURLWithComponents:", v1)|| +[FCExcerptURLProtocol canHandleURLWithComponents:](FCExcerptURLProtocol, "canHandleURLWithComponents:", v1))
  {
    v2 = 0;
  }
  else
  {
    v2 = +[FCPuzzleThumbnailURLProtocol canHandleURLWithComponents:](FCPuzzleThumbnailURLProtocol, "canHandleURLWithComponents:", v1) ^ 1;
  }

  return v2;
}

void sub_1A1BA9D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Block_object_dispose((const void *)(v41 - 152), 8);
  _Unwind_Resume(a1);
}

void FCUpdateAssetURLHostIfNeeded(void *a1)
{
  id v1;
  id v2;
  id v3;

  v1 = a1;
  if (qword_1ED0F8840 != -1)
  {
    v3 = v1;
    dispatch_once(&qword_1ED0F8840, &__block_literal_global_17_3);
    v1 = v3;
  }
  if (!byte_1ED0F882A)
  {
    v2 = v1;
    FCUpdateAssetURLHostIfNeededWithParameters(v1, (void *)qword_1ED0F8838, byte_1ED0F8829);
    v1 = v2;
  }

}

void sub_1A1BAB27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id FCUserAgentHeaderValue()
{
  if (qword_1ED0F8710 != -1)
    dispatch_once(&qword_1ED0F8710, &__block_literal_global_20_2);
  return (id)qword_1ED0F8708;
}

id FCClientInfoHeaderValue()
{
  if (qword_1ED0F8700 != -1)
    dispatch_once(&qword_1ED0F8700, &__block_literal_global_151);
  return (id)_MergedGlobals_200;
}

id AppBundleID()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1A1BABA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BADC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCProcessIsMemoryConstrained()
{
  if (qword_1ED0F7D48 != -1)
    dispatch_once(&qword_1ED0F7D48, &__block_literal_global_4);
  return _MergedGlobals_137;
}

void sub_1A1BAE184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BAE550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BB0120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1BB0AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

id FCURLForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask a2)
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(a1, a2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_onlyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A1BB1B20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id FCCachedThumbnailForHeadline(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
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

  v1 = a1;
  objc_msgSend(v1, "thumbnailUltraHQ");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v1, "thumbnailUltraHQ");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "thumbnailHQ");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailAssetHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v1, "thumbnailHQ");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "thumbnailMedium");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "thumbnailAssetHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v1, "thumbnailMedium");
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v1, "thumbnail");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "thumbnailAssetHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v1, "thumbnail");
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v1, "thumbnailLQ");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "thumbnailAssetHandle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "filePath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v18 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v1, "thumbnailLQ");
          v5 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v18 = (void *)v5;
LABEL_12:

  return v18;
}

id FCThumbnailForHeadlineMinimumSizeInPixels(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v5 = a1;
  v6 = v5;
  if (a2 == *MEMORY[0x1E0C9D820] && a3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v23 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v5, "thumbnailLQ");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "thumbnailLQ");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailSize");
    v12 = v11;
    v14 = v13;

    if (v12 >= a2 && v14 >= a3)
    {
      objc_msgSend(v6, "thumbnailLQ");
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  objc_msgSend(v6, "thumbnail");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v6, "thumbnail");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "thumbnailSize");
    v20 = v19;
    v22 = v21;

    if (v20 >= a2 && v22 >= a3)
    {
      objc_msgSend(v6, "thumbnail");
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  objc_msgSend(v6, "thumbnailMedium");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v6, "thumbnailMedium");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "thumbnailSize");
    v28 = v27;
    v30 = v29;

    if (v28 >= a2 && v30 >= a3)
    {
      objc_msgSend(v6, "thumbnailMedium");
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  objc_msgSend(v6, "thumbnailHQ");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v6, "thumbnailHQ");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "thumbnailSize");
    v35 = v34;
    v37 = v36;

    if (v35 >= a2 && v37 >= a3)
    {
      objc_msgSend(v6, "thumbnailHQ");
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  objc_msgSend(v6, "thumbnailUltraHQ");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v6, "thumbnailUltraHQ");
    v38 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v23 = (id)v38;
    if (v38)
      goto LABEL_40;
  }
  objc_msgSend(v6, "thumbnailUltraHQ");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    v23 = v40;
  }
  else
  {
    objc_msgSend(v6, "thumbnailHQ");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v23 = v42;
    }
    else
    {
      objc_msgSend(v6, "thumbnailMedium");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        v23 = v44;
      }
      else
      {
        objc_msgSend(v6, "thumbnail");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          objc_msgSend(v6, "thumbnailLQ");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v48;

      }
    }

  }
LABEL_40:

  return v23;
}

double FCThumbnailAspectRatioForHeadline(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v1 = a1;
  objc_msgSend(v1, "thumbnailUltraHQ");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "thumbnailUltraHQ");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v8 = v3;
    objc_msgSend(v3, "thumbnailSize");
    v10 = v9;
    v12 = v11;

    goto LABEL_12;
  }
  objc_msgSend(v1, "thumbnailHQ");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v1, "thumbnailHQ");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v1, "thumbnailMedium");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v1, "thumbnailMedium");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v1, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v1, "thumbnail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v1, "thumbnailLQ");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v1, "thumbnailLQ");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_12:
  if (v12 == 0.0)
    v13 = 0.0;
  else
    v13 = v10 / v12;

  return v13;
}

BOOL FCCKPQueryRetrieveResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPQueryRetrieveResponseQueryResult *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPQueryRetrieveResponseQueryResult);
        -[FCCKPQueryRetrieveResponse addQueryResults:](a1, v17);
        if (!PBReaderPlaceMark()
          || (FCCKPQueryRetrieveResponseQueryResultReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(FCCKPQueryRetrieveResponseQueryResult **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPQueryRetrieveResponseQueryResultReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPRecordIdentifier *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(FCCKPRecordIdentifier);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && FCCKPRecordIdentifierReadFrom((uint64_t)v17, a2))
          goto LABEL_34;
        goto LABEL_41;
      case 2u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v19;

        goto LABEL_39;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 32) = v23;
        goto LABEL_39;
      case 4u:
        v17 = objc_alloc_init(FCCKPRecord);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && FCCKPRecordReadFrom((id *)&v17->super.super.isa, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

BOOL FCCKPRecordReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  FCCKPRecordIdentifier *v19;
  uint64_t v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 3;
        goto LABEL_42;
      case 2u:
        v19 = objc_alloc_init(FCCKPRecordIdentifier);
        objc_storeStrong(a1 + 7, v19);
        if (!PBReaderPlaceMark() || !FCCKPRecordIdentifierReadFrom((uint64_t)v19, a2))
          goto LABEL_47;
        goto LABEL_38;
      case 3u:
        v19 = objc_alloc_init(FCCKPRecordType);
        objc_storeStrong(a1 + 9, v19);
        if (!PBReaderPlaceMark() || (FCCKPRecordTypeReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_47;
        goto LABEL_38;
      case 4u:
        v19 = objc_alloc_init(FCCKPIdentifier);
        v20 = 2;
        goto LABEL_36;
      case 5u:
        v19 = objc_alloc_init(FCCKPDateStatistics);
        objc_storeStrong(a1 + 8, v19);
        if (!PBReaderPlaceMark() || !FCCKPDateStatisticsReadFrom((uint64_t)v19, a2))
          goto LABEL_47;
        goto LABEL_38;
      case 7u:
        v19 = objc_alloc_init(FCCKPRecordField);
        objc_msgSend(a1, "addFields:", v19);
        if (!PBReaderPlaceMark() || !FCCKPRecordFieldReadFrom((uint64_t)v19, a2))
          goto LABEL_47;
        goto LABEL_38;
      case 9u:
        v19 = objc_alloc_init(FCCKPIdentifier);
        v20 = 5;
LABEL_36:
        objc_storeStrong(&a1[v20], v19);
        if (PBReaderPlaceMark() && (FCCKPIdentifierReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_38:
          PBReaderRecallMark();
LABEL_43:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_47:

        return 0;
      case 0xAu:
        PBReaderReadString();
        v19 = (FCCKPRecordIdentifier *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addConflictLoserEtags:", v19);
        goto LABEL_43;
      case 0xBu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 6;
LABEL_42:
        v19 = (FCCKPRecordIdentifier *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_43;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_44;
    }
  }
}

BOOL FCCKPRecordFieldReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPRecordFieldIdentifier *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPRecordFieldIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (FCCKPRecordFieldIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(FCCKPRecordFieldValue);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (FCCKPRecordFieldValueReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPRecordFieldValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  FCCKPDate *v38;
  void *v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 68) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_51;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_53;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_53:
        *(_DWORD *)(a1 + 64) = v20;
        goto LABEL_60;
      case 2u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 24;
        goto LABEL_43;
      case 4u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 68) |= 2u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v30 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_57:
        *(_QWORD *)(a1 + 16) = v30;
        goto LABEL_60;
      case 5u:
        *(_BYTE *)(a1 + 68) |= 1u;
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v37 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v36);
          *(_QWORD *)(a2 + v35) = v36 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v37 = 0;
        }
        *(_QWORD *)(a1 + 8) = v37;
        goto LABEL_60;
      case 6u:
        v38 = objc_alloc_init(FCCKPDate);
        objc_storeStrong((id *)(a1 + 32), v38);
        if (!PBReaderPlaceMark() || (FCCKPDateReadFrom((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_62;
        goto LABEL_49;
      case 7u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 56;
LABEL_43:
        v39 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_60;
      case 9u:
        v38 = objc_alloc_init(FCCKPRecordReference);
        objc_storeStrong((id *)(a1 + 48), v38);
        if (!PBReaderPlaceMark() || (FCCKPRecordReferenceReadFrom((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_62;
        goto LABEL_49;
      case 0xBu:
        v38 = objc_alloc_init(FCCKPRecordFieldValue);
        objc_msgSend((id)a1, "addListValue:", v38);
        if (PBReaderPlaceMark() && (FCCKPRecordFieldValueReadFrom(v38, a2) & 1) != 0)
        {
LABEL_49:
          PBReaderRecallMark();

LABEL_60:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_62:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_60;
    }
  }
}

uint64_t FCCKPRecordFieldIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL FCCKPRecordIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPIdentifier *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (FCCKPIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(FCCKPRecordZoneIdentifier);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || !FCCKPRecordZoneIdentifierReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL FCCKPRecordZoneIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPIdentifier *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(FCCKPIdentifier);
        v18 = 8;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(FCCKPIdentifier);
        v18 = 16;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (FCCKPIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPRecordTypeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL FCCKPDateStatisticsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPDate *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(FCCKPDate);
        v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(FCCKPDate);
        v18 = 8;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (FCCKPDateReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPDateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 16) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_QWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id FCCKPRecordFieldIdentifierForUserFieldName(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0C946A0];
  v2 = a1;
  if (objc_msgSend(v2, "isEqualToString:", v1)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported operation for special key-path allTokens"));
    v10 = 136315906;
    v11 = "FCCKPRecordFieldIdentifier *FCCKPRecordFieldIdentifierForUserFieldName(NSString *__strong)";
    v12 = 2080;
    v13 = "FCCKPredicateConversion.m";
    v14 = 1024;
    v15 = 94;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  CKServerFieldNameForUserFieldName(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = v2;
  v6 = v5;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setName:", v6);

  return v7;
}

id CKServerFieldNameForUserFieldName(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (qword_1ED0F8340 != -1)
  {
    dispatch_once(&qword_1ED0F8340, &__block_literal_global_4_1);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)qword_1ED0F8338, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

id CKNSArrayFromCollection(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "allValues");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "allObjects");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = v1;
    }
  }
  v3 = v2;

  return v3;
}

void CKValidateRecordArrayValue(void *a1)
{
  id v1;
  uint64_t v2;
  Protocol *v3;
  objc_class *i;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  Protocol *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    objc_getProtocol("CKRecordValue");
    v3 = (Protocol *)objc_claimAutoreleasedReturnValue();
    for (i = (objc_class *)objc_opt_class(); i != (objc_class *)objc_opt_class(); i = class_getSuperclass(i))
    {
      if (class_conformsToProtocol(i, v3))
      {
        if (i)
          goto LABEL_10;
        break;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3940]);
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("Array members must conform to CKRecordValue: %@ (%@)"), v1, v18);
      *(_DWORD *)buf = 136315906;
      v29 = "void CKValidateRecordArrayValue(NSArray<__kindof id<CKRecordValue>> *__strong)";
      v30 = 2080;
      v31 = "FCCKRecordFieldConversion.m";
      v32 = 1024;
      v33 = 39;
      v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    i = 0;
LABEL_10:
    v20 = v3;
    v21 = (void *)v2;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v1;
    v5 = v1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = MEMORY[0x1E0C81028];
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v5);
          if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v11 = objc_alloc(MEMORY[0x1E0CB3940]);
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(i);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("Array members can't be mixed class: %@ (%@ != %@)"), v5, v13, v14, v20, v21);
            *(_DWORD *)buf = 136315906;
            v29 = "void CKValidateRecordArrayValue(NSArray<__kindof id<CKRecordValue>> *__strong)";
            v30 = 2080;
            v31 = "FCCKRecordFieldConversion.m";
            v32 = 1024;
            v33 = 44;
            v34 = 2114;
            v35 = v15;
            _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

    v1 = v22;
  }

}

double FCCGRectFromBuffer(unint64_t a1)
{
  if (a1)
    return (double)HIWORD(a1) / 65535.0;
  else
    return *MEMORY[0x1E0C9D648];
}

uint64_t PBArticleStoryTypeFromString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("topStory")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("breaking")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("developing")))
        {
          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("updated")))
          {
            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("local")))
              v3 = 0;
            else
              v3 = 5;
          }
          else
          {
            v3 = 4;
          }
        }
        else
        {
          v3 = 3;
        }
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t PBArticleRoleFromString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length") && objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("article")))
  {
    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("cover")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("campaign_landing_page")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("end-of-issue")))
        {
          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("replica-advertisement")))
          {
            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("spotlight")))
            {
              if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("feature")))
                v3 = 8 * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("audio-daily-briefing")) == 0);
              else
                v3 = 6;
            }
            else
            {
              v3 = 5;
            }
          }
          else
          {
            v3 = 4;
          }
        }
        else
        {
          v3 = 7;
        }
      }
      else
      {
        v3 = 3;
      }
    }
    else
    {
      v3 = 2;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t PBArticleContentTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("web")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("flint")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("video")))
        v2 = 0;
      else
        v2 = 3;
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t FCArticleStoryTypeForStoryTypeString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("top"))
    && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("topStory")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("breaking")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("updated")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("developing")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("local")))
            v2 = 0;
          else
            v2 = 5;
        }
        else
        {
          v2 = 3;
        }
      }
      else
      {
        v2 = 4;
      }
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

void sub_1A1BC01F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCurrentQoSOrUtilityIfMain()
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    return 17;
  else
    return FCCurrentQoS();
}

id FCGenerateOperationID()
{
  uint64_t v0;
  _BYTE v2[17];
  uint64_t v3;

  v0 = 0;
  v3 = *MEMORY[0x1E0C80C00];
  do
    v2[v0++] = aAbcdef01234567[arc4random_uniform(0x10u)];
  while (v0 != 16);
  v2[16] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t FCCurrentQoS()
{
  unint64_t v0;
  uint64_t v1;

  HIDWORD(v0) = qos_class_self() - 9;
  LODWORD(v0) = HIDWORD(v0);
  v1 = 8 * (v0 >> 3) + 9;
  if ((v0 >> 3) >= 4)
    return -1;
  else
    return v1;
}

const __CFString *FCStringFromQueuePriority(uint64_t a1)
{
  __int128 v1;
  unint64_t v2;

  *((_QWORD *)&v1 + 1) = a1;
  *(_QWORD *)&v1 = a1 + 8;
  v2 = (v1 >> 2) - 1;
  if (v2 > 3)
    return CFSTR("VeryLow");
  else
    return off_1E46464D0[v2];
}

const __CFString *FCStringFromQualityOfService(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;

  v1 = CFSTR("UserInteractive");
  v2 = CFSTR("Utility");
  v3 = CFSTR("UserInitiated");
  if (a1 != 25)
    v3 = CFSTR("UserInteractive");
  if (a1 != 17)
    v2 = v3;
  if (a1 == 9)
    v1 = CFSTR("Background");
  if (a1 == -1)
    v1 = CFSTR("Default");
  if (a1 <= 16)
    return v1;
  else
    return v2;
}

dispatch_queue_global_t FCDispatchQueueForQualityOfService(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  intptr_t v4;

  if (a1 == 33)
    v1 = 33;
  else
    v1 = 0;
  if (a1 == 25)
    v1 = 25;
  if (a1 == 17)
    v1 = 17;
  v2 = 21;
  if (a1 == 9)
    v3 = 9;
  else
    v3 = 0;
  if (a1 != -1)
    v2 = v3;
  if (a1 <= 16)
    v4 = v2;
  else
    v4 = v1;
  return dispatch_get_global_queue(v4, 0);
}

id FCHandleOperationTimeout(dispatch_time_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "timeoutQueue");
    *(_DWORD *)buf = 136315906;
    v16 = "FCOperationCancelledTest  _Nonnull FCHandleOperationTimeout(dispatch_time_t, __strong dispatch_queue_t _Nonnul"
          "l, __strong dispatch_block_t _Nonnull)";
    v17 = 2080;
    v18 = "FCBlockUtilities.m";
    v19 = 1024;
    v20 = 243;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "timeoutHandler");
    *(_DWORD *)buf = 136315906;
    v16 = "FCOperationCancelledTest  _Nonnull FCHandleOperationTimeout(dispatch_time_t, __strong dispatch_queue_t _Nonnul"
          "l, __strong dispatch_block_t _Nonnull)";
    v17 = 2080;
    v18 = "FCBlockUtilities.m";
    v19 = 1024;
    v20 = 244;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (a1 == -1)
  {
    v9 = &__block_literal_global_14_5;
  }
  else
  {
    v14 = 0;
    FCHandleOperationCancellation(&v14, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    dispatch_after(a1, v5, v8);
    v9 = _Block_copy(v7);

  }
  v10 = _Block_copy(v9);

  return v10;
}

id FCPersistenceQueue()
{
  if (qword_1ED0F87D0 != -1)
    dispatch_once(&qword_1ED0F87D0, &__block_literal_global_162);
  return (id)_MergedGlobals_209;
}

void FCPerformBlockOnMainThread(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v4 = "void FCPerformBlockOnMainThread(dispatch_block_t  _Nonnull __strong)";
    v5 = 2080;
    v6 = "FCBlockUtilities.m";
    v7 = 1024;
    v8 = 23;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v1[2](v1);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v1);

}

void sub_1A1BC2CE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FCHistoryItemIDFromArticleID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("art-%@"), a1);
}

uint64_t FCCKLocalizedRecordKey(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a1, a2);
}

id FCArticleRecordSourceAlwaysLocalizedKeysFromDesiredFieldOptions(int a1)
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", CFSTR("articleRecirculationConfigurationAsset"));
  objc_msgSend(v2, "addObject:", CFSTR("engagementCohortsBaseline"));
  objc_msgSend(v2, "addObject:", CFSTR("conversionCohortsBaseline"));
  if ((a1 & 0x100000) != 0)
  {
    v5[0] = CFSTR("stocksMetadata");
    v5[1] = CFSTR("stocksScores");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

  }
  return v2;
}

void sub_1A1BC51FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BC60BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromFCScoringType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Legacy");
  else
    return off_1E4647ED8[a1];
}

FCProxyHeadline *FCAssignSingleHeadlineMetadata(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  FCProxyHeadline *v9;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    v7 = a3;
    v8 = a2;
    v9 = -[FCProxyHeadline initWithHeadline:overrideMetadata:configuration:]([FCProxyHeadline alloc], "initWithHeadline:overrideMetadata:configuration:", v6, v8, v7);

  }
  else
  {
    v9 = (FCProxyHeadline *)v5;
  }

  return v9;
}

id FCAssignHeadlineMetadata(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v5;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __FCAssignHeadlineMetadata_block_invoke_2;
            v20[3] = &unk_1E464A0D8;
            v21 = v16;
            v22 = v7;
            FCMutateHeadlineWithBlock(v14, v20);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
      v5 = v19;
    }
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

id FCMutateHeadlineWithBlock(void *a1, void *a2)
{
  void (**v3)(id, void *);
  id v4;
  objc_class *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v6);
  return v6;
}

uint64_t FCAppConfigurationIntegerValueWithDefaultValueIfMissing(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v6)
        a4 = objc_msgSend(v5, "longLongValue");
    }

    return a4;
  }
  return a3;
}

void sub_1A1BC9F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *FCCKLocalizedArticleArticleRecirculationConfigurationKey()
{
  void *v0;
  int v1;
  __CFString *v2;
  void *v3;
  void *v4;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isContentStoreFrontSupported");

  v2 = CFSTR("articleRecirculationConfiguration");
  if (v1)
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentStoreFrontID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("articleRecirculationConfiguration"), v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id FCSupportedStoreFrontIDs()
{
  if (qword_1ED0F8560 != -1)
    dispatch_once(&qword_1ED0F8560, &__block_literal_global_329);
  return (id)qword_1ED0F8558;
}

uint64_t FCCKLocalizedLanguageSpecificRecordKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), a1, a2, a3);
}

id FCArticleRecordSourceDesiredKeysFromDesiredFieldOptions(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int HasExtendedColorDisplay;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[44];
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_new();
  HasExtendedColorDisplay = NFDeviceHasExtendedColorDisplay();
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetLQ"));
    if (HasExtendedColorDisplay)
      objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetLQ2"));
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetLQMetadata"));
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidget"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidget2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetMetadata"));
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_37:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetHQ"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetHQ2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailWidgetHQMetadata"));
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v7, "addObject:", CFSTR("title"));
  if ((a1 & 0x200000) == 0)
  {
LABEL_6:
    if ((a1 & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v7, "addObject:", CFSTR("titlesExperimental"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v7, "addObject:", CFSTR("titleCompact"));
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v7, "addObject:", CFSTR("storyType"));
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_44:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailLQ"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailLQ2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailLQMetadata"));
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_47:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnail"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnail2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailMetadata"));
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_53;
  }
LABEL_50:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailMedium"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailMedium2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailMediumMetadata"));
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_56;
  }
LABEL_53:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailHQ"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailHQ2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailHQMetadata"));
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_59;
  }
LABEL_56:
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailUltraHQ"));
  if (HasExtendedColorDisplay)
    objc_msgSend(v7, "addObject:", CFSTR("thumbnailUltraHQ2"));
  objc_msgSend(v7, "addObject:", CFSTR("thumbnailUltraHQMetadata"));
  if ((a1 & 0x800) == 0)
  {
LABEL_14:
    if ((a1 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v7, "addObject:", CFSTR("shortExcerpt"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_15:
    if ((a1 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v7, "addObject:", CFSTR("videoURL"));
  objc_msgSend(v7, "addObject:", CFSTR("videoStillImage"));
  objc_msgSend(v7, "addObject:", CFSTR("videoDuration"));
  objc_msgSend(v7, "addObject:", CFSTR("videoType"));
  objc_msgSend(v7, "addObject:", CFSTR("sportsEventIDs"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v7, "addObject:", CFSTR("isSponsored"));
  if ((a1 & 0x4000) == 0)
  {
LABEL_17:
    if ((a1 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v7, "addObject:", CFSTR("isDraft"));
  if ((a1 & 0x8000) == 0)
  {
LABEL_18:
    if ((a1 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v7, "addObject:", CFSTR("iAdCategories"));
  if ((a1 & 0x10000) == 0)
  {
LABEL_19:
    if ((a1 & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_64:
  objc_msgSend(v7, "addObject:", CFSTR("iAdKeywords"));
  if ((a1 & 0x20000) != 0)
LABEL_20:
    objc_msgSend(v7, "addObject:", CFSTR("iAdSectionTagIDs"));
LABEL_21:
  if ((a1 & 0x80000) != 0)
  {
    v17[0] = CFSTR("videoCallToActionTitle");
    v17[1] = CFSTR("videoCallToActionURL");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

    if ((a1 & 0x100000) == 0)
    {
LABEL_23:
      if ((a1 & 0x4000000) == 0)
        goto LABEL_24;
      goto LABEL_68;
    }
  }
  else if ((a1 & 0x100000) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v7, "addObject:", CFSTR("clusterIDStocks"));
  if ((a1 & 0x4000000) == 0)
  {
LABEL_24:
    if ((a1 & 1) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v7, "addObject:", CFSTR("accessoryText"));
  if ((a1 & 1) == 0)
  {
LABEL_25:
    if ((a1 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  v16[0] = CFSTR("referencedArticleID");
  v16[1] = CFSTR("coverArt");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v12);

  if ((a1 & 0x1000000) == 0)
  {
LABEL_26:
    if ((a1 & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v7, "addObject:", CFSTR("layeredCover"));
  objc_msgSend(v7, "addObject:", CFSTR("layeredCoverAspectRatio"));
  if ((a1 & 0x2000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x10000000) == 0)
      goto LABEL_28;
LABEL_72:
    objc_msgSend(v7, "addObject:", CFSTR("float16TitleEncoding"));
    if ((a1 & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_71:
  v15[0] = CFSTR("narrativeTrackMetadata");
  v15[1] = CFSTR("narrativeTrackFullURL");
  v15[2] = CFSTR("narrativeTrackSampleURL");
  v15[3] = CFSTR("narrativeTrackTextRanges");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v13);

  if ((a1 & 0x10000000) != 0)
    goto LABEL_72;
LABEL_28:
  if ((a1 & 0x20000000) != 0)
LABEL_29:
    objc_msgSend(v7, "addObject:", CFSTR("float16FullBodyEncoding"));
LABEL_30:
  v14[0] = CFSTR("thumbnailFocalFrame");
  v14[1] = CFSTR("thumbnailPerceptualHash");
  v14[2] = CFSTR("publishDate");
  v14[3] = CFSTR("isPaid");
  v14[4] = CFSTR("isBundlePaid");
  v14[5] = CFSTR("isFeature");
  v14[6] = CFSTR("sourceChannelTagID");
  v14[7] = CFSTR("publisherArticleVersion");
  v14[8] = CFSTR("backendArticleVersion");
  v14[9] = CFSTR("contentType");
  v14[10] = CFSTR("contentURL");
  v14[11] = CFSTR("clusterID");
  v14[12] = CFSTR("blockedStorefrontIDs");
  v14[13] = CFSTR("allowedStorefrontIDs");
  v14[14] = CFSTR("primaryAudience");
  v14[15] = CFSTR("behaviorFlags");
  v14[16] = CFSTR("minNewsVersion");
  v14[17] = CFSTR("topicTagIDs");
  v14[18] = CFSTR("scoresTopicTagIDs");
  v14[19] = CFSTR("relatedArticleIDs2");
  v14[20] = CFSTR("moreFromPublisherArticleIDs");
  v14[21] = CFSTR("articleID");
  v14[22] = CFSTR("articleETag");
  v14[23] = CFSTR("articleModDate");
  v14[24] = CFSTR("flintDocument");
  v14[25] = CFSTR("flintFontResourceIDs");
  v14[26] = CFSTR("publisherSpecifiedArticleIDs");
  v14[27] = CFSTR("parentIssueID");
  v14[28] = CFSTR("language");
  v14[29] = CFSTR("role");
  v14[30] = CFSTR("halfLifeMillis");
  v14[31] = CFSTR("halfLifeMillisOverride");
  v14[32] = CFSTR("linkedArticleIDs");
  v14[33] = CFSTR("linkedIssueIDs");
  v14[34] = CFSTR("isIssueOnly");
  v14[35] = CFSTR("bodyTextLength");
  v14[36] = CFSTR("thumbnailPrimaryColor");
  v14[37] = CFSTR("thumbnailBackgroundColor");
  v14[38] = CFSTR("thumbnailTextColor");
  v14[39] = CFSTR("thumbnailAccentColor");
  v14[40] = CFSTR("authors");
  v14[41] = CFSTR("expirationData");
  v14[42] = CFSTR("routeURL");
  v14[43] = CFSTR("schemaFlags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(v7, "fc_safelyAddObject:", v6);
  objc_msgSend(v7, "fc_safelyAddObject:", v5);

  return v7;
}

void sub_1A1BD0478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD1198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD1480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD160C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD16F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD17C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD1898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD1968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD2A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BD4458(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 248));
  _Unwind_Resume(a1);
}

void sub_1A1BD5370(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 240));
  _Unwind_Resume(a1);
}

void sub_1A1BD5B74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2 == 1)
  {
    v10 = objc_begin_catch(exception_object);
    if (objc_msgSend(v10, "errorCode") == 1006 || objc_msgSend(v10, "errorCode") == 1009)
    {
      v11 = (void *)MEMORY[0x1E0C94EA8];
      objc_msgSend(v10, "reason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithCode:format:", 1009, CFSTR("Invalid predicate: %@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1000, CFSTR("Unknown error %@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }

    if (v9)
      *v9 = objc_retainAutorelease(v13);

    objc_end_catch();
    JUMPOUT(0x1A1BD599CLL);
  }
  _Unwind_Resume(exception_object);
}

id CKVerifyFilters(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v6)
          v6 = (_QWORD *)v6[1];
        v7 = v6;
        objc_msgSend(v7, "name", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        CKAllowedSystemFieldNames();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) != 0 || !v8)
        {

          goto LABEL_15;
        }
        CKValidateKeyName();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_16;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
LABEL_15:
    v11 = 0;
  }
LABEL_16:

  return v11;
}

id CKAllowedSystemFieldNames()
{
  if (qword_1ED0F8330 != -1)
    dispatch_once(&qword_1ED0F8330, &__block_literal_global_84);
  return (id)_MergedGlobals_169;
}

__CFString *FCDefaultClientAPIBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AD18[a1 - 1];
}

const __CFString *FCDefaultCKEdgeCacheURLStringForEnvironment()
{
  return CFSTR("https://gateway.icloud.com:443/ckdatabase");
}

__CFString *FCDefaultFairPlayBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AC88[a1 - 1];
}

uint64_t FCDefaultCKQueryURLStringForEnvironment()
{
  return objc_msgSend(CFSTR("https://gateway.icloud.com:443/ckdatabase"), "stringByAppendingPathComponent:", CFSTR("api/client/query/retrieve"));
}

uint64_t FCDefaultCKFetchURLStringForEnvironment()
{
  return objc_msgSend(CFSTR("https://gateway.icloud.com:443/ckdatabase"), "stringByAppendingPathComponent:", CFSTR("api/client/record/retrieve"));
}

__CFString *FCDefaultNotificationsBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AD18[a1 - 1];
}

__CFString *FCDefaultNewsletterAPIBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464ACB8[a1 - 1];
}

void sub_1A1BD7C10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A1BD8020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id *v10;

  operator delete(v10);
  _Unwind_Resume(a1);
}

void sub_1A1BD91C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1BD92FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void FCPerformIfNonNil(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, id);
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v7 = "void FCPerformIfNonNil(id  _Nullable __strong, FCidBlock  _Nonnull __strong)";
    v8 = 2080;
    v9 = "FCBlockUtilities.m";
    v10 = 1024;
    v11 = 37;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v3)
LABEL_4:
    v4[2](v4, v3);
LABEL_5:

}

void sub_1A1BD9764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void FCDispatchAsyncWithQualityOfService(void *a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a1;
  FCBlockWithQualityOfService(a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v6);

}

id FCBlockWithQualityOfService(uint64_t a1, dispatch_block_t block)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  dispatch_qos_class_t v8;
  dispatch_block_t v9;
  void *v10;

  if (a1 == 33)
    v3 = 33;
  else
    v3 = 0;
  if (a1 == 25)
    v4 = 25;
  else
    v4 = v3;
  if (a1 == 17)
    v5 = 17;
  else
    v5 = v4;
  if (a1 == 9)
    v6 = 9;
  else
    v6 = 0;
  if (a1 == -1)
    v7 = 21;
  else
    v7 = v6;
  if (a1 <= 16)
    v8 = v7;
  else
    v8 = v5;
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  v10 = _Block_copy(v9);

  return v10;
}

uint64_t FCHigherQualityOfService(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = -1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (result != 33)
    v5 = -1;
  if (result != 25)
    v4 = v5;
  if (result != 17)
    v3 = v4;
  if (result == 9)
    v2 = 1;
  if (result == -1)
    v2 = 0;
  if (result > 16)
    v2 = v3;
  v6 = -1;
  v7 = 2;
  v8 = 3;
  v9 = 4;
  if (a2 != 33)
    v9 = -1;
  if (a2 != 25)
    v8 = v9;
  if (a2 != 17)
    v7 = v8;
  if (a2 == 9)
    v6 = 1;
  if (a2 == -1)
    v6 = 0;
  if (a2 > 16)
    v6 = v7;
  if (v2 <= v6)
    return a2;
  return result;
}

void sub_1A1BD9E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Unwind_Resume(a1);
}

uint64_t FCDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a2;
  return 0;
}

void sub_1A1BDB914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BDBC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BDC3F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL FCDispatchGroupIsEmpty(void *a1)
{
  NSObject *v1;
  _BOOL8 v2;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "group");
    *(_DWORD *)buf = 136315906;
    v6 = "BOOL FCDispatchGroupIsEmpty(dispatch_group_t  _Nonnull __strong)";
    v7 = 2080;
    v8 = "FCBlockUtilities.m";
    v9 = 1024;
    v10 = 168;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v2 = dispatch_group_wait(v1, 0) == 0;

  return v2;
}

void sub_1A1BDD648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BDD714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BDDAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 248), 8);
  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t FCFDBInvokeStep(sqlite3 *a1, sqlite3_stmt *a2)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_step(a2);
  if ((v3 & 0xFFFFFFFE) != 0x64 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("sqlite3 step failed with result=%d, error=%@"), v3, v6);
    *(_DWORD *)buf = 136315906;
    v9 = "int FCFDBInvokeStep(sqlite3 *, sqlite3_stmt *)";
    v10 = 2080;
    v11 = "FCFDBUtilities.m";
    v12 = 1024;
    v13 = 48;
    v14 = 2114;
    v15 = v7;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBStepFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v3;
}

uint64_t FCFDBInvokePrepare(sqlite3 *a1, id a2, sqlite3_stmt **a3)
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_prepare_v2(a1, (const char *)objc_msgSend(objc_retainAutorelease(a2), "cStringUsingEncoding:", 4), -1, a3, 0);
  if ((_DWORD)v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("sqlite3 prepare failed with result=%d, error=%@"), v4, v7);
    *(_DWORD *)buf = 136315906;
    v10 = "int FCFDBInvokePrepare(sqlite3 *, NSString *__strong, sqlite3_stmt **)";
    v11 = 2080;
    v12 = "FCFDBUtilities.m";
    v13 = 1024;
    v14 = 41;
    v15 = 2114;
    v16 = v8;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBPrepareFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v4;
}

uint64_t FCFDBInvokeFinalize(sqlite3 *a1, sqlite3_stmt *pStmt)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_finalize(pStmt);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("sqlite3 finalize failed with result=%d, error=%@"), v3, v6);
    *(_DWORD *)buf = 136315906;
    v9 = "int FCFDBInvokeFinalize(sqlite3 *, sqlite3_stmt *)";
    v10 = 2080;
    v11 = "FCFDBUtilities.m";
    v12 = 1024;
    v13 = 55;
    v14 = 2114;
    v15 = v7;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBFinalizeFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v3;
}

id FCAppConfigurationArrayValueWithDefaultValue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v9 = v7,
          v7 == v8))
    {
      v9 = v6;
    }
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

uint64_t FCChannelUpsellTriggerMethodForValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("TriggerMethodHardFollow")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("TriggerMethodChannelFeedEntry")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("TriggerMethodArticleOpenDaily")))
        {
          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("TriggerMethodArticleOpenWeekly")))
          {
            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("TriggerMethodArticleOpenMonthly")))
              v3 = 0;
            else
              v3 = 5;
          }
          else
          {
            v3 = 4;
          }
        }
        else
        {
          v3 = 3;
        }
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FCEmailSignupStyleForValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("EmailSignupStyleLandingPage")))
      v3 = 2 * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("EmailSignupStyleAlert")) == 0);
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FCEndpointEnvironmentForEnvironment(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRODUCTION")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("STAGING")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("QA")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TEST")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DEVEL")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SANDBOX")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DEMO1")) & 1) != 0)
  {
    v2 = 8;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("DEMO2")))
  {
    v2 = 9;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id FCAnalyticsEnvelopeContentTypeConfigsByContentType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_opt_new();
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:error:", v4, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v20;
  v8 = v7;
  if (v4 && !v7)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:error:", v3, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    v8 = v10;
    if (v3 && !v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("config"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("urls"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __FCAnalyticsEnvelopeContentTypeConfigsByContentType_block_invoke;
        v16[3] = &unk_1E4642D88;
        v17 = v12;
        v18 = v5;
        v13 = v12;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

      }
    }

  }
  v14 = v5;

  return v14;
}

id FCAppConfigurationDictionaryValueWithOverride(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = a3;
  NewsCoreUserDefaults();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", v10);

  if (NFInternalBuild() && v12)
  {
    NewsCoreUserDefaults();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
      if (!v17)
      {

        goto LABEL_10;
      }
      v18 = v17;
      v19 = FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v18;
        _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "Failed to parse debug override value for %@ error: %@", buf, 0x16u);
      }

    }
  }
  FCAppConfigurationDictionaryValueWithDefaultValue(v7, (uint64_t)v8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v16;
}

void sub_1A1BE7638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCFDBInvokeOpen(const char *a1, sqlite3 **a2)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_open_v2(a1, a2, 32774, 0);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(*a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("sqlite3 open failed with result=%d, error=%@"), v3, v6);
    *(_DWORD *)buf = 136315906;
    v9 = "int FCFDBInvokeOpen(const char *, sqlite3 **, int)";
    v10 = 2080;
    v11 = "FCFDBUtilities.m";
    v12 = 1024;
    v13 = 20;
    v14 = 2114;
    v15 = v7;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBOpenFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v3;
}

uint64_t FCFDBInvokeExec(sqlite3 *a1, const char *a2)
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_exec(a1, a2, 0, 0, 0);
  if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("sqlite3 exec failed with result=%d, error=%@"), v3, v6);
    *(_DWORD *)buf = 136315906;
    v9 = "int FCFDBInvokeExec(sqlite3 *, const char *)";
    v10 = 2080;
    v11 = "FCFDBUtilities.m";
    v12 = 1024;
    v13 = 34;
    v14 = 2114;
    v15 = v7;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBExecFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v3;
}

void sub_1A1BEA158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCVisitLocallyPrunableHistoryItems(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a1;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_dateBySubtractingTimeInterval:", 7776000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_dateBySubtractingTimeInterval:", 864000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCVisitLocallyPrunableHistoryItems_block_invoke;
  aBlock[3] = &unk_1E463A950;
  v18 = v7;
  v19 = v8;
  v10 = v8;
  v11 = v7;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __FCVisitLocallyPrunableHistoryItems_block_invoke_2;
  v14[3] = &unk_1E4645A98;
  v15 = _Block_copy(aBlock);
  v16 = v3;
  v12 = v3;
  v13 = v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

}

unint64_t FCDesiredTagRecordFieldOptionsWithHeadlineFieldOptions(unint64_t a1)
{
  uint64x2_t v1;
  int8x16_t v2;
  int8x16_t v3;
  uint64_t v4;
  int8x16_t v5;
  int8x8_t v6;

  v1 = (uint64x2_t)vdupq_n_s64(a1);
  v2 = (int8x16_t)vshlq_u64(v1, (uint64x2_t)xmmword_1A1E82530);
  v3 = (int8x16_t)vshlq_u64(v1, (uint64x2_t)xmmword_1A1E82540);
  v4 = v3.i8[0] & 2;
  v5 = vorrq_s8(vandq_s8(v2, (int8x16_t)xmmword_1A1E82560), vandq_s8(v3, (int8x16_t)xmmword_1A1E82550));
  v6 = vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
  if ((*(_QWORD *)&v6 & 0xFFFFFFFFFFFFFF7FLL) != 0)
    return (a1 >> 18) & 0x200 | (a1 >> 24) & 0x400 | v4 & 0xFFFFFFFFFFFFFF9ELL | (32 * ((a1 >> 4) & 3)) | a1 & 1 | *(_QWORD *)&v6 | 0x11C;
  else
    return (a1 >> 18) & 0x200 | (a1 >> 24) & 0x400 | v4 & 0xFFFFFFFFFFFFFF9ELL | (32 * ((a1 >> 4) & 3)) | a1 & 1 | *(_QWORD *)&v6;
}

id FCTagRecordSourceDesiredKeysFromDesiredFieldOptions(unint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  _QWORD v9[28];
  _QWORD v10[2];
  _QWORD v11[29];

  v11[28] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = v2;
  v4 = (a1 >> 2) & 1;
  if ((a1 & 4) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("nameImage"));
    if ((a1 & 8) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("nameImageForDarkBackground"));
  LODWORD(v4) = 1;
  if ((a1 & 0x10) == 0)
  {
LABEL_4:
    if ((a1 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("nameImageMask"));
  objc_msgSend(v3, "addObject:", CFSTR("nameImageMetadata"));
  LODWORD(v4) = 1;
  if ((a1 & 0x20) == 0)
  {
LABEL_5:
    if ((a1 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "addObject:", CFSTR("nameImageMaskWidgetSmall"));
  if ((a1 & 0x40) == 0)
  {
LABEL_6:
    if ((a1 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_18:
  objc_msgSend(v3, "addObject:", CFSTR("nameImageMaskWidgetLarge"));
  if ((a1 & 0x80) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("nameCompact"));
LABEL_8:
  if ((a1 & 0x100) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("nameImageCompact"));
    objc_msgSend(v3, "addObject:", CFSTR("nameImageCompactMetadata"));
    if ((a1 & 1) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  if ((a1 & 1) != 0)
  {
LABEL_21:
    v11[0] = CFSTR("hideAccessoryText");
    v11[1] = CFSTR("publisherPaidAuthorizationURL");
    v11[2] = CFSTR("publisherPaidVerificationURL");
    v11[3] = CFSTR("publisherPaidWebAccessURL");
    v11[4] = CFSTR("publisherPaidLeakyPaywallOptOut");
    v11[5] = CFSTR("publisherPaidFeldsparablePurchaseIDs");
    v11[6] = CFSTR("publisherPaidBundlePurchaseIDs");
    v11[7] = CFSTR("logoImage");
    v11[8] = CFSTR("sectionTagIDs");
    v11[9] = CFSTR("iAdCategories");
    v11[10] = CFSTR("iAdKeywords");
    v11[11] = CFSTR("coverImage");
    v11[12] = CFSTR("feedNavImage");
    v11[13] = CFSTR("feedNavImageHQ");
    v11[14] = CFSTR("sportsTheme");
    v11[15] = CFSTR("sportsLogoImage");
    v11[16] = CFSTR("sportsLogoImageCompact");
    v11[17] = CFSTR("sportsLogoImageLarge");
    v11[18] = CFSTR("nameImageLarge");
    v11[19] = CFSTR("navigationChromeBackgroundImage");
    v11[20] = CFSTR("navigationChromeBackgroundDarkModeImage");
    v11[21] = CFSTR("navigationChromeBackgroundImageCompact");
    v11[22] = CFSTR("navigationChromeBackgroundDarkModeImageCompact");
    v11[23] = CFSTR("navigationChromeBackgroundImageLarge");
    v11[24] = CFSTR("navigationChromeBackgroundDarkModeImageLarge");
    v11[25] = CFSTR("sportsLogoAltImage");
    v11[26] = CFSTR("sportsLogoAltImageCompact");
    v11[27] = CFSTR("sportsLogoAltImageLarge");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

LABEL_22:
    v10[0] = CFSTR("nameImageScaleFactor");
    v10[1] = CFSTR("nameImageBaselineShift");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

    if ((a1 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if ((_DWORD)v4)
    goto LABEL_22;
  if ((a1 & 0x400) != 0)
LABEL_12:
    objc_msgSend(v3, "addObject:", CFSTR("template"));
LABEL_13:
  v9[0] = CFSTR("type");
  v9[1] = CFSTR("contentProvider");
  v9[2] = CFSTR("isPublic");
  v9[3] = CFSTR("isDeprecated");
  v9[4] = CFSTR("replacementID");
  v9[5] = CFSTR("parent");
  v9[6] = CFSTR("defaultSectionTagID");
  v9[7] = CFSTR("blockedStorefrontIDs");
  v9[8] = CFSTR("allowedStorefrontIDs");
  v9[9] = CFSTR("minNewsVersion");
  v9[10] = CFSTR("isNotificationEnabled");
  v9[11] = CFSTR("score");
  v9[12] = CFSTR("primaryAudience");
  v9[13] = CFSTR("behaviorFlags");
  v9[14] = CFSTR("propertyFlags");
  v9[15] = CFSTR("subtitle");
  v9[16] = CFSTR("latestIssueIDs");
  v9[17] = CFSTR("archiveIssueListID");
  v9[18] = CFSTR("language");
  v9[19] = CFSTR("magazineGenre");
  v9[20] = CFSTR("publisherSpecifiedArticleIDsModifiedDate");
  v9[21] = CFSTR("publisherSpecifiedArticles");
  v9[22] = CFSTR("superGroupKnobs");
  v9[23] = CFSTR("superGroupConfig");
  v9[24] = CFSTR("recentIssueIDs");
  v9[25] = CFSTR("highlightsArticleListID");
  v9[26] = CFSTR("subscriptionRate");
  v9[27] = CFSTR("adTargetingKeywords");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

void sub_1A1BF0364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCAppConfigurationNumberValue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v9 = v7,
          v7 == v8))
    {
      v9 = v6;
    }
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

id NewsCoreSensitiveUserDefaults()
{
  if (qword_1ED0F8550 != -1)
    dispatch_once(&qword_1ED0F8550, &__block_literal_global_4_3);
  return (id)qword_1ED0F8548;
}

void sub_1A1BFBE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFC0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFC788(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A1BFCF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  id *v57;
  uint64_t v58;

  objc_destroyWeak(v57);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v58 - 256), 8);
  _Unwind_Resume(a1);
}

const __CFString *FCStringFromBundleSubscriptionCachePolicy(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("CachedIfNotThenNetwork");
  else
    return off_1E4644790[a1 - 1];
}

void sub_1A1BFD0C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1BFD7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFD8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFDA80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void FCCoreConfigurationFetch(void *a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  objc_msgSend(v7, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "isDefaultConfiguration") & 1) == 0)
  {
    if (v3)
      v3[2](v3, v4, 0);
  }
  else
  {
    v5 = FCCurrentQoSOrUtilityIfMain();
    FCDispatchQueueForQualityOfService(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchConfigurationIfNeededWithCompletionQueue:completion:", v6, v3);

  }
}

void sub_1A1BFEDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFEEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1BFF09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

const __CFString *FCStringFromNetworkEventType(int a1)
{
  const __CFString *result;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 0:
      result = CFSTR("Unknown");
      break;
    case 1:
      result = CFSTR("CloudKit (Private) - Fetch Records");
      break;
    case 2:
      result = CFSTR("CloudKit (Private) - Modify Records");
      break;
    case 3:
      result = CFSTR("CloudKit (Private) - Fetch Zones");
      break;
    case 4:
      result = CFSTR("CloudKit (Private) - Modify Zones");
      break;
    case 5:
      result = CFSTR("CloudKit (Private) - Fetch Subscriptions");
      break;
    case 6:
      result = CFSTR("CloudKit (Private) - Modify Subscriptions");
      break;
    case 7:
      result = CFSTR("CloudKit (Private) - Fetch Zone Changes");
      break;
    case 8:
      result = CFSTR("CloudKit (Private) - Fetch Database Changes");
      break;
    case 9:
      result = CFSTR("CloudKit (Public) - Fetch");
      break;
    case 10:
      result = CFSTR("CloudKit (Public) - OrderFeed");
      break;
    case 11:
      result = CFSTR("CloudKit (Public) - MultiFeed");
      break;
    case 12:
      result = CFSTR("CloudKit (Public) - MultiFetch");
      break;
    case 13:
      result = CFSTR("CloudKit (Public) - TagSearch");
      break;
    case 14:
      result = CFSTR("CloudKit (Public) - Today Config");
      break;
    case 15:
      result = CFSTR("CDN");
      break;
    case 16:
      result = CFSTR("CDN - App Config");
      break;
    case 17:
      result = CFSTR("CVWS");
      break;
    case 18:
      result = CFSTR("News Edge - App Config");
      break;
    case 19:
      result = CFSTR("News Edge - Search");
      break;
    case 20:
      result = CFSTR("News Edge - Today Config");
      break;
    case 21:
      result = CFSTR("News Edge - Puzzle Archive");
      break;
    case 22:
      result = CFSTR("News Edge - Widget Config");
      break;
    case 23:
      result = CFSTR("News Edge - Widget Config & Today Config Lite");
      break;
    case 24:
      result = CFSTR("Auth Token Service");
      break;
    case 25:
      result = CFSTR("Sports Data Service");
      break;
    case 26:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
        v3 = 136315906;
        v4 = "NSString * _Nonnull FCStringFromNetworkEventType(FCNetworkEventType)";
        v5 = 2080;
        v6 = "FCNetworkEvent.m";
        v7 = 1024;
        v8 = 439;
        v9 = 2114;
        v10 = v2;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

      }
      goto LABEL_30;
    default:
LABEL_30:
      result = 0;
      break;
  }
  return result;
}

id FCURLForContainerizedUserAccountCachesDirectory(char a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this function is only supported for containerized processes"));
    v3 = 136315906;
    v4 = "NSURL *FCURLForContainerizedUserAccountCachesDirectory(BOOL)";
    v5 = 2080;
    v6 = "FCFileURLs.m";
    v7 = 1024;
    v8 = 61;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
  if (qword_1ED0F80B0 != -1)
    dispatch_once(&qword_1ED0F80B0, &__block_literal_global_61);
  return (id)_MergedGlobals_161;
}

void sub_1A1C03728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCDispatchGroupWrap(void *a1, void *a2)
{
  NSObject *v3;
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD *);
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "group");
    *(_DWORD *)buf = 136315906;
    v12 = "void FCDispatchGroupWrap(__strong dispatch_group_t _Nonnull, void (^__strong _Nonnull)(__strong dispatch_block_t))";
    v13 = 2080;
    v14 = "FCBlockUtilities.m";
    v15 = 1024;
    v16 = 270;
    v17 = 2114;
    v18 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v12 = "void FCDispatchGroupWrap(__strong dispatch_group_t _Nonnull, void (^__strong _Nonnull)(__strong dispatch_block_t))";
    v13 = 2080;
    v14 = "FCBlockUtilities.m";
    v15 = 1024;
    v16 = 271;
    v17 = 2114;
    v18 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  dispatch_group_enter(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __FCDispatchGroupWrap_block_invoke;
  v9[3] = &unk_1E463AB18;
  v10 = v3;
  v5 = (void (*)(_QWORD *, _QWORD *))v4[2];
  v6 = v3;
  v5(v4, v9);

}

void sub_1A1C049D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C06F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C0AF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C0B6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C0DF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C0E004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C0E818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCFeedPersonalizing.score(items:options:)(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  int64_t v47;
  id v48;
  _BYTE v49[40];
  uint64_t v50;
  _OWORD v51[2];
  __int128 v52;
  _OWORD v53[2];
  __int128 v54;
  void *v55;

  v3 = a1;
  if (a1 >> 62)
  {
LABEL_50:
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A30);
    v43 = sub_1A1E551EC();
    swift_bridgeObjectRelease();
    v3 = v43;
  }
  else
  {
    v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    sub_1A1E5521C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A30);
    if (!swift_dynamicCastMetatype())
    {
      v41 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v41)
      {
        v42 = v4 + 32;
        while (1)
        {
          v55 = &unk_1EE660020;
          if (!swift_dynamicCastObjCProtocolConditional())
            break;
          v42 += 8;
          if (!--v41)
            goto LABEL_3;
        }
        v3 = v4 | 1;
      }
    }
  }
LABEL_3:
  v5 = FCFeedPersonalizing.sort(items:options:)(v3, a2);
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v5, sel_scoreProfiles);

  v7 = objc_msgSend(v6, sel_dictionaryRepresentation);
  sub_1A1C4A864();
  v8 = MEMORY[0x1E0DEC198];
  a2 = sub_1A1E5515C();

  v45 = a2 + 64;
  v9 = 1 << *(_BYTE *)(a2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a2 + 64);
  v46 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v44 = a2;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v12 << 6);
    }
    else
    {
      v17 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_47;
      if (v17 >= v46)
      {
LABEL_39:
        swift_release();
        swift_bridgeObjectRelease();
        return (uint64_t)v13;
      }
      v18 = *(_QWORD *)(v45 + 8 * v17);
      ++v12;
      if (!v18)
      {
        v12 = v17 + 1;
        if (v17 + 1 >= v46)
          goto LABEL_39;
        v18 = *(_QWORD *)(v45 + 8 * v12);
        if (!v18)
        {
          v12 = v17 + 2;
          if (v17 + 2 >= v46)
            goto LABEL_39;
          v18 = *(_QWORD *)(v45 + 8 * v12);
          if (!v18)
          {
            v12 = v17 + 3;
            if (v17 + 3 >= v46)
              goto LABEL_39;
            v18 = *(_QWORD *)(v45 + 8 * v12);
            if (!v18)
            {
              v19 = v17 + 4;
              if (v19 >= v46)
                goto LABEL_39;
              v18 = *(_QWORD *)(v45 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_49;
                  if (v12 >= v46)
                    goto LABEL_39;
                  v18 = *(_QWORD *)(v45 + 8 * v12);
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v12 = v19;
            }
          }
        }
      }
LABEL_26:
      v11 = (v18 - 1) & v18;
      v16 = __clz(__rbit64(v18)) + (v12 << 6);
    }
    sub_1A1C0F260(*(_QWORD *)(a2 + 48) + 40 * v16, (uint64_t)v53);
    v20 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v16);
    *((_QWORD *)&v54 + 1) = v20;
    v51[0] = v53[0];
    v51[1] = v53[1];
    v52 = v54;
    sub_1A1C0F260((uint64_t)v51, (uint64_t)v49);
    v50 = *((_QWORD *)&v52 + 1);
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A30);
    if (swift_dynamicCast())
      break;
LABEL_8:
    sub_1A1C0FEAC((uint64_t)v51);
  }
  v47 = v12;
  a2 = v8;
  v22 = objc_msgSend(v48, sel_itemID);
  v23 = sub_1A1E55174();
  v25 = v24;

  sub_1A1C0F260((uint64_t)v51, (uint64_t)v49);
  v50 = *((_QWORD *)&v52 + 1);
  v26 = *((id *)&v52 + 1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v48 = v13;
  v29 = sub_1A1C0F984(v23, v25);
  v30 = v13[2];
  v31 = (v28 & 1) == 0;
  v32 = v30 + v31;
  if (__OFADD__(v30, v31))
  {
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v33 = v28;
  if (v13[3] >= v32)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v28 & 1) == 0)
      {
LABEL_35:
        v13[(v29 >> 6) + 8] |= 1 << v29;
        v36 = (uint64_t *)(v13[6] + 16 * v29);
        *v36 = v23;
        v36[1] = v25;
        *(_QWORD *)(v13[7] + 8 * v29) = v26;
        v37 = v13[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_48;
        v13[2] = v39;
        swift_bridgeObjectRetain();
        goto LABEL_7;
      }
    }
    else
    {
      sub_1A1C4C5AC();
      if ((v33 & 1) == 0)
        goto LABEL_35;
    }
LABEL_6:
    v14 = v13[7];

    *(_QWORD *)(v14 + 8 * v29) = v26;
LABEL_7:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1A1C0FE78((uint64_t)v49);
    a2 = v44;
    v12 = v47;
    goto LABEL_8;
  }
  sub_1A1C10124(v32, isUniquelyReferenced_nonNull_native);
  v34 = sub_1A1C0F984(v23, v25);
  if ((v33 & 1) == (v35 & 1))
  {
    v29 = v34;
    if ((v33 & 1) == 0)
      goto LABEL_35;
    goto LABEL_6;
  }
  result = sub_1A1E55228();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A85810F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A1C0F260(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_1A1C0F984(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A1E55270();
  sub_1A1E55180();
  v4 = sub_1A1E55288();
  return sub_1A1C0F9E8(a1, a2, v4);
}

unint64_t sub_1A1C0F9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A1E55210() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1A1E55210() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A1C0FE78(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1A1C0FEAC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A1C10124(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A48);
  v38 = a2;
  v6 = sub_1A1E55204();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1A1E55270();
    sub_1A1E55180();
    result = sub_1A1E55288();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void FCFlattenArrayToArray(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          FCFlattenArrayToArray(v9, v4);
        else
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void sub_1A1C10DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C1612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C162D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C16C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCHeadlinesByArticleIDFromHeldRecords(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  FCHeadlineExperimentalTitleProvider *v21;
  void *v22;
  void *v23;
  FCHeadlineExperimentalTitleProvider *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  FCHeadlineExperimentalTitleProvider *v38;
  uint64_t v39;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  FCIssuesWithHeldRecords(v16, a6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8)
    v21 = -[FCHeadlineExperimentalTitleProvider initWithShouldShowAlternateHeadlines:]([FCHeadlineExperimentalTitleProvider alloc], "initWithShouldShowAlternateHeadlines:", objc_msgSend(v15, "shouldShowAlternateHeadlines"));
  else
    v21 = 0;
  v22 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v17, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __FCHeadlinesByArticleIDFromHeldRecords_block_invoke;
  v32[3] = &unk_1E4644488;
  v33 = v15;
  v34 = v16;
  v35 = v18;
  v36 = v19;
  v38 = v21;
  v39 = a7;
  v37 = v20;
  v24 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v16;
  v29 = v15;
  objc_msgSend(v22, "fc_dictionaryWithKeys:allowingNil:valueBlock:", v23, 1, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

id FCIssuesWithHeldRecords(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager");
    *(_DWORD *)buf = 136315906;
    v18 = "NSDictionary<NSString *,FCIssue *> *FCIssuesWithHeldRecords(FCAssetManager *__strong, FCHeldRecords<NTPBIssueR"
          "ecord *> *__strong, NSDictionary<NSString *,id<FCChannelProviding>> *__strong)";
    v19 = 2080;
    v20 = "FCArticleHeadlineUtilities.m";
    v21 = 1024;
    v22 = 81;
    v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __FCIssuesWithHeldRecords_block_invoke;
  v14[3] = &unk_1E463F050;
  v15 = v7;
  v16 = v5;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v6, "transformRecordsWithBlock:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_dictionaryWithKeySelector:", sel_identifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1A1C18120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C189E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C18B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C18FF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1C19330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C19C50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1C19FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id FCBundle()
{
  if (qword_1ED0F7D38 != -1)
    dispatch_once(&qword_1ED0F7D38, &__block_literal_global_2);
  return (id)_MergedGlobals_136;
}

uint64_t FCCKPResponseOperationResultReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  FCCKPResponseOperationResultError *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(FCCKPResponseOperationResultError);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark()
          || (FCCKPResponseOperationResultErrorReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPOperationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  BOOL v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_46:
          *(_DWORD *)(a1 + 16) = v22;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_50:
          v38 = v28 != 0;
          v39 = 21;
          goto LABEL_55;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_52;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_54:
      v38 = v34 != 0;
      v39 = 20;
LABEL_55:
      *(_BYTE *)(a1 + v39) = v38;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPResponseOperationResultErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPResponseOperationResultErrorClient *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(FCCKPResponseOperationResultErrorClient);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (PBReaderPlaceMark()
          && (FCCKPResponseOperationResultErrorClientReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_39;
        }
        goto LABEL_46;
      case 2u:
        v17 = objc_alloc_init(FCCKPResponseOperationResultErrorServer);
        objc_storeStrong((id *)(a1 + 48), v17);
        if (!PBReaderPlaceMark()
          || (FCCKPResponseOperationResultErrorServerReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 3u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if (v23 < 0)
            {
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 40) = v20;
        goto LABEL_44;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
        goto LABEL_34;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
LABEL_34:
        v26 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_44;
      case 7u:
        v17 = objc_alloc_init(FCCKPResponseOperationResultErrorExtension);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark()
          && (FCCKPResponseOperationResultErrorExtensionReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t FCCKPResponseOperationResultErrorServerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCKPRecordRetrieveResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPRecord *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_BYTE *)(a1 + 16) = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !FCCKPRecordReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A1C24824(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1C25440(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1C25DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  id *v37;
  uint64_t v38;

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v38 - 224), 8);
  _Block_object_dispose((const void *)(v38 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C26A50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 248));
  _Unwind_Resume(a1);
}

void sub_1A1C27494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A1C29348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FCCoreConfigurationPromise(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager");
    *(_DWORD *)buf = 136315906;
    v10 = "NFPromise<id<FCCoreConfiguration>> *FCCoreConfigurationPromise(__strong id<FCCoreConfigurationManager>)";
    v11 = 2080;
    v12 = "FCCoreConfigurationManager.m";
    v13 = 1024;
    v14 = 13;
    v15 = 2114;
    v16 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FCCoreConfigurationPromise_block_invoke;
  v7[3] = &unk_1E463DAD0;
  v8 = v1;
  v3 = v1;
  v4 = (void *)objc_msgSend(v2, "initWithResolver:", v7);

  return v4;
}

uint64_t FCAppConfigurationPositiveIntegerValue(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5 && (objc_msgSend(v4, "longLongValue") & 0x8000000000000000) == 0)
        a3 = objc_msgSend(v4, "longLongValue");
    }

  }
  return a3;
}

id FCURLForAppConfigurationMirror()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForGroupContainerForEnvironment(CFSTR("group.com.apple.news"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("appConfigurationMirror"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FCURLForGroupContainerForEnvironment(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "groupIdentifier");
    *(_DWORD *)buf = 136315906;
    v13 = "NSURL *FCURLForGroupContainerForEnvironment(NSString *__strong, NSString *__strong)";
    v14 = 2080;
    v15 = "FCFileURLs.m";
    v16 = 1024;
    v17 = 228;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "environmentIdentifier");
    *(_DWORD *)buf = 136315906;
    v13 = "NSURL *FCURLForGroupContainerForEnvironment(NSString *__strong, NSString *__strong)";
    v14 = 2080;
    v15 = "FCFileURLs.m";
    v16 = 1024;
    v17 = 229;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  FCURLForGroupIdentifier(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v11);

  return v6;
}

id FCURLForGroupIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3620];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A1C2E658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FCURLForTodayPersonalizationUpdateStore()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("todayPersonalizationUpdateStore"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FCURLForTodayPrivateDataTransactionQueue()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("todayPrivateDataTransactionQueue"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FCURLForTodayDropbox()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("todayWidgetDropboxData"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A1C30184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FCURLForNotificationDropbox()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("notificationDropboxData"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "environmentIdentifier");
    *(_DWORD *)buf = 136315906;
    v9 = "NSURL *FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(NSString *__strong)";
    v10 = 2080;
    v11 = "FCFileURLs.m";
    v12 = 1024;
    v13 = 126;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  FCURLForFeldsparUserAccountHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", v1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v7);

  return v3;
}

id FCURLForFeldsparUserAccountHomeDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  v0 = FCSystemDirectoryDirectoryPath();
  FCURLForSystemDirectoriesPath(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("News"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v5);

  return v2;
}

id FCURLForSystemDirectoriesPath(id a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a1, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    free(v1);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void *FCSystemDirectoryDirectoryPath()
{
  void *v0;
  uint64_t started;

  v0 = malloc_type_malloc(0x400uLL, 0x67B5ED4BuLL);
  if (v0)
  {
    started = sysdir_start_search_path_enumeration_private();
    MEMORY[0x1A8581194](started, v0);
  }
  return v0;
}

void sub_1A1C30984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FCReadWriteDictionaryWithAccessor(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "readingURL");
    *(_DWORD *)buf = 136315906;
    v26 = "BOOL FCReadWriteDictionaryWithAccessor(NSURL *__strong, NSSet<Class> *__strong, NSURL *__strong, NSError *__st"
          "rong, void (^__strong)(NSMutableDictionary *__strong))";
    v27 = 2080;
    v28 = "FCFileCoordinatedDictionaryUtilities.m";
    v29 = 1024;
    v30 = 47;
    v31 = 2114;
    v32 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "writingURL");
    *(_DWORD *)buf = 136315906;
    v26 = "BOOL FCReadWriteDictionaryWithAccessor(NSURL *__strong, NSSet<Class> *__strong, NSURL *__strong, NSError *__st"
          "rong, void (^__strong)(NSMutableDictionary *__strong))";
    v27 = 2080;
    v28 = "FCFileCoordinatedDictionaryUtilities.m";
    v29 = 1024;
    v30 = 48;
    v31 = 2114;
    v32 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v26 = "BOOL FCReadWriteDictionaryWithAccessor(NSURL *__strong, NSSet<Class> *__strong, NSURL *__strong, NSError *__st"
          "rong, void (^__strong)(NSMutableDictionary *__strong))";
    v27 = 2080;
    v28 = "FCFileCoordinatedDictionaryUtilities.m";
    v29 = 1024;
    v30 = 49;
    v31 = 2114;
    v32 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_9;
  }
  else if (v12)
  {
LABEL_9:
    v13[2](v13, 0);
    v14 = 0;
    goto LABEL_19;
  }
  FCReadDictionary(v9, v10);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x1E0C9AA70];
  if (v18)
    v20 = (void *)v18;
  v21 = v20;

  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  ((void (**)(id, void *))v13)[2](v13, v22);
  v23 = objc_msgSend(v21, "isEqualToDictionary:", v22);

  if ((v23 & 1) != 0)
    v14 = 1;
  else
    v14 = FCWriteDictionary(v22, v11);

LABEL_19:
  return v14;
}

id FCReadDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v17 = "NSDictionary *FCReadDictionary(NSURL *__strong, NSSet<Class> *__strong)";
    v18 = 2080;
    v19 = "FCFileCoordinatedDictionaryUtilities.m";
    v20 = 1024;
    v21 = 17;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "allowedClasses");
    *(_DWORD *)buf = 136315906;
    v17 = "NSDictionary *FCReadDictionary(NSURL *__strong, NSSet<Class> *__strong)";
    v18 = 2080;
    v19 = "FCFileCoordinatedDictionaryUtilities.m";
    v20 = 1024;
    v21 = 18;
    v22 = 2114;
    v23 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v4, v5, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v8 = v7;
    if ((!v6 || v7) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v3, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Failed to unarchive dictionary from '%@' with error: %@"), v13, v8);
      *(_DWORD *)buf = 136315906;
      v17 = "NSDictionary *FCReadDictionary(NSURL *__strong, NSSet<Class> *__strong)";
      v18 = 2080;
      v19 = "FCFileCoordinatedDictionaryUtilities.m";
      v20 = 1024;
      v21 = 28;
      v22 = 2114;
      v23 = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1A1C33998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCURLForContainerizedUserAccountDocumentDirectory(char a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this function is only supported for containerized processes"));
    v3 = 136315906;
    v4 = "NSURL *FCURLForContainerizedUserAccountDocumentDirectory(BOOL)";
    v5 = 2080;
    v6 = "FCFileURLs.m";
    v7 = 1024;
    v8 = 78;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
  if (qword_1ED0F80C0 != -1)
    dispatch_once(&qword_1ED0F80C0, &__block_literal_global_5_2);
  return (id)qword_1ED0F80B8;
}

void sub_1A1C34474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t adStatusConditionTypeForType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("BundleSubscription")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("sBundleSubscription")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A1C35028(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C351E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C35390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCInferQualityOfServiceFromRelativePriority(uint64_t a1)
{
  uint64_t v1;

  v1 = 25;
  if (!a1)
    v1 = 17;
  if (a1 == -1)
    return 9;
  else
    return v1;
}

void sub_1A1C35D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCPersonalizationDataMaxAggregates()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "BOOLForKey:", CFSTR("personalization_low_aggregate_cap")))
    v1 = 100;
  else
    v1 = 6000;

  return v1;
}

void sub_1A1C37048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C376DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C38AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C38DF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1C3BBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C3C76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPQueryFilterTypeForNSPredicateOperatorType(unint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1 < 0xB && ((0x53Fu >> a1) & 1) != 0)
    return dword_1A1E82648[a1];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected operator for predicate"));
    v3 = 136315906;
    v4 = "FCCKPQueryFilter_Type FCCKPQueryFilterTypeForNSPredicateOperatorType(NSPredicateOperatorType)";
    v5 = 2080;
    v6 = "FCCKPredicateConversion.m";
    v7 = 1024;
    v8 = 132;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
  return 1;
}

void sub_1A1C3DBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C3E3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCSwizzleClassMethods(objc_class *a1, const char *a2, const char *a3)
{
  objc_method *ClassMethod;
  objc_method *v6;

  if (a1)
  {
    ClassMethod = class_getClassMethod(a1, a2);
    v6 = class_getClassMethod(a1, a3);
    if (ClassMethod)
    {
      if (v6)
        method_exchangeImplementations(ClassMethod, v6);
    }
  }
}

id FCURLForContainerizedUserAccountHomeDirectory(char a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this function is only supported for containerized processes"));
    v3 = 136315906;
    v4 = "NSURL *FCURLForContainerizedUserAccountHomeDirectory(BOOL)";
    v5 = 2080;
    v6 = "FCFileURLs.m";
    v7 = 1024;
    v8 = 54;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
  FCURLForDirectoryInDomain(NSLibraryDirectory, 1uLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A1C3FF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id FCURLForAccountActionQueue()
{
  void *v0;
  void *v1;

  FCURLForFeldsparUserAccountHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("actionQueue"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1A1C41658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCurrentContextEnvironment()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (!NFInternalBuild())
    return 0;
  NewsCoreUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("content_environment"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("staging")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("devel")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("qa")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("test")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("icloud1")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sandbox")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("demo1")) & 1) != 0)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("demo2")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A1C44A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C44CD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1A1C4830C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C49C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id mergeSortedOrderedCollections(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _BYTE *v19;
  char v20;
  _BYTE buf[24];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "engulfee");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "NSIndexSet *mergeSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrd"
                           "eredMutableCollection>, __strong NSComparator)";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCOrderedCollection.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v22[0]) = 59;
      WORD2(v22[0]) = 2114;
      *(_QWORD *)((char *)v22 + 6) = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    if (v8)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cmptr");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "NSIndexSet *mergeSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrd"
                           "eredMutableCollection>, __strong NSComparator)";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCOrderedCollection.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v22[0]) = 60;
      WORD2(v22[0]) = 2114;
      *(_QWORD *)((char *)v22 + 6) = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22[0] = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __mergeSortedOrderedCollections_block_invoke;
  v15[3] = &unk_1E4647368;
  v16 = v6;
  v19 = buf;
  v18 = v8;
  v20 = isKindOfClass & 1;
  v11 = v10;
  v17 = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  _Block_object_dispose(buf, 8);
LABEL_10:

  return v11;
}

void sub_1A1C4A42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_1A1C4A864()
{
  unint64_t result;

  result = qword_1ED0F7A38;
  if (!qword_1ED0F7A38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0F7A38);
  }
  return result;
}

id FCFeedPersonalizing.sort(items:options:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A30);
  v4 = (void *)sub_1A1E5518C();
  v5 = objc_msgSend(v2, sel_sortItems_options_configurationSet_, v4, a2, 0);

  return v5;
}

uint64_t type metadata accessor for PingBasedOnlineNetworkTransitionMonitor()
{
  return objc_opt_self();
}

void sub_1A1C4B08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t FCFeedPersonalizing.score(items:options:configurationSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  uint64_t *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  int64_t v48;
  id v49;
  _BYTE v50[40];
  uint64_t v51;
  _OWORD v52[2];
  __int128 v53;
  _OWORD v54[2];
  __int128 v55;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A30);
  v7 = (void *)sub_1A1E5518C();
  v8 = objc_msgSend(v3, sel_sortItems_options_configurationSet_, v7, a2, a3);

  v9 = objc_msgSend(v8, sel_scoreProfiles);
  v10 = objc_msgSend(v9, sel_dictionaryRepresentation);

  sub_1A1C4A864();
  v11 = sub_1A1E5515C();

  v46 = v11 + 64;
  v12 = 1 << *(_BYTE *)(v11 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v11 + 64);
  v47 = (unint64_t)(v12 + 63) >> 6;
  swift_bridgeObjectRetain();
  v15 = 0;
  v16 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v45 = v11;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
      goto LABEL_25;
    }
    v20 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_39;
    if (v20 >= v47)
    {
LABEL_37:
      swift_release();
      swift_bridgeObjectRelease();
      return (uint64_t)v16;
    }
    v21 = *(_QWORD *)(v46 + 8 * v20);
    ++v15;
    if (!v21)
    {
      v15 = v20 + 1;
      if (v20 + 1 >= v47)
        goto LABEL_37;
      v21 = *(_QWORD *)(v46 + 8 * v15);
      if (!v21)
      {
        v15 = v20 + 2;
        if (v20 + 2 >= v47)
          goto LABEL_37;
        v21 = *(_QWORD *)(v46 + 8 * v15);
        if (!v21)
        {
          v15 = v20 + 3;
          if (v20 + 3 >= v47)
            goto LABEL_37;
          v21 = *(_QWORD *)(v46 + 8 * v15);
          if (!v21)
            break;
        }
      }
    }
LABEL_24:
    v14 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v15 << 6);
LABEL_25:
    sub_1A1C0F260(*(_QWORD *)(v11 + 48) + 40 * v19, (uint64_t)v54);
    v23 = *(void **)(*(_QWORD *)(v11 + 56) + 8 * v19);
    *((_QWORD *)&v55 + 1) = v23;
    v52[0] = v54[0];
    v52[1] = v54[1];
    v53 = v55;
    sub_1A1C0F260((uint64_t)v52, (uint64_t)v50);
    v51 = *((_QWORD *)&v53 + 1);
    v24 = v23;
    if (swift_dynamicCast())
    {
      v48 = v15;
      v25 = v6;
      v26 = objc_msgSend(v49, sel_itemID);
      v27 = sub_1A1E55174();
      v29 = v28;

      sub_1A1C0F260((uint64_t)v52, (uint64_t)v50);
      v51 = *((_QWORD *)&v53 + 1);
      v30 = *((id *)&v53 + 1);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v49 = v16;
      v33 = sub_1A1C0F984(v27, v29);
      v34 = v16[2];
      v35 = (v32 & 1) == 0;
      v36 = v34 + v35;
      if (__OFADD__(v34, v35))
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      v37 = v32;
      if (v16[3] < v36)
      {
        sub_1A1C10124(v36, isUniquelyReferenced_nonNull_native);
        v38 = sub_1A1C0F984(v27, v29);
        if ((v37 & 1) != (v39 & 1))
          goto LABEL_42;
        v33 = v38;
        if ((v37 & 1) == 0)
          goto LABEL_33;
LABEL_4:
        v17 = v16[7];

        *(_QWORD *)(v17 + 8 * v33) = v30;
LABEL_5:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1A1C0FE78((uint64_t)v50);
        v6 = v25;
        v11 = v45;
        v15 = v48;
        goto LABEL_6;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v32 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_1A1C4C5AC();
        if ((v37 & 1) != 0)
          goto LABEL_4;
      }
LABEL_33:
      v16[(v33 >> 6) + 8] |= 1 << v33;
      v40 = (uint64_t *)(v16[6] + 16 * v33);
      *v40 = v27;
      v40[1] = v29;
      *(_QWORD *)(v16[7] + 8 * v33) = v30;
      v41 = v16[2];
      v42 = __OFADD__(v41, 1);
      v43 = v41 + 1;
      if (v42)
        goto LABEL_40;
      v16[2] = v43;
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
LABEL_6:
    sub_1A1C0FEAC((uint64_t)v52);
  }
  v22 = v20 + 4;
  if (v22 >= v47)
    goto LABEL_37;
  v21 = *(_QWORD *)(v46 + 8 * v22);
  if (v21)
  {
    v15 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    v15 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v15 >= v47)
      goto LABEL_37;
    v21 = *(_QWORD *)(v46 + 8 * v15);
    ++v22;
    if (v21)
      goto LABEL_24;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_1A1E55228();
  __break(1u);
  return result;
}

id sub_1A1C4C5AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A48);
  v2 = *v0;
  v3 = sub_1A1E551F8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1A1C4C75C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A1C4C7A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id PingBasedOnlineNetworkTransitionMonitor.__allocating_init(configurationManager:hostName:port:)(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_1A1C4E500(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v10;
}

id PingBasedOnlineNetworkTransitionMonitor.init(configurationManager:hostName:port:)(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  id v4;

  v4 = sub_1A1C4E500(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v4;
}

id sub_1A1C4C8E8(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  _QWORD *v15;
  id v16;
  id v17;
  char *v18;
  id v19;

  v7 = objc_msgSend(*(id *)&v3[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_configurationManager], sel_possiblyUnfetchedAppConfiguration);
  v8 = 1.0;
  if ((objc_msgSend(v7, sel_respondsToSelector_, sel_offlineModeDetectionPingInterval) & 1) != 0)
  {
    objc_msgSend(v7, sel_offlineModeDetectionPingInterval);
    v8 = v9;
  }
  v10 = 5.0;
  if ((objc_msgSend(v7, sel_respondsToSelector_, sel_offlineModeDetectionPingTimeoutInterval) & 1) != 0)
  {
    objc_msgSend(v7, sel_offlineModeDetectionPingTimeoutInterval);
    v10 = v11;
  }
  v12 = *(_QWORD *)&v3[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_hostName];
  v13 = *(_QWORD *)&v3[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_hostName + 8];
  v14 = *(_WORD *)&v3[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_port];
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  v15[5] = v3;
  v16 = objc_allocWithZone((Class)type metadata accessor for PingBasedOnlineNetworkTransitionOperation());
  swift_bridgeObjectRetain();
  v17 = a1;
  swift_retain();
  v18 = v3;
  v19 = sub_1A1C4E6D8(v12, v13, v14, (uint64_t)sub_1A1C4E6AC, (uint64_t)v15, v8, v10);
  swift_release();
  objc_msgSend(v19, sel_start);
  swift_unknownObjectRelease();
  return v19;
}

void sub_1A1C4CA60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v19[0] = a4;
  v6 = sub_1A1E55114();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A1E5512C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[4] = a2;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A1C4CC6C;
  aBlock[3] = &block_descriptor_41;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_1A1E55120();
  v19[1] = MEMORY[0x1E0DEE9D8];
  sub_1A1C4EE60((unint64_t *)&unk_1ED0F7958, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7970);
  sub_1A1C4EA74();
  sub_1A1E551E0();
  MEMORY[0x1A85801B0](0, v14, v10, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();
  v16 = *(_QWORD *)(v19[0] + OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_dateOfLastTransitionLock);
  v17 = v16 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v16 + 16);
  v18 = (os_unfair_lock_s *)(v16 + ((*(unsigned int *)(*(_QWORD *)v16 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v18);
  sub_1A1C4CC70(v17);
  os_unfair_lock_unlock(v18);
}

uint64_t sub_1A1C4CC70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v15 - v5;
  sub_1A1C4F028(a1, (uint64_t)&v15 - v5);
  v7 = sub_1A1E55060();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1A1E55048();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_init);
  v12 = objc_msgSend(v10, sel_fc_laterDateAllowingNilWithDate_andDate_, v9, v11);

  if (v12)
  {
    sub_1A1E55054();

    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v4, v13, 1, v7);
  return sub_1A1C4F028((uint64_t)v4, a1);
}

id PingBasedOnlineNetworkTransitionOperation.__allocating_init(pingInterval:pingTimeoutInterval:hostName:port:notificationBlock:)(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  objc_class *v7;
  id v15;
  id v16;

  v15 = objc_allocWithZone(v7);
  v16 = sub_1A1C4E6D8(a1, a2, a3, a4, a5, a6, a7);
  swift_release();
  return v16;
}

void sub_1A1C4D008(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_dateOfLastTransitionLock);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_1A1C4C75C(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_1A1C4D07C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A1C4C75C(a1, a2);
}

id PingBasedOnlineNetworkTransitionMonitor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PingBasedOnlineNetworkTransitionMonitor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PingBasedOnlineNetworkTransitionMonitor.__deallocating_deinit()
{
  return sub_1A1C4E460(type metadata accessor for PingBasedOnlineNetworkTransitionMonitor);
}

uint64_t sub_1A1C4D154()
{
  return 1;
}

uint64_t sub_1A1C4D15C()
{
  sub_1A1E55270();
  sub_1A1E5527C();
  return sub_1A1E55288();
}

uint64_t sub_1A1C4D19C()
{
  return sub_1A1E5527C();
}

uint64_t sub_1A1C4D1C0()
{
  sub_1A1E55270();
  sub_1A1E5527C();
  return sub_1A1E55288();
}

uint64_t sub_1A1C4D20C()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1A1C4D254(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probe);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1A1C4D2A4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id PingBasedOnlineNetworkTransitionOperation.init(pingInterval:pingTimeoutInterval:hostName:port:notificationBlock:)(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  id v7;

  v7 = sub_1A1C4E6D8(a1, a2, a3, a4, a5, a6, a7);
  swift_release();
  return v7;
}

uint64_t sub_1A1C4D31C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD aBlock[7];

  v1 = v0;
  v56 = sub_1A1E55114();
  v59 = *(_QWORD *)(v56 - 8);
  MEMORY[0x1E0C80A78](v56);
  v55 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1A1E5512C();
  v57 = *(_QWORD *)(v3 - 8);
  v58 = v3;
  MEMORY[0x1E0C80A78](v3);
  v54 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_1A1E55144();
  v53 = *(_QWORD *)(v63 - 8);
  v5 = MEMORY[0x1E0C80A78](v63);
  v51 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v52 = (char *)&v46 - v7;
  v8 = sub_1A1E5509C();
  v61 = *(_QWORD *)(v8 - 8);
  v62 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v60 = (char *)&v46 - v12;
  v13 = sub_1A1E55078();
  v14 = *(_QWORD *)(v13 - 8);
  v49 = v13;
  v50 = v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v46 - v18;
  v20 = objc_msgSend(v0, sel_operationID);
  v21 = sub_1A1E55174();
  v47 = v21;
  v23 = v22;

  v24 = *(void **)&v0[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_log];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1A1E81D70;
  *(_QWORD *)(v25 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v25 + 64) = sub_1A1C4E850();
  *(_QWORD *)(v25 + 32) = v21;
  *(_QWORD *)(v25 + 40) = v23;
  swift_bridgeObjectRetain();
  sub_1A1E551A4();
  sub_1A1E5506C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v48 = v19;
  sub_1A1E55084();
  v26 = v60;
  sub_1A1E55090();
  sub_1A1E550E4();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v11, v26, v62);
  sub_1A1E550FC();
  sub_1A1E550F0();
  v27 = sub_1A1E550C0();
  v28 = objc_msgSend(v1, sel_retryCount);
  v29 = objc_msgSend(objc_allocWithZone((Class)FCOnce), sel_init);
  v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v30;
  v31[3] = v24;
  v31[4] = v47;
  v31[5] = v23;
  v31[6] = v28;
  v31[7] = v29;
  swift_retain();
  v32 = v24;
  v33 = v29;
  sub_1A1C4E904((uint64_t)sub_1A1C4E8F4);
  sub_1A1E550B4();
  swift_release();
  swift_release();
  v34 = *(_QWORD *)&v1[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock];
  os_unfair_lock_lock((os_unfair_lock_t)(v34 + 24));
  swift_release();
  *(_QWORD *)(v34 + 16) = v27;
  v46 = v27;
  swift_retain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 24));
  sub_1A1C4E914(0, (unint64_t *)&unk_1ED0F7998);
  v35 = (void *)sub_1A1E551BC();
  sub_1A1E550D8();
  v36 = v51;
  sub_1A1E55138();
  v37 = v52;
  MEMORY[0x1A8580138](v36, *(double *)&v1[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_pingTimeoutInterval]);
  v53 = *(_QWORD *)(v53 + 8);
  ((void (*)(char *, uint64_t))v53)(v36, v63);
  v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = v38;
  *(_QWORD *)(v39 + 24) = v33;
  aBlock[4] = sub_1A1C4E978;
  aBlock[5] = v39;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A1C4CC6C;
  aBlock[3] = &block_descriptor;
  v40 = _Block_copy(aBlock);
  v41 = v33;
  swift_retain();
  v42 = v54;
  sub_1A1E55120();
  v64 = MEMORY[0x1E0DEE9D8];
  sub_1A1C4EE60((unint64_t *)&unk_1ED0F7958, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7970);
  sub_1A1C4EA74();
  v44 = v55;
  v43 = v56;
  sub_1A1E551E0();
  MEMORY[0x1A8580198](v37, v42, v44, v40);
  swift_release();
  _Block_release(v40);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v44, v43);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v58);
  ((void (*)(char *, uint64_t))v53)(v37, v63);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v48, v49);
  swift_release();
  return swift_release();
}

void sub_1A1C4D970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(unint64_t, char *, uint64_t);
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void (*v46)(unint64_t, char *, uint64_t);
  void *v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t aBlock;
  uint64_t v75;
  uint64_t (*v76)();
  void *v77;
  id (*v78)();
  uint64_t v79;

  v69 = a7;
  v70 = a4;
  v71 = a6;
  v72 = a5;
  v73 = a3;
  v9 = sub_1A1E55108();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v67 - v14;
  v16 = sub_1A1E550CC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v20 = MEMORY[0x1A858117C](a2 + 16);
  if (v20)
  {
    v21 = (void *)v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
    v22 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
    if (v22 == *MEMORY[0x1E0CCE5C8])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
      v67 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v67(v15, v19, v9);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1A1E81D90;
      v68 = v21;
      v24 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
      v25 = sub_1A1C4E850();
      v26 = v72;
      *(_QWORD *)(v23 + 32) = v70;
      *(_QWORD *)(v23 + 40) = v26;
      v27 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v23 + 96) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v23 + 104) = v27;
      v28 = v71;
      *(_QWORD *)(v23 + 64) = v25;
      *(_QWORD *)(v23 + 72) = v28;
      sub_1A1C4EE60(&qword_1EE652658, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
      swift_bridgeObjectRetain();
      v29 = sub_1A1E55234();
      *(_QWORD *)(v23 + 136) = v24;
      *(_QWORD *)(v23 + 144) = v25;
      *(_QWORD *)(v23 + 112) = v29;
      *(_QWORD *)(v23 + 120) = v30;
      sub_1A1E551A4();
      sub_1A1E5506C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
      v31 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v32 = swift_allocObject();
      v33 = (void (*)(unint64_t, char *, uint64_t))v67;
      v34 = v68;
      *(_QWORD *)(v32 + 16) = v68;
      v33(v32 + v31, v13, v9);
      v78 = (id (*)())sub_1A1C4EEA4;
      v79 = v32;
      aBlock = MEMORY[0x1E0C809B0];
      v75 = 1107296256;
      v35 = &block_descriptor_38;
LABEL_6:
      v76 = sub_1A1C4CC6C;
      v77 = v35;
      v47 = _Block_copy(&aBlock);
      v48 = v34;
      swift_release();
      objc_msgSend(v69, sel_executeOnce_, v47);
      _Block_release(v47);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      return;
    }
    if (v22 == *MEMORY[0x1E0CCE5C0])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
      v67 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v67(v15, v19, v9);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
      v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = xmmword_1A1E81D90;
      v68 = v21;
      v37 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v36 + 56) = MEMORY[0x1E0DEA968];
      v38 = sub_1A1C4E850();
      v39 = v72;
      *(_QWORD *)(v36 + 32) = v70;
      *(_QWORD *)(v36 + 40) = v39;
      v40 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v36 + 96) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v36 + 104) = v40;
      v41 = v71;
      *(_QWORD *)(v36 + 64) = v38;
      *(_QWORD *)(v36 + 72) = v41;
      sub_1A1C4EE60(&qword_1EE652658, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
      swift_bridgeObjectRetain();
      v42 = sub_1A1E55234();
      *(_QWORD *)(v36 + 136) = v37;
      *(_QWORD *)(v36 + 144) = v38;
      *(_QWORD *)(v36 + 112) = v42;
      *(_QWORD *)(v36 + 120) = v43;
      sub_1A1E551A4();
      sub_1A1E5506C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
      v44 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v45 = swift_allocObject();
      v46 = (void (*)(unint64_t, char *, uint64_t))v67;
      v34 = v68;
      *(_QWORD *)(v45 + 16) = v68;
      v46(v45 + v44, v13, v9);
      v78 = (id (*)())sub_1A1C4EEA4;
      v79 = v45;
      aBlock = MEMORY[0x1E0C809B0];
      v75 = 1107296256;
      v35 = &block_descriptor_26;
      goto LABEL_6;
    }
    if (v22 == *MEMORY[0x1E0CCE5B8] || v22 == *MEMORY[0x1E0CCE5D8])
      goto LABEL_13;
    if (v22 == *MEMORY[0x1E0CCE5B0])
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
      v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_1A1E81D80;
      *(_QWORD *)(v49 + 56) = MEMORY[0x1E0DEA968];
      v50 = sub_1A1C4E850();
      v51 = v72;
      *(_QWORD *)(v49 + 32) = v70;
      *(_QWORD *)(v49 + 40) = v51;
      v52 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v49 + 96) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v49 + 104) = v52;
      v53 = v71;
      *(_QWORD *)(v49 + 64) = v50;
      *(_QWORD *)(v49 + 72) = v53;
      swift_bridgeObjectRetain();
      sub_1A1E551A4();
      sub_1A1E5506C();
      swift_bridgeObjectRelease();
      v54 = swift_allocObject();
      *(_QWORD *)(v54 + 16) = v21;
      v78 = sub_1A1C4EEA8;
      v79 = v54;
      aBlock = MEMORY[0x1E0C809B0];
      v75 = 1107296256;
      v76 = sub_1A1C4CC6C;
      v77 = &block_descriptor_32;
      v55 = _Block_copy(&aBlock);
      v56 = v21;
      swift_release();
      objc_msgSend(v69, sel_executeOnce_, v55);

      _Block_release(v55);
      return;
    }
    if (v22 == *MEMORY[0x1E0CCE5D0])
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
      v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = xmmword_1A1E81D80;
      *(_QWORD *)(v57 + 56) = MEMORY[0x1E0DEA968];
      v58 = sub_1A1C4E850();
      v59 = v72;
      *(_QWORD *)(v57 + 32) = v70;
      *(_QWORD *)(v57 + 40) = v59;
      v60 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v57 + 96) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v57 + 104) = v60;
      v61 = v71;
      *(_QWORD *)(v57 + 64) = v58;
      *(_QWORD *)(v57 + 72) = v61;
      swift_bridgeObjectRetain();
      sub_1A1E551A4();
      sub_1A1E5506C();
      swift_bridgeObjectRelease();

    }
    else
    {
      sub_1A1E55198();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0F79B0);
      v62 = swift_allocObject();
      *(_OWORD *)(v62 + 16) = xmmword_1A1E81D80;
      *(_QWORD *)(v62 + 56) = MEMORY[0x1E0DEA968];
      v63 = sub_1A1C4E850();
      v64 = v72;
      *(_QWORD *)(v62 + 32) = v70;
      *(_QWORD *)(v62 + 40) = v64;
      v65 = MEMORY[0x1E0DEBBF8];
      *(_QWORD *)(v62 + 96) = MEMORY[0x1E0DEBB98];
      *(_QWORD *)(v62 + 104) = v65;
      v66 = v71;
      *(_QWORD *)(v62 + 64) = v63;
      *(_QWORD *)(v62 + 72) = v66;
      swift_bridgeObjectRetain();
      sub_1A1E5506C();
      swift_bridgeObjectRelease();

      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    }
  }
}

uint64_t sub_1A1C4E208(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

_QWORD *sub_1A1C4E2B8(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
  {
    sub_1A1E550A8();
    result = (_QWORD *)swift_release();
  }
  *v1 = 0;
  return result;
}

uint64_t *sub_1A1C4E34C@<X0>(uint64_t *result@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3;

  v3 = *result;
  if (*result)
    result = (uint64_t *)sub_1A1E550A8();
  *a2 = v3 == 0;
  return result;
}

void PingBasedOnlineNetworkTransitionOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PingBasedOnlineNetworkTransitionOperation.__deallocating_deinit()
{
  return sub_1A1C4E460(type metadata accessor for PingBasedOnlineNetworkTransitionOperation);
}

id sub_1A1C4E460(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1A1C4E500(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  char *v4;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  objc_class *v16;
  objc_super v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_dateOfLastTransitionLock;
  v12 = sub_1A1E55060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C8);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + ((*(unsigned int *)(*(_QWORD *)v13 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_1A1C4C75C((uint64_t)v10, v13 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v13 + 16));
  v14 = v4;
  sub_1A1C4C7A4((uint64_t)v10);
  *(_QWORD *)&v4[v11] = v13;
  *(_QWORD *)&v14[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_configurationManager] = a1;
  v15 = &v14[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_hostName];
  *(_QWORD *)v15 = a2;
  *((_QWORD *)v15 + 1) = a3;
  *(_WORD *)&v14[OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_port] = a4;
  swift_unknownObjectRetain();

  v16 = (objc_class *)type metadata accessor for PingBasedOnlineNetworkTransitionMonitor();
  v18.receiver = v14;
  v18.super_class = v16;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t sub_1A1C4E678()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1A1C4E6AC()
{
  uint64_t *v0;

  sub_1A1C4CA60(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t type metadata accessor for PingBasedOnlineNetworkTransitionOperation()
{
  return objc_opt_self();
}

id sub_1A1C4E6D8(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  char *v7;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  objc_super v22;

  v15 = OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_log;
  sub_1A1C4E914(0, &qword_1ED0F7950);
  v16 = v7;
  *(_QWORD *)&v7[v15] = sub_1A1E551D4();
  v17 = OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79A8);
  v18 = swift_allocObject();
  *(_DWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)&v16[v17] = v18;
  *(_QWORD *)&v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probe] = 0;
  *(double *)&v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_pingInterval] = a6;
  *(double *)&v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_pingTimeoutInterval] = a7;
  v19 = &v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_hostName];
  *(_QWORD *)v19 = a1;
  *((_QWORD *)v19 + 1) = a2;
  *(_WORD *)&v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_port] = a3;
  v20 = &v16[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_notificationBlock];
  *(_QWORD *)v20 = a4;
  *((_QWORD *)v20 + 1) = a5;
  swift_retain();

  v22.receiver = v16;
  v22.super_class = (Class)type metadata accessor for PingBasedOnlineNetworkTransitionOperation();
  return objc_msgSendSuper2(&v22, sel_init);
}

unint64_t sub_1A1C4E850()
{
  unint64_t result;

  result = qword_1ED0F7968;
  if (!qword_1ED0F7968)
  {
    result = MEMORY[0x1A8581110](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED0F7968);
  }
  return result;
}

uint64_t sub_1A1C4E894()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A1C4E8B8()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1A1C4E8F4(uint64_t a1)
{
  uint64_t v1;

  sub_1A1C4D970(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56));
}

uint64_t sub_1A1C4E904(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1A1C4E914(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1A1C4E94C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1A1C4E978()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD aBlock[6];

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1A858117C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    aBlock[4] = sub_1A1C4EDB0;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A1C4CC6C;
    aBlock[3] = &block_descriptor_20;
    v6 = _Block_copy(aBlock);
    v7 = v4;
    swift_release();
    objc_msgSend(v1, sel_executeOnce_, v6);
    _Block_release(v6);

  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1A1C4EA74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED0F7978;
  if (!qword_1ED0F7978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED0F7970);
    result = MEMORY[0x1A8581110](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED0F7978);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A8581104](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A1C4EB04(_QWORD *a1)
{
  uint64_t v1;
  id v3;
  id v4;

  v3 = objc_msgSend(objc_allocWithZone((Class)FCOperationDelayedRetrySignal), sel_initWithDelay_, *(double *)(v1 + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_pingInterval));
  v4 = v3;
  *a1 = v3;
  return 1;
}

unint64_t sub_1A1C4EB64()
{
  unint64_t result;

  result = qword_1EE652578;
  if (!qword_1EE652578)
  {
    result = MEMORY[0x1A8581110](&unk_1A1E81DAC, &type metadata for PingBasedOnlineNetworkTransitionOperation.Errors);
    atomic_store(result, (unint64_t *)&qword_1EE652578);
  }
  return result;
}

uint64_t method lookup function for PingBasedOnlineNetworkTransitionMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PingBasedOnlineNetworkTransitionMonitor.__allocating_init(configurationManager:hostName:port:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PingBasedOnlineNetworkTransitionMonitor.notifyWhenTransitionOccurs(on:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PingBasedOnlineNetworkTransitionMonitor.dateOfLastTransition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t method lookup function for PingBasedOnlineNetworkTransitionOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PingBasedOnlineNetworkTransitionOperation.__allocating_init(pingInterval:pingTimeoutInterval:hostName:port:notificationBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t getEnumTagSinglePayload for PingBasedOnlineNetworkTransitionOperation.Errors(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for PingBasedOnlineNetworkTransitionOperation.Errors(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1A1C4ECA0 + 4 * byte_1A1E81DA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A1C4ECC0 + 4 * byte_1A1E81DA5[v4]))();
}

_BYTE *sub_1A1C4ECA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A1C4ECC0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A1C4ECC8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A1C4ECD0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A1C4ECD8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A1C4ECE0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1A1C4ECEC()
{
  return 0;
}

ValueMetadata *type metadata accessor for PingBasedOnlineNetworkTransitionOperation.Errors()
{
  return &type metadata for PingBasedOnlineNetworkTransitionOperation.Errors;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED0F7988)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED0F7988);
  }
}

uint64_t sub_1A1C4ED5C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A1C4ED80()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1A1C4ED8C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A1C4EDB0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 16);
  sub_1A1C4EE1C();
  v2 = (void *)swift_allocError();
  v3 = (id)sub_1A1E55018();

  objc_msgSend(v1, sel_finishedPerformingOperationWithError_, v3);
}

unint64_t sub_1A1C4EE1C()
{
  unint64_t result;

  result = qword_1EE652650;
  if (!qword_1EE652650)
  {
    result = MEMORY[0x1A8581110](&unk_1A1E81E14, &type metadata for PingBasedOnlineNetworkTransitionOperation.Errors);
    atomic_store(result, (unint64_t *)&qword_1EE652650);
  }
  return result;
}

uint64_t sub_1A1C4EE60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1A8581110](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_1A1C4EEA8()
{
  uint64_t v0;
  char *v1;

  v1 = *(char **)(v0 + 16);
  (*(void (**)(void))&v1[OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_notificationBlock])();
  return objc_msgSend(v1, sel_finishedPerformingOperationWithError_, 0);
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1A1E55108();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1A1C4EF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v1 = sub_1A1E55108();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(void **)(v0 + 16);
  v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  sub_1A1C4EE60(&qword_1EE652658, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
  v5 = (void *)swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v6, v4, v1);
  v7 = (id)sub_1A1E55018();

  objc_msgSend(v3, sel_finishedPerformingOperationWithError_, v7);
}

uint64_t sub_1A1C4F028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t FCHeadlineProviding.newsArticleURL.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v19;

  v2 = v1;
  v4 = sub_1A1E5503C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F7A50);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v2, sel_articleID);
  if (!v11)
  {
    sub_1A1E55174();
    v11 = (id)sub_1A1E55168();
    swift_bridgeObjectRelease();
  }
  v12 = objc_msgSend(v2, sel_routeURL);
  if (v12)
  {
    v13 = v12;
    sub_1A1E55030();

    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v14(v10, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
    {
      v15 = 0;
    }
    else
    {
      v15 = (void *)sub_1A1E55024();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
  else
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v14(v10, 1, 1, v4);
    v15 = 0;
  }
  v16 = objc_msgSend((id)objc_opt_self(), sel_fc_NewsURLForArticleID_routeURL_, v11, v15);

  if (v16)
  {
    sub_1A1E55030();

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14)(a1, v17, 1, v4);
}

void sub_1A1C507BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1A1C51DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C53E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C54DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C5AF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C5B894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C5D920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C68788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6892C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6C1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6CC00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6D5D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6DFA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6E9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6F42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C6FE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C70864(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C710EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C719C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C72254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C72808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C72B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C73054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C73A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromShortcutCategoryType(__CFString *a1)
{
  __CFString **v1;

  if (!a1)
  {
    v1 = FCCKShortcutCategoryTypeCurated;
    goto LABEL_5;
  }
  if (a1 == (__CFString *)1)
  {
    v1 = FCCKShortcutCategoryTypeUnknown;
LABEL_5:
    a1 = *v1;
  }
  return a1;
}

__CFString *NSStringFromShortcutCategoryStatus(__CFString *a1)
{
  __CFString **v1;

  if (!a1)
  {
    v1 = FCCKShortcutCategoryStatusBlocked;
    goto LABEL_5;
  }
  if (a1 == (__CFString *)1)
  {
    v1 = &FCCKShortcutCategoryStatusUnknown;
LABEL_5:
    a1 = *v1;
  }
  return a1;
}

uint64_t FCShortcutCategoryTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("curated")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 1;
  }

  return v2;
}

uint64_t FCShortcutCategoryStatusFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("blocked")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("unknown"));
    v2 = 1;
  }

  return v2;
}

void sub_1A1C76164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t FCArticleContentTypeFromPBContentType(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

uint64_t FCArticleStoryTypeFromPBStoryType(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 5)
    return v1 + 1;
  else
    return 0;
}

uint64_t PBArticleStoryTypeFromFCStoryType(uint64_t result)
{
  if ((unint64_t)(result - 1) < 5)
    return result;
  else
    return 0;
}

uint64_t FCArticleRoleFromPBRole(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 8)
    return v1 + 1;
  else
    return 0;
}

uint64_t PBArticleRoleFromFCRole(uint64_t result)
{
  if ((unint64_t)(result - 1) < 8)
    return result;
  else
    return 0;
}

void sub_1A1C77950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C77E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCTopicallyOrderGroups(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const void *v20;
  void *v21;
  const void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  FCTopicalNode *v43;
  void *v44;
  void *v45;
  void *v46;
  id *v47;
  id *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  id *v59;
  id *v60;
  id *WeakRetained;
  id v62;
  id *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v69;
  char *v70;
  NSObject *v71;
  char *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id *v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id *v94;
  _QWORD v95[4];
  id v96;
  _QWORD aBlock[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[6];
  _QWORD v102[4];
  id v103;
  id v104;
  double v105;
  double v106;
  double v107;
  double v108;
  _QWORD v109[4];
  id v110;
  id v111;
  id v112[7];
  _QWORD v113[4];
  id v114;
  uint8_t buf[4];
  char *v116;
  __int16 v117;
  char *v118;
  __int16 v119;
  _BYTE v120[18];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v116 = *(char **)&a5;
    v117 = 2048;
    v118 = *(char **)&a6;
    v119 = 2048;
    *(double *)v120 = a7;
    *(_WORD *)&v120[8] = 2048;
    *(double *)&v120[10] = a8;
    _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Topically ordering groups with relatednessThreshold=%f relatednessKWeight=%f topicScoreWeight=%f highestScoringRelativeScoreMultiplier=%f", buf, 0x2Au);
  }
  if (v17)
    v20 = v17;
  else
    v20 = &__block_literal_global_117;
  v21 = _Block_copy(v20);

  if (v18)
    v22 = v18;
  else
    v22 = &__block_literal_global_119;
  v23 = _Block_copy(v22);

  v24 = (void *)MEMORY[0x1E0C99D20];
  v25 = (void *)MEMORY[0x1E0C809B0];
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __FCTopicallyOrderGroups_block_invoke_3;
  v113[3] = &unk_1E463AA30;
  v26 = v15;
  v114 = v26;
  objc_msgSend(v24, "fc_array:", v113);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v112[0] = v25;
  v112[1] = (id)3221225472;
  v112[2] = __FCTopicallyOrderGroups_block_invoke_5;
  v112[3] = &unk_1E463BF40;
  v29 = v26;
  v112[4] = v29;
  v30 = v28;
  v112[5] = v30;
  v31 = v16;
  v112[6] = v31;
  if (!__FCTopicallyOrderGroups_block_invoke_5(v112) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected allArticleTopicData to be size of groups.allValues.count + extraData.count"));
    *(_DWORD *)buf = 136315906;
    v116 = "NSOrderedSet<NSString *> * _Nonnull FCTopicallyOrderGroups(NSDictionary<NSString *,NSSet<FCTopicalNodeElement"
           " *> *> * _Nonnull __strong, NSArray<NSSet<NSString *> *> * _Nonnull __strong, double (^ _Nullable __strong)(N"
           "SSet<NSString *> * _Nonnull __strong), NSString * _Nonnull (^ _Nullable __strong)(NSString * _Nonnull __stron"
           "g), double, double, double, double)";
    v117 = 2080;
    v118 = "FCHeadlineClusterOrdering.m";
    v119 = 1024;
    *(_DWORD *)v120 = 564;
    *(_WORD *)&v120[4] = 2114;
    *(_QWORD *)&v120[6] = v73;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v80 = v31;

  v32 = (void *)MEMORY[0x1E0C99D80];
  v109[0] = v25;
  v109[1] = 3221225472;
  v109[2] = __FCTopicallyOrderGroups_block_invoke_131;
  v109[3] = &unk_1E463B8D0;
  v33 = v29;
  v110 = v33;
  v75 = v30;
  v111 = v75;
  objc_msgSend(v32, "fc_dictionary:", v109);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "fc_dictionaryBySwappingValuesAndKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0C99E60];
  v102[0] = v25;
  v102[1] = 3221225472;
  v102[2] = __FCTopicallyOrderGroups_block_invoke_4_140;
  v102[3] = &unk_1E463BFE0;
  v77 = v34;
  v103 = v77;
  v36 = v33;
  v104 = v36;
  v105 = a5;
  v106 = a6;
  v107 = a7;
  v108 = a8;
  objc_msgSend(v35, "fc_set:", v102);
  v101[0] = v25;
  v101[1] = 3221225472;
  v101[2] = __FCTopicallyOrderGroups_block_invoke_146;
  v101[3] = &unk_1E463ABB8;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v101[4] = v37;
  v38 = v36;
  v101[5] = v38;
  if ((__FCTopicallyOrderGroups_block_invoke_146((uint64_t)v101) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expected each group to have exactly 1 node containing it's identifier"));
    *(_DWORD *)buf = 136315906;
    v116 = "NSOrderedSet<NSString *> * _Nonnull FCTopicallyOrderGroups(NSDictionary<NSString *,NSSet<FCTopicalNodeElement"
           " *> *> * _Nonnull __strong, NSArray<NSSet<NSString *> *> * _Nonnull __strong, double (^ _Nullable __strong)(N"
           "SSet<NSString *> * _Nonnull __strong), NSString * _Nonnull (^ _Nullable __strong)(NSString * _Nonnull __stron"
           "g), double, double, double, double)";
    v117 = 2080;
    v118 = "FCHeadlineClusterOrdering.m";
    v119 = 1024;
    *(_DWORD *)v120 = 625;
    *(_WORD *)&v120[4] = 2114;
    *(_QWORD *)&v120[6] = v74;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v78 = v38;

  v39 = (void *)MEMORY[0x1E0C99E60];
  v99[0] = v25;
  v99[1] = 3221225472;
  v99[2] = __FCTopicallyOrderGroups_block_invoke_153;
  v99[3] = &unk_1E463AE18;
  v100 = v37;
  v40 = v37;
  objc_msgSend(v39, "fc_set:", v99);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v25;
  aBlock[1] = 3221225472;
  aBlock[2] = __FCTopicallyOrderGroups_block_invoke_4_157;
  aBlock[3] = &unk_1E463C050;
  v42 = v21;
  v98 = v42;
  v95[0] = v25;
  v95[1] = 3221225472;
  v95[2] = __FCTopicallyOrderGroups_block_invoke_5_159;
  v95[3] = &unk_1E463C078;
  v76 = _Block_copy(aBlock);
  v96 = v76;
  v81 = v41;
  objc_msgSend(v41, "enumerateObjectsUsingBlock:", v95);
  v43 = [FCTopicalNode alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("root"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_opt_new();
  v46 = (void *)objc_opt_new();
  v47 = -[FCTopicalNode initWithIdentifier:displayedElements:allTopicCollections:relatednessThreshold:relatednessKWeight:topicScoreWeight:highestScoringRelativeScoreMultiplier:]((id *)&v43->super.isa, v44, v45, v46, a5, a6, a7, a8);

  v93[0] = v25;
  v93[1] = 3221225472;
  v93[2] = __FCTopicallyOrderGroups_block_invoke_6_163;
  v93[3] = &unk_1E463BD78;
  v48 = v47;
  v94 = v48;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v93);
  objc_msgSend(v40, "setByAddingObject:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0C99D80];
  v91[0] = v25;
  v91[1] = 3221225472;
  v91[2] = __FCTopicallyOrderGroups_block_invoke_7;
  v91[3] = &unk_1E463AA78;
  v51 = v49;
  v92 = v51;
  objc_msgSend(v50, "fc_dictionary:", v91);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_165);
  v53 = v42;
  if (v48)
  {
    -[FCTopicalNode calculateLeafScoresWithTopicScoreProvider:]((double *)v48, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v54;
    v56 = v23;
    if (v54)
      v57 = *(void **)(v54 + 8);
    else
      v57 = 0;
    v58 = v57;
    v59 = v58;
    if (v58 != v48)
    {
      v60 = v58;
      do
      {
        if (v60)
        {
          v60[9] = v48[16];
          WeakRetained = (id *)objc_loadWeakRetained(v60 + 7);
        }
        else
        {
          WeakRetained = 0;
        }

        v60 = WeakRetained;
      }
      while (WeakRetained != v48);
    }
    -[FCTopicalNode calculateNonLeafScoresWithTopicProvider:]((uint64_t)v48, v53);

    v23 = v56;
  }

  v87[0] = v25;
  v87[1] = 3221225472;
  v87[2] = __FCTopicallyOrderGroups_block_invoke_12;
  v87[3] = &unk_1E463C1F0;
  v62 = v53;
  v89 = v62;
  v90 = &__block_literal_global_166;
  v63 = v48;
  v88 = v63;
  __FCTopicallyOrderGroups_block_invoke_12((uint64_t)v87);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v84[0] = v25;
    v84[1] = 3221225472;
    v84[2] = __FCTopicallyOrderGroups_block_invoke_18;
    v84[3] = &unk_1E463C268;
    v85 = v23;
    v86 = v62;
    v69 = v65;
    objc_msgSend(v51, "fc_arrayByTransformingWithBlock:", v84);
    v70 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v116 = v70;
    _os_log_debug_impl(&dword_1A1B90000, v69, OS_LOG_TYPE_DEBUG, "Ordered clusters with nodes %@", buf, 0xCu);

    v65 = FCPersonalizationLog;
  }
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    v82[0] = v25;
    v82[1] = 3221225472;
    v82[2] = __FCTopicallyOrderGroups_block_invoke_178;
    v82[3] = &unk_1E463C290;
    v83 = v23;
    v71 = v65;
    objc_msgSend(v81, "fc_arrayByTransformingWithBlock:", v82);
    v72 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v116 = v72;
    _os_log_debug_impl(&dword_1A1B90000, v71, OS_LOG_TYPE_DEBUG, "Ordered clusters with edges %@", buf, 0xCu);

  }
  if (v64)
    v66 = v64;
  else
    v66 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

void sub_1A1C7B468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCPostPurchaseOnboardingStepWithValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("landingPage")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("channelPicker")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("channelPickerNewsPlus")))
          v3 = 4 * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("deepLink")) == 0);
        else
          v3 = 3;
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FCPostPurchaseOnboardingConfigurationTypeWithValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("postPurchaseFromOslo")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("postPurchaseFromLandingPage")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("postPurchaseFromPuzzle")))
        {
          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("detectionAsFamilyMember")))
          {
            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("detectionAsAppleOneUser")))
            {
              if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("detectionAsAmplifyUser")))
              {
                if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("detectionAsPaidBundleViaOfferUser")))
                  v3 = 8
                     * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("postPurchaseFromPaidBundleViaOffer")) == 0);
                else
                  v3 = 7;
              }
              else
              {
                v3 = 6;
              }
            }
            else
            {
              v3 = 5;
            }
          }
          else
          {
            v3 = 4;
          }
        }
        else
        {
          v3 = 3;
        }
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

__CFString *FCDescriptionForVerticalAlignment(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E463C4B0[a1];
}

BOOL FCRelativeOrderOppositeOrder(uint64_t a1)
{
  return a1 != 1;
}

BOOL FCSizeIsLargerThanEqualToSize(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 >= a3;
}

BOOL FCCGRectAlmostEqual(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.00999999978
      && vabdd_f64(a2, a6) < 0.00999999978
      && vabdd_f64(a3, a7) < 0.00999999978
      && vabdd_f64(a4, a8) < 0.00999999978;
}

uint64_t FCCKPResponseOperationResultErrorClientReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  FCCKPUniqueFieldFailure *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 101)
      {
        v24 = objc_alloc_init(FCCKPUniqueFieldFailure);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || (FCCKPUniqueFieldFailureReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 != 100)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_37;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v24 = objc_alloc_init(FCCKPOplockFailure);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (FCCKPOplockFailureReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A1C7DDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C7ECF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FRAccountQueueIsSupportedActionType(unint64_t a1)
{
  return (a1 < 7) & (0x6Eu >> a1);
}

BOOL FCAccountQueueIsDestructiveActionType(uint64_t a1)
{
  return a1 == 3 || a1 == 6;
}

void sub_1A1C82CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C83490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C84C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C87DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C884EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C88658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C889AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C89634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  uint64_t v56;

  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 224), 8);
  _Block_object_dispose((const void *)(v56 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C8C1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1A1C8D7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

void sub_1A1C8DF08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1A1C8F014(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A1C933D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A1C94848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1C97DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1C981F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A1C98574(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *FCDebugFetchOperationDescriptionForStatus(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E463D9B0[a1];
}

uint64_t FCTagTypeFromPBTagType(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 5)
    return v1 + 1;
  else
    return 0;
}

uint64_t FCTagEligibilityForGroupingFromNTPBTagRecord_GroupingAvailability(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

uint64_t NTPBTagRecord_GroupingAvailabilityFromFCTagEligibilityForGrouping(uint64_t result)
{
  if ((unint64_t)(result - 1) < 3)
    return result;
  else
    return 0;
}

uint64_t FCSportsLeagueTypeFromString(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(&unk_1E470D268, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

uint64_t FCSportsTypeFromString(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(&unk_1E470D290, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

void *FCMastheadLogoVisibilityFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(&unk_1E470D2E0, "objectForKeyedSubscript:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(&unk_1E470D2E0, "objectForKeyedSubscript:", v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)objc_msgSend(v3, "integerValue");

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t FCPaidAccessCheckerHasBundleSubscriptionToChannelInline(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a1;
  v6 = a2;
  if (!v6)
    goto LABEL_3;
  objc_msgSend(v5, "bundleSubscription");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v7, (const void *)(v7 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = v9;
  objc_getAssociatedObject((id)v7, (const void *)~v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_msgSend(v11, "unsignedIntegerValue") - a3) ^ (v10 + a3);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v5, "bundleSubscription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleChannelIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "containsObject:", v6);

  }
  else
  {
LABEL_3:
    v13 = 0;
  }

  return v13;
}

void sub_1A1C9DB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromFCFeedDescriptorConfiguration(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA)
    return CFSTR("Default");
  else
    return off_1E463DDD0[a1 - 1];
}

uint64_t FCAssetHandleQoSFromPriority(uint64_t a1)
{
  if (a1 <= 0)
    return -1;
  else
    return 25;
}

void sub_1A1CA1120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CA198C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v24 - 128));
  _Unwind_Resume(a1);
}

void sub_1A1CA1AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CA1B9C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1CA2634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CA2F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CA4338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CA5C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *FCOfflineModePingHostName(unint64_t a1)
{
  if (!a1)
    return CFSTR("gateway.icloud.com");
  FCNewsAssetServerHostNameForEnvironment(a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t FCCKPResponseOperationResultErrorExtensionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (1)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_34;
            v21 += 7;
            v14 = v22++ >= 9;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_36:
          *(_DWORD *)(a1 + 24) = v23;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
      }
      v20 = *(void **)(a1 + v19);
      *(_QWORD *)(a1 + v19) = v18;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

FCBundleSubscription *FCBundleSubscriptionMakeInline(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7, char a8, void *a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  FCBundleSubscription *v21;
  void *v22;
  FCBundleSubscription *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a9;
  v17 = a6;
  v18 = a3;
  v19 = a2;
  v20 = a1;
  LOBYTE(v28) = a8;
  LOBYTE(v27) = a7;
  v21 = -[FCBundleSubscription initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]([FCBundleSubscription alloc], "initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", v20, v19, v18, a4, a5, v17, v27, v29, v28);
  v22 = (void *)MEMORY[0x1E0CB37E8];
  v23 = v21;
  objc_msgSend(v22, "numberWithUnsignedInteger:", (char *)&v21[5]._bundleChannelIDsVersion + 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -356 - (_QWORD)v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v23, (char *)&v21->super.isa + 1, v24, (void *)1);
  objc_setAssociatedObject(v23, (const void *)(-356 - (_QWORD)v21), v25, (void *)1);

  return v23;
}

void sub_1A1CB4A18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 232));
  _Unwind_Resume(a1);
}

void sub_1A1CB4D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CB55B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CB61D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CB6DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CB800C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *FCStringFromFeedPersonalizationConfigurationSet(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x26)
    return CFSTR("Default");
  else
    return off_1E463E888[a1 - 1];
}

uint64_t ArticleContentTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("web")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("flint")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("video")))
        v2 = 0;
      else
        v2 = 3;
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t FCCKPUniqueFieldFailureReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPIdentifier *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (FCCKPIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCSortOptionForNTPBSortOption(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

uint64_t FCSortOptionForStringSortOption(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("VideoGroupSortOptionDate")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("VideoGroupSortOptionPersonalization")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL FCFilterOptionForNTPBFilterOption(int a1)
{
  return a1 != 0;
}

uint64_t FCFilterOptionForStringFilterOption(void *a1)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("VideoGroupFilterOptionWatched"));
}

void sub_1A1CBFF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCTernaryFromBOOL(uint64_t result)
{
  return result;
}

BOOL FCBOOLFromTernary(uint64_t a1)
{
  return a1 == 1;
}

uint64_t FCOSVersionCompare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = 1;
  if (a2 >= a4)
    v5 = 0;
  else
    v5 = -1;
  if (a1 <= a3)
    v4 = v5;
  if (a1 >= a3)
    return v4;
  else
    return -1;
}

__CFString *FCStringFromOSVersion(uint64_t a1, uint64_t a2)
{
  if (!a1)
    return CFSTR("<none>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), a1, a2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id FCStringFromOSVersions(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  FCStringFromOSVersion(*a1, a1[1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromOSVersion(a1[2], a1[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromOSVersion(a1[4], a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromOSVersion(a1[6], a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("iOS=%@, macOS=%@, watchOS=%@, visionOS=%@"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_1A1CC5478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1CC74DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1CC9184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  id *v37;
  uint64_t v38;

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v38 - 224), 8);
  _Block_object_dispose((const void *)(v38 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t FCIssueHistoryItemIDFromIssueID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iss-%@"), a1);
}

void sub_1A1CCC018(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t FCWriteDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v14 = "BOOL FCWriteDictionary(NSDictionary *__strong, NSURL *__strong)";
    v15 = 2080;
    v16 = "FCFileCoordinatedDictionaryUtilities.m";
    v17 = 1024;
    v18 = 36;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v14 = "BOOL FCWriteDictionary(NSDictionary *__strong, NSURL *__strong)";
    v15 = 2080;
    v16 = "FCFileCoordinatedDictionaryUtilities.m";
    v17 = 1024;
    v18 = 37;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "afterData");
    *(_DWORD *)buf = 136315906;
    v14 = "BOOL FCWriteDictionary(NSDictionary *__strong, NSURL *__strong)";
    v15 = 2080;
    v16 = "FCFileCoordinatedDictionaryUtilities.m";
    v17 = 1024;
    v18 = 41;
    v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = objc_msgSend(v5, "writeToURL:atomically:", v4, 1);

  return v7;
}

long double FCPersonalizationUtilitiesStaticHourlyFlowRate(void *a1, unint64_t a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;

  v3 = a1;
  objc_msgSend(v3, "hourlyFlowRateDampeningFactor");
  v4 = 1.0;
  if (v5 != 0.0)
  {
    objc_msgSend(v3, "hourlyFlowRateDampeningFactor");
    v4 = 1.0 / v6;
  }
  objc_msgSend(v3, "hourlyFlowRateMinimum");
  v8 = v7;
  objc_msgSend(v3, "hourlyFlowRatePerSubscription");
  v10 = v9;
  objc_msgSend(v3, "hourlyFlowRateSubscriptionCountBuffer");
  v12 = v8 + pow(v11 + v10 * (double)a2, v4);

  return v12;
}

double FCPersonalizationBaselineClicksMultiplerForTagID(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  double v24[7];
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (!v6)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke;
    v26[3] = &unk_1E463F390;
    v26[4] = v5;
    __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke((uint64_t)v26);
LABEL_5:
    v11 = 1.0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "defaultTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;

    goto LABEL_7;
  }
  objc_msgSend(v7, "optionalTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_2;
    v25[3] = &unk_1E463F390;
    v25[4] = v5;
    __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_2((uint64_t)v25);
    goto LABEL_5;
  }
LABEL_7:
  v13 = v10;
  objc_msgSend(v13, "doubleValue");
  if (a3 <= 0.0 || v14 <= 0.0)
  {
    *(_QWORD *)&v24[0] = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v24[1] = 3221225472;
    *(_QWORD *)&v24[2] = __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_3;
    *(_QWORD *)&v24[3] = &unk_1E463F3B8;
    v24[6] = a3;
    *(_QWORD *)&v24[4] = v13;
    *(_QWORD *)&v24[5] = v5;
    __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_3(v24);
    v11 = 1.0;
  }
  else
  {
    objc_msgSend(v13, "doubleValue");
    v16 = v15 / 100.0;
    v11 = v15 / 100.0 / a3;
    v17 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v17;
      objc_msgSend(v18, "numberWithDouble:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v5;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      _os_log_debug_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEBUG, "Found whitelisted tag prior for %@. Tag prior %@, baseline prior %@, multiplier %@", buf, 0x2Au);

    }
  }

LABEL_13:
  return v11;
}

void sub_1A1CCF138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Unwind_Resume(a1);
}

void FCResourceArchiveCopyFileFinishedHandler(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;

  BOMCopierUserData();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v4);
}

void FCOperationFlagsApplyToURLRequest(char a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", 0);
    v3 = v4;
    if ((a1 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setAllowsCellularAccess:", 0);
  v3 = v4;
  if ((a1 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a1 & 4) != 0)
  {
LABEL_4:
    objc_msgSend(v4, "setAllowsConstrainedNetworkAccess:", 0);
    v3 = v4;
  }
LABEL_5:

}

const __CFString *NSStringForFCUserEventHistoryPruningPolicyType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("MaxTotalSize");
  else
    return off_1E463F720[a1];
}

void *FCSubscriptionTypes()
{
  return &unk_1E470C678;
}

uint64_t FCCKSubscriptionOriginFromFCSubscriptionOrigin(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    case 9:
      result = a1;
      break;
    case 4:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: These values are deprecated and shouldn't be the origin for any subscription"));
        v6 = 136315906;
        v7 = "FCCKSubscriptionOrigin FCCKSubscriptionOriginFromFCSubscriptionOrigin(FCSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 388;
        v12 = 2114;
        v13 = v3;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 4;
      break;
    case 5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: These values are deprecated and shouldn't be the origin for any subscription"));
        v6 = 136315906;
        v7 = "FCCKSubscriptionOrigin FCCKSubscriptionOriginFromFCSubscriptionOrigin(FCSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 392;
        v12 = 2114;
        v13 = v4;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 5;
      break;
    case 10:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: This value should never be persisted as a subscription origin"));
        v6 = 136315906;
        v7 = "FCCKSubscriptionOrigin FCCKSubscriptionOriginFromFCSubscriptionOrigin(FCSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 414;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 10;
      break;
    default:
      return result;
  }
  return result;
}

const __CFString *FCDescriptionForSubscriptionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("tag");
  else
    return off_1E463F740[a1 - 1];
}

uint64_t FCSubscriptionOriginFromFCCKSubscriptionOrigin(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    case 9:
      result = a1;
      break;
    case 4:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: These values are deprecated and shouldn't be the origin for any subscription"));
        v6 = 136315906;
        v7 = "FCSubscriptionOrigin FCSubscriptionOriginFromFCCKSubscriptionOrigin(FCCKSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 347;
        v12 = 2114;
        v13 = v3;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 4;
      break;
    case 5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: These values are deprecated and shouldn't be the origin for any subscription"));
        v6 = 136315906;
        v7 = "FCSubscriptionOrigin FCSubscriptionOriginFromFCCKSubscriptionOrigin(FCCKSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 351;
        v12 = 2114;
        v13 = v4;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 5;
      break;
    case 10:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: This value should never be persisted as a subscription origin"));
        v6 = 136315906;
        v7 = "FCSubscriptionOrigin FCSubscriptionOriginFromFCCKSubscriptionOrigin(FCCKSubscriptionOrigin)";
        v8 = 2080;
        v9 = "FCSubscription.m";
        v10 = 1024;
        v11 = 373;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

      }
      result = 10;
      break;
    default:
      return result;
  }
  return result;
}

const __CFString *NSStringFromFCSubscriptionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("FCSubscriptionTypeTag");
  else
    return off_1E463F768[a1 - 1];
}

const __CFString *NSStringFromFCSubscriptionOrigin(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return CFSTR("FCSubscriptionOriginUserInitiated");
  else
    return off_1E463F790[a1 - 1];
}

uint64_t FCSubscriptionOriginFromNSString(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(&unk_1E470D308, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

void sub_1A1CD5EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 240), 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A1CDD8B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A1CDDC6C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A1CDE0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1CDE874(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1CE10FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1A1CE2504(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1A1CE3188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 248), 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1CE3DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *FCUserAccountHomeDirectoryPath()
{
  return FCSystemDirectoryDirectoryPath();
}

void *FCContainerizedUserAccountHomeDirectoryPath()
{
  return FCSystemDirectoryDirectoryPath();
}

void *FCContainerizedUserAccountCachesDirectoryPath()
{
  return FCSystemDirectoryDirectoryPath();
}

void *FCAppleInternalLibraryDirectoryPath()
{
  return FCSystemDirectoryDirectoryPath();
}

__CFString *NSStringFromFCOnboardingVersionNumber(unint64_t a1)
{
  if (a1 < 7)
    return off_1E4640320[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Onboarded Post-YukonF with versionNumber %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *NSStringFromFCSportsOnboardingState(uint64_t a1)
{
  if (a1)
    return CFSTR("Sports Onboarded");
  else
    return CFSTR("Sports Not Onboarded");
}

void *FCOnboardingVersionNumbers()
{
  return &unk_1E470C690;
}

void sub_1A1CE62B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCReadingListEntryIDFromArticleID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rl-%@"), a1);
}

void sub_1A1CEE268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1CF0C1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPRecordReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  FCCKPRecordIdentifier *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(FCCKPRecordIdentifier);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || !FCCKPRecordIdentifierReadFrom((uint64_t)v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A1CF2E1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1A1CF3728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSKMutablePaymentClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED0F7F58)
  {
    qword_1ED0F7F58 = _sl_dlopen();
    if (!qword_1ED0F7F58)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SKMutablePayment");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED0F7F50 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id FCApplyFeedTransformations(void *a1, void *a2)
{
  return FCApplyFeedTransformationsAndLog(a1, a2, 0);
}

id FCApplyFeedTransformationsAndLog(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  v21 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        v12 = v7;
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v14 = objc_msgSend(v7, "count");
        objc_msgSend(v13, "transformFeedItems:", v7);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (a3)
        {
          v15 = (void *)FCFeedItemTransformationLog;
          if (os_log_type_enabled((os_log_t)FCFeedItemTransformationLog, OS_LOG_TYPE_DEBUG))
          {
            v16 = v15;
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v7, "count");
            *(_DWORD *)buf = 138412802;
            v27 = v18;
            v28 = 2048;
            v29 = v14;
            v30 = 2048;
            v31 = v19;
            _os_log_debug_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEBUG, "%@: %lu -> %lu", buf, 0x20u);

          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

  return v7;
}

void sub_1A1CF637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 256), 8);
  _Unwind_Resume(a1);
}

id FCPersonalizationActionToIndex()
{
  if (qword_1ED0F7A90 != -1)
    dispatch_once(&qword_1ED0F7A90, &__block_literal_global_51);
  return (id)_MergedGlobals_4;
}

id FCPersonalizationActionIndexToAction()
{
  if (qword_1ED0F7AA0 != -1)
    dispatch_once(&qword_1ED0F7AA0, &__block_literal_global_34);
  return (id)qword_1ED0F7A98;
}

uint64_t FCPersonalizationActionIndex(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  FCPersonalizationActionToIndex();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

uint64_t FCPersonalizationActionForIndex(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  FCPersonalizationActionIndexToAction();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

id FCRankTagsDescending(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(a1, "fc_dictionaryWithKeySelector:", sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rankTagIDsDescending:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FCRankTagsDescending_block_invoke;
  v10[3] = &unk_1E463C9B8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t FCCKPConfigurationFieldValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  FCCKPConfigurationField *v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 64) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_55;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_57;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_57:
        *(_DWORD *)(a1 + 56) = v20;
        goto LABEL_68;
      case 2u:
        PBReaderReadData();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 24;
        goto LABEL_47;
      case 3u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 64) |= 8u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v30 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_61:
        *(_BYTE *)(a1 + 60) = v30 != 0;
        goto LABEL_68;
      case 4u:
        v35 = 0;
        v36 = 0;
        v37 = 0;
        *(_BYTE *)(a1 + 64) |= 2u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          v40 = v39 + 1;
          if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              v15 = v36++ >= 9;
              if (v15)
              {
                v37 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v37 = 0;
LABEL_65:
        *(_QWORD *)(a1 + 16) = v37;
        goto LABEL_68;
      case 5u:
        *(_BYTE *)(a1 + 64) |= 1u;
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v44 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v43);
          *(_QWORD *)(a2 + v42) = v43 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v44 = 0;
        }
        *(_QWORD *)(a1 + 8) = v44;
        goto LABEL_68;
      case 6u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 48;
LABEL_47:
        v45 = *(void **)(a1 + v27);
        *(_QWORD *)(a1 + v27) = v26;

        goto LABEL_68;
      case 7u:
        v46 = objc_alloc_init(FCCKPConfigurationField);
        -[FCCKPConfigurationFieldValue addFieldValues:](a1, v46);
        if (!PBReaderPlaceMark() || !FCCKPConfigurationFieldReadFrom((uint64_t)v46, a2))
          goto LABEL_70;
        goto LABEL_53;
      case 8u:
        v46 = objc_alloc_init(FCCKPConfigurationFieldValue);
        -[FCCKPConfigurationFieldValue addListValues:](a1, v46);
        if (PBReaderPlaceMark() && (FCCKPConfigurationFieldValueReadFrom(v46, a2) & 1) != 0)
        {
LABEL_53:
          PBReaderRecallMark();

LABEL_68:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_70:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_68;
    }
  }
}

void sub_1A1D06874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPublisherSpecifiedArticleListIDForTagID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("L-%@-publisherSpecifiedArticleIDs"), a1);
}

uint64_t FCCKExperimentizedRecordKey(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a1, a2);
}

uint64_t FCCKLocalizedExperimentizedRecordKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), a1, a2, a3);
}

void FCSetupLogging()
{
  if (FCSetupLogging_onceToken != -1)
    dispatch_once(&FCSetupLogging_onceToken, &__block_literal_global_57);
}

id FCURLForUserAccountHomePath()
{
  void *v0;

  v0 = FCSystemDirectoryDirectoryPath();
  return FCURLForSystemDirectoriesPath(v0);
}

id FCURLForAppleInternalLibraryDirectory()
{
  void *v0;
  void *v1;

  v0 = FCSystemDirectoryDirectoryPath();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v0, 4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    free(v0);
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
      v0 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v0 = 0;
    }

  }
  return v0;
}

id FCURLForAppleInternalLibraryBundlesDirectory()
{
  void *v0;
  void *v1;

  FCURLForAppleInternalLibraryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Bundles"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id FCURLForTodayPersonalizationDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Personalization_Data"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v6);

  return v3;
}

id FCURLForLegacyWidgetReferralItems()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privateDataContainerCombinationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("todayWidgetArticleList"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v6);

  return v3;
}

id FCURLForWidgetReferralItems(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v1 = a1;
  +[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDataContainerCombinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForFeldsparUserAccountHomeDirectoryForEnvironment(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("referralItems"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v9);

  return v6;
}

id FCURLForNewsAnalyticsPayloads()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;

  FCURLForFeldsparUserAccountHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Analytics_Payloads"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v4);

  return v1;
}

id FCURLForInternalExtrasBundle()
{
  void *v0;
  void *v1;
  void *v2;

  FCURLForAppleInternalLibraryBundlesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("NewsCoreInternalExtras"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathExtension:", CFSTR("bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCURLsForAppExternalFiles(char a1)
{
  _QWORD v2[4];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __FCURLsForAppExternalFiles_block_invoke;
  v2[3] = &__block_descriptor_33_e22_v16__0__NSMutableSet_8l;
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id FCPurchaseReceiptDirectoryURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  FCURLForContainerizedUserAccountDocumentDirectory(1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("receipts"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v1)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v1, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

uint64_t FCPaywallTypeForValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("PaywallTypeArticleHardPaywall")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeArticleSharedHardPaywall")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeArticleSoftPaywall")))
        {
          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeArticleSharedSoftPaywall")))
          {
            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeChannelSoftPaywall")))
            {
              if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeMagazineFeedSoftPaywallSmall")))
              {
                if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeMagazineFeedSoftPaywallMedium")))
                {
                  if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeMagazineFeedSoftPaywallLarge")))
                  {
                    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeMagazineFeedVideoSoftPaywallSmall")))
                    {
                      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeMagazineFeedVideoSoftPaywallLarge")))
                      {
                        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypePDFHardPaywall")))
                        {
                          if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeAudioFeedSoftPaywallSmall")))
                          {
                            if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeAudioFeedSoftPaywallLarge")))
                            {
                              if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeAudioFeedVideoSoftPaywallSmall")))
                              {
                                if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("PaywallTypeAudioFeedVideoSoftPaywallLarge")))
                                {
                                  v3 = 0;
                                }
                                else
                                {
                                  v3 = 15;
                                }
                              }
                              else
                              {
                                v3 = 14;
                              }
                            }
                            else
                            {
                              v3 = 13;
                            }
                          }
                          else
                          {
                            v3 = 12;
                          }
                        }
                        else
                        {
                          v3 = 11;
                        }
                      }
                      else
                      {
                        v3 = 10;
                      }
                    }
                    else
                    {
                      v3 = 9;
                    }
                  }
                  else
                  {
                    v3 = 8;
                  }
                }
                else
                {
                  v3 = 7;
                }
              }
              else
              {
                v3 = 6;
              }
            }
            else
            {
              v3 = 5;
            }
          }
          else
          {
            v3 = 4;
          }
        }
        else
        {
          v3 = 3;
        }
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FCPaywallOffersLinkTargetTypeForValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("OffersLinkTargetTypeURL")))
      v3 = 2 * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("OffersLinkTargetTypeAMSURL")) == 0);
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id _FCFeedFilterOptionsAsStrings(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("DuplicateArticles"));
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("DuplicateClusters"));
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "addObject:", CFSTR("BlockedStorefronts"));
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "addObject:", CFSTR("ExplicitContent"));
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x4000000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "addObject:", CFSTR("MutedChannels"));
  if ((a1 & 0x4000000) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "addObject:", CFSTR("MutedChannelsExceptDailyBriefing"));
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "addObject:", CFSTR("IgnoringLocalArticleDuplicates"));
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "addObject:", CFSTR("IgnoringLocalClusterDuplicates"));
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "addObject:", CFSTR("MinimumNewsVersion"));
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "addObject:", CFSTR("NonFlint"));
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "addObject:", CFSTR("FreeArticles"));
  if ((a1 & 0x800) == 0)
  {
LABEL_13:
    if ((a1 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "addObject:", CFSTR("Paywall"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_14:
    if ((a1 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "addObject:", CFSTR("BriefingArticles"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_15:
    if ((a1 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "addObject:", CFSTR("InaccessiblePaid"));
  if ((a1 & 0x4000) == 0)
  {
LABEL_16:
    if ((a1 & 0x20000000) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "addObject:", CFSTR("NonSubscribedChannels"));
  if ((a1 & 0x20000000) == 0)
  {
LABEL_17:
    if ((a1 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "addObject:", CFSTR("NonSubscribedChannelsExceptLocal"));
  if ((a1 & 0x8000) == 0)
  {
LABEL_18:
    if ((a1 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "addObject:", CFSTR("NonVideoArticles"));
  if ((a1 & 0x10000) == 0)
  {
LABEL_19:
    if ((a1 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "addObject:", CFSTR("PaidBundleArticles"));
  if ((a1 & 0x20000) == 0)
  {
LABEL_20:
    if ((a1 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "addObject:", CFSTR("MutedTopics"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_21:
    if ((a1 & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "addObject:", CFSTR("MutedTopicsForSingleTopic"));
  if ((a1 & 0x80000) == 0)
  {
LABEL_22:
    if ((a1 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "addObject:", CFSTR("EvergreenArticles"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_23:
    if ((a1 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "addObject:", CFSTR("SeenArticles"));
  if ((a1 & 0x200000) == 0)
  {
LABEL_24:
    if ((a1 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "addObject:", CFSTR("ReadArticles"));
  if ((a1 & 0x400000) == 0)
  {
LABEL_25:
    if ((a1 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "addObject:", CFSTR("CompletedReadingArticles"));
  if ((a1 & 0x800000) == 0)
  {
LABEL_26:
    if ((a1 & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "addObject:", CFSTR("ListenedArticles"));
  if ((a1 & 0x1000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "addObject:", CFSTR("CompletedListeningArticles"));
  if ((a1 & 0x2000000) == 0)
  {
LABEL_28:
    if ((a1 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "addObject:", CFSTR("PlaylistArticles"));
  if ((a1 & 0x8000000) == 0)
  {
LABEL_29:
    if ((a1 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "addObject:", CFSTR("RemovedFromAudioArticles"));
  if ((a1 & 0x10000000) == 0)
  {
LABEL_30:
    if ((a1 & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "addObject:", CFSTR("NonDownloadedArticles"));
  if ((a1 & 0x40000000) == 0)
  {
LABEL_31:
    if ((a1 & 0x80000000) == 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "addObject:", CFSTR("DislikedArticles"));
  if ((a1 & 0x80000000) == 0)
  {
LABEL_32:
    if ((a1 & 0x100000000) == 0)
      goto LABEL_33;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "addObject:", CFSTR("SponsoredArticles"));
  if ((a1 & 0x100000000) == 0)
  {
LABEL_33:
    if ((a1 & 0x200000000) == 0)
      goto LABEL_34;
LABEL_69:
    objc_msgSend(v3, "addObject:", CFSTR("ReduceVisibilityForNonFollowers"));
    if ((a1 & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_68:
  objc_msgSend(v3, "addObject:", CFSTR("NonBundleArticles"));
  if ((a1 & 0x200000000) != 0)
    goto LABEL_69;
LABEL_34:
  if ((a1 & 0x400000000) != 0)
LABEL_35:
    objc_msgSend(v3, "addObject:", CFSTR("AlaCarteInaccessiblePaidForBundleSubscribers"));
LABEL_36:
  v4 = v3;

  return v4;
}

id FCFeedFilterOptionsToNSString(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _FCFeedFilterOptionsAsStrings(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FCFeedFilterOptionToNSString(uint64_t a1)
{
  void *v1;
  void *v2;

  _FCFeedFilterOptionsAsStrings(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCInterestTokenByCombiningTokens(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      v7 = v3;
    else
      v7 = v4;
    v6 = v7;
  }
  v8 = v6;

  return v8;
}

uint64_t PBLifetimeFromFCLifetime(uint64_t a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

uint64_t FCLifetimeFromPBLifetime(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

uint64_t FCArticleContentTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("web")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("flint")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("video")))
        v2 = 0;
      else
        v2 = 3;
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t FCRankOfQualityOfService(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = -1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 != 33)
    v4 = -1;
  if (a1 != 25)
    v3 = v4;
  if (a1 != 17)
    v2 = v3;
  if (a1 == 9)
    v1 = 1;
  if (a1 == -1)
    v1 = 0;
  if (a1 <= 16)
    return v1;
  else
    return v2;
}

void sub_1A1D18ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a67;
  uint64_t v67;

  objc_destroyWeak(location);
  objc_destroyWeak(&a67);
  _Block_object_dispose((const void *)(v67 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D19BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FCCKPOplockFailureReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPRecord *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !FCCKPRecordReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL FCShortcutTypeIsDeprecated(uint64_t a1)
{
  return a1 != 0;
}

__CFString *NSStringFromShortcutType(__CFString *a1)
{
  __CFString **v1;

  if (!a1)
  {
    v1 = FCCKShortcutTypeTag;
    goto LABEL_5;
  }
  if (a1 == (__CFString *)1)
  {
    v1 = &FCCKShortcutTypeMySports;
LABEL_5:
    a1 = *v1;
  }
  return a1;
}

uint64_t FCShortcutTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tag")) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("mySports"));

  return v2;
}

void sub_1A1D33758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D338A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D34E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D3926C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id FCChannelsWithHeldRecords(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager");
    *(_DWORD *)buf = 136315906;
    v17 = "NSDictionary<NSString *,id<FCChannelProviding>> *FCChannelsWithHeldRecords(FCAssetManager *__strong, FCHeldRec"
          "ords<NTPBTagRecord *> *__strong)";
    v18 = 2080;
    v19 = "FCArticleHeadlineUtilities.m";
    v20 = 1024;
    v21 = 68;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __FCChannelsWithHeldRecords_block_invoke;
  v14[3] = &unk_1E4644460;
  v5 = v3;
  v15 = v5;
  objc_msgSend(v4, "transformRecordsWithBlock:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_dictionaryWithKeySelector:", sel_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = objc_msgSend(v4, "count");
    v11 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v17 = (const char *)v10;
    v18 = 2048;
    v19 = (char *)v11;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "ArticleHeadlineUtilities transformed heldTagRecords:%lu into tags:%lu", buf, 0x16u);

  }
  return v7;
}

id FCHeadlinesWithHeldRecords(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  FCHeadlineExperimentalTitleProvider *v19;
  void *v20;
  void *v21;
  FCHeadlineExperimentalTitleProvider *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  FCHeadlineExperimentalTitleProvider *v36;
  uint64_t v37;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a5;
  FCChannelsWithHeldRecords(v14, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FCIssuesWithHeldRecords(v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    v19 = -[FCHeadlineExperimentalTitleProvider initWithShouldShowAlternateHeadlines:]([FCHeadlineExperimentalTitleProvider alloc], "initWithShouldShowAlternateHeadlines:", objc_msgSend(v13, "shouldShowAlternateHeadlines"));
  else
    v19 = 0;
  v20 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v15, "allRecordIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __FCHeadlinesWithHeldRecords_block_invoke;
  v30[3] = &unk_1E4644488;
  v31 = v13;
  v32 = v14;
  v33 = v15;
  v34 = v17;
  v36 = v19;
  v37 = a6;
  v35 = v18;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v15;
  v26 = v14;
  v27 = v13;
  objc_msgSend(v20, "fc_dictionaryWithKeys:allowingNil:valueBlock:", v21, 1, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a6;
  v17 = a5;
  FCChannelsWithHeldRecords(v14, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FCIssuesWithHeldRecords(v14, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99D80];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists_block_invoke;
  v29[3] = &unk_1E46444D8;
  v30 = v13;
  v31 = v16;
  v32 = v14;
  v33 = v15;
  v35 = v19;
  v36 = a7;
  v34 = v18;
  v21 = v19;
  v22 = v18;
  v23 = v15;
  v24 = v14;
  v25 = v16;
  v26 = v13;
  objc_msgSend(v20, "fc_dictionary:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void sub_1A1D3C614(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t FCHLSUIntegerFromString(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (objc_class *)MEMORY[0x1E0CB3900];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithString:", v2);

  v6 = 0;
  objc_msgSend(v3, "scanUnsignedLongLong:", &v6);
  v4 = v6;

  return v4;
}

uint64_t FCTagSettingsEntryIDFromTagID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), a1);
}

uint64_t FCIsTagSettingsRecordName(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("ts-"));
}

uint64_t FCPaymentTransactionStateFromSKState(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

id getSKPaymentQueueClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSKPaymentQueueClass_softClass;
  v7 = getSKPaymentQueueClass_softClass;
  if (!getSKPaymentQueueClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSKPaymentQueueClass_block_invoke;
    v3[3] = &unk_1E46406D0;
    v3[4] = &v4;
    __getSKPaymentQueueClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A1D40A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D40F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSKPaymentQueueClass_block_invoke(uint64_t a1)
{
  StoreKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SKPaymentQueue");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSKPaymentQueueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    StoreKitLibrary();
  }
}

void StoreKitLibrary()
{
  void *v0;

  if (!StoreKitLibraryCore_frameworkLibrary)
  {
    StoreKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!StoreKitLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getSKPaymentQueueClientClass_block_invoke(uint64_t a1)
{
  Class result;
  FCCKPrivateFetchRecordZonesOperation *v3;
  SEL v4;

  StoreKitLibrary();
  result = objc_getClass("SKPaymentQueueClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSKPaymentQueueClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (FCCKPrivateFetchRecordZonesOperation *)abort_report_np();
    return (Class)-[FCCKPrivateFetchRecordZonesOperation validateOperation](v3, v4);
  }
  return result;
}

uint64_t FCDesiredArticleRecordFieldOptionsWithHeadlineFieldOptions(unint64_t a1)
{
  return a1 & 0xF | (16 * ((a1 >> 6) & 1)) | (a1 >> 7) & 0x240000 | (a1 >> 5) & 0x1FE0 | (a1 >> 7) & 0x371BE000 | (a1 >> 24) & 0x400;
}

void sub_1A1D46354(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D4B3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D4B84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CKNSPredicateOperatorTypeForFCCKPQueryFilterType(int a1)
{
  int v1;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1 - 1;
  if ((a1 - 1) < 0x10 && ((0x80F7u >> v1) & 1) != 0)
    return qword_1A1E825C8[v1];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected filter type"));
    v4 = 136315906;
    v5 = "NSPredicateOperatorType CKNSPredicateOperatorTypeForFCCKPQueryFilterType(FCCKPQueryFilter_Type)";
    v6 = 2080;
    v7 = "FCCKPredicateConversion.m";
    v8 = 1024;
    v9 = 68;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

  }
  return 4;
}

uint64_t CKQueryFilterTypeSortedValue(int a1)
{
  if ((a1 - 2) > 0x13)
    return 1;
  else
    return dword_1A1E82698[a1 - 2];
}

uint64_t FCNextHigherVolumeFeedBin(uint64_t result)
{
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(result)
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't increase an unknown bin"));
        v2 = 136315906;
        v3 = "FCFeedBin FCNextHigherVolumeFeedBin(FCFeedBin)";
        v4 = 2080;
        v5 = "FCFeedBins.m";
        v6 = 1024;
        v7 = 26;
        v8 = 2114;
        v9 = v1;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2, 0x26u);

      }
      result = 0;
      break;
    case 1:
      result = 2;
      break;
    case 2:
    case 3:
      result = 3;
      break;
    default:
      return result;
  }
  return result;
}

__CFString *FCStringFromFeedBin(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E4644A00[a1];
}

id FCOfflineThumbnailAssetHandlesForHeadline(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FCOfflineThumbnailAssetHandlesForHeadline_block_invoke;
  v10[3] = &unk_1E463EFB0;
  v11 = v4;
  v12 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "fc_array:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FCOfflineThumbnailAssetHandlesForIssue(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0C99D20];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCOfflineThumbnailAssetHandlesForIssue_block_invoke;
  v6[3] = &unk_1E463AA30;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v2, "fc_array:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FCOfflineThumbnailAssetHandlesForPuzzle(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FCOfflineThumbnailAssetHandlesForPuzzle_block_invoke;
  v10[3] = &unk_1E463EFB0;
  v11 = v3;
  v12 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "fc_array:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FCOfflineThumbnailAssetHandlesForArticleRecord(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __FCOfflineThumbnailAssetHandlesForArticleRecord_block_invoke;
  v14[3] = &unk_1E463F098;
  v15 = v6;
  v16 = v5;
  v17 = v7;
  v9 = v7;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v8, "fc_array:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id FCOfflineThumbnailAssetHandlesForPuzzleRecords(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __FCOfflineThumbnailAssetHandlesForPuzzleRecords_block_invoke;
  v18[3] = &unk_1E4644A28;
  v19 = v8;
  v20 = v7;
  v21 = v10;
  v22 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v11, "fc_array:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_1A1D4EF90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPRecordType *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(FCCKPRecordType);
        -[FCCKPQuery addTypes:](a1, v17);
        if (PBReaderPlaceMark() && (FCCKPRecordTypeReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_29;
        goto LABEL_54;
      case 2u:
        v17 = objc_alloc_init(FCCKPQueryFilter);
        -[FCCKPQuery addFilters:](a1, v17);
        if (!PBReaderPlaceMark() || (FCCKPQueryFilterReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_54;
        goto LABEL_29;
      case 3u:
        v17 = objc_alloc_init(FCCKPQuerySort);
        -[FCCKPQuery addSorts:](a1, v17);
        if (PBReaderPlaceMark() && (FCCKPQuerySortReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_52:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_54:

        return 0;
      case 4u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                v21 = 0;
                goto LABEL_47;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_47:
        *(_BYTE *)(a1 + 40) = v21 != 0;
        goto LABEL_52;
      case 5u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v27) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v27) = 0;
LABEL_51:
        *(_DWORD *)(a1 + 16) = v27;
        goto LABEL_52;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_52;
    }
  }
}

id FCAssetHandleForArticleAndMinimumSize(void *a1, double a2, double a3, double a4)
{
  void *v4;
  void *v5;

  FCThumbnailForHeadlineMinimumSizeInPixels(a1, a2 * a4, a3 * a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnailAssetHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL FCHeadlineHasLocalThumbnail(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v1 = a1;
  objc_msgSend(v1, "thumbnailUltraHQ");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v1, "thumbnailHQ");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailAssetHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v1, "thumbnailMedium");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "thumbnailAssetHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v1, "thumbnail");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "thumbnailAssetHandle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "filePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(v1, "thumbnailLQ");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "thumbnailAssetHandle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "filePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v12 != 0;

          v11 = 0;
        }

      }
    }

  }
  return v5;
}

id FCPlaceholderHeadlineThumbnail()
{
  void *v0;
  void *v1;
  FCRawFileDataProvider *v2;
  _QWORD *v3;
  void *v4;

  FCBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("cellImagePlaceholder"), CFSTR("png"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = -[FCRawFileDataProvider initWithFilePath:]([FCRawFileDataProvider alloc], "initWithFilePath:", v1);
  v3 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v2);
  +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v3, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FCThumbnailForHeadline(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  FCCachedThumbnailForHeadline(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    FCPlaceholderHeadlineThumbnail();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id FCFetchThumbnailForHeadlineWithMinimumSize(void *a1, uint64_t a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v11 = a3;
  FCAssetHandleForArticleAndMinimumSize(a1, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __FCFetchThumbnailForHeadlineWithMinimumSize_block_invoke;
    v16[3] = &unk_1E463B790;
    v17 = v12;
    v18 = v11;
    objc_msgSend(v17, "downloadIfNeededWithPriority:completion:", a2, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    v14 = 0;
  }

  return v14;
}

id FCNarrativeTrackForSubscription(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "cachedSubscription");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v6, (const void *)(v6 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = v8;
  objc_getAssociatedObject((id)v6, (const void *)~v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue") ^ v9;

  if ((v11 & 1) != 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v3, "narrativeTrackSample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_6:
    objc_msgSend(v3, "narrativeTrack");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend(v3, "narrativeTrackSample");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = (void *)v13;

  return v14;
}

__CFString *FCFDBErrorMessage(sqlite3 *a1)
{
  const char *v1;
  __CFString *v2;

  if (a1)
  {
    v1 = sqlite3_errmsg(a1);
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v1, 4);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = CFSTR("<unknown>");
    }
  }
  else
  {
    v2 = CFSTR("<unknown>");
  }
  return v2;
}

uint64_t FCFDBInvokeClose(sqlite3 *a1)
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_close(a1);
  if ((_DWORD)v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCFDBErrorMessage(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("sqlite3 close failed with result=%d, error=%@"), v2, v5);
    *(_DWORD *)buf = 136315906;
    v8 = "int FCFDBInvokeClose(sqlite3 *)";
    v9 = 2080;
    v10 = "FCFDBUtilities.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v6;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: FDBCloseFailed) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v2;
}

const __CFString *NSStringFromFCNewsPersonalizationArticleEmbeddingsFittingConfigurationEmbeddingType(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("body");
  else
    return CFSTR("title");
}

id FCCloudKitIDFromUUID(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  FCUUIDStringToUUIDBytes(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "substringToIndex:", 22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id FCUUIDFromCloudKitID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length") != 23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cloudKitID.length == FCLengthOfCloudKitID");
    *(_DWORD *)buf = 136315906;
    v11 = "NSString *FCUUIDFromCloudKitID(NSString *__strong)";
    v12 = 2080;
    v13 = "FCNewsIDUtilities.m";
    v14 = 1024;
    v15 = 37;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v1, "substringFromIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("=="));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
  FCUUIDBytesToUUIDString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FCTagCloudKitIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("T"));
}

id FCArticleCloudKitIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("A"));
}

id FCIssueCloudKitIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("I"));
}

id FCForYouConfigRecordIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("Y-"));
}

id FCArticleListRecordIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("L"));
}

id FCIssueListRecordIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("M"));
}

id FCPuzzleCloudKitIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("J"));
}

id FCPuzzleTypeCloudKitIDFromUUID(void *a1)
{
  return FCCloudKitIDFromUUID(a1, CFSTR("Z"));
}

id FCRandomTagCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("T"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomArticleCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("A"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomIssueCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("I"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomForYouConfigCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("Y-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomArticleListCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("L"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomIssueListCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("M"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomPuzzleCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("J"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomPuzzleTypeCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCCloudKitIDFromUUID(v1, CFSTR("Z"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FCRandomShortcutCategoryCloudKitID()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCUUIDFromCloudKitID(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t FCSubscriptionButtonTypeWithValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTypeArticle")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTypeLandingPage")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTypeIssueCover")))
          v3 = 0;
        else
          v3 = 3;
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FCTargetTypeWithValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTargetTypeLandingPage")))
    {
      if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTargetTypeOsloSheet")))
      {
        if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonTargetTypeAMSSheet")))
          v3 = 0;
        else
          v3 = 3;
      }
      else
      {
        v3 = 2;
      }
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL FCPostPurchaseActionTypeWithValue(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = v1;
  v3 = v1
    && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonPostPurchaseActionTypeNone"))
    && objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("SubscriptionButtonPostPurchaseActionTypeURL")) == 0;

  return v3;
}

void sub_1A1D5D4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSKReceiptRefreshRequestClass_block_invoke(uint64_t a1)
{
  StoreKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SKReceiptRefreshRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_175 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    StoreKitLibrary_0();
  }
}

void StoreKitLibrary_0()
{
  void *v0;

  if (!StoreKitLibraryCore_frameworkLibrary_0)
  {
    StoreKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!StoreKitLibraryCore_frameworkLibrary_0)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void __getSKPaymentQueueClientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  StoreKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SKPaymentQueueClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED0F8430 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = abort_report_np();
    __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke_2(v2, v3);
  }
}

void sub_1A1D5F694(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D60A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D60C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCFeedRangeCoveredByFeedItems(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", objc_msgSend(v2, "order"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", objc_msgSend(v4, "order") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t FCFeedGroupTypeFromNSString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("None")) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SingleTag")) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TopStories")) & 1) != 0)
    {
      v2 = 26;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TrendingStories")) & 1) != 0)
    {
      v2 = 2;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DailyBriefings")) & 1) != 0)
    {
      v2 = 3;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SavedStories")) & 1) != 0)
    {
      v2 = 4;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GreatStoriesYouMissed")) & 1) != 0)
    {
      v2 = 5;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Editorial")) & 1) != 0)
    {
      v2 = 6;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Latest")) & 1) != 0)
    {
      v2 = 8;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Topic")) & 1) != 0)
    {
      v2 = 9;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MoreForYou")) & 1) != 0)
    {
      v2 = 10;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NewFavorite")) & 1) != 0)
    {
      v2 = 11;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PaidSubscription")) & 1) != 0)
    {
      v2 = 12;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("BestOfEdition")) & 1) != 0)
    {
      v2 = 13;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DraftArticles")) & 1) != 0)
    {
      v2 = 16;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DraftIssues")) & 1) != 0)
    {
      v2 = 17;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AutoFavorite")) & 1) != 0)
    {
      v2 = 14;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MoreFromPublisher")) & 1) != 0)
    {
      v2 = 18;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RelatedArticles")) & 1) != 0)
    {
      v2 = 19;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RecommendedReads")) & 1) != 0)
    {
      v2 = 20;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("EndOfArticleUnknown")) & 1) != 0)
    {
      v2 = 21;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Spotlight")) & 1) != 0)
    {
      v2 = 7;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Curated")) & 1) != 0)
    {
      v2 = 23;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Newspaper")) & 1) != 0)
    {
      v2 = 24;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LocalNews")) & 1) != 0)
    {
      v2 = 25;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AudioDailyBriefing")) & 1) != 0)
    {
      v2 = 36;
      goto LABEL_55;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MagazineTrending")) & 1) != 0)
    {
      v2 = 37;
      goto LABEL_55;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Don't have a mapping for %@"), v1);
      *(_DWORD *)buf = 136315906;
      v6 = "FCFeedGroupType FCFeedGroupTypeFromNSString(NSString *__strong)";
      v7 = 2080;
      v8 = "FCFeedGroupType.m";
      v9 = 1024;
      v10 = 125;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  v2 = 0;
LABEL_55:

  return v2;
}

const __CFString *NSStringFromFCFeedGroupType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x25)
    return CFSTR("None");
  else
    return off_1E46452F0[a1 - 1];
}

id NSErrorForHTTPStatusCode(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3308]);
  if (a1 > 399)
  {
    if ((unint64_t)(a1 - 400) <= 0x1D && ((1 << (a1 + 112)) & 0x20002009) != 0)
      goto LABEL_13;
    if (a1 == 500 || a1 == 503)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSErrorFCAdditionsShouldRetry"));
LABEL_13:
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = a1;
      goto LABEL_14;
    }
LABEL_19:
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = -1000;
    v9 = 0;
    goto LABEL_15;
  }
  if (a1 <= 199)
  {
    if (a1 == -2000)
      goto LABEL_13;
    if (!a1)
    {
      v6 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSErrorFCAdditionsIsNetworkUnavailable"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("NSErrorFCAdditionsShouldRetry"));
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = 0;
LABEL_14:
      v9 = v5;
LABEL_15:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  v10 = 0;
  if (a1 != 200 && a1 != 202)
    goto LABEL_19;
LABEL_16:

  return v10;
}

void sub_1A1D6D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NSErrorByUpdatingRetryStatusForError(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  v4 = v1;
  if (v3)
  {
    v5 = objc_msgSend(v1, "code");
    v4 = v1;
    if ((unint64_t)(v5 + 1009) <= 8)
    {
      v4 = v1;
      if (((1 << (v5 - 15)) & 0x131) != 0)
      {
        objc_msgSend(v1, "userInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "mutableCopy");
        v8 = v7;
        if (v7)
          v9 = v7;
        else
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = v9;

        objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSErrorFCAdditionsShouldRetry"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "code") == -1009);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("NSErrorFCAdditionsIsNetworkUnavailable"));

        v12 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v1, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v1, "code"), v10);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v4;
}

BOOL FCArticleStoryTypeIsEligibleForExpiration(uint64_t a1)
{
  return a1 != 5;
}

void sub_1A1D705E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D70FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D71220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCCKPRecordsOptions()
{
  if (qword_1ED0F8460 != -1)
    dispatch_once(&qword_1ED0F8460, &__block_literal_global_98);
  return (id)_MergedGlobals_177;
}

void sub_1A1D7230C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D735E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKDatabaseStartUpResultFromError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v5 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v1, "fc_isTemporaryNetworkOrServerError") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v4 = objc_msgSend(v2, "code");

    if (v4 == 4097)
    {
LABEL_5:
      v5 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (objc_msgSend(v2, "fc_isOfflineError"))
    v5 = 1;
  else
    v5 = 2;
LABEL_11:

  return v5;
}

uint64_t FCCKPQueryRetrieveRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPQuery *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(FCCKPQuery);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (FCCKPQueryReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_37;
        goto LABEL_44;
      case 2u:
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v19;

        goto LABEL_42;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 16) = v23;
        goto LABEL_42;
      case 4u:
        v17 = objc_alloc_init(FCCKPRecordZoneIdentifier);
        objc_storeStrong((id *)(a1 + 40), v17);
        if (!PBReaderPlaceMark() || !FCCKPRecordZoneIdentifierReadFrom((uint64_t)v17, a2))
          goto LABEL_44;
        goto LABEL_37;
      case 5u:
        v17 = objc_alloc_init(FCCKPRequestedFields);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark() && (FCCKPRequestedFieldsReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_42;
    }
  }
}

void sub_1A1D749D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D75458(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id FCCKPClientOptions()
{
  if (qword_1ED0F8490 != -1)
    dispatch_once(&qword_1ED0F8490, &__block_literal_global_102);
  return (id)_MergedGlobals_180;
}

double FCCoverArtImageDimensionsFromJSON(void *a1)
{
  double v1;
  id v2;
  void *v3;
  void *v4;
  float v5;

  v1 = *MEMORY[0x1E0C9D820];
  v2 = a1;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "floatValue");
      v1 = v5;
      objc_msgSend(v4, "floatValue");
    }
  }

  return v1;
}

id FCCoverArtImageClassFromJSON(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("type"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "isEqualToString:", CFSTR("image2")))
    v2 = (void *)objc_opt_class();
  v3 = v2;

  return v3;
}

id FCCoverArtImageURLFromJSON(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("URL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id FCCoverArtImagesFromUnprocessedImages(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = FCCoverArtImageDimensionsFromJSON(v8);
            v11 = v10;
            v12 = (objc_class *)FCCoverArtImageClassFromJSON(v8);
            FCCoverArtImageURLFromJSON(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = [v12 alloc];
            v15 = (void *)objc_msgSend(v14, "initWithDimensions:URL:", v13, v9, v11, (_QWORD)v17);
            objc_msgSend(v2, "fc_safelyAddObject:", v15);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void FCMergeHistoryItemSeenFields(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "leftItem");
    *(_DWORD *)buf = 136315906;
    v18 = "void FCMergeHistoryItemSeenFields(__strong id<FCMutableReadingHistoryItem>, __strong id<FCReadingHistoryItem>)";
    v19 = 2080;
    v20 = "FCReadingHistoryUtilities.m";
    v21 = 1024;
    v22 = 29;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "rightItem");
    *(_DWORD *)buf = 136315906;
    v18 = "void FCMergeHistoryItemSeenFields(__strong id<FCMutableReadingHistoryItem>, __strong id<FCReadingHistoryItem>)";
    v19 = 2080;
    v20 = "FCReadingHistoryUtilities.m";
    v21 = 1024;
    v22 = 30;
    v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "firstSeenAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstSeenAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_earlierDateAllowingNilWithDate:andDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstSeenAt:", v8);

  v9 = objc_msgSend(v4, "maxVersionSeen");
  v10 = objc_msgSend(v3, "maxVersionSeen");
  if (v10 <= v9)
  {
    if (v10 == v9)
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "firstSeenAtOfMaxVersionSeen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstSeenAtOfMaxVersionSeen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fc_earlierDateAllowingNilWithDate:andDate:", v14, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFirstSeenAtOfMaxVersionSeen:", v13);

    }
    else
    {
      objc_msgSend(v3, "setMaxVersionSeen:", v9);
      objc_msgSend(v4, "firstSeenAtOfMaxVersionSeen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFirstSeenAtOfMaxVersionSeen:", v14);
    }

  }
}

id FCPruneHistoryItemsForUpload(void *a1)
{
  return _FCPruneHistoryForUpload(a1, &__block_literal_global_105, &__block_literal_global_9_0);
}

id _FCPruneHistoryForUpload(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  uint64_t (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v6[2](v6, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v8, "count", (_QWORD)v18) < 0x3E8
          || (v7[2](v7, v14) & 1) != 0
          || v15 && (objc_msgSend(v15, "fc_timeIntervalUntilNow"), v16 < 2419200.0))
        {
          objc_msgSend(v8, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

id FCPruneHistoryRecordsForUpload(void *a1)
{
  return _FCPruneHistoryForUpload(a1, &__block_literal_global_11_1, &__block_literal_global_13);
}

uint64_t FeldsparCoreInternalExtrasEnabled()
{
  if (qword_1ED0F84C0 != -1)
    dispatch_once(&qword_1ED0F84C0, &__block_literal_global_1_1);
  return _MergedGlobals_182;
}

void sub_1A1D7ABDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D7B50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCTagRecordDesiredFieldOptionsForNameImageFallback()
{
  return 284;
}

id FCUUIDStringToUUIDBytes(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v6;
  _BYTE buf[22];
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (objc_class *)MEMORY[0x1E0CB3A28];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithUUIDString:", v2);

  if (v3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v3, "getUUIDBytes:", buf);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "UUID");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "NSData *FCUUIDStringToUUIDBytes(NSString *__strong)";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCUUIDUtilities.m";
      v8 = 1024;
      v9 = 18;
      v10 = 2114;
      v11 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v4 = 0;
  }

  return v4;
}

id FCUUIDBytesToUUIDString(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CB3A28];
    v2 = a1;
    v3 = [v1 alloc];
    v4 = objc_retainAutorelease(v2);
    v5 = objc_msgSend(v4, "bytes");

    v6 = (void *)objc_msgSend(v3, "initWithUUIDBytes:", v5);
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "result");
      *(_DWORD *)buf = 136315906;
      v12 = "NSString *FCUUIDBytesToUUIDString(NSData *__strong)";
      v13 = 2080;
      v14 = "FCUUIDUtilities.m";
      v15 = 1024;
      v16 = 38;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void sub_1A1D7CD58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A1D7DDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1D7E1EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1A1D8045C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1D811F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location)
{
  id *v45;

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1D81F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D86F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D8C40C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1A1D9110C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D93B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D956E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D9584C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D959B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1D95B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCHeadlineTemplateTypeWithJSONValue(void *a1)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("Image On Top"));
}

void sub_1A1D96C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPQuerySortReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  FCCKPRecordFieldIdentifier *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPRecordFieldIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (FCCKPRecordFieldIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *FCStringFromQoSClass(int a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v1 = CFSTR("UserInteractive");
  v2 = CFSTR("Utility");
  v3 = CFSTR("Default");
  v4 = CFSTR("UserInitiated");
  if (a1 != 25)
    v4 = CFSTR("UserInteractive");
  if (a1 != 21)
    v3 = v4;
  if (a1 != 17)
    v2 = v3;
  if (a1 == 9)
    v1 = CFSTR("Background");
  if (!a1)
    v1 = CFSTR("Unspecified");
  if (a1 <= 16)
    return v1;
  else
    return v2;
}

uint64_t FCDefaultsDomainiCloudDataDestructionStickyKeys()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("show_stories_only_from_favorites"), CFSTR("FCAppleAccountContentStoreFrontiTunesDSIDKey"), CFSTR("FCAppleAccountContentStoreFrontIDKey"), CFSTR("automatic_downloads_enabled"), CFSTR("automatically_download_feed_stories"), CFSTR("automatically_download_saved_stories"), CFSTR("automatically_download_issues"), CFSTR("automatically_download_puzzles"), CFSTR("automatically_download_audio"), 0);
}

id FCSettingsOverrideEmbedURLTodayWidget()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "BOOLForKey:", CFSTR("embed_url_override_enabled")))
    {
      NewsCoreUserDefaults();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "stringForKey:", CFSTR("embed_url_override_today_widget"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("testID"), v6);

  objc_msgSend(v3, "fc_URLByAddingQueryItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t FCZoneLastModifiedExternallySharedPreferenceKey(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zone-last-modified-externally-%@"), a1);
}

uint64_t FCFeedBinForTopicsInForYou(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "subscriptionList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subscribedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 0x64)
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

const __CFString *FCOperationPurposeFromFeedType(unint64_t a1)
{
  if (a1 > 0x17)
    return CFSTR("todayFeed");
  else
    return off_1E4646BB8[a1];
}

void applicationStateNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  objc_msgSend(a5, "objectForKey:", CFSTR("com.apple.news"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = a2;
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __applicationStateNotificationCallback_block_invoke;
    block[3] = &unk_1E463AB18;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __applicationStateNotificationCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailability");
}

void applicationRegisteredAndUnregisteredNotificationCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  objc_msgSend(a5, "objectForKey:", CFSTR("bundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.news")))
  {
    v7 = a2;
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __applicationRegisteredAndUnregisteredNotificationCallback_block_invoke;
    block[3] = &unk_1E463AB18;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __applicationRegisteredAndUnregisteredNotificationCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailability");
}

BOOL FCCKPLocaleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            -[FCCKPLocale addEnabledKeyboards:](a1, v19);
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_26:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;
LABEL_27:

          goto LABEL_28;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_28:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCDeviceIsA7()
{
  if (qword_1ED0F8580 != -1)
    dispatch_once(&qword_1ED0F8580, &__block_literal_global_123);
  return _MergedGlobals_190;
}

uint64_t FCDeviceIsA8()
{
  if (qword_1ED0F8588 != -1)
    dispatch_once(&qword_1ED0F8588, &__block_literal_global_1_2);
  return byte_1ED0F8579;
}

id FCDeviceUUIDForVendor()
{
  if (qword_1ED0F8598 != -1)
    dispatch_once(&qword_1ED0F8598, &__block_literal_global_7_4);
  return (id)qword_1ED0F8590;
}

id FCDeviceIdentifierForVendor()
{
  if (qword_1ED0F85A8 != -1)
    dispatch_once(&qword_1ED0F85A8, &__block_literal_global_8_2);
  return (id)qword_1ED0F85A0;
}

void sub_1A1D9D550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCLookupRecordByName(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  FCLookupRecordByNames(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fc_onlyObject", v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FCFeedItemRecordsForArticle(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordType"), CFSTR("FeedItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), v4, CFSTR("articleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v7;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id FCSortedFeedItemRecordsForFeedID(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordType"), CFSTR("FeedItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), v4, CFSTR("tagID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v7;
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("order"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("subOrder"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id FCLookupFeedItemRecordByFeedAndArticle(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("recordType"), CFSTR("FeedItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), v7, CFSTR("tagID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), v6, CFSTR("articleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v10;
  v18[1] = v11;
  v18[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "fc_onlyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id FCLookupRecordByNames(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __FCLookupRecordByNames_block_invoke;
  v11[3] = &unk_1E463AE18;
  v12 = v3;
  v5 = v3;
  v6 = a1;
  objc_msgSend(v4, "fc_set:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v7, CFSTR("recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1A1DA8068(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DA8CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1DA8E94(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1DAB3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 216), 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DAC4A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  id v11;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(exception_object);
    (*(void (**)(uint64_t))(v10 + 16))(v10);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1A1DAC470);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A1DAD2E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Unwind_Resume(exception_object);
}

void enumerateOrderedCollectionPairwise(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v3 = a1;
  v4 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__53;
    v8[4] = __Block_byref_object_dispose__53;
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __enumerateOrderedCollectionPairwise_block_invoke;
    v5[3] = &unk_1E4647318;
    v6 = v4;
    v7 = v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

    _Block_object_dispose(v8, 8);
  }

}

void sub_1A1DAF1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __enumerateOrderedCollectionPairwise_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

BOOL isOrderedCollectionSorted(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v8;
  _QWORD v9[4];
  id v10;
  _BYTE *v11;
  _BYTE buf[24];
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v13) = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __isOrderedCollectionSorted_block_invoke;
    v9[3] = &unk_1E4647340;
    v10 = v4;
    v11 = buf;
    enumerateOrderedCollectionPairwise(v3, v9);

    v6 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cmptr");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "BOOL isOrderedCollectionSorted(__strong id<FCOrderedCollection>, __strong NSComparator)";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCOrderedCollection.m";
      *(_WORD *)&buf[22] = 1024;
      v13 = 34;
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v6 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v13) = 0;
  }
  _Block_object_dispose(buf, 8);

  return v6;
}

void sub_1A1DAF408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __isOrderedCollectionSorted_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (result == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

void __mergeSortedOrderedCollections_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v3, v5, v4 - v5, 1024, *(_QWORD *)(a1 + 48));
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
    v8 = v6 >= v4;
  else
    v8 = 1;
  if (v8
    || (v9 = *(_QWORD *)(a1 + 48),
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v3),
        v10,
        v11))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v3, v7);
    if (objc_msgSend(*(id *)(a1 + 32), "count") == v12 + 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", v7);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to insert %@"), v3);
      *(_DWORD *)buf = 136315906;
      v15 = "NSIndexSet *mergeSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrderedMutableColl"
            "ection>, __strong NSComparator)_block_invoke";
      v16 = 2080;
      v17 = "FCOrderedCollection.m";
      v18 = 1024;
      v19 = 93;
      v20 = 2114;
      v21 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

}

id diffSortedOrderedCollections(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "rightCollection");
    *(_DWORD *)buf = 136315906;
    v26 = "NSDictionary *diffSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrderedCollection>,"
          " __strong NSComparator)";
    v27 = 2080;
    v28 = "FCOrderedCollection.m";
    v29 = 1024;
    v30 = 123;
    v31 = 2114;
    v32 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v5)
      goto LABEL_6;
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "leftCollection");
    *(_DWORD *)buf = 136315906;
    v26 = "NSDictionary *diffSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrderedCollection>,"
          " __strong NSComparator)";
    v27 = 2080;
    v28 = "FCOrderedCollection.m";
    v29 = 1024;
    v30 = 124;
    v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v7)
  {
    v8 = 0;
    if (v5 && v6)
    {
      v9 = (void *)objc_opt_new();
      v10 = (void *)objc_opt_new();
      if (objc_msgSend(v5, "count"))
      {
        v11 = 0;
        v12 = 0;
        while (1)
        {
          if (v12 >= objc_msgSend(v6, "count"))
            goto LABEL_25;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v7[2](v7, v13, v14);
          if (v15 == 1)
          {
            objc_msgSend(v9, "addIndex:", v12);
          }
          else
          {
            if (v15)
            {
              if (v15 == -1)
                objc_msgSend(v10, "addIndex:", v11++);
              goto LABEL_19;
            }
            ++v11;
          }
          ++v12;
LABEL_19:

          if (v11 >= objc_msgSend(v5, "count"))
            goto LABEL_25;
        }
      }
      v12 = 0;
      v11 = 0;
LABEL_25:
      if (v11 >= objc_msgSend(v5, "count"))
      {
        if (v12 >= objc_msgSend(v6, "count"))
        {
LABEL_30:
          v23[0] = CFSTR("insertedIndices");
          v23[1] = CFSTR("deletedIndices");
          v24[0] = v9;
          v24[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        v18 = v11 - objc_msgSend(v10, "count");
        v11 = v18 + objc_msgSend(v9, "count");
        v16 = v6;
        v17 = v9;
      }
      else
      {
        v16 = v5;
        v12 = v11;
        v17 = v10;
      }
      objc_msgSend(v17, "addIndexesInRange:", v11, objc_msgSend(v16, "count") - v12);
      goto LABEL_30;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cmptr");
      *(_DWORD *)buf = 136315906;
      v26 = "NSDictionary *diffSortedOrderedCollections(__strong id<FCOrderedCollection>, __strong id<FCOrderedCollection"
            ">, __strong NSComparator)";
      v27 = 2080;
      v28 = "FCOrderedCollection.m";
      v29 = 1024;
      v30 = 125;
      v31 = 2114;
      v32 = v22;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v8 = 0;
  }
LABEL_31:

  return v8;
}

id findObjectWithFeatureInSortedOrderedCollection(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  uint64_t (**v10)(id, void *, id);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v7, "count") || (v11 = objc_msgSend(v7, "count") - 1, v11 < 0))
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v12 = 0;
  while (1)
  {
    v13 = v12 + v11;
    if (v12 + v11 < 0 != __OFADD__(v12, v11))
      ++v13;
    v14 = (uint64_t)(double)(v13 >> 1);
    objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10[2](v10, v16, v8);
    if (v17 == -1)
    {
      v12 = v14 + 1;
      goto LABEL_12;
    }
    if (v17 == 1)
    {
      v11 = v14 - 1;
      goto LABEL_12;
    }
    if (!v17)
      break;
LABEL_12:

    if (v12 > v11)
      goto LABEL_13;
  }

LABEL_14:
  return v15;
}

void sub_1A1DB086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1DB234C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DB25CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DB3250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *FCCKPrivateDatabaseVersionString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Base");
  else
    return off_1E4647758[a1 - 1];
}

uint64_t FCCKPrivateDatabaseVersionMin(uint64_t result, uint64_t a2)
{
  if (result >= a2)
    return a2;
  return result;
}

uint64_t FCCKPrivateDatabaseVersionMin3(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2 >= a3)
    v3 = a3;
  else
    v3 = a2;
  if (v3 < result)
    return v3;
  return result;
}

double FCCKPrivateDatabaseVersionDebutOS@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  switch(a1)
  {
    case 0:
      result = 0.0;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      break;
    case 1:
      *(_QWORD *)&result = 11;
      *(_OWORD *)a2 = xmmword_1A1E83290;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      break;
    case 2:
      *(_OWORD *)a2 = xmmword_1A1E83280;
      *(_QWORD *)(a2 + 16) = 11;
      result = 0.0;
      *(_OWORD *)(a2 + 24) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_QWORD *)(a2 + 56) = 0;
      break;
    case 3:
      *(_OWORD *)a2 = xmmword_1A1E83240;
      *(_OWORD *)(a2 + 16) = xmmword_1A1E83250;
      *(_QWORD *)&result = 11;
      *(_OWORD *)(a2 + 32) = xmmword_1A1E83260;
      *(_OWORD *)(a2 + 48) = xmmword_1A1E83270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t FCCKPrivateDatabaseVersionSupportedByOS(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = 3;
  v3 = 3;
  while (1)
  {
    switch(v3)
    {
      case 1uLL:
        v10 = 0;
        v6 = 0;
        v7 = 0;
        v5 = 1;
        v9 = 11;
        v4 = 3;
        v8 = 1;
        break;
      case 3uLL:
        v4 = 0;
        v5 = 0;
        v8 = 0;
        v9 = 18;
        v10 = 15;
        v6 = 11;
        v7 = 2;
        break;
      case 2uLL:
        v4 = 0;
        v5 = 0;
        v6 = 0;
        v7 = 0;
        v8 = 1;
        v9 = 14;
        v10 = 11;
        break;
      default:
        return result;
    }
    v11 = *a1;
    if (!*a1 || v11 >= v9 && (v11 <= v9 ? (v12 = a1[1] < v4) : (v12 = 0), !v12))
    {
      if ((v5 & 1) != 0 || (v13 = a1[2]) == 0 || v13 >= v10 && (v13 > v10 || (a1[3] & 0x8000000000000000) == 0))
      {
        if ((v8 & 1) != 0)
          break;
        v14 = a1[4];
        if (!v14 || v14 >= v6 && (v14 > v6 || (a1[5] & 0x8000000000000000) == 0))
        {
          v15 = a1[6];
          if (!v15 || v15 >= v7 && (v15 > v7 || (a1[7] & 0x8000000000000000) == 0))
            break;
        }
      }
    }
    v12 = v3-- > 1;
    if (!v12)
      return 0;
  }
  return v3;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

id FCErrorForCKError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "code") == 7 || (v2 = v1, objc_msgSend(v1, "code") == 6))
  {
    objc_msgSend(v1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v9 = CFSTR("FCErrorRetryAfter");
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v1, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_errorWithCode:description:additionalUserInfo:", 2, v7, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t FCShouldErrorBeExcludedFromSimulatedCrashes(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  if ((objc_msgSend(v1, "fc_isOfflineError") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v3 = objc_msgSend(v1, "code");

    if (v3 == -1202)
    {
LABEL_4:
      v4 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v4 = FCShouldErrorBeExcludedFromSimulatedCrashes(v6);
  else
    v4 = 0;

LABEL_10:
  return v4;
}

void sub_1A1DBDCA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1DBF3C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DC2D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL RCRequestFeedTypeFromFCRequestFeedType(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

void sub_1A1DC5DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCPaidAccessCheckerHasAccessToItemInline(void *a1, int a2, int a3, void *a4, char a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v31;

  v9 = a1;
  v10 = a4;
  objc_msgSend(v9, "bundleSubscriptionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  v15 = v10;
  if ((a2 & 1) != 0 || a3)
  {
    if (!v14
      || !a2
      || (objc_msgSend(v14, "purchasedTagIDs"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "containsObject:", v15),
          v16,
          (v17 & 1) == 0))
    {
      if (!v13 || !a3)
        goto LABEL_13;
      v18 = v13;
      v19 = v15;
      if (!v19)
        goto LABEL_10;
      objc_msgSend(v18, "bundleSubscription");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_getAssociatedObject((id)v20, (const void *)(v20 + 1));
      v31 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");
      v23 = v22;
      objc_getAssociatedObject((id)v20, (const void *)~v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_msgSend(v24, "unsignedIntegerValue") - a5) ^ (v23 + a5);

      v18 = v31;
      if ((v25 & 1) == 0)
      {
LABEL_10:

LABEL_13:
        v29 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v31, "bundleSubscription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleChannelIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "containsObject:", v19);

      if ((v28 & 1) == 0)
        goto LABEL_13;
    }
  }
  v29 = 1;
LABEL_14:

  return v29;
}

void sub_1A1DC8DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t FCPurchaseTypeForpurchaseType(void *a1)
{
  return (int)objc_msgSend(a1, "intValue");
}

uint64_t FCPurchaseValidationStateForValidationState(void *a1)
{
  return (int)objc_msgSend(a1, "intValue");
}

id FCTagFilterOptionsToNSString(char a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Deprecated"));
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("BlockedStorefronts"));
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "addObject:", CFSTR("MinimumNewsVersion"));
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", CFSTR("ExplicitContent"));
  if ((a1 & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((a1 & 0x20) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("MutedChannels"));
LABEL_7:
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t FCCKPRequestOperationHeaderReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  FCCKPIdentifier *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  void *v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  uint64_t result;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_98;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 56;
        goto LABEL_98;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_98;
      case 5u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 1u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if (v26 < 0)
            {
              v20 += 7;
              v15 = v21++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_118:
        v89 = 8;
        goto LABEL_152;
      case 6u:
        v27 = 0;
        v28 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 0x10u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v22 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_122:
        v89 = 40;
        goto LABEL_152;
      case 7u:
        v33 = objc_alloc_init(FCCKPIdentifier);
        objc_storeStrong((id *)(a1 + 136), v33);
        if (!PBReaderPlaceMark() || (FCCKPIdentifierReadFrom((uint64_t)v33, a2) & 1) == 0)
          goto LABEL_162;
        goto LABEL_70;
      case 8u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
        goto LABEL_98;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_98;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_98;
      case 0xBu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 152;
        goto LABEL_98;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 104;
        goto LABEL_98;
      case 0xDu:
        v34 = 0;
        v35 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 2u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          v38 = v37 + 1;
          if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v22 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_126:
        v89 = 16;
        goto LABEL_152;
      case 0xEu:
        v40 = 0;
        v41 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 4u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          v44 = v43 + 1;
          if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v44;
            v22 |= (unint64_t)(v45 & 0x7F) << v40;
            if (v45 < 0)
            {
              v40 += 7;
              v15 = v41++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_130;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_130:
        v89 = 24;
        goto LABEL_152;
      case 0xFu:
        *(_WORD *)(a1 + 220) |= 0x80u;
        v46 = *v3;
        v47 = *(_QWORD *)(a2 + v46);
        if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v48 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v47);
          *(_QWORD *)(a2 + v46) = v47 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v48 = 0;
        }
        *(_DWORD *)(a1 + 112) = v48;
        goto LABEL_153;
      case 0x10u:
        v49 = 0;
        v50 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 8u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v22 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_134;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_134:
        v89 = 32;
        goto LABEL_152;
      case 0x11u:
        v33 = objc_alloc_init(FCCKPLocale);
        objc_storeStrong((id *)(a1 + 176), v33);
        if (PBReaderPlaceMark() && FCCKPLocaleReadFrom((uint64_t)v33, a2))
        {
LABEL_70:
          PBReaderRecallMark();

LABEL_153:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_162:

        return 0;
      case 0x12u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 184;
        goto LABEL_98;
      case 0x13u:
        v55 = 0;
        v56 = 0;
        v57 = 0;
        *(_WORD *)(a1 + 220) |= 0x40u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          v60 = v59 + 1;
          if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v57 |= (unint64_t)(v61 & 0x7F) << v55;
            if (v61 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v57) = 0;
                goto LABEL_138;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v57) = 0;
LABEL_138:
        v90 = 72;
        goto LABEL_147;
      case 0x14u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_98;
      case 0x15u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_98;
      case 0x16u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_98;
      case 0x17u:
        v62 = 0;
        v63 = 0;
        v57 = 0;
        *(_WORD *)(a1 + 220) |= 0x200u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          v66 = v65 + 1;
          if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v57 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v15 = v63++ >= 9;
              if (v15)
              {
                LODWORD(v57) = 0;
                goto LABEL_142;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v57) = 0;
LABEL_142:
        v90 = 200;
        goto LABEL_147;
      case 0x18u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 208;
        goto LABEL_98;
      case 0x19u:
        v68 = 0;
        v69 = 0;
        v57 = 0;
        *(_WORD *)(a1 + 220) |= 0x100u;
        while (2)
        {
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          v72 = v71 + 1;
          if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v57 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v57) = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v57) = 0;
LABEL_146:
        v90 = 168;
LABEL_147:
        *(_DWORD *)(a1 + v90) = v57;
        goto LABEL_153;
      case 0x1Au:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 192;
LABEL_98:
        v74 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_153;
      case 0x1Bu:
        v75 = 0;
        v76 = 0;
        v22 = 0;
        *(_WORD *)(a1 + 220) |= 0x20u;
        while (2)
        {
          v77 = *v3;
          v78 = *(_QWORD *)(a2 + v77);
          v79 = v78 + 1;
          if (v78 == -1 || v79 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
            *(_QWORD *)(a2 + v77) = v79;
            v22 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              v15 = v76++ >= 9;
              if (v15)
              {
                v22 = 0;
                goto LABEL_151;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_151:
        v89 = 48;
LABEL_152:
        *(_QWORD *)(a1 + v89) = v22;
        goto LABEL_153;
      case 0x1Du:
        v82 = 0;
        v83 = 0;
        v84 = 0;
        *(_WORD *)(a1 + 220) |= 0x400u;
        while (2)
        {
          v85 = *v3;
          v86 = *(_QWORD *)(a2 + v85);
          v87 = v86 + 1;
          if (v86 == -1 || v87 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v88 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v86);
            *(_QWORD *)(a2 + v85) = v87;
            v84 |= (unint64_t)(v88 & 0x7F) << v82;
            if (v88 < 0)
            {
              v82 += 7;
              v15 = v83++ >= 9;
              if (v15)
              {
                v84 = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v84 = 0;
LABEL_158:
        *(_BYTE *)(a1 + 216) = v84 != 0;
        goto LABEL_153;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_153;
    }
  }
}

void sub_1A1DD4E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCAppConfigurationFetch(void *a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  objc_msgSend(v7, "fetchedAppConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
      v3[2](v3, v4, 0);
  }
  else
  {
    v5 = FCCurrentQoSOrUtilityIfMain();
    FCDispatchQueueForQualityOfService(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", v6, v3);

  }
}

void sub_1A1DD9EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1DD9FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCDefaultScheduledMicroUpdateTimes()
{
  if (qword_1ED0F86C0 != -1)
    dispatch_once(&qword_1ED0F86C0, &__block_literal_global_144);
  return (id)_MergedGlobals_197;
}

id FCBucketForFeldsparID(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v1, "hash"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

unint64_t FCModdedBucketID(void *a1, unint64_t a2)
{
  unint64_t result;

  result = 0;
  if (a1)
  {
    if (a2)
      return objc_msgSend(a1, "unsignedIntegerValue") % a2;
  }
  return result;
}

BOOL FCIsUserInExperiment(unint64_t a1, double a2, double a3)
{
  return (double)a1 < a3 && (double)a1 >= a2;
}

uint64_t FCEndpointEnvironmentForNTPBEndpointEnvironment(int a1)
{
  if ((a1 - 1) > 5)
    return 0;
  else
    return qword_1A1E83380[a1 - 1];
}

id FCAppConfigurationArrayValue(void *a1, uint64_t a2)
{
  return FCAppConfigurationArrayValueWithDefaultValue(a1, a2, 0);
}

uint64_t FCStoryStyleConfigurationsFromStoryStyleConfigDicts(void *a1, const char *a2)
{
  return objc_msgSend(a1, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_219, &__block_literal_global_223);
}

id FCAppConfigurationDictionaryValue(void *a1, uint64_t a2)
{
  return FCAppConfigurationDictionaryValueWithDefaultValue(a1, a2, 0);
}

id FCAppConfigurationURLValue(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v2 == v3))
    {
      v7 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v2;
      else
        v4 = 0;
      v5 = v4;
      v6 = v5;
      if (v5 && objc_msgSend(v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t fc_ensure(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

double fc_ensureGreaterThanZero(double result, double a2)
{
  if (result <= 0.0)
    return a2;
  return result;
}

double fc_ensureGreaterThanOrEqualToZero(double result, double a2)
{
  if (result < 0.0)
    return a2;
  return result;
}

double fc_ensureGreaterThanOrEqualToZeroLessThanOne(double result, double a2)
{
  if (result >= 1.0 || result < 0.0)
    return a2;
  return result;
}

double fc_ensureNormalized(double result, double a2)
{
  if (result > 1.0 || result < 0.0)
    return a2;
  return result;
}

void sub_1A1DDDDB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DE04BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCArticleListTypeFromPBArticleListType(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

BOOL FCArticleListHasMetadataFromPBArticleListType(int a1)
{
  return (a1 - 1) < 2;
}

uint64_t PBArticleListTypeFromString(uint64_t result)
{
  id v1;
  _BOOL4 v2;
  uint64_t v3;

  if (result)
  {
    v1 = (id)result;
    v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("editorial")) == 0;
    v3 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("people-also-coread"));

    if (v3)
      return v2;
    else
      return 2;
  }
  return result;
}

uint64_t cloudKitValueFromEntryOrigin(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

uint64_t entryOriginFromCloudKitValue(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

void sub_1A1DE6EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t FCSecondsToMilliseconds(double a1)
{
  return (unint64_t)(fmax(a1, 0.0) * 1000.0);
}

double FCMillisecondsToSeconds(unint64_t a1)
{
  return (double)a1 / 1000.0;
}

void sub_1A1DEDD64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL FCCKPRecordRetrieveRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPRecordIdentifier *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(FCCKPRecordIdentifier);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && FCCKPRecordIdentifierReadFrom((uint64_t)v17, a2))
          goto LABEL_26;
        goto LABEL_34;
      case 2u:
        v17 = objc_alloc_init(FCCKPRequestedFields);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (FCCKPRequestedFieldsReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();
LABEL_30:

LABEL_31:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_34:

        return 0;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_29;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_29:
        v17 = *(FCCKPRecordIdentifier **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;
        goto LABEL_30;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_31;
    }
  }
}

void sub_1A1DF1A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A1DF32BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1DF50E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1DF66C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 56));
  _Unwind_Resume(a1);
}

void sub_1A1DF68BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1DF6A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1DF6C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1DF7688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL FCCKPConfigurationFieldReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  FCCKPConfigurationFieldValue *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(FCCKPConfigurationFieldValue **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(FCCKPConfigurationFieldValue);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (FCCKPConfigurationFieldValueReadFrom(v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id FCBlockConjunction(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __FCBlockConjunction_block_invoke;
  v9[3] = &unk_1E463CD58;
  v10 = v3;
  v11 = v4;
  v5 = v4;
  v6 = v3;
  v7 = _Block_copy(v9);

  return v7;
}

void FCWaitUntilBlockIsInvoked(void *a1)
{
  _QWORD *v1;
  dispatch_semaphore_t v2;
  void (*v3)(_QWORD *, _QWORD *);
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v9 = "void FCWaitUntilBlockIsInvoked(FCAsyncOperationBlock  _Nonnull __strong)";
    v10 = 2080;
    v11 = "FCBlockUtilities.m";
    v12 = 1024;
    v13 = 47;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FCWaitUntilBlockIsInvoked_block_invoke;
  v6[3] = &unk_1E463AB18;
  v7 = v2;
  v3 = (void (*)(_QWORD *, _QWORD *))v1[2];
  v4 = v2;
  v3(v1, v6);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

uint64_t FCQoSClassFromQoS(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;

  if (a1 == 33)
    v1 = 33;
  else
    v1 = 0;
  if (a1 == 25)
    v2 = 25;
  else
    v2 = v1;
  if (a1 == 17)
    v3 = 17;
  else
    v3 = v2;
  if (a1 == 9)
    v4 = 9;
  else
    v4 = 0;
  if (a1 == -1)
    v5 = 21;
  else
    v5 = v4;
  if (a1 <= 16)
    return v5;
  else
    return v3;
}

uint64_t FCQoSFromQoSClass(int a1)
{
  unint64_t v1;
  uint64_t v2;

  HIDWORD(v1) = a1 - 9;
  LODWORD(v1) = a1 - 9;
  v2 = 8 * (v1 >> 3) + 9;
  if ((v1 >> 3) >= 4)
    return -1;
  else
    return v2;
}

void FCDispatchAfterWithQualityOfService(dispatch_time_t a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  id v8;

  v7 = a2;
  FCBlockWithQualityOfService(a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_after(a1, v7, v8);

}

void FCDispatchGroupNotifyWithQualityOfService(void *a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  NSObject *v8;
  id v9;

  v7 = a2;
  v8 = a1;
  FCBlockWithQualityOfService(a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v8, v7, v9);

}

void FCDispatchAsyncWithQoSPropagation(void *a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = a1;
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a2);
  dispatch_async(v3, v4);

}

void FCDispatchGroupNotifyWithTimeout(void *a1, void *a2, dispatch_time_t a3, void *a4)
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "group");
    *(_DWORD *)buf = 136315906;
    v23 = "void FCDispatchGroupNotifyWithTimeout(dispatch_group_t  _Nonnull __strong, dispatch_queue_t  _Nonnull __strong"
          ", dispatch_time_t, FCTimeoutBlock  _Nonnull __strong)";
    v24 = 2080;
    v25 = "FCBlockUtilities.m";
    v26 = 1024;
    v27 = 175;
    v28 = 2114;
    v29 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queue");
    *(_DWORD *)buf = 136315906;
    v23 = "void FCDispatchGroupNotifyWithTimeout(dispatch_group_t  _Nonnull __strong, dispatch_queue_t  _Nonnull __strong"
          ", dispatch_time_t, FCTimeoutBlock  _Nonnull __strong)";
    v24 = 2080;
    v25 = "FCBlockUtilities.m";
    v26 = 1024;
    v27 = 176;
    v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v23 = "void FCDispatchGroupNotifyWithTimeout(dispatch_group_t  _Nonnull __strong, dispatch_queue_t  _Nonnull __strong"
          ", dispatch_time_t, FCTimeoutBlock  _Nonnull __strong)";
    v24 = 2080;
    v25 = "FCBlockUtilities.m";
    v26 = 1024;
    v27 = 177;
    v28 = 2114;
    v29 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __FCDispatchGroupNotifyWithTimeout_block_invoke;
  v20[3] = &unk_1E463B598;
  v11 = v9;
  v21 = v11;
  FCHandleOperationTimeout(a3, v8, v20);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __FCDispatchGroupNotifyWithTimeout_block_invoke_2;
  block[3] = &unk_1E463CD58;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v12 = v11;
  v13 = v18;
  dispatch_group_notify(v7, v8, block);

}

id FCHandleOperationCancellation(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _BYTE *v15;
  _QWORD block[4];
  id v17;
  _BYTE *v18;
  _QWORD aBlock[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _BYTE buf[24];
  __int128 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cancellationTrigger");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "FCOperationCancelledTest  _Nonnull FCHandleOperationCancellation(__autoreleasing dispatch_block"
                         "_t * _Nonnull, __strong dispatch_block_t _Nonnull)";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCBlockUtilities.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v25) = 195;
    WORD2(v25) = 2114;
    *(_QWORD *)((char *)&v25 + 6) = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cancellationHandler");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "FCOperationCancelledTest  _Nonnull FCHandleOperationCancellation(__autoreleasing dispatch_block"
                         "_t * _Nonnull, __strong dispatch_block_t _Nonnull)";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCBlockUtilities.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v25) = 196;
    WORD2(v25) = 2114;
    *(_QWORD *)((char *)&v25 + 6) = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v25 = __Block_byref_object_copy__70;
  *((_QWORD *)&v25 + 1) = __Block_byref_object_dispose__70;
  v26 = _Block_copy(v3);
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCHandleOperationCancellation_block_invoke;
  aBlock[3] = &unk_1E46494C0;
  v20 = v4;
  v21 = v22;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __FCHandleOperationCancellation_block_invoke_3;
  block[3] = &unk_1E463B8F8;
  v7 = _Block_copy(aBlock);
  v17 = v7;
  v18 = buf;
  *a1 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __FCHandleOperationCancellation_block_invoke_4;
  v13[3] = &unk_1E46494E8;
  v14 = v7;
  v15 = buf;
  v8 = v7;
  v9 = _Block_copy(v13);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v22, 8);

  return v9;
}

void sub_1A1DFA0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1A1DFA1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FCRepeat(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    for (; a1; --a1)
      v3[2](v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v6 = "void FCRepeat(NSUInteger, __strong dispatch_block_t _Nonnull)";
    v7 = 2080;
    v8 = "FCBlockUtilities.m";
    v9 = 1024;
    v10 = 281;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

void *FCTestBlockForClass(uint64_t a1)
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCTestBlockForClass_block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

id FCTestBlockForProtocol(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCTestBlockForProtocol_block_invoke;
  aBlock[3] = &unk_1E4643668;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

id FCRecursiveBlock(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCRecursiveBlock_block_invoke;
  aBlock[3] = &unk_1E463B598;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

void sub_1A1DFAC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *FCSpecificCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "isMemberOfClass:", a1))
    return a2;
  return 0;
}

void *FCProtocolCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "conformsToProtocol:", a1))
    return a2;
  return 0;
}

void *FCClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t *v11;
  uint64_t *v13;

  v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        v11 = v13++;
        if ((objc_msgSend(v9, "conformsToProtocol:", *v11) & 1) == 0)
          break;
        if (!--a3)
          return v9;
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef FCCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
    return 0;
  if (CFGetTypeID(cf) == a1)
    return cf;
  return 0;
}

uint64_t FCCheckedStaticCast(uint64_t a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315906;
    v5 = "id FCCheckedStaticCast(Class, id<NSObject>)";
    v6 = 2080;
    v7 = "FCCast.m";
    v8 = 1024;
    v9 = 109;
    v10 = 2114;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked static cast.  This is a serious problem and could lead to a crash, or worse."));
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
  return a2;
}

void *FCCheckedProtocolCast(uint64_t a1, void *a2)
{
  void *v2;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  v12 = *MEMORY[0x1E0C80C00];
  if (a2 && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315906;
      v5 = "id FCCheckedProtocolCast(Protocol *, id<NSObject>)";
      v6 = 2080;
      v7 = "FCCast.m";
      v8 = 1024;
      v9 = 120;
      v10 = 2114;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked protocol cast"));
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
    }
    return 0;
  }
  return v2;
}

void *FCCheckedStaticProtocolCast(uint64_t a1, void *a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2
    && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315906;
    v5 = "id FCCheckedStaticProtocolCast(Protocol *, id<NSObject>)";
    v6 = 2080;
    v7 = "FCCast.m";
    v8 = 1024;
    v9 = 131;
    v10 = 2114;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked protocol cast. This is a serious problem and could lead to a crash, or worse."));
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
  return a2;
}

void *FCPersonalizationActions()
{
  return &unk_1E470C858;
}

const __CFString *NSStringFromFCPersonalizationAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x21)
    return CFSTR("None");
  else
    return off_1E46495C8[a1 - 1];
}

uint64_t FCPersonalizationActionFromTodayPersonalizationAction(int a1)
{
  if ((a1 - 2) > 4)
    return 22;
  else
    return qword_1A1E83528[a1 - 2];
}

id FCCFArrayShortDescription(const __CFArray *a1)
{
  return -[FCDescription descriptionString](+[FCDescription descriptionWithCFType:format:](FCDescription, "descriptionWithCFType:format:", a1, CFSTR("; count=%ld"),
             CFArrayGetCount(a1)),
           "descriptionString");
}

id FCCFArrayDescription(const __CFArray *a1)
{
  FCDescription *v2;
  CFIndex v3;
  void *v4;
  void *v5;

  v2 = objc_retain(+[FCDescription descriptionWithCFType:format:](FCDescription, "descriptionWithCFType:format:", a1, CFSTR("; count=%ld"),
           CFArrayGetCount(a1)));
  if (CFArrayGetCount(a1) >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%d]"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCDescription addField:format:](v2, "addField:format:", v4, CFSTR("%@"), CFArrayGetValueAtIndex(a1, v3));

      ++v3;
    }
    while (CFArrayGetCount(a1) > v3);
  }
  -[FCDescription setFieldOptionCommaSeparated](v2, "setFieldOptionCommaSeparated");
  -[FCDescription descriptionString](v2, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FCCFDictionaryDescription(const __CFDictionary *a1)
{
  void *v2;
  void *v3;

  +[FCDescription descriptionWithCFType:format:](FCDescription, "descriptionWithCFType:format:", a1, &stru_1E464BC40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryDescriptionApplierFunction, v2);
  objc_msgSend(v2, "descriptionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CFDictionaryDescriptionApplierFunction(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addField:format:", a1, CFSTR("%@"), a2);
}

__CFString *FCObjectReferenceDescription(void *a1)
{
  id v1;
  void *v2;
  const char *ClassName;
  int v4;
  void *v5;
  const char *v6;
  __CFString *v7;
  uint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    ClassName = object_getClassName(v1);
    v4 = strcmp(ClassName, "NSCFArray");
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = object_getClassName(v2);
    if (v4)
      objc_msgSend(v5, "stringWithFormat:", CFSTR("(%s*)%p"), v6, v2, v9);
    else
      objc_msgSend(v5, "stringWithFormat:", CFSTR("(%s*)%p; count=%ld"), v6, v2, CFArrayGetCount((CFArrayRef)v2));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<nil>");
  }

  return v7;
}

id FCStringArrayFromBitFields(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        if (((a2 >> v5) & 1) >= objc_msgSend(v6, "count"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Bad Value: %lu>"), (a2 >> v5) & 1);
        else
          objc_msgSend(v6, "objectAtIndex:", (a2 >> v5) & 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
          objc_msgSend(v4, "addObject:", v7);

      }
      ++v5;

    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

id FCAVWorkQueue()
{
  if (qword_1ED0F87F0 != -1)
    dispatch_once(&qword_1ED0F87F0, &__block_literal_global_164);
  return (id)_MergedGlobals_211;
}

id FCAVWorkOperationQueue()
{
  if (qword_1ED0F8800 != -1)
    dispatch_once(&qword_1ED0F8800, &__block_literal_global_3_8);
  return (id)qword_1ED0F87F8;
}

id FCKeyIdentifiersFromHLSMetadata(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0C99D50];
    v2 = a1;
    v3 = (void *)objc_msgSend([v1 alloc], "initWithBase64EncodedString:options:", v2, 0);

    if (!v3)
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

      return v9;
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_13:

      goto LABEL_14;
    }
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("uri"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fc_safelyAddObject:", v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        objc_msgSend(v7, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_18_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fc_safelyAddObjects:", v8);
    }

    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
  return v9;
}

void sub_1A1DFCAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCPuzzleTypeSettingsEntryIDFromPuzzleTypeID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ps-%@"), a1);
}

void sub_1A1DFD79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCIsPuzzleTypeSettingsRecordName(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("ps-"));
}

void sub_1A1DFF068(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E02134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E052D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E057B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E05F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E0637C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v19 - 112));
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1E06E14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1E07618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E076F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E077F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double FCRound(double a1)
{
  return round(a1);
}

double FCFractionalPart(double a1)
{
  BOOL v1;
  double v2;
  double result;

  v1 = a1 <= 0.0;
  v2 = -(-a1 - floor(-a1));
  result = a1 - floor(a1);
  if (v1)
    return v2;
  return result;
}

void FCClamp(double a1, double a2, double a3)
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 < a2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "max >= min");
    *(_DWORD *)buf = 136315906;
    v5 = "CGFloat FCClamp(CGFloat, CGFloat, CGFloat)";
    v6 = 2080;
    v7 = "FCMath.m";
    v8 = 1024;
    v9 = 43;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

unint64_t FCClampUInt64s(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;

  if (a1 >= a3)
    v3 = a3;
  else
    v3 = a1;
  if (a1 >= a2)
    return v3;
  else
    return a2;
}

double FCMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double FCRandom()
{
  return (double)random() / 2147483650.0;
}

double FCRandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double FCReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double FCSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

uint64_t FCAudioUpsellPlayPositionForValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("beginning")))
  {
    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("middle")))
      v3 = 2 * (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("end")) == 0);
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1A1E0BEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

BOOL FCMIMETypeIsPlainText(void *a1)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:", CFSTR("text/plain")) == 0;
}

BOOL FCMIMETypeIsHTML(void *a1)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:", CFSTR("text/html")) == 0;
}

BOOL FCMIMETypeIsAudioOrVideo(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("audio/mpeg")))
    v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("video/mp4")) == 0;
  else
    v2 = 1;

  return v2;
}

BOOL FCMIMETypeIsFont(void *a1)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:", CFSTR("application/font-sfnt")) == 0;
}

BOOL FCMIMETypeIsGZip(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("application/gzip")))
    v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("application/x-gzip")) == 0;
  else
    v2 = 1;

  return v2;
}

BOOL FCMIMETypeIsBinary(void *a1)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:", CFSTR("application/octet-stream")) == 0;
}

uint64_t FCMIMETypeIsANEF(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("application/vnd.apple-anef"));
}

id FCPermanentURLForResourceRecordID(void *a1, void *a2)
{
  return FCPermanentURLForRecordID(a1, 3, a2, 1);
}

uint64_t FCNewsAssetServerHostName()
{
  unint64_t v0;

  v0 = FCCurrentContextEnvironment();
  if (v0 > 4)
    return 0;
  else
    return (uint64_t)*(&off_1E4649FC0 + v0);
}

uint64_t FCNewsAssetServerHostNameForEnvironment(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return (uint64_t)*(&off_1E4649FC0 + a1);
}

void sub_1A1E0F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E10870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSKProductsRequestClass_block_invoke(uint64_t a1)
{
  StoreKitLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SKProductsRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_215 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    StoreKitLibrary_1();
  }
}

void StoreKitLibrary_1()
{
  void *v0;

  if (!StoreKitLibraryCore_frameworkLibrary_1)
  {
    StoreKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!StoreKitLibraryCore_frameworkLibrary_1)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getSKPaymentQueueClientClass_block_invoke_1(uint64_t a1)
{
  Class result;
  FCPuzzleTypeFetchOperation *v3;
  SEL v4;

  StoreKitLibrary_1();
  result = objc_getClass("SKPaymentQueueClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (FCPuzzleTypeFetchOperation *)abort_report_np();
    -[FCPuzzleTypeFetchOperation init](v3, v4);
  }
  qword_1ED0F8850 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id FCHeadlinePromotedToImageOnTop(void *a1)
{
  return FCMutateHeadlineWithBlock(a1, &__block_literal_global_171);
}

double FCScoreForHeadline(void *a1, int a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = a1;
  objc_msgSend(v3, "tileProminenceScore");
  v5 = v4;
  if (a2)
  {
    if (objc_msgSend(v3, "isFeatureCandidate"))
    {
      objc_msgSend(v3, "publishDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fc_timeIntervalUntilNow");
      v8 = v7;

      if (v8 <= 86400.0)
        v5 = v5 + 100.0;
    }
  }

  return v5;
}

uint64_t FCIndexOfHighestScoringHeadline(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a4;
  v11 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a test block"));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "NSUInteger FCIndexOfHighestScoringHeadline(NSArray<id<FCHeadlineProviding>> *__strong, NSRange,"
                         " BOOL (^__strong)(__strong id<FCHeadlineProviding>), double (^__strong)(__strong id<FCHeadlineProviding>))";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCFeedBuildingUtilities.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v27[0]) = 50;
    WORD2(v27[0]) = 2114;
    *(_QWORD *)((char *)v27 + 6) = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a score block"));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "NSUInteger FCIndexOfHighestScoringHeadline(NSArray<id<FCHeadlineProviding>> *__strong, NSRange,"
                         " BOOL (^__strong)(__strong id<FCHeadlineProviding>), double (^__strong)(__strong id<FCHeadlineProviding>))";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCFeedBuildingUtilities.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v27[0]) = 51;
    WORD2(v27[0]) = 2114;
    *(_QWORD *)((char *)v27 + 6) = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27[0] = 0xBFF0000000000000;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a2, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __FCIndexOfHighestScoringHeadline_block_invoke;
    v17[3] = &unk_1E464A050;
    v18 = v11;
    v20 = buf;
    v19 = v10;
    v21 = &v22;
    objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v13, 0, v17);

    v12 = v23[3];
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v12;
}

void sub_1A1E12238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id FCPromoteHeadlines(void *a1, char a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;

  v8 = a1;
  v9 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 <= 1)
    v11 = 1;
  else
    v11 = a5;
  if (v9
    && (v12 = objc_msgSend(v9, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_10_3),
        v12 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v14 = v12;
    v15 = objc_msgSend(v9, "count");
    v13 = (v14 + v11 - v15) & ~((v14 + v11 - v15) >> 63);
  }
  else
  {
    v13 = 0;
  }
  v36 = v8;
  if (v13 < (unint64_t)objc_msgSend(v8, "count"))
  {
    if (v35
      && (v16 = objc_msgSend(v35, "indexOfObjectPassingTest:", &__block_literal_global_10_3), v16 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v32 = v11 - v16;
      if (v11 - v16 <= (unint64_t)objc_msgSend(v36, "count"))
      {
        v33 = objc_msgSend(v36, "count");
        v34 = v32 <= 1 ? 1 : v32;
        v17 = v33 - v34;
      }
      else
      {
        v17 = -1;
      }
    }
    else
    {
      v17 = objc_msgSend(v8, "count") - 1;
    }
    if (v13 <= v17)
    {
      if (v13)
        v18 = 0;
      else
        v18 = a2;
      v19 = v17 + 1;
      while (1)
      {
        v20 = v13 + v11;
        if (v13 + v11 >= (unint64_t)(v19 - v13))
          v20 = v19 - v13;
        v21 = (v18 & 1) != 0 ? v19 - v13 : v20;
        v22 = (v18 & 1) != 0 ? &__block_literal_global_12 : &__block_literal_global_15_1;
        v23 = (v18 & 1) != 0 ? &__block_literal_global_14_7 : &__block_literal_global_16_2;
        v24 = FCIndexOfHighestScoringHeadline(v10, v13, v21, v22, v23);
        if (!v13 && (a2 & 1) == 0 && !objc_msgSend(v9, "count"))
        {
          objc_msgSend(v10, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hasThumbnail");

          if ((v26 & 1) != 0)
            break;
        }
        if ((v18 & 1) != 0)
        {
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_36;
        }
        else
        {
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_39:
            objc_msgSend(v10, "objectAtIndexedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            FCMutateHeadlineWithBlock(v29, &__block_literal_global_171);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v24, v30);
            v13 = v24 + v11;

            goto LABEL_40;
          }
          v13 += v11;
        }
LABEL_40:
        v18 = 0;
        if (v13 > v17)
          goto LABEL_41;
      }
      v24 = 0;
      if ((v18 & 1) == 0)
        goto LABEL_39;
LABEL_36:
      objc_msgSend(v10, "objectAtIndexedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      FCMutateHeadlineWithBlock(v27, &__block_literal_global_171);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "removeObjectAtIndex:", v24);
      objc_msgSend(v10, "insertObject:atIndex:", v28, 0);
      v13 += v11;

      goto LABEL_40;
    }
  }
LABEL_41:

  return v10;
}

BOOL __FCPromoteOneHeadline(void *a1, int a2, void *a3)
{
  id v5;
  uint64_t (**v6)(id, void *);
  void *v7;
  char v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a1;
  v6 = a3;
  if (a2
    && objc_msgSend(v5, "count")
    && (objc_msgSend(v5, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v6[2](v6, v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v9 = v11 != 0;
    if (v11)
    {
      objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_18_1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      FCMutateHeadlineWithBlock(v13, &__block_literal_global_171);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectIdenticalTo:", v13);
      objc_msgSend(v5, "insertObject:atIndex:", v14, 0);

    }
  }

  return v9;
}

id _FCPromoteOneHeadline(uint64_t a1, int a2)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __FCPromoteOneHeadline(v3, a2, &__block_literal_global_20_3);
  return v3;
}

id FCPromoteOneHeadline(uint64_t a1)
{
  return _FCPromoteOneHeadline(a1, 0);
}

id FCPromoteOneHeadlineIgnoringProminence(uint64_t a1)
{
  return _FCPromoteOneHeadline(a1, 1);
}

id _FCPromoteAccessibleHeadline(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___FCPromoteAccessibleHeadline_block_invoke_2;
  aBlock[3] = &unk_1E463F110;
  v11 = v5;
  v7 = v5;
  v8 = _Block_copy(aBlock);
  if (!__FCPromoteOneHeadline(v6, a3, v8))
    __FCPromoteOneHeadline(v6, a3, &__block_literal_global_21_1);

  return v6;
}

id FCPromoteAccessibleHeadline(uint64_t a1, void *a2)
{
  return _FCPromoteAccessibleHeadline(a1, a2, 0);
}

id FCPromoteAccessibleHeadlineIgnoringProminence(uint64_t a1, void *a2)
{
  return _FCPromoteAccessibleHeadline(a1, a2, 1);
}

void FCAssignPersonalizationScoresToHeadlines(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a1;
  objc_msgSend(a2, "sortItems:options:configurationSet:", v5, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scoreProfiles");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  FCAssignPersonalizationScoresFromProfiles(v5, v7);
}

void FCAssignPersonalizationScoresFromProfiles(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setScoreProfile:", v10);
        objc_msgSend(v10, "sortingScore");
        objc_msgSend(v9, "setTileProminenceScore:");

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

id FCFeedItemsCoveredByRange(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FCFeedItemsCoveredByRange_block_invoke;
  v7[3] = &unk_1E4645E30;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1A1E13EE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E16CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E177D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E18B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double FCPersonalizationExponentialSumForValue(long double a1, long double a2)
{
  double v3;

  v3 = a1;
  if (a2 != 1.0)
    return (1.0 - pow(a2, a1)) / (1.0 - a2);
  return v3;
}

long double FCPersonalizationExponentiallyDecayValue(double a1, long double a2, long double a3, long double a4)
{
  double v6;

  v6 = a2;
  if (a4 != 1.0)
    v6 = (1.0 - pow(a4, a2)) / (1.0 - a4);
  return v6 + a1 * pow(a4, a3);
}

double FCPersonalizationLinearImpressionCount(double a1, long double a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2 == 0.0)
  {
    v4 = 0.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot get a linear impression with a decay rate of 0"));
      v12 = 136315906;
      v13 = "double FCPersonalizationLinearImpressionCount(double, double)";
      v14 = 2080;
      v15 = "FCPersonalizationData.m";
      v16 = 1024;
      v17 = 923;
      v18 = 2114;
      v19 = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    }
  }
  else
  {
    v4 = 555.0;
    v5 = (1.0 - pow(a2, 555.0)) / (1.0 - a2);
    if (v5 > a1)
      v5 = a1;
    v6 = log(1.0 - v5 * (1.0 - a2));
    v7 = v6 / log(a2);
    v8 = fabs(v7);
    if (v8 >= INFINITY && v8 <= INFINITY && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Found a NaN or Inf linear impression count result"));
      v12 = 136315906;
      v13 = "double FCPersonalizationLinearImpressionCount(double, double)";
      v14 = 2080;
      v15 = "FCPersonalizationData.m";
      v16 = 1024;
      v17 = 927;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    }
    if (v8 != INFINITY)
      return v7;
  }
  return v4;
}

long double FCPersonalizationApplyPrior(double a1, double a2, double a3, long double a4)
{
  double v7;

  v7 = FCPersonalizationLinearImpressionCount(a3, a4);
  return a1 + pow(a4, v7) * a2;
}

void sub_1A1E1B4D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A1E1C8CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  _Unwind_Resume(exception_object);
}

void sub_1A1E1D1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

const __CFString *FCCommandStatusDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("success");
  else
    return off_1E464A5E0[a1 - 1];
}

BOOL FCPBFeedItemInventoryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  void *v8;
  void *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  BOOL v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (!*(_BYTE *)(a2 + *v5))
    {
      v8 = (void *)MEMORY[0x1A8580B64](a1, a2);
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
          break;
        v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v14);
        *(_QWORD *)(a2 + v13) = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v17 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v17)
        v18 = 1;
      else
        v18 = (v12 & 7) == 4;
      if (v18)
      {
        objc_autoreleasePoolPop(v8);
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_42;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_44:
          v32 = 24;
          goto LABEL_49;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        case 3u:
          v30 = objc_alloc_init(MEMORY[0x1E0D62698]);

          *(_QWORD *)(a1 + 32) = v30;
          if (PBReaderPlaceMark() && (NTPBDateReadFrom() & 1) != 0)
            goto LABEL_37;
          goto LABEL_54;
        case 4u:
          v31 = objc_alloc_init(MEMORY[0x1E0D626D0]);
          objc_msgSend((id)a1, "addFeedItems:", v31);

          if (!PBReaderPlaceMark() || (NTPBFeedItemReadFrom() & 1) == 0)
            goto LABEL_54;
LABEL_37:
          PBReaderRecallMark();
          goto LABEL_50;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            goto LABEL_50;
LABEL_54:
          objc_autoreleasePoolPop(v9);
          return 0;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          break;
        v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v28 + 1;
        v21 |= (unint64_t)(v29 & 0x7F) << v25;
        if ((v29 & 0x80) == 0)
          goto LABEL_46;
        v25 += 7;
        v16 = v26++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v21) = 0;
LABEL_48:
      v32 = 8;
LABEL_49:
      *(_DWORD *)(a1 + v32) = v21;
LABEL_50:
      objc_autoreleasePoolPop(v9);
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL _fc_isValidJSONValueObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  float v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v1 = a1;
  __FCJSONValidValueClasses_block_invoke();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___fc_isValidJSONValueObject_block_invoke;
  v8[3] = &unk_1E464A600;
  v3 = v1;
  v9 = v3;
  if (objc_msgSend(v2, "fc_containsObjectPassingTest:", v8))
  {
    objc_opt_class();
    if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "floatValue");
      objc_msgSend(v4, "floatValue");
      v6 = fabsf(v5) != INFINITY;
    }
    else
    {
      v4 = 0;
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t ___fc_isValidJSONValueObject_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t _fc_isValidJSONContainerObject(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (qword_1ED0F88E0 != -1)
    dispatch_once(&qword_1ED0F88E0, &__block_literal_global_60);
  v2 = (id)qword_1ED0F88D8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___fc_isValidJSONContainerObject_block_invoke;
  v6[3] = &unk_1E464A600;
  v7 = v1;
  v3 = v1;
  v4 = objc_msgSend(v2, "fc_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t ___fc_isValidJSONContainerObject_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id _fc_JSONEncodableObjectWithObjectHandlers(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const void *v17;
  id v18;
  const void *v19;
  id v20;
  const void *v21;
  id v22;
  const void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  char v49;
  _QWORD v50[4];
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (v11)
  {
    if (v12)
      v17 = v12;
    else
      v17 = &__block_literal_global_10_4;
    v18 = _Block_copy(v17);

    if (v13)
      v19 = v13;
    else
      v19 = &__block_literal_global_12_0;
    v20 = _Block_copy(v19);

    if (v16)
      v21 = v16;
    else
      v21 = &__block_literal_global_13_3;
    v22 = _Block_copy(v21);

    if (v14)
      v23 = v14;
    else
      v23 = &__block_literal_global_8_5;
    v24 = _Block_copy(v23);

    if ((_fc_isValidJSONContainerObject(v11) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v11;
        else
          v25 = 0;
        v26 = v25;
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_5;
        v56[3] = &unk_1E464A668;
        v20 = v20;
        v57 = v20;
        v18 = v18;
        v58 = v18;
        v24 = v24;
        v59 = v24;
        v22 = v22;
        v60 = v22;
        v61 = a6;
        objc_msgSend(v26, "fc_arrayByTransformingWithBlockWithIndex:", v56);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v28 = v57;
LABEL_20:

LABEL_41:
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v11;
        else
          v30 = 0;
        v26 = v30;
        objc_msgSend(v26, "allObjects");
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_40:
        v34 = (void *)v31;
        _fc_JSONEncodableObjectWithObjectHandlers(v31, v18, v20, v24, v22, 0);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v11;
        else
          v33 = 0;
        v26 = v33;
        objc_msgSend(v26, "array");
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v11;
        else
          v36 = 0;
        v26 = v36;
        v37 = MEMORY[0x1E0C809B0];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_6;
        v50[3] = &unk_1E464A690;
        v51 = &__block_literal_global_8_5;
        v38 = v24;
        v52 = v38;
        v39 = v18;
        v53 = v39;
        v40 = v20;
        v54 = v40;
        v41 = v22;
        v55 = v41;
        objc_msgSend(v26, "fc_dictionaryByTransformingKeysWithKeyAndValueBlock:", v50);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v37;
        v44[1] = 3221225472;
        v44[2] = ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_7;
        v44[3] = &unk_1E464A6B8;
        v22 = v41;
        v45 = v22;
        v18 = v39;
        v46 = v18;
        v20 = v40;
        v47 = v20;
        v24 = v38;
        v48 = v24;
        v49 = a6;
        objc_msgSend(v42, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v44);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v28 = v51;
        goto LABEL_20;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This condition shouldn't be possible, the object %@ was a container type, but not handled."), v11);
        *(_DWORD *)buf = 136315906;
        v63 = "id _fc_JSONEncodableObjectWithObjectHandlers(__strong id, __strong FCJSONEncodingObjectHandler, __strong F"
              "CJSONEncodingArrayObjectHandler, __strong FCJSONEncodingDictionaryKeyHandler, __strong FCJSONEncodingDicti"
              "onaryValueHandler, BOOL)";
        v64 = 2080;
        v65 = "FCJSONUtilities.m";
        v66 = 1024;
        v67 = 127;
        v68 = 2114;
        v69 = v43;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v27 = 0;
    }
    else
    {
      if (!a6)
      {
        (*((void (**)(id, id))v18 + 2))(v18, v11);
        v32 = objc_claimAutoreleasedReturnValue();
        v26 = (id)v32;
        if (!v32
          || (_fc_JSONEncodableObjectWithObjectHandlers(v32, v18, v20, v24, v22, 1),
              (v27 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          _fc_JSONEncodableObjectWithObjectHandlers(v11, v18, v20, v24, v22, 1);
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_41;
      }
      if (_fc_isValidJSONValueObject(v11))
        v29 = v11;
      else
        v29 = 0;
      v27 = v29;
    }
  }
  else
  {
    v27 = 0;
    v22 = v15;
    v24 = v14;
    v20 = v13;
    v18 = v12;
  }
LABEL_42:

  return v27;
}

void *fc_NSObjectDescriptionObjectHandler()
{
  return &__block_literal_global_19_1;
}

id fc_JSONEncodableObjectWithObjectHandlers(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17[0] = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
            v14 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v14;
          }
        }
      }
    }
    _fc_JSONEncodableObjectWithObjectHandlers(v9, v10, v11, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

id fc_JSONEncodableObject(void *a1)
{
  return fc_JSONEncodableObjectWithObjectHandlers(a1, 0, 0, 0, 0);
}

void sub_1A1E24D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E25BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPRequestedFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  FCCKPRecordFieldIdentifier *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(FCCKPRecordFieldIdentifier);
        -[FCCKPRequestedFields addFields:](a1, v17);
        if (!PBReaderPlaceMark() || (FCCKPRecordFieldIdentifierReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t FCCompareRelativePriority(uint64_t a1, uint64_t a2)
{
  if (a1 < a2)
    return -1;
  else
    return a1 > a2;
}

uint64_t FCHigherRelativePriority(uint64_t result, uint64_t a2)
{
  if (result <= a2)
    return a2;
  return result;
}

uint64_t FCNextHighestRelativePriority(uint64_t result)
{
  if ((unint64_t)(result + 1) <= 3)
    return qword_1A1E835D8[result + 1];
  return result;
}

BOOL FCRelativePriorityIsHigh(uint64_t a1)
{
  return a1 > 0;
}

uint64_t FCInferRelativePriorityFromQualityOfService(uint64_t a1)
{
  if (a1 == 9)
    return -1;
  return a1 == 33 || a1 == 25;
}

uint64_t FCQueuePriorityFromRelativePriority(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 4)
    return 0;
  else
    return 4 * (a1 + 1) - 4;
}

float FCInferTaskPriorityFromRelativePriority(unint64_t a1)
{
  float result;

  result = 0.25;
  if (a1 <= 2)
    return flt_1A1E835F8[a1];
  return result;
}

dispatch_queue_global_t FCDispatchQueueForRelativePriority(uint64_t a1)
{
  uint64_t v1;

  v1 = 25;
  if (!a1)
    v1 = 17;
  if (a1 == -1)
    return FCDispatchQueueForQualityOfService(9);
  else
    return FCDispatchQueueForQualityOfService(v1);
}

uint64_t FCCKQueryPriorityFromRelativePriority(uint64_t a1)
{
  uint64_t v1;

  v1 = 300;
  if (!a1)
    v1 = 200;
  if (a1 == -1)
    return 100;
  else
    return v1;
}

const __CFString *FCStringFromRelativePriority(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("low");
  else
    return off_1E464A898[a1];
}

uint64_t FCBundleSubscriptionValidationStateForValidationState(void *a1)
{
  return (int)objc_msgSend(a1, "intValue");
}

void FCSwizzleInstanceMethods(objc_class *a1, const char *a2, const char *a3)
{
  objc_method *InstanceMethod;
  objc_method *v7;
  objc_method *v8;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v11)(void);
  const char *v12;

  if (a1)
  {
    InstanceMethod = class_getInstanceMethod(a1, a2);
    v7 = class_getInstanceMethod(a1, a3);
    if (InstanceMethod)
    {
      v8 = v7;
      if (v7)
      {
        Implementation = method_getImplementation(v7);
        TypeEncoding = method_getTypeEncoding(v8);
        if (class_addMethod(a1, a2, Implementation, TypeEncoding))
        {
          v11 = method_getImplementation(InstanceMethod);
          v12 = method_getTypeEncoding(InstanceMethod);
          class_replaceMethod(a1, a3, v11, v12);
        }
        else
        {
          method_exchangeImplementations(InstanceMethod, v8);
        }
      }
    }
  }
}

id FCPersonalizationAggregateDefaultBaselineAggregateWithConfigurableValues(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v1 = (objc_class *)MEMORY[0x1E0D62760];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  +[FCBaselineFeature baselineFeature](FCBaselineFeature, "baselineFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalizationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFeatureKey:", v5);

  objc_msgSend(v2, "baselineImpressionPrior");
  v7 = v6;
  objc_msgSend(v2, "defaultScoringConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baselineRatePrior");
  objc_msgSend(v3, "setClicks:", v7 * v9);

  objc_msgSend(v2, "baselineImpressionPrior");
  v11 = v10;

  objc_msgSend(v3, "setImpressions:", v11);
  objc_msgSend(v3, "setEventCount:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimestamp:", objc_msgSend(v12, "fc_millisecondTimeIntervalSince1970"));

  return v3;
}

id FCPersonalizationAggregateBaselineAggregateWithConfigurableValues(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  +[FCBaselineFeature baselineFeature](FCBaselineFeature, "baselineFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personalizationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregateForFeatureKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    FCPersonalizationAggregateDefaultBaselineAggregateWithConfigurableValues(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id FCPersonalizationAggregateAggregatesForFeatures(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_181);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(v3, "aggregatesForFeatureKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "personalizationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v7, "setObject:forKey:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

double FCPersonalizationAggregateImpressionBiasForAction(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a1 == 22 || (v9 = 1.0, a1 == 1))
  {
    objc_msgSend(v7, "indexImpressionBiasCorrectionFactor");
    v11 = v10;
    objc_msgSend(v8, "groupImpressionBiasCorrectionFactor");
    v13 = v12;
    v14 = pow(v11, (double)a2);
    v9 = v14 * pow(v13, (double)a3);
    v15 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v15;
      objc_msgSend(v17, "numberWithDouble:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEBUG, "Impression bias for the headline seen event: %@", (uint8_t *)&v20, 0xCu);

    }
  }

  return v9;
}

double FCPersonalizationAggregateGroupBiasForGroupType(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a2;
  v4 = v3;
  if (a1 == 2)
  {
    objc_msgSend(v3, "trendingGroupAggregatesGroupBias");
    goto LABEL_5;
  }
  v5 = 1.0;
  if (a1 == 1)
  {
    objc_msgSend(v3, "topStoriesGroupAggregatesGroupBias");
LABEL_5:
    v5 = v6;
  }

  return v5;
}

uint64_t FCHashForAggregate(void *a1)
{
  id v1;
  double v2;
  unint64_t v3;
  double v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  objc_msgSend(v1, "clicks");
  v3 = vcvtmd_u64_f64(v2 * 10000.0);
  objc_msgSend(v1, "impressions");
  v5 = vcvtmd_u64_f64(v4 * 10000.0);
  v6 = objc_msgSend(v1, "eventCount");
  objc_msgSend(v1, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6 ^ v3 ^ v5 ^ objc_msgSend(v7, "hash");
  return v8;
}

id FCDebugJSONForAggregate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Clicks");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = a1;
  objc_msgSend(v2, "clicks");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("Impressions");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "impressions");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("Event Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "eventCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("Last Modified");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id FCDebugAggregateWithJSONDictionary(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;

  v1 = (objc_class *)MEMORY[0x1E0D62760];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Clicks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
  if (!v6)
    v6 = &unk_1E470B480;
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v3, "setClicks:");

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Impressions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  v11 = v10;
  if (!v10)
    v10 = &unk_1E470B480;
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v3, "setImpressions:");

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("EventCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  v15 = v14;
  if (!v14)
    v14 = &unk_1E470B480;
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v3, "setEventCount:", (unint64_t)v16);

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LastModified"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;
  v20 = v19;
  if (!v19)
    v19 = &unk_1E470B480;
  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v3, "setTimestamp:", (unint64_t)v21);

  return v3;
}

id FCDebugJSONDictionaryFromAggregate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Clicks");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = a1;
  objc_msgSend(v2, "clicks");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("Impressions");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "impressions");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("EventCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "eventCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("LastModified");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

__CFString *FCDefaultSearchBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464ACE8[a1 - 1];
}

__CFString *FCDefaultPuzzlesArchiveBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464ACE8[a1 - 1];
}

__CFString *FCDefaultAuthTokenAPIBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AD18[a1 - 1];
}

__CFString *FCDefaultSportsDataVisualizationAPIBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AD48[a1 - 1];
}

__CFString *FCDefaultAppAnalyticsSportsEventsBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464AD78[a1 - 1];
}

__CFString *FCDefaultFineGrainedNewsletterSubscriptionBaseURLStringForEnvironment(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 0;
  else
    return off_1E464ADA8[a1 - 1];
}

void sub_1A1E30F18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E37338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E37614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E384DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E38648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E38CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E38E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E38FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E39818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCAggregateFetchResultWithFetchResults(void *a1)
{
  id v1;
  id v2;
  unsigned int (**v3)(void *, uint64_t);
  uint64_t v4;
  _QWORD aBlock[4];
  id v7;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __FCAggregateFetchResultWithFetchResults_block_invoke;
  aBlock[3] = &unk_1E464B040;
  v7 = v1;
  v2 = v1;
  v3 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  v4 = 0;
  if ((((uint64_t (*)(void *, _QWORD))v3[2])(v3, 0) & 1) == 0)
  {
    if (v3[2](v3, 2))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

void sub_1A1E3A948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCPuzzleHistoryItemIDFromPuzzleID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ph-%@"), a1);
}

void sub_1A1E40C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E41978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E41AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E42024(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E422C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E425E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E42A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E42C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E42D9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A1E43050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E4335C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E43EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E44964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E454E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FCCKPQueryFilterReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  FCCKPRecordFieldValue *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_37;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 24) = v21;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v18 = objc_alloc_init(FCCKPRecordFieldValue);
          objc_storeStrong((id *)(a1 + 16), v18);
          if (!PBReaderPlaceMark() || (FCCKPRecordFieldValueReadFrom((uint64_t)v18, a2) & 1) == 0)
          {
LABEL_42:

            return 0;
          }
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = objc_alloc_init(FCCKPRecordFieldIdentifier);
          objc_storeStrong((id *)(a1 + 8), v18);
          if (!PBReaderPlaceMark() || (FCCKPRecordFieldIdentifierReadFrom((uint64_t)v18, a2) & 1) == 0)
            goto LABEL_42;
        }
        PBReaderRecallMark();

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NTPBMarketingSubscriptionRequest_SubscriptionTypeFrom(int a1)
{
  return a1 != 0;
}

uint64_t NTPBMarketingSubscriptionRequest_SubscriptionActionFrom(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

void sub_1A1E49A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

double FCFloatFromUnsignedShort(unsigned int a1)
{
  return (double)a1 / 65535.0;
}

double FCCGSizeFromMetadataBuffer(unint64_t a1)
{
  if (a1)
    return (double)(a1 >> 36);
  else
    return *MEMORY[0x1E0C9D820];
}

void sub_1A1E4D76C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id FCPlaceholderIssueThumbnail()
{
  void *v0;
  void *v1;
  FCRawFileDataProvider *v2;
  _QWORD *v3;
  void *v4;

  FCBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("cellImagePlaceholder"), CFSTR("png"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = -[FCRawFileDataProvider initWithFilePath:]([FCRawFileDataProvider alloc], "initWithFilePath:", v1);
  v3 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v2);
  +[FCIssueThumbnail issueThumbnailWithAssetHandle:thumbnailSize:](FCIssueThumbnail, "issueThumbnailWithAssetHandle:thumbnailSize:", v3, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FCThumbnailForIssue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "coverImageAssetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "coverImageAssetHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCIssueThumbnail issueThumbnailWithAssetHandle:thumbnailSize:](FCIssueThumbnail, "issueThumbnailWithAssetHandle:thumbnailSize:", v4, 1.79769313e308, 1.79769313e308);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    FCPlaceholderIssueThumbnail();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id FCFetchThumbnailForIssue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  objc_msgSend(a1, "coverImageAssetHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __FCFetchThumbnailForIssue_block_invoke;
    v10[3] = &unk_1E463B790;
    v11 = v6;
    v12 = v5;
    objc_msgSend(v11, "downloadIfNeededWithPriority:completion:", a2, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5)
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    v8 = 0;
  }

  return v8;
}

void sub_1A1E51460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1E51580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FCCKDatabaseZoneIDsToMigrate(void *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  if (v4)
  {
    v5 = v4[4];
    v6 = v4[5];
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  objc_msgSend(v3, "databaseMigrationZoneNamesFromVersion:toVersion:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_196);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id FCCKDatabaseZoneIDsToDeleteAfterMigration(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 < a2)
  {
    do
    {
      v18 = 0u;
      v19 = 0u;
      v7 = a1 + 1;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v5, "databaseMigrationZoneNamesFromVersion:toVersion:", a1, a1 + 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v5, "databaseMigrationShouldMigrateEntireZone:", v13))
              objc_msgSend(v6, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      a1 = v7;
    }
    while (v7 != a2);
  }
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2_5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id FCCKDatabaseRecordIDsToDeleteAfterMigration(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a2;
  if (a1 < a2)
  {
    v7 = *MEMORY[0x1E0C94730];
    v25 = v5;
    do
    {
      v28 = a1 + 1;
      objc_msgSend(v5, "databaseMigrationZoneNamesFromVersion:toVersion:", a1, v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = v8;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v37;
        v26 = *(_QWORD *)v37;
        v27 = a1;
        do
        {
          v12 = 0;
          v29 = v10;
          do
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
            if ((objc_msgSend(v5, "databaseMigrationShouldMigrateEntireZone:", v13) & 1) == 0)
            {
              v31 = v12;
              objc_msgSend(v5, "databaseMigrationRecordNamesToMigrateInZone:fromVersion:toVersion:", v13, a1, v28);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v33;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v33 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v13, v7);
                    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v19, v20);
                    objc_msgSend(v6, "addObject:", v21);

                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                }
                while (v16);
              }

              v5 = v25;
              v11 = v26;
              a1 = v27;
              v10 = v29;
              v12 = v31;
            }
            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v10);
      }

      a1 = v28;
    }
    while (v28 != v24);
  }
  objc_msgSend(v6, "allObjects", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t sub_1A1E55018()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A1E55024()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A1E55030()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A1E5503C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A1E55048()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A1E55054()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A1E55060()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A1E5506C()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1A1E55078()
{
  return MEMORY[0x1E0CCE230]();
}

uint64_t sub_1A1E55084()
{
  return MEMORY[0x1E0CCE240]();
}

uint64_t sub_1A1E55090()
{
  return MEMORY[0x1E0CCE248]();
}

uint64_t sub_1A1E5509C()
{
  return MEMORY[0x1E0CCE270]();
}

uint64_t sub_1A1E550A8()
{
  return MEMORY[0x1E0CCE410]();
}

uint64_t sub_1A1E550B4()
{
  return MEMORY[0x1E0CCE4E8]();
}

uint64_t sub_1A1E550C0()
{
  return MEMORY[0x1E0CCE590]();
}

uint64_t sub_1A1E550CC()
{
  return MEMORY[0x1E0CCE5E0]();
}

uint64_t sub_1A1E550D8()
{
  return MEMORY[0x1E0CCE5F0]();
}

uint64_t sub_1A1E550E4()
{
  return MEMORY[0x1E0CCE620]();
}

uint64_t sub_1A1E550F0()
{
  return MEMORY[0x1E0CCE6B0]();
}

uint64_t sub_1A1E550FC()
{
  return MEMORY[0x1E0CCE6C8]();
}

uint64_t sub_1A1E55108()
{
  return MEMORY[0x1E0CCEB10]();
}

uint64_t sub_1A1E55114()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A1E55120()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A1E5512C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A1E55138()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A1E55144()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A1E55150()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1A1E5515C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A1E55168()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A1E55174()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A1E55180()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A1E5518C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A1E55198()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A1E551A4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A1E551B0()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1A1E551BC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A1E551C8()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A1E551D4()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A1E551E0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A1E551EC()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1A1E551F8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A1E55204()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A1E55210()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A1E5521C()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1A1E55228()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A1E55234()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1A1E55240()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A1E5524C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A1E55258()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A1E55264()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A1E55270()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A1E5527C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A1E55288()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x1E0D034D0]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1E0D03508]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1E0D03510]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1E0C800D8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1E0C800E0]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
  MEMORY[0x1E0C97F80](bv, range.location, range.length, bytes);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1E0C97F88](bv);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CKCreateGUID()
{
  return MEMORY[0x1E0C94718]();
}

uint64_t CKProductType()
{
  return MEMORY[0x1E0C94958]();
}

uint64_t CKProductVersion()
{
  return MEMORY[0x1E0C94960]();
}

uint64_t CKRetryAfterSecondsForError()
{
  return MEMORY[0x1E0C94A50]();
}

uint64_t CKValidateKeyName()
{
  return MEMORY[0x1E0C94B38]();
}

uint64_t CKValueIsAcceptablePredicateClass()
{
  return MEMORY[0x1E0C94B40]();
}

uint64_t CKXPCSuitableError()
{
  return MEMORY[0x1E0C94B68]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CacheManagementEnumerateAssets()
{
  return MEMORY[0x1E0D09BD0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

uint64_t NFDeviceHasExtendedColorDisplay()
{
  return MEMORY[0x1E0D60A90]();
}

uint64_t NFDeviceOSVersion()
{
  return MEMORY[0x1E0D60A98]();
}

uint64_t NFGeneralDeviceString()
{
  return MEMORY[0x1E0D60AA8]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x1E0D60AB0]();
}

uint64_t NFSeedBuild()
{
  return MEMORY[0x1E0D60AB8]();
}

uint64_t NFStoreDemoMode()
{
  return MEMORY[0x1E0D60AC0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t NTPBDateReadFrom()
{
  return MEMORY[0x1E0D625A0]();
}

uint64_t NTPBFeedItemReadFrom()
{
  return MEMORY[0x1E0D625A8]();
}

uint64_t NTPBReadBaseFromRecordData()
{
  return MEMORY[0x1E0D625B0]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1E0D82C18]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1E0D82D08]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x1E0C9A380]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void operator delete(void *__p)
{
  off_1E4635B80(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4635B88(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccaes_siv_decrypt_mode()
{
  return MEMORY[0x1E0C818C0]();
}

uint64_t ccaes_siv_encrypt_mode()
{
  return MEMORY[0x1E0C818C8]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1E0C82090]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t ccsiv_ciphertext_size()
{
  return MEMORY[0x1E0C82408]();
}

uint64_t ccsiv_one_shot()
{
  return MEMORY[0x1E0C82420]();
}

uint64_t ccsiv_plaintext_size()
{
  return MEMORY[0x1E0C82428]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_query_count_results()
{
  return MEMORY[0x1E0C829B0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x1E0CCEE28]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D28](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1E0C857B8](*(_QWORD *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1E0C857C8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

uint64_t zalgo()
{
  return MEMORY[0x1E0D60B40]();
}

uint64_t zalgoIfMain()
{
  return MEMORY[0x1E0D60B48]();
}

