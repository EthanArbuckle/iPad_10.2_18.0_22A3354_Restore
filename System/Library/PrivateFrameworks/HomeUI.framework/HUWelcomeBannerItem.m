@implementation HUWelcomeBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {

  }
  else
  {
    v5 = -[HUWelcomeBannerItem _shouldHideDiscoverHomeBanner](self, "_shouldHideDiscoverHomeBanner");

    if (!v5)
    {
      v11 = (void *)MEMORY[0x1E0D519C0];
      v12 = (void *)MEMORY[0x1E0D314B8];
      v22[0] = *MEMORY[0x1E0D30D18];
      _HULocalizedStringWithDefaultValue(CFSTR("HUWelcomeUIBannerCell_Title"), CFSTR("HUWelcomeUIBannerCell_Title"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0D30BA0];
      v23[0] = v8;
      v23[1] = CFSTR("Home.Banners.Status.Welcome");
      v14 = *MEMORY[0x1E0D30BF8];
      v22[1] = v13;
      v22[2] = v14;
      _HULocalizedStringWithDefaultValue(CFSTR("HUWelcomeUIBannerCell_Details"), CFSTR("HUWelcomeUIBannerCell_Details"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v9;
      v22[3] = *MEMORY[0x1E0D30BC0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUWelcomeUIBannerCell_ActionBar"), CFSTR("HUWelcomeUIBannerCell_ActionBar"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v15;
      v22[4] = *MEMORY[0x1E0D30B78];
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[4] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "outcomeWithResults:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "futureWithResult:", v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  v6 = (void *)MEMORY[0x1E0D519C0];
  v7 = objc_alloc(MEMORY[0x1E0D314B8]);
  v24 = *MEMORY[0x1E0D30D70];
  v25[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithResults:", v8);
  objc_msgSend(v6, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

- (BOOL)_shouldHideDiscoverHomeBanner
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint64_t v17;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  uint8_t buf[4];
  HUWelcomeBannerItem *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[HUBannerItem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v4, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithHome:user:nameStyle:", v4, v6, 0);

  if (!-[HUBannerItem forceShowBanner](self, "forceShowBanner"))
  {
    if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) != 0)
    {
      v8 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "hasDismissedWelcomeUIBanner"))
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v32 = self;
        v33 = 2112;
        v34 = v10;
        v35 = 2048;
        v36 = v4;
        v37 = 2112;
        v38 = v11;
        v39 = 2112;
        v40 = (uint64_t)v12;
        v41 = 1024;
        v42 = objc_msgSend(v7, "hasDismissedWelcomeUIBanner");
        v13 = "%@:%@ Discover Home Banner is not shown, for home:(%p:%@), userItem:%@ hasDismissedWelcomeBanner: %{BOOL}d";
        v14 = v9;
        v15 = 58;
LABEL_11:
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

LABEL_12:
      }
    }
    else
    {
      objc_msgSend(v4, "accessories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        HFLogForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "debugDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accessories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v32 = self;
          v33 = 2112;
          v34 = v10;
          v35 = 2048;
          v36 = v11;
          v37 = 2112;
          v38 = v4;
          v39 = 2048;
          v40 = objc_msgSend(v12, "count");
          v13 = "%@:%@ Discover Home Banner is not shown, for home:(%p:%@), with accessory count: %ld";
          v14 = v9;
          v15 = 52;
          goto LABEL_11;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D31870], "getAvailabilityDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v20)
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "debugDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "debugDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v7, "hasDismissedWelcomeUIBanner");
            objc_msgSend(v4, "accessories");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v23, "count");
            objc_msgSend(MEMORY[0x1E0D31870], "getAvailabilityDictionary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "debugDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138414082;
            v32 = self;
            v33 = 2112;
            v34 = v30;
            v35 = 2048;
            v36 = v4;
            v37 = 2112;
            v38 = v21;
            v39 = 2112;
            v40 = (uint64_t)v22;
            v41 = 1024;
            v42 = v29;
            v43 = 2048;
            v44 = v28;
            v45 = 2112;
            v46 = v25;
            _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Discover Home Banner is shown, for home:(%p:%@), with reasons: userItem:%@ hasDismissedWelcomeBanner: %{BOOL}d, self.home.accessories.count = %ld, localeDictionary: %@", buf, 0x4Eu);

          }
          v8 = 0;
          goto LABEL_14;
        }
        if (v20)
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "debugDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D31870], "getAvailabilityDictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "debugDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v32 = self;
          v33 = 2112;
          v34 = v10;
          v35 = 2048;
          v36 = v4;
          v37 = 2112;
          v38 = v11;
          v39 = 2112;
          v40 = (uint64_t)v27;
          _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Discover Home Banner is not shown, for home:(%p:%@), with invalid localeDictionary: %@", buf, 0x34u);

          goto LABEL_12;
        }
      }
    }
    v8 = 1;
LABEL_14:

    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

@end
