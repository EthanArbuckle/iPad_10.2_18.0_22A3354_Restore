@implementation HUCameraUpgradeOfferBannerItem

- (HUCameraUpgradeOfferBannerItem)initWithHome:(id)a3
{
  id v4;
  HUCameraUpgradeOfferBannerItem *v5;
  id v6;
  void *v7;
  uint64_t v8;
  HFUserItem *userItem;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUCameraUpgradeOfferBannerItem;
  v5 = -[HUBannerItem initWithHome:](&v11, sel_initWithHome_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(v4, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithHome:user:nameStyle:", v4, v7, 0);
    userItem = v5->_userItem;
    v5->_userItem = (HFUserItem *)v8;

  }
  return v5;
}

void __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hiddenOfferDisplayOutcome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

}

- (id)hiddenOfferDisplayOutcome
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D31578]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  return v2;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[4];
  id v26[2];
  char v27;
  char v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  id location;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D519C0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke;
    v30[3] = &unk_1E6F53748;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v7, "futureWithBlock:", v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    -[HUBannerItem home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerItem home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "hf_userIsOwner:", v11);

    -[HUCameraUpgradeOfferBannerItem userItem](self, "userItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasDismissedCameraUpgradeBanner");

    -[HUBannerItem home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_allCameraProfilesSupportingRecording");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "count");

    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location) = 67109632;
      HIDWORD(location) = v12;
      v33 = 1024;
      v34 = v14;
      v35 = 2048;
      v36 = v17;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Subclass update with options called for OfferBannerItem (isOwner %d, hasDismissedBanner %d, cameraCount %lu)", (uint8_t *)&location, 0x18u);
    }

    v19 = -[HUBannerItem forceShowBanner](self, "forceShowBanner");
    if (v12 && (v14 & ~v19 & 1) == 0 && v17)
    {
      if (-[HUCameraUpgradeOfferBannerItem hasFetchedOfferResults](self, "hasFetchedOfferResults"))
      {
        v20 = (void *)MEMORY[0x1E0D519C0];
        -[HUCameraUpgradeOfferBannerItem offerDisplayOutcome](self, "offerDisplayOutcome");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "futureWithResult:", v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_initWeak(&location, self);
        -[HUCameraUpgradeOfferBannerItem fetchPremiumOffer](self, "fetchPremiumOffer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_2;
        v25[3] = &unk_1E6F58FB8;
        objc_copyWeak(v26, &location);
        v27 = v12;
        v28 = 0;
        v26[1] = v17;
        objc_msgSend(v23, "flatMap:", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_destroyWeak(v26);

        objc_destroyWeak(&location);
      }
    }
    else
    {
      HFLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location) = 0;
        _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Not showing offer banner because user is not owner, or has no cameras supporting recording, or already upgraded.", (uint8_t *)&location, 2u);
      }

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_23;
      v29[3] = &unk_1E6F4C660;
      v29[4] = self;
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v29);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

void __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hiddenOfferDisplayOutcome");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

}

id __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  __int16 v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "hasOpportunityBubble") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "fetchPlanLimit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_3;
    v9[3] = &unk_1E6F58F90;
    v10 = *(_WORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 40);
    v9[4] = WeakRetained;
    v9[5] = v4;
    objc_msgSend(v3, "flatMap:", v9);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(WeakRetained, "hiddenOfferDisplayOutcome");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  return v7;
}

id __62__HUCameraUpgradeOfferBannerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  int v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(unsigned __int8 *)(a1 + 48);
    v16 = *(unsigned __int8 *)(a1 + 49);
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "offerTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "offerMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "offerActionTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sheetActionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "planLimit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sheetTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sheetMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messageKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67111682;
    v19 = v15;
    v20 = 1024;
    v21 = v16;
    v22 = 2048;
    v23 = v17;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v4;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(isOwner %d, hasDismissedBanner %d, cameraCount %lu) Offer title:%@ Message:%@ offerActionTitle:%@ sheetActionText:%@ planLimit:%@ sheetTitle: %@, sheetMessage:%@, messageKey:%@", buf, 0x68u);

  }
  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "offerDisplayOutcome");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)fetchPlanLimit
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0D519C0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke;
  v5[3] = &unk_1E6F53748;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "futureWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D116A0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_2;
  v6[3] = &unk_1E6F58FE0;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "requestFeatureWithId:completion:", CFSTR("home.cameras"), v6);

  objc_destroyWeak(&v8);
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_3;
  v10[3] = &unk_1E6F53590;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v7, "performBlock:", v10);

  objc_destroyWeak(&v14);
}

void __48__HUCameraUpgradeOfferBannerItem_fetchPlanLimit__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "savePlanLimit:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");

}

