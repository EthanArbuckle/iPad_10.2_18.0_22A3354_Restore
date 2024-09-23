@implementation HUMediaServiceItemManager

- (HUMediaServiceItemManager)initWithHome:(id)a3 mediaServiceItem:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  HUMediaServiceItemManager *v10;
  HUMediaServiceItemManager *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUMediaServiceItemManager;
  v10 = -[HFItemManager initWithDelegate:](&v16, sel_initWithDelegate_, a5);
  v11 = v10;
  if (v10)
  {
    -[HUMediaServiceItemManager setHomeForUser:](v10, "setHomeForUser:", v8);
    -[HUMediaServiceItemManager setMediaServiceItem:](v11, "setMediaServiceItem:", v9);
    v12 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(v8, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithHome:user:nameStyle:", v8, v13, 0);
    -[HUMediaServiceItemManager setUserItem:](v11, "setUserItem:", v14);

  }
  return v11;
}

- (HUMediaServiceItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_mediaServiceItem_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaServiceItemManager.m"), 56, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaServiceItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  HUAccessorySettingsItemModule *v12;
  NSObject *v13;
  void *v14;
  HUAccessorySettingsItemModule *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v56[5];
  char v57;
  _QWORD v58[5];
  BOOL v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[6];
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t buf[4];
  HUMediaServiceItemManager *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  -[HUMediaServiceItemManager userItem](self, "userItem", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceItemManager homeForUser](self, "homeForUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    -[HUMediaServiceItemManager userItem](self, "userItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasValidSettings");

    if (v11)
    {
      v12 = [HUAccessorySettingsItemModule alloc];
      -[HUMediaServiceItemManager userItem](self, "userItem");
      v13 = objc_claimAutoreleasedReturnValue();
      v69 = *MEMORY[0x1E0D31008];
      v70[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HUAccessorySettingsItemModule initWithItemUpdater:homeKitSettingsVendor:usageOptions:](v12, "initWithItemUpdater:homeKitSettingsVendor:usageOptions:", self, v13, v14);
      -[HUMediaServiceItemManager setUserSettingsItemModule:](self, "setUserSettingsItemModule:", v15);

    }
    else
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "CAN'T ACCESS USER BASED SETTINGS: The user's settings can't be accessed because hasValidSettings == NO", buf, 2u);
      }
    }
  }
  else
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v66 = self;
      v67 = 2112;
      v68 = v16;
      _os_log_debug_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEBUG, "%@:%@  Not Displaying HMSettings based controls because current user is not permitted", buf, 0x16u);

    }
  }

  v17 = objc_alloc(MEMORY[0x1E0D31840]);
  v18 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke;
  v61[3] = &unk_1E6F4C518;
  v61[4] = self;
  v19 = (void *)objc_msgSend(v17, "initWithResultsBlock:", v61);
  -[HUMediaServiceItemManager setUpdateListeningHistoryItem:](self, "setUpdateListeningHistoryItem:", v19);

  v60[0] = v18;
  v60[1] = 3221225472;
  v60[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2;
  v60[3] = &unk_1E6F4C518;
  v60[4] = self;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v60);
  -[HUMediaServiceItemManager setUpdateListeningHistoryFooterItem:](self, "setUpdateListeningHistoryFooterItem:", v20);

  v58[0] = v18;
  v58[1] = 3221225472;
  v58[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_31;
  v58[3] = &unk_1E6F4DF80;
  v59 = -[HUMediaServiceItemManager _isAppleMusicService](self, "_isAppleMusicService");
  v58[4] = self;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v58);
  -[HUMediaServiceItemManager setRemoveItem:](self, "setRemoveItem:", v21);

  v22 = -[HUMediaServiceItemManager _hasAuthFatalError](self, "_hasAuthFatalError") ^ 1;
  v56[0] = v18;
  v56[1] = 3221225472;
  v56[2] = __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2_34;
  v56[3] = &unk_1E6F4DF80;
  v57 = v22;
  v56[4] = self;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v56);
  -[HUMediaServiceItemManager setReconnectItem:](self, "setReconnectItem:", v23);

  -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mediaService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serviceName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc(MEMORY[0x1E0D31840]);
  v63[0] = *MEMORY[0x1E0D30D18];
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceReconnectServiceHeader"), CFSTR("%@%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v34;
  v63[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v27, "initWithResults:", v36);
  -[HUMediaServiceItemManager setReconnectTitleItem:](self, "setReconnectTitleItem:", v37);

  v38 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v39;
  -[HUMediaServiceItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v40;
  -[HUMediaServiceItemManager updateListeningHistoryFooterItem](self, "updateListeningHistoryFooterItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v41;
  -[HUMediaServiceItemManager removeItem](self, "removeItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v42;
  -[HUMediaServiceItemManager reconnectItem](self, "reconnectItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v43;
  -[HUMediaServiceItemManager reconnectTitleItem](self, "reconnectTitleItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v38, "initWithArray:", v45);

  if (-[HUMediaServiceItemManager _isAppleMusicService](self, "_isAppleMusicService"))
  {
    -[HUMediaServiceItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v47);

    -[HUMediaServiceItemManager updateListeningHistoryFooterItem](self, "updateListeningHistoryFooterItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "removeObject:", v48);

  }
  v49 = (void *)MEMORY[0x1E0C99E20];
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v46);
  objc_msgSend(v49, "setWithObject:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUMediaServiceItemManager _isAppleMusicService](self, "_isAppleMusicService"))
  {
    -[HUMediaServiceItemManager userSettingsItemModule](self, "userSettingsItemModule");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "itemProviders");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "unionSet:", v53);

  }
  objc_msgSend(v51, "allObjects");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mediaServiceItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mediaService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "updateListeningHistoryEnabled");

  v4 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaServiceListeningHistoryTitle"), CFSTR("HUMediaServiceListeningHistoryTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = *MEMORY[0x1E0D30E20];
  if (v3)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(*(id *)(a1 + 32), "mediaServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceListeningHistoryFooter"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = CFSTR("instructionsStyle");
  v18[1] = v13;
  v18[2] = &unk_1E7040E88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D30D18];
  objc_msgSend(*(id *)(a1 + 32), "mediaServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceRemoveServiceTitle"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __56__HUMediaServiceItemManager__buildItemProvidersForHome___block_invoke_2_34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D30D18];
  objc_msgSend(*(id *)(a1 + 32), "mediaServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceReconnectServiceTitle"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  id v113;
  HUMediaServiceItemManager *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  void *v133;
  _BYTE v134[128];
  void *v135;
  _BYTE v136[128];
  void *v137;
  _BYTE v138[128];
  void *v139;
  _QWORD v140[6];
  uint64_t v141;
  _QWORD v142[3];

  v142[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v115 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v118;
  -[HUMediaServiceItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v6;
  -[HUMediaServiceItemManager updateListeningHistoryFooterItem](self, "updateListeningHistoryFooterItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v7;
  -[HUMediaServiceItemManager removeItem](self, "removeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v140[3] = v8;
  -[HUMediaServiceItemManager reconnectItem](self, "reconnectItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v140[4] = v9;
  -[HUMediaServiceItemManager reconnectTitleItem](self, "reconnectTitleItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v140[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithArray:", v11);
  v13 = objc_msgSend(v4, "intersectsSet:", v12);

  v14 = v115;
  if (v13)
  {
    v15 = -[HUMediaServiceItemManager _hasAuthFatalError](self, "_hasAuthFatalError");
    -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v4, "containsObject:", v16);
    v18 = !v15;

    if (v17 && v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceAccountInfoSectionIdentifier"));
      v20 = (void *)MEMORY[0x1E0C99D20];
      -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "arrayWithObject:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setItems:", v22);

      objc_msgSend(v115, "addObject:", v19);
    }
    -[HUMediaServiceItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "containsObject:", v23) & v18;

    if (v24 == 1)
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceUpdateListeningHistorySectionIdentifier"));
      v26 = (void *)MEMORY[0x1E0C99D20];
      -[HUMediaServiceItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayWithObject:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setItems:", v28);

      objc_msgSend(v115, "addObject:", v25);
    }
    -[HUMediaServiceItemManager updateListeningHistoryFooterItem](self, "updateListeningHistoryFooterItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v4, "containsObject:", v29) & v18;

    if (v30 == 1)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"));
      v32 = (void *)MEMORY[0x1E0C99D20];
      -[HUMediaServiceItemManager updateListeningHistoryFooterItem](self, "updateListeningHistoryFooterItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "arrayWithObject:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setItems:", v34);

      objc_msgSend(v115, "addObject:", v31);
    }
    -[HUMediaServiceItemManager removeItem](self, "removeItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v4, "containsObject:", v35);

    if (v36)
    {
      if (v15)
      {
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceReconnectServiceTitleSectionIdentifier"));
        -[HUMediaServiceItemManager reconnectTitleItem](self, "reconnectTitleItem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setItems:", v39);

        objc_msgSend(v115, "addObject:", v37);
      }
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceRemoveServiceSectionIdentifier"));
      v41 = (void *)objc_opt_new();
      if (v15)
      {
        -[HUMediaServiceItemManager reconnectItem](self, "reconnectItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v42);

      }
      -[HUMediaServiceItemManager removeItem](self, "removeItem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v43);

      objc_msgSend(v40, "setItems:", v41);
      objc_msgSend(v115, "addObject:", v40);

    }
  }
  if (-[HUMediaServiceItemManager _isAppleMusicService](self, "_isAppleMusicService"))
  {
    v114 = self;
    -[HUMediaServiceItemManager userSettingsItemModule](self, "userSettingsItemModule");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v4;
    objc_msgSend(v44, "buildSectionsWithDisplayedItems:", v4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("allowiTunesAccountSection"));
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v130;
      v119 = *MEMORY[0x1E0D30E20];
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v130 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
          objc_msgSend(v51, "headerTitle");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedString();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v52, "isEqualToString:", v53);

          if (v54)
          {
            objc_msgSend(v51, "items");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "na_firstObjectPassingTest:", &__block_literal_global_102);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              v137 = v56;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "setItems:", v57);

              objc_msgSend(v56, "latestResults");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectForKeyedSubscript:", v119);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "integerValue");

              if (v60 == 2)
                v61 = CFSTR("HUUserSettingsAllowiTunesAccountEnabled_Footer");
              else
                v61 = CFSTR("HUUserSettingsAllowiTunesAccountDisabled_Footer");
              _HULocalizedStringWithDefaultValue(v61, v61, 1);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "setFooterTitle:", v62);

            }
          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
      }
      while (v48);
    }

    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("losslessSection"));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v63 = v46;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v126;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v126 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
          objc_msgSend(v68, "headerTitle");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedString();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v69, "isEqualToString:", v70);

          if (v71)
          {
            objc_msgSend(v68, "items");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "na_firstObjectPassingTest:", &__block_literal_global_59_0);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              v135 = v73;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "setItems:", v74);

            }
          }
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
      }
      while (v65);
    }

    HFLocalizedString();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v75, "stringByAppendingString:", CFSTR("\n"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v77, "initWithString:", v78);

    v80 = objc_alloc(MEMORY[0x1E0CB3498]);
    v141 = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_losslessURL");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v81;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, &v141, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend(v80, "initWithString:attributes:", v76, v82);
    objc_msgSend(v79, "appendAttributedString:", v83);

    objc_msgSend(v120, "setAttributedFooterTitle:", v79);
    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("dolbyAtmosSection"));
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v84 = v63;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v122;
      do
      {
        for (k = 0; k != v86; ++k)
        {
          if (*(_QWORD *)v122 != v87)
            objc_enumerationMutation(v84);
          v89 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
          objc_msgSend(v89, "headerTitle");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedString();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v90, "isEqualToString:", v91);

          if (v92)
          {
            objc_msgSend(v89, "items");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "na_firstObjectPassingTest:", &__block_literal_global_73);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            if (v94)
            {
              v133 = v94;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "setItems:", v95);

            }
          }
        }
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      }
      while (v86);
    }

    HFLocalizedString();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setFooterTitle:", v96);

    v97 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v84, "na_filter:", &__block_literal_global_88);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "na_map:", &__block_literal_global_77_0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend(v97, "initWithArray:", v99);

    if (v117)
    {
      objc_msgSend(v117, "items");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "count");

      if (v102)
        objc_msgSend(v100, "insertObject:atIndex:", v117, 0);
    }
    -[HUMediaServiceItemManager homeForUser](v114, "homeForUser");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v113;
    if ((objc_msgSend(v103, "hf_currentUserIsOwner") & 1) != 0)
    {
      -[HUMediaServiceItemManager homeForUser](v114, "homeForUser");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v104, "hf_hasAtleastOneOasisEnabledHomePod") && v120)
      {
        objc_msgSend(v120, "items");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend(v105, "count");

        v14 = v115;
        if (v106)
          objc_msgSend(v100, "addObject:", v120);
LABEL_62:
        -[HUMediaServiceItemManager homeForUser](v114, "homeForUser");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v107, "hf_currentUserIsOwner") & 1) != 0)
        {
          -[HUMediaServiceItemManager homeForUser](v114, "homeForUser");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v108, "hf_hasAtleastOneOasisEnabledHomePod") && v116)
          {
            objc_msgSend(v116, "items");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = objc_msgSend(v109, "count");

            if (v110)
              objc_msgSend(v100, "addObject:", v116);
            goto LABEL_69;
          }

        }
