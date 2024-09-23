@implementation HUResidentDeviceStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  HUResidentDeviceStatusBannerItem *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {

  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled");

    if ((v6 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0D519C0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke;
      v17[3] = &unk_1E6F4D600;
      v18 = v4;
      v19 = self;
      objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "futureWithBlock:scheduler:", v17, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reschedule:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v18;
      goto LABEL_6;
    }
  }
  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = (void *)MEMORY[0x1E0D314B8];
  v20 = *MEMORY[0x1E0D30D70];
  v21[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outcomeWithResults:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

id __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  int v29;
  uint64_t *v30;
  int v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D30D70];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v11, "_sortedObjectDisplayNamesForHomeKitObjects:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v14 = *MEMORY[0x1E0D30D20];
      if (v13 == 1)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HUBannerResidentDevice_Description_NotReady_OneObject"), v14);
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUBannerResidentDevice_Description_NotReady_OneObject"), CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D30BF8]);

      }
      else
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HUBannerResidentDevice_Description_NotReady_MultipleObjects"), v14);
        _HULocalizedStringWithDefaultValue(CFSTR("HUBannerResidentDevice_Description_NotReady_MultipleObjects"), CFSTR("HUBannerResidentDevice_Description_NotReady_MultipleObjects"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30BF8]);
      }

LABEL_34:
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    objc_msgSend(v11, "sourceItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v12, "hf_remoteAccessState");
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "homeManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "residentProvisioningStatus");

    v28 = objc_msgSend(v12, "hf_hasAppleTVs");
    v29 = objc_msgSend(v12, "hf_hasHomePods");
    v30 = (uint64_t *)MEMORY[0x1E0D30B98];
    if ((v27 & 1) != 0)
    {
      v35 = CFSTR("HFStatusDetailsRemoteAccessAvailableButNeedsTwoFactorAuthTitle");
      if (v24 == 1)
        v35 = CFSTR("HFStatusDetailsNeedsTwoFactorAuthTitle");
      v36 = *MEMORY[0x1E0D30D20];
      v37 = v35;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, v36);
      HFLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D30D18]);
      HFLocalizedString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *MEMORY[0x1E0D30BF8];
    }
    else
    {
      v31 = v29;
      if ((v27 & 2) != 0 && v24 == 1)
      {
        HFLocalizedString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30D18]);

        v33 = *MEMORY[0x1E0D30D20];
        if ((v28 & v31) == 1)
        {
          v34 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_AppleTVHomePod");
        }
        else if (v28)
        {
          v34 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_AppleTV");
        }
        else
        {
          if (!v31)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HFStatusDetailsNoRemoteAccessNotAtHomeTitle"), v33);
            HFLogForCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v54 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v56 = v54;
              _os_log_error_impl(&dword_1B8E1E000, v52, OS_LOG_TYPE_ERROR, "%@: Showing 'No Remote Access' banner but there are no HomePods or Apple TVs in the home.", buf, 0xCu);
            }

            goto LABEL_29;
          }
          v34 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_HomePod");
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, v33);
        HFLocalizedString();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0D30BF8]);

LABEL_29:
        v43 = *MEMORY[0x1E0D30BC0];
        v42 = v8;
        v41 = 0;
        goto LABEL_30;
      }
      if (v24 != 1 || objc_msgSend(v12, "hf_isCurrentLocationHome"))
      {
        v41 = MEMORY[0x1E0C9AAB0];
        v42 = v8;
        v43 = v3;
LABEL_30:
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v43);
        goto LABEL_31;
      }
      if (((v28 | v31) & 1) != 0)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);
        HFLogForCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v53 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v56 = v53;
          _os_log_error_impl(&dword_1B8E1E000, v44, OS_LOG_TYPE_ERROR, "%@: Hiding banner since there are HomePods or Apple TVs in the home that are still configuring.", buf, 0xCu);
        }

        goto LABEL_31;
      }
      HFLocalizedString();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HFStatusDetailsNoRemoteAccessTitle"), *MEMORY[0x1E0D30D20]);
      objc_msgSend(MEMORY[0x1E0D31970], "aboutResidentDeviceURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedString();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0D30BF8]);

      v40 = *v30;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, v40);

LABEL_31:
    v46 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D50]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D30D48]);
    objc_msgSend(v8, "objectForKeyedSubscript:", *v30);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUBannerStatus_LearnMore"), CFSTR("HUBannerStatus_LearnMore"), 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D30BC0]);

    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7041230, CFSTR("bannerItemCategory"));
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v3 = *(_QWORD *)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)HUResidentDeviceStatusBannerItem;
  v4 = a2;
  objc_msgSendSuper2(&v10, sel__subclass_updateWithOptions_, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HUResidentDeviceStatusBannerItem__subclass_updateWithOptions___block_invoke_2;
  v9[3] = &unk_1E6F52070;
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "flatMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v7);
}

@end
