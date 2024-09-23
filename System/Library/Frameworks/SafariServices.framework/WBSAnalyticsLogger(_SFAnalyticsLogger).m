@implementation WBSAnalyticsLogger(_SFAnalyticsLogger)

- (void)_sf_didBeginDownloadWithMIMEType:()_SFAnalyticsLogger uti:downloadType:promptType:browserPersona:
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v12 = a3;
  v13 = a4;
  v14 = *(NSObject **)(a1 + (int)*MEMORY[0x1E0D8ADE0]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didBeginDownloadWithMIMEType_uti_downloadType_promptType_browserPersona___block_invoke;
  block[3] = &unk_1E4AC7AC8;
  v18 = v12;
  v19 = v13;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(v14, block);

}

- (uint64_t)_sf_didAddFavoriteFromShareSheet
{
  return objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.ShareSheet.AddedFavorite"), &__block_literal_global_74);
}

- (void)_sf_performExtensionsReportIfNecessaryWithExtensionsController:()_SFAnalyticsLogger
{
  id v4;
  double Current;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("LastPeriodicExtensionsReportTimePreferenceKey"));
  v8 = Current - v7;

  if (v8 > 604800.0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __105__WBSAnalyticsLogger__SFAnalyticsLogger___sf_performExtensionsReportIfNecessaryWithExtensionsController___block_invoke;
    v9[3] = &unk_1E4ABFB20;
    v10 = v4;
    v11 = a1;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

- (uint64_t)_sf_reportCapsuleLayoutStyle:()_SFAnalyticsLogger backgroundColorInTabBarEnabled:
{
  _QWORD v5[5];
  char v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportCapsuleLayoutStyle_backgroundColorInTabBarEnabled___block_invoke;
  v5[3] = &__block_descriptor_41_e19___NSDictionary_8__0l;
  v5[4] = a3;
  v6 = a4;
  return objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.CapsuleLayoutStyle"), v5);
}

- (void)_sf_didPerformFormatMenuAction:()_SFAnalyticsLogger provenance:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  _QWORD v8[4];
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    if (a4)
    {
      v6 = a3 - 1;
      if ((unint64_t)(a3 - 1) <= 0x2F && ((0xFFFFFFFF7BDFuLL >> v6) & 1) != 0)
      {
        v11 = v4;
        v12 = v5;
        v7 = off_1E4AC7BF8[v6];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __84__WBSAnalyticsLogger__SFAnalyticsLogger___sf_didPerformFormatMenuAction_provenance___block_invoke;
        v8[3] = &unk_1E4AC7B78;
        v9 = v7;
        v10 = a4;
        objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.PerformedFormatMenuAction"), v8);

      }
    }
  }
}

- (uint64_t)_sf_reportPrivateWindowStatus:()_SFAnalyticsLogger
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportPrivateWindowStatus___block_invoke;
  v4[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v4[4] = a3;
  return objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.MobileSafari.PrivateWindowStatus"), v4);
}

- (uint64_t)_sf_reportBrowserChoiceNotNow
{
  return objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariViewService.BrowserChoice"), &__block_literal_global_44);
}

- (void)_sf_reportBrowserChoice:()_SFAnalyticsLogger
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__WBSAnalyticsLogger__SFAnalyticsLogger___sf_reportBrowserChoice___block_invoke;
  v6[3] = &unk_1E4AC7B30;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.SafariViewService.BrowserChoice"), v6);

}

@end
