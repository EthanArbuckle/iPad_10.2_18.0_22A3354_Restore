@implementation HUQuickControlProxHandOffSummaryViewUpdater

- (HUQuickControlProxHandOffSummaryViewUpdater)initWithNavigationBarTitleView:(id)a3
{
  id v5;
  HUQuickControlProxHandOffSummaryViewUpdater *v6;
  HUQuickControlProxHandOffSummaryViewUpdater *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUQuickControlProxHandOffSummaryViewUpdater;
  v6 = -[HUQuickControlProxHandOffSummaryViewUpdater init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleView, a3);
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
    {
      objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:", v7);
      objc_msgSend(v8, "lastActivities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlProxHandOffSummaryViewUpdater _setupObservableActivityForActivity:](v7, "_setupObservableActivityForActivity:", v10);

      objc_msgSend(v8, "lastActivities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastDisambiguationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlProxHandOffSummaryViewUpdater _updateSummaryViewForActivities:forProxControlID:disambiguationContext:](v7, "_updateSummaryViewForActivities:forProxControlID:disambiguationContext:", v11, v12, v13);

    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater _invalidateHomePodPhoneCallStatusUpdateTimer](self, "_invalidateHomePodPhoneCallStatusUpdateTimer");
    -[HUQuickControlProxHandOffSummaryViewUpdater _invalidateHomePodTimerStatusUpdateTimer](self, "_invalidateHomePodTimerStatusUpdateTimer");
  }
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlProxHandOffSummaryViewUpdater;
  -[HUQuickControlProxHandOffSummaryViewUpdater dealloc](&v3, sel_dealloc);
}

- (void)_updateSummaryViewForActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  char v49;
  __CFString *v50;
  NSObject *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  uint8_t buf[4];
  __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v57 = v7;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &unk_1EF347EB0;
    if (objc_msgSend(v9, "conformsToProtocol:", v10))
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  -[__CFString activityString](v12, "activityString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlProxHandoffSummaryNotPlaying"), CFSTR("HUQuickControlProxHandoffSummaryNotPlaying"), 1);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_opt_class();
  v17 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_opt_class();
  v20 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v19)
    v23 = v19;
  else
    v23 = v22;
  v58 = objc_msgSend(v23, "assetType");
  -[HUQuickControlProxHandOffSummaryViewUpdater lastActivity](self, "lastActivity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", v12);

  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if ((v25 & 1) != 0)
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      v60 = v12;
      _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "NOT Updating summary view for PCActivity = [%@]", buf, 0xCu);
    }

  }
  else
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412546;
      v60 = v16;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "Updating summary view with secondary text [%@] for activity %@", buf, 0x16u);
    }

    -[HUQuickControlProxHandOffSummaryViewUpdater titleView](self, "titleView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "summaryView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSecondaryText:", v16);

    if (-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodPhoneCallStatusUpdateTimerActive](self, "_isHomePodPhoneCallStatusUpdateTimerActive")&& (-[HUQuickControlProxHandOffSummaryViewUpdater homePodPhoneCallActivity](self, "homePodPhoneCallActivity"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, !v30))
    {
      -[HUQuickControlProxHandOffSummaryViewUpdater _invalidateHomePodPhoneCallStatusUpdateTimer](self, "_invalidateHomePodPhoneCallStatusUpdateTimer");
    }
    else if (!-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodPhoneCallStatusUpdateTimerActive](self, "_isHomePodPhoneCallStatusUpdateTimerActive"))
    {
      -[HUQuickControlProxHandOffSummaryViewUpdater homePodPhoneCallActivity](self, "homePodPhoneCallActivity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        -[HUQuickControlProxHandOffSummaryViewUpdater _startHomePodPhoneCallStatusUpdateTimer](self, "_startHomePodPhoneCallStatusUpdateTimer");
    }
    if (-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodTimerStatusUpdateTimerActive](self, "_isHomePodTimerStatusUpdateTimerActive")&& (-[HUQuickControlProxHandOffSummaryViewUpdater homePodTimerActivity](self, "homePodTimerActivity"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v32, !v32))
    {
      -[HUQuickControlProxHandOffSummaryViewUpdater _invalidateHomePodTimerStatusUpdateTimer](self, "_invalidateHomePodTimerStatusUpdateTimer");
    }
    else if (!-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodTimerStatusUpdateTimerActive](self, "_isHomePodTimerStatusUpdateTimerActive"))
    {
      -[HUQuickControlProxHandOffSummaryViewUpdater homePodTimerActivity](self, "homePodTimerActivity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        -[HUQuickControlProxHandOffSummaryViewUpdater _startHomePodTimerStatusUpdateTimer](self, "_startHomePodTimerStatusUpdateTimer");
    }
  }
  v56 = v16;
  if (v19)
    v34 = v19;
  else
    v34 = v22;
  objc_msgSend(v34, "deviceName");
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v55 = v22;
  -[HUQuickControlProxHandOffSummaryViewUpdater titleView](self, "titleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "summaryView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "primaryText");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", v35);

  if ((v39 & 1) == 0)
  {
    HFLogForCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v35;
      _os_log_impl(&dword_1B8E1E000, v40, OS_LOG_TYPE_DEFAULT, "Updating summary view with values - Primary Text [%@]", buf, 0xCu);
    }

    -[HUQuickControlProxHandOffSummaryViewUpdater titleView](self, "titleView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "summaryView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setPrimaryText:", v35);

  }
  v43 = v58;
  if (v58)
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater titleView](self, "titleView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "summaryView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "image");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      -[HUQuickControlProxHandOffSummaryViewUpdater lastActivity](self, "lastActivity");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqual:", v12);

      v43 = v58;
      if ((v49 & 1) != 0)
        goto LABEL_55;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0D83160], "composedImageFor:assetType:", v12, v43);
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (v43 >= 9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("? (%ld)"), v43);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = off_1E6F4E890[v43 - 1];
      }
      *(_DWORD *)buf = 138413058;
      v60 = v50;
      v61 = 2112;
      v62 = v52;
      v63 = 2112;
      v64 = v20;
      v65 = 2112;
      v66 = v12;
      _os_log_impl(&dword_1B8E1E000, v51, OS_LOG_TYPE_DEFAULT, "Updating summary view with Image = [%@] assetType = [%@] identifier = [%@] activity = [%@]", buf, 0x2Au);

    }
    -[HUQuickControlProxHandOffSummaryViewUpdater titleView](self, "titleView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "summaryView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setImage:", v50);

  }