LABEL_69:
        objc_msgSend(v100, "sortedArrayUsingComparator:", &__block_literal_global_90_0);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v111);

        goto LABEL_70;
      }

    }
    v14 = v115;
    goto LABEL_62;
  }
LABEL_70:

  return v14;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "settingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30720]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "settingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30768]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "settingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30738]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "headerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31570]);
    objc_msgSend(v2, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithIdentifier:", v7);

    objc_msgSend(v2, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_78);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    HFLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    v24 = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithString:attributes:", v12, v18);
    objc_msgSend(v15, "appendAttributedString:", v19);

    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v8, "setAttributedFooterTitle:", v15);
    objc_msgSend(v8, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      v21 = v8;
    else
      v21 = 0;
    v22 = v21;

  }
  else
  {
    v22 = v2;
  }

  return v22;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (_os_feature_enabled_impl() && v5)
  {
    objc_msgSend(v5, "settingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30730]);

    v8 = v7 ^ 1;
  }
  else
  {
    v8 = 1;
    if (!v5)
      goto LABEL_9;
  }
  objc_msgSend(v5, "settingKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D30718]);

  objc_msgSend(v5, "settingKeyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D30720]);

  v8 &= ~(v10 | v12);
LABEL_9:
  objc_msgSend(v5, "settingKeyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D30768]))
  {

  }
  else
  {
    objc_msgSend(v5, "settingKeyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D30738]);

    v16 = v8;
    if (!v15)
      goto LABEL_13;
  }
  v16 = 0;
LABEL_13:
  if (v5)
    v17 = v16;
  else
    v17 = v8;

  return v17;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "headerTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __62__HUMediaServiceItemManager__buildSectionsWithDisplayedItems___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (BOOL)_isAppleMusicService
{
  void *v2;
  void *v3;
  char v4;

  -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isServiceRemovable") ^ 1;

  return v4;
}

- (BOOL)_hasAuthFatalError
{
  void *v2;
  void *v3;
  char v4;

  -[HUMediaServiceItemManager mediaServiceItem](self, "mediaServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authFatalError");

  return v4;
}

- (HFItem)updateListeningHistoryItem
{
  return self->_updateListeningHistoryItem;
}

- (void)setUpdateListeningHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_updateListeningHistoryItem, a3);
}

- (HFItem)updateListeningHistoryFooterItem
{
  return self->_updateListeningHistoryFooterItem;
}

- (void)setUpdateListeningHistoryFooterItem:(id)a3
{
  objc_storeStrong((id *)&self->_updateListeningHistoryFooterItem, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (HFItem)reconnectItem
{
  return self->_reconnectItem;
}

- (void)setReconnectItem:(id)a3
{
  objc_storeStrong((id *)&self->_reconnectItem, a3);
}

- (HFItem)reconnectTitleItem
{
  return self->_reconnectTitleItem;
}

- (void)setReconnectTitleItem:(id)a3
{
  objc_storeStrong((id *)&self->_reconnectTitleItem, a3);
}

- (HUMediaServiceItem)mediaServiceItem
{
  return self->_mediaServiceItem;
}

- (void)setMediaServiceItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceItem, a3);
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (void)setUserItem:(id)a3
{
  objc_storeStrong((id *)&self->_userItem, a3);
}

- (HUAccessorySettingsItemModule)userSettingsItemModule
{
  return self->_userSettingsItemModule;
}

- (void)setUserSettingsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsItemModule, a3);
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
  objc_storeStrong((id *)&self->_homeForUser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_mediaServiceItem, 0);
  objc_storeStrong((id *)&self->_reconnectTitleItem, 0);
  objc_storeStrong((id *)&self->_reconnectItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_updateListeningHistoryFooterItem, 0);
  objc_storeStrong((id *)&self->_updateListeningHistoryItem, 0);
}

@end