- (id)fetchPremiumOffer
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v7, &location);
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v6, 3221225472, __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke, &unk_1E6F53748);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithBlock:scheduler:", &v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v4 = (void *)getICQOfferManagerClass_softClass;
  v16 = getICQOfferManagerClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getICQOfferManagerClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getICQOfferManagerClass_block_invoke_0;
    v12[3] = &unk_1E6F4C868;
    v12[4] = &v13;
    __getICQOfferManagerClass_block_invoke_0((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v13, 8);
  v7 = objc_alloc_init(v6);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_2;
  v9[3] = &unk_1E6F59008;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v8 = v3;
  v10 = v8;
  objc_msgSend(v7, "getPremiumOfferWithCompletion:", v9);

  objc_destroyWeak(&v11);
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_3;
  v10[3] = &unk_1E6F53590;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v7, "performBlock:", v10);

  objc_destroyWeak(&v14);
}

void __51__HUCameraUpgradeOfferBannerItem_fetchPremiumOffer__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "savePremiumOffer:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");

}

- (void)savePlanLimit:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Camera count request error:%@", (uint8_t *)&buf, 0xCu);
    }

  }
  -[HUCameraUpgradeOfferBannerItem setMessageKey:](self, "setMessageKey:", 0);
  if (objc_msgSend(v6, "status") == 1)
  {
    -[HUCameraUpgradeOfferBannerItem setPlanLimit:](self, "setPlanLimit:", &unk_1E7041338);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v9 = (_QWORD *)getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr;
    v24 = getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr;
    if (!getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr)
    {
      v10 = iCloudQuotaLibrary();
      v9 = dlsym(v10, "kICQOpportunitySheetUnlimitedKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
      getkICQOpportunitySheetUnlimitedKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&buf, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkICQOpportunitySheetUnlimitedKey(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("HUCameraUpgradeOfferBannerItem.m"), 32, CFSTR("%s"), dlerror());

      __break(1u);
    }
    -[HUCameraUpgradeOfferBannerItem setMessageKey:](self, "setMessageKey:", *v9);
  }
  else
  {
    objc_msgSend(v6, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      HFLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_error_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_ERROR, "Missing planLimit for feature = %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v6, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraUpgradeOfferBannerItem setPlanLimit:](self, "setPlanLimit:", v13);

      -[HUCameraUpgradeOfferBannerItem planLimit](self, "planLimit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraUpgradeOfferBannerItem setMessageKey:](self, "setMessageKey:", v15);

    }
  }
  -[HUCameraUpgradeOfferBannerItem sheetDetails](self, "sheetDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem messageKey](self, "messageKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setSheetMessage:](self, "setSheetMessage:", v19);

}

- (void)savePremiumOffer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  __int128 buf;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Premium offer error:%@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(v6, "opportunityBubble");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "Nil opportunity bubble, not showing banner", (uint8_t *)&buf, 2u);
    }

  }
  objc_msgSend(v6, "opportunityBubble");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setHasOpportunityBubble:](self, "setHasOpportunityBubble:", v12 != 0);

  -[HUCameraUpgradeOfferBannerItem setHasFetchedOfferResults:](self, "setHasFetchedOfferResults:", 1);
  objc_msgSend(v6, "opportunityBubble");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bubbleDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "opportunityBubble");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sheetDetails");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraUpgradeOfferBannerItem setSheetDetails:](self, "setSheetDetails:", v16);
  objc_msgSend(v14, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setOfferTitle:](self, "setOfferTitle:", v17);

  objc_msgSend(v14, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setOfferMessage:](self, "setOfferMessage:", v18);

  objc_msgSend(v14, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setOfferActionTitle:](self, "setOfferActionTitle:", v21);

  objc_msgSend(v16, "actions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setSheetActionText:](self, "setSheetActionText:", v24);

  objc_msgSend(v16, "title");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setSheetTitle:](self, "setSheetTitle:", v25);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x2020000000;
  v26 = (_QWORD *)getkICQOpportunitySheetDefaultKeySymbolLoc_ptr;
  v39 = getkICQOpportunitySheetDefaultKeySymbolLoc_ptr;
  if (!getkICQOpportunitySheetDefaultKeySymbolLoc_ptr)
  {
    v27 = iCloudQuotaLibrary();
    v26 = dlsym(v27, "kICQOpportunitySheetDefaultKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v26;
    getkICQOpportunitySheetDefaultKeySymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&buf, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkICQOpportunitySheetDefaultKey(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("HUCameraUpgradeOfferBannerItem.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
  objc_msgSend(v16, "messageForKey:", *v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUpgradeOfferBannerItem setSheetMessage:](self, "setSheetMessage:", v28);

  if (objc_msgSend(MEMORY[0x1E0D31288], "forceDisplaySingleCameraUpgradeBanner"))
  {
    -[HUCameraUpgradeOfferBannerItem offerTitle](self, "offerTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      v31 = CFSTR("(DBG) Your iCloud subscription was upgraded to include secure video recording for one camera.");
      v32 = CFSTR("(DBG) Secure Video Available");
      v33 = &unk_1E7041350;
      v34 = CFSTR("(DBG) Set Up Now");
      goto LABEL_17;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D31288], "forceDisplayMultiCameraUpgradeBanner"))
  {
    v31 = CFSTR("(DBG) Your iCloud subscription was upgraded to support recording on more cameras.");
    v32 = CFSTR("(DBG) Recording Limits Increased");
    v33 = &unk_1E7041368;
    v34 = CFSTR("(DBG) Recording Options");
LABEL_17:
    -[HUCameraUpgradeOfferBannerItem setOfferTitle:](self, "setOfferTitle:", CFSTR("(DBG) Secure Video Available"));
    -[HUCameraUpgradeOfferBannerItem setOfferMessage:](self, "setOfferMessage:", CFSTR("(DBG) Your iCloud subscription was upgraded to include secure video recording"));
    -[HUCameraUpgradeOfferBannerItem setOfferActionTitle:](self, "setOfferActionTitle:", v34);
    -[HUCameraUpgradeOfferBannerItem setPlanLimit:](self, "setPlanLimit:", v33);
    -[HUCameraUpgradeOfferBannerItem setSheetTitle:](self, "setSheetTitle:", v32);
    -[HUCameraUpgradeOfferBannerItem setSheetMessage:](self, "setSheetMessage:", v31);
    -[HUCameraUpgradeOfferBannerItem setSheetActionText:](self, "setSheetActionText:", CFSTR("(DBG) Continue"));
  }

}

- (id)offerDisplayOutcome
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init(MEMORY[0x1E0D31578]);
  -[HUCameraUpgradeOfferBannerItem offerTitle](self, "offerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.CameraUpgradeOffer"), *MEMORY[0x1E0D30BA0]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCameraUpgradeOfferBannerItem offerTitle](self, "offerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HUCameraUpgradeOfferBannerItem offerMessage](self, "offerMessage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2 == 0;
  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(v6, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D70]);

  if (v7)
  -[HUCameraUpgradeOfferBannerItem offerMessage](self, "offerMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30BF8]);

  v11 = objc_alloc(MEMORY[0x1E0D311C8]);
  v12 = (void *)objc_msgSend(v11, "initWithPackageIdentifier:state:", *MEMORY[0x1E0D304B8], *MEMORY[0x1E0D304D8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30C60]);

  -[HUCameraUpgradeOfferBannerItem offerActionTitle](self, "offerActionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BC0]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7041380, CFSTR("bannerItemCategory"));
  return v4;
}

- (NSNumber)planLimit
{
  return self->_planLimit;
}

- (void)setPlanLimit:(id)a3
{
  objc_storeStrong((id *)&self->_planLimit, a3);
}

- (NSString)bannerActionText
{
  return self->_bannerActionText;
}

- (NSString)sheetTitle
{
  return self->_sheetTitle;
}

- (void)setSheetTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sheetTitle, a3);
}