LABEL_55:
  -[HUQuickControlProxHandOffSummaryViewUpdater setLastActivity:](self, "setLastActivity:", v12);

}

- (void)_startHomePodPhoneCallStatusUpdateTimer
{
  dispatch_source_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12[2];
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  -[HUQuickControlProxHandOffSummaryViewUpdater setPhoneCallStatusUpdateTimer:](self, "setPhoneCallStatusUpdateTimer:", v4);

  v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting *HomePod* Phone Call Status Update Timer", buf, 0xCu);

  }
  -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __86__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodPhoneCallStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6F4E870;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __86__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodPhoneCallStatusUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating *HomePod* Phone Call Status...", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(WeakRetained, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "homePodPhoneCallActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

}

- (void)_invalidateHomePodPhoneCallStatusUpdateTimer
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling *HomePod* Phone Call Status Update Timer", (uint8_t *)&v7, 0xCu);

  }
  if (-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodPhoneCallStatusUpdateTimerActive](self, "_isHomePodPhoneCallStatusUpdateTimerActive"))
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

  }
  -[HUQuickControlProxHandOffSummaryViewUpdater setPhoneCallStatusUpdateTimer:](self, "setPhoneCallStatusUpdateTimer:", 0);
}

- (BOOL)_isHomePodPhoneCallStatusUpdateTimerActive
{
  void *v3;
  NSObject *v4;
  BOOL v5;

  -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater phoneCallStatusUpdateTimer](self, "phoneCallStatusUpdateTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_testcancel(v4) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_startHomePodTimerStatusUpdateTimer
{
  dispatch_source_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12[2];
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  -[HUQuickControlProxHandOffSummaryViewUpdater setTimerStatusUpdateTimer:](self, "setTimerStatusUpdateTimer:", v4);

  v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting *HomePod* MobileTimer Status Update Timer", buf, 0xCu);

  }
  -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __82__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodTimerStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6F4E870;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __82__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodTimerStatusUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating *HomePod* MobileTimer Status...", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(WeakRetained, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "homePodTimerActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

}

