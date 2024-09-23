@implementation _SFSearchEngineInfo

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (BOOL)searchShouldUseSafeSearchTemplate
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((isWebFilterEnabled_determinedWebFilterState & 1) == 0)
  {
    if (!WebContentAnalysisLibraryCore_frameworkLibrary)
    {
      v12 = xmmword_1E4ABFC58;
      v13 = 0;
      WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (WebContentAnalysisLibraryCore_frameworkLibrary)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2050000000;
      v2 = (void *)getWFUserSettingsClass_softClass;
      v11 = getWFUserSettingsClass_softClass;
      if (!getWFUserSettingsClass_softClass)
      {
        *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v12 + 1) = 3221225472;
        v13 = __getWFUserSettingsClass_block_invoke;
        v14 = &unk_1E4ABFC78;
        v15 = &v8;
        __getWFUserSettingsClass_block_invoke((uint64_t)&v12);
        v2 = (void *)v9[3];
      }
      v3 = objc_retainAutorelease(v2);
      _Block_object_dispose(&v8, 8);
      v4 = [v3 alloc];
      NSUserName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithUserName:", v5, v8);

      isWebFilterEnabled_webFilterEnabled = objc_msgSend(v6, "restrictionType") != 0;
    }
    isWebFilterEnabled_determinedWebFilterState = 1;
  }
  return isWebFilterEnabled_webFilterEnabled;
}

@end
