@implementation WBSAnalyticsLogger

uint64_t __80__WBSAnalyticsLogger__SFWebClipsAnalyticsLogger__schedulePeriodicWebClipsReport__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performWebClipsBehaviorReport");
  objc_msgSend(*(id *)(a1 + 32), "_webClipsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  return objc_msgSend(*(id *)(a1 + 32), "schedulePeriodicWebClipsReport");
}

void __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke_2(_QWORD *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v1 = (const __CFString *)a1[4];
  v2 = (const __CFString *)a1[5];
  if (!v1)
    v1 = CFSTR("<unknown type>");
  v16[0] = CFSTR("MIMEType");
  v16[1] = CFSTR("UTI");
  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("<unknown type>");
  v17[0] = v1;
  v17[1] = v3;
  v4 = CFSTR("automatic download on navigation");
  v5 = a1[6];
  v6 = a1[7];
  if (v5 == 1)
    v4 = CFSTR("explicitly downloaded");
  if (v5 == 2)
    v7 = CFSTR("save to files in share sheet");
  else
    v7 = (__CFString *)v4;
  v16[2] = CFSTR("type");
  v16[3] = CFSTR("prompt");
  v8 = CFSTR("no download prompt");
  if (v6 == 1)
    v8 = CFSTR("download on prompt");
  if (v6 == 2)
    v8 = CFSTR("cancelled on prompt");
  v17[2] = v7;
  v17[3] = v8;
  v16[4] = CFSTR("persona");
  v9 = a1[8] - 1;
  if (v9 > 3)
    v10 = CFSTR("Safari");
  else
    v10 = off_1E4AC7BD8[v9];
  v17[4] = v10;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __74__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didAddFavoriteFromShareSheet__block_invoke()
{
  return MEMORY[0x1E0C9AA70];
}

void __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "extensionStatisticsReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v3 + (int)*MEMORY[0x1E0D8ADE0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_2;
  v6[3] = &unk_1E4ABFB20;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_3;
  v6[3] = &unk_1E4AC7B30;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "reportNumberOfExtensionsWithFrequencyDictionaryProvider:", v6);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "telemetryDataForExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportStatusForExtensions:extensionType:", v4, CFSTR("WebExtension"));

  objc_msgSend(*(id *)(a1 + 32), "reportStartPageOverrideStatistics:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("LastPeriodicExtensionsReportTimePreferenceKey"), CFAbsoluteTimeGetCurrent());

}

id __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D8B078];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "enabledCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = *MEMORY[0x1E0D8B068];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "disabledCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = *MEMORY[0x1E0D8B080];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "enabledCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = *MEMORY[0x1E0D8B070];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "disabledCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __102__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportCapsuleLayoutStyle_backgroundColorInTabBarEnabled___block_invoke(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("bottom");
  if (*(_QWORD *)(a1 + 32) != 1)
    v1 = CFSTR("top");
  v8[1] = CFSTR("backgroundColorInTabBarEnabled");
  v9[0] = v1;
  v8[0] = CFSTR("capsuleLayoutStyle");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v1;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __84__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didPerformFormatMenuAction_provenance___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  unint64_t v3;
  const __CFString *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("action");
  v6[1] = CFSTR("provenance");
  if ((unint64_t)(v1 - 1) > 4)
    v2 = CFSTR("unknown");
  else
    v2 = off_1E4AC7D78[v1 - 1];
  v7[1] = v2;
  v6[2] = CFSTR("menuType");
  v3 = *(_QWORD *)(a1 + 40) - 1;
  if (v3 > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E4AC7DA0[v3];
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __72__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportPrivateWindowStatus___block_invoke(uint64_t a1)
{
  __CFString *v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("status");
  v1 = CFSTR("running");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == 1)
    v1 = CFSTR("cached");
  if (v2 == 2)
    v1 = CFSTR("no private window");
  v8[0] = v1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = v1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void *__71__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoiceNotNow__block_invoke()
{
  return &unk_1E4B27650;
}

id __66__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoice___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("selectedBrowser");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