- (void)_invalidateHomePodTimerStatusUpdateTimer
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling *HomePod* MobileTimer Status Update Timer", (uint8_t *)&v7, 0xCu);

  }
  if (-[HUQuickControlProxHandOffSummaryViewUpdater _isHomePodTimerStatusUpdateTimerActive](self, "_isHomePodTimerStatusUpdateTimerActive"))
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

  }
  -[HUQuickControlProxHandOffSummaryViewUpdater setTimerStatusUpdateTimer:](self, "setTimerStatusUpdateTimer:", 0);
}

- (BOOL)_isHomePodTimerStatusUpdateTimerActive
{
  void *v3;
  NSObject *v4;
  BOOL v5;

  -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUQuickControlProxHandOffSummaryViewUpdater timerStatusUpdateTimer](self, "timerStatusUpdateTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_testcancel(v4) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setupObservableActivityForActivity:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D83190]);

  if (v7)
  {
    objc_opt_class();
    v8 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    -[HUQuickControlProxHandOffSummaryViewUpdater setHomePodPhoneCallActivity:](self, "setHomePodPhoneCallActivity:", v10);
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlProxHandOffSummaryViewUpdater homePodPhoneCallActivity](self, "homePodPhoneCallActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v14 = "%@ Found HomePod Phone Call Activity = [%@]";
LABEL_13:
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0x16u);

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(v5, "activityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D83198]);

  if (v16)
  {
    objc_opt_class();
    v17 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    -[HUQuickControlProxHandOffSummaryViewUpdater setHomePodTimerActivity:](self, "setHomePodTimerActivity:", v19);
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlProxHandOffSummaryViewUpdater homePodTimerActivity](self, "homePodTimerActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v14 = "%@ Found HomePod MobileTimer Activity = [%@]";
    goto LABEL_13;
  }
LABEL_15:

}

- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v13;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ didUpdateActivities = %@ forProxControlID = %@ disambiguationContext = %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_msgSend(v9, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlProxHandOffSummaryViewUpdater _setupObservableActivityForActivity:](self, "_setupObservableActivityForActivity:", v14);

  -[HUQuickControlProxHandOffSummaryViewUpdater _updateSummaryViewForActivities:forProxControlID:disambiguationContext:](self, "_updateSummaryViewForActivities:forProxControlID:disambiguationContext:", v9, v10, v11);
}

- (PCTelephonyActivity)homePodPhoneCallActivity
{
  return self->_homePodPhoneCallActivity;
}

- (void)setHomePodPhoneCallActivity:(id)a3
{
  objc_storeStrong((id *)&self->_homePodPhoneCallActivity, a3);
}

- (OS_dispatch_source)phoneCallStatusUpdateTimer
{
  return self->_phoneCallStatusUpdateTimer;
}

- (void)setPhoneCallStatusUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, a3);
}

- (PCTimerActivity)homePodTimerActivity
{
  return self->_homePodTimerActivity;
}

- (void)setHomePodTimerActivity:(id)a3
{
  objc_storeStrong((id *)&self->_homePodTimerActivity, a3);
}

- (OS_dispatch_source)timerStatusUpdateTimer
{
  return self->_timerStatusUpdateTimer;
}

- (void)setTimerStatusUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timerStatusUpdateTimer, a3);
}

- (PCActivity)lastActivity
{
  return self->_lastActivity;
}

- (void)setLastActivity:(id)a3
{
  objc_storeStrong((id *)&self->_lastActivity, a3);
}

- (HUQuickControlSummaryNavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_timerStatusUpdateTimer, 0);
  objc_storeStrong((id *)&self->_homePodTimerActivity, 0);
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, 0);
  objc_storeStrong((id *)&self->_homePodPhoneCallActivity, 0);
}

@end