- (NSString)sheetMessage
{
  return self->_sheetMessage;
}

- (void)setSheetMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sheetMessage, a3);
}

- (NSString)sheetActionText
{
  return self->_sheetActionText;
}

- (void)setSheetActionText:(id)a3
{
  objc_storeStrong((id *)&self->_sheetActionText, a3);
}

- (void)setUserItem:(id)a3
{
  objc_storeStrong((id *)&self->_userItem, a3);
}

- (BOOL)hasFetchedOfferResults
{
  return self->_hasFetchedOfferResults;
}

- (void)setHasFetchedOfferResults:(BOOL)a3
{
  self->_hasFetchedOfferResults = a3;
}

- (BOOL)hasOpportunityBubble
{
  return self->_hasOpportunityBubble;
}

- (void)setHasOpportunityBubble:(BOOL)a3
{
  self->_hasOpportunityBubble = a3;
}

- (NSString)offerTitle
{
  return self->_offerTitle;
}

- (void)setOfferTitle:(id)a3
{
  objc_storeStrong((id *)&self->_offerTitle, a3);
}

- (NSString)offerMessage
{
  return self->_offerMessage;
}

- (void)setOfferMessage:(id)a3
{
  objc_storeStrong((id *)&self->_offerMessage, a3);
}

- (NSString)offerActionTitle
{
  return self->_offerActionTitle;
}

- (void)setOfferActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_offerActionTitle, a3);
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
  objc_storeStrong((id *)&self->_messageKey, a3);
}

- (ICQOpportunitySheetDetailsSpecification)sheetDetails
{
  return self->_sheetDetails;
}

- (void)setSheetDetails:(id)a3
{
  objc_storeStrong((id *)&self->_sheetDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sheetDetails, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_offerActionTitle, 0);
  objc_storeStrong((id *)&self->_offerMessage, 0);
  objc_storeStrong((id *)&self->_offerTitle, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_sheetActionText, 0);
  objc_storeStrong((id *)&self->_sheetMessage, 0);
  objc_storeStrong((id *)&self->_sheetTitle, 0);
  objc_storeStrong((id *)&self->_bannerActionText, 0);
  objc_storeStrong((id *)&self->_planLimit, 0);
}

@end
