@implementation IMSMSFilterCapabilitiesBinder

+ (int64_t)localizeSubAction:(int64_t)a3
{
  int64_t v3;

  v3 = 0xFFFFLL;
  if ((unint64_t)(a3 - 20000) < 3)
    v3 = a3 - 19990;
  if ((unint64_t)(a3 - 10000) <= 8)
    return a3 - 9999;
  else
    return v3;
}

+ (int64_t)deLocalizeSubAction:(int64_t)a3 action:(int64_t)a4
{
  int64_t v4;

  v4 = 0xFFFFLL;
  if (a4 == 4)
    v4 = a3 + 9999;
  if (a4 == 3)
    return a3 + 19990;
  else
    return v4;
}

+ (BOOL)isValidSubAction:(int64_t)a3 subAction:(int64_t)a4
{
  BOOL v4;

  v4 = (unint64_t)(a4 - 1) < 9;
  if (a3 != 4)
    v4 = 0;
  if (a3 == 3)
    return (unint64_t)(a4 - 10) < 3;
  else
    return v4;
}

+ (void)executeCompletionBlockForFilterParamsUpdate:(id)a3 promo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  unint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v33 = a3;
  v6 = a4;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v33)
  {
    v8 = objc_msgSend(v33, "count");
    v9 = v33;
    if (v8)
    {
      v10 = 0;
      v11 = CFSTR("FilterCapabilitiesBinder");
      v31 = a1;
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (int)objc_msgSend(v12, "intValue");

        v14 = objc_msgSend(a1, "localizeSubAction:", v13);
        if ((objc_msgSend(a1, "isValidSubAction:subAction:", 4, v14) & 1) != 0)
        {
          v15 = v6;
          v16 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v32, "containsObject:", v17);

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v19);

            v11 = v16;
            v6 = v15;
            a1 = v31;
            goto LABEL_12;
          }
          v11 = v16;
          v6 = v15;
          a1 = v31;
          if (_IMWillLog())
          {
            v30 = v13;
LABEL_10:
            _IMAlwaysLog();
          }
        }
        else if (_IMWillLog())
        {
          v30 = v13;
          goto LABEL_10;
        }
LABEL_12:
        ++v10;
        v20 = objc_msgSend(v33, "count", v30);
        v9 = v33;
      }
      while (v20 > v10);
    }
  }
  if (v6 && objc_msgSend(v6, "count"))
  {
    for (i = 0; objc_msgSend(v6, "count", v30) > i; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (int)objc_msgSend(v22, "intValue");

      v24 = objc_msgSend(a1, "localizeSubAction:", v23);
      if ((objc_msgSend(a1, "isValidSubAction:subAction:", 3, v24) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v7, "containsObject:", v25);

        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v27);

          continue;
        }
        if (_IMWillLog())
        {
          v30 = v23;
LABEL_22:
          _IMAlwaysLog();
        }
      }
      else if (_IMWillLog())
      {
        v30 = v23;
        goto LABEL_22;
      }
    }
  }
  v28 = (void *)objc_msgSend(v32, "mutableCopy");
  v29 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(a1, "updateFilterParamsBindings:promotionalSubActions:", v28, v29);

}

+ (BOOL)firstPartyFilterExtensionActive
{
  void *v2;
  char v3;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.smsFilter.extension"));

  return v3;
}

+ (void)IMMetricsCollectorForSMSSubClassification:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "firstPartyFilterExtensionActive") & 1) == 0)
  {
    +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("type");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventFilteringAction"), v6);

  }
}

+ (int)updateFilterParamsBindings:(id)a3 promotionalSubActions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SMSFilterExtensionParams *v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  SMSFilterExtensionParams *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SMSFilterExtensionParams *v42;
  const __CFString *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  SMSFilterExtensionParams *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  int v67;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v69;
  SMSFilterExtensionParams *v71;
  void *v72;
  id v73;
  SMSFilterExtensionParams *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v72 = v7;
  v9 = objc_msgSend(v7, "count") + v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9 + 2);
  if ((objc_msgSend(a1, "firstPartyFilterExtensionActive") & 1) == 0 && v9 >= 1)
  {
    +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventFilteringAction"), &unk_1E3FFF248);

  }
  v12 = objc_alloc_init(SMSFilterExtensionParams);
  -[SMSFilterExtensionParams setAction:](v12, "setAction:", 4);
  -[SMSFilterExtensionParams setSubAction:](v12, "setSubAction:", 0);
  -[SMSFilterExtensionParams setFilterMode:](v12, "setFilterMode:", 4);
  -[SMSFilterExtensionParams setFilterModeStringValue:](v12, "setFilterModeStringValue:", CFSTR("CKConversationListFilterModeSMSTransactional"));
  -[SMSFilterExtensionParams setCategory:](v12, "setCategory:", 3);
  -[SMSFilterExtensionParams setSubCategory:](v12, "setSubCategory:", 0);
  -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v12, "setOrderOfPlacementInUI:", 0);
  -[SMSFilterExtensionParams setLabel:](v12, "setLabel:", CFSTR("smsft"));
  -[SMSFilterExtensionParams setIconName:](v12, "setIconName:", CFSTR("arrow.left.arrow.right"));
  if (objc_msgSend(v6, "count"))
    v13 = CFSTR("FILTERHANDLE_FOLDER_NAME_ALL_TRANSACTIONS");
  else
    v13 = CFSTR("FILTERHANDLE_FOLDER_NAME_TRANSACTIONS");
  -[SMSFilterExtensionParams setFolderName:](v12, "setFolderName:", v13);
  v74 = v12;
  objc_msgSend(v10, "addObject:", v12);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v81;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v81 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v18);
        v20 = objc_alloc_init(SMSFilterExtensionParams);
        -[SMSFilterExtensionParams setAction:](v20, "setAction:", 4);
        -[SMSFilterExtensionParams setSubAction:](v20, "setSubAction:", (int)objc_msgSend(v19, "intValue"));
        -[SMSFilterExtensionParams setFilterMode:](v20, "setFilterMode:", -[SMSFilterExtensionParams action](v20, "action") & 0xF | (16* -[SMSFilterExtensionParams subAction](v20, "subAction")));
        -[SMSFilterExtensionParams setCategory:](v20, "setCategory:", 3);
        -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", CFSTR("smsft"));
        switch(-[SMSFilterExtensionParams subAction](v20, "subAction"))
        {
          case 1uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSTransactionalOthers"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 1);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 11);
            -[SMSFilterExtensionParams label](v20, "label");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringByAppendingString:", CFSTR("_ot"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v22);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_OTHERS"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("ellipsis.circle"));
            v23 = a1;
            v24 = 17;
            goto LABEL_22;
          case 2uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSFinance"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 2);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 1);
            -[SMSFilterExtensionParams label](v20, "label");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringByAppendingString:", CFSTR("_fi"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v28);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_FINANCE"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("creditcard"));
            v23 = a1;
            v24 = 9;
            goto LABEL_22;
          case 3uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSOrders"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 3);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 2);
            -[SMSFilterExtensionParams label](v20, "label");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringByAppendingString:", CFSTR("_or"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v30);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_ORDERS"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("shippingbox"));
            v23 = a1;
            v24 = 10;
            goto LABEL_22;
          case 4uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSReminder"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 4);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 3);
            -[SMSFilterExtensionParams label](v20, "label");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByAppendingString:", CFSTR("_rm"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v32);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_REMINDERS"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("calendar.badge.clock"));
            v23 = a1;
            v24 = 11;
            goto LABEL_22;
          case 5uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSHealth"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 5);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 4);
            -[SMSFilterExtensionParams label](v20, "label");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByAppendingString:", CFSTR("_ht"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v26);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_HEALTH"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("heart"));
            v23 = a1;
            v24 = 12;
            goto LABEL_22;
          case 6uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSWeather"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 6);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 6);
            -[SMSFilterExtensionParams label](v20, "label");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringByAppendingString:", CFSTR("_we"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v34);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_WEATHER"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("cloud.sun"));
            v23 = a1;
            v24 = 13;
            goto LABEL_22;
          case 7uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSCarrier"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 7);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 7);
            -[SMSFilterExtensionParams label](v20, "label");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringByAppendingString:", CFSTR("_cr"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v36);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_CARRIER"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("antenna.radiowaves.left.and.right"));
            v23 = a1;
            v24 = 14;
            goto LABEL_22;
          case 8uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSRewards"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 8);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 8);
            -[SMSFilterExtensionParams label](v20, "label");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringByAppendingString:", CFSTR("_rw"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v38);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_REWARDS"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("star"));
            v23 = a1;
            v24 = 15;
            goto LABEL_22;
          case 9uLL:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSPublicServices"));
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 9);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 5);
            -[SMSFilterExtensionParams label](v20, "label");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringByAppendingString:", CFSTR("_ps"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", v40);

            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_PUBLIC_SERVICES"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", CFSTR("building.2"));
            v23 = a1;
            v24 = 16;
LABEL_22:
            objc_msgSend(v23, "IMMetricsCollectorForSMSSubClassification:", v24);
            break;
          default:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v20, "setFilterModeStringValue:", &stru_1E3FBBA48);
            -[SMSFilterExtensionParams setSubCategory:](v20, "setSubCategory:", 0);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v20, "setOrderOfPlacementInUI:", 0);
            -[SMSFilterExtensionParams setLabel:](v20, "setLabel:", CFSTR("none"));
            -[SMSFilterExtensionParams setFolderName:](v20, "setFolderName:", CFSTR("None"));
            -[SMSFilterExtensionParams setIconName:](v20, "setIconName:", 0);
            break;
        }
        objc_msgSend(v10, "addObject:", v20);

        ++v18;
      }
      while (v16 != v18);
      v41 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      v16 = v41;
    }
    while (v41);
  }
  v73 = v14;

  v42 = objc_alloc_init(SMSFilterExtensionParams);
  -[SMSFilterExtensionParams setAction:](v42, "setAction:", 3);
  -[SMSFilterExtensionParams setSubAction:](v42, "setSubAction:", 0);
  -[SMSFilterExtensionParams setFilterMode:](v42, "setFilterMode:", 5);
  -[SMSFilterExtensionParams setFilterModeStringValue:](v42, "setFilterModeStringValue:", CFSTR("CKConversationListFilterModeSMSPromotional"));
  -[SMSFilterExtensionParams setCategory:](v42, "setCategory:", 2);
  -[SMSFilterExtensionParams setSubCategory:](v42, "setSubCategory:", 0);
  -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v42, "setOrderOfPlacementInUI:", 0);
  -[SMSFilterExtensionParams setLabel:](v42, "setLabel:", CFSTR("smsfp"));
  -[SMSFilterExtensionParams setIconName:](v42, "setIconName:", CFSTR("megaphone"));
  if (objc_msgSend(v72, "count"))
    v43 = CFSTR("FILTERHANDLE_FOLDER_NAME_ALL_PROMOTIONS");
  else
    v43 = CFSTR("FILTERHANDLE_FOLDER_NAME_PROMOTIONS");
  -[SMSFilterExtensionParams setFolderName:](v42, "setFolderName:", v43);
  v71 = v42;
  objc_msgSend(v10, "addObject:", v42);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v44 = v72;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v77 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v50 = objc_alloc_init(SMSFilterExtensionParams);
        -[SMSFilterExtensionParams setAction:](v50, "setAction:", 3);
        -[SMSFilterExtensionParams setSubAction:](v50, "setSubAction:", (int)objc_msgSend(v49, "intValue"));
        -[SMSFilterExtensionParams setFilterMode:](v50, "setFilterMode:", -[SMSFilterExtensionParams action](v50, "action") & 0xF | (16* -[SMSFilterExtensionParams subAction](v50, "subAction")));
        -[SMSFilterExtensionParams setCategory:](v50, "setCategory:", 2);
        -[SMSFilterExtensionParams setLabel:](v50, "setLabel:", CFSTR("smsfp"));
        v51 = -[SMSFilterExtensionParams subAction](v50, "subAction");
        switch(v51)
        {
          case 10:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v50, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSPromotionalOthers"));
            -[SMSFilterExtensionParams setSubCategory:](v50, "setSubCategory:", 10);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v50, "setOrderOfPlacementInUI:", 11);
            -[SMSFilterExtensionParams label](v50, "label");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "stringByAppendingString:", CFSTR("_ot"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v50, "setLabel:", v59);

            -[SMSFilterExtensionParams setFolderName:](v50, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_OTHERS"));
            -[SMSFilterExtensionParams setIconName:](v50, "setIconName:", CFSTR("ellipsis.circle"));
            v54 = a1;
            v55 = 20;
            goto LABEL_41;
          case 12:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v50, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSCoupons"));
            -[SMSFilterExtensionParams setSubCategory:](v50, "setSubCategory:", 12);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v50, "setOrderOfPlacementInUI:", 9);
            -[SMSFilterExtensionParams label](v50, "label");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringByAppendingString:", CFSTR("_cu"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v50, "setLabel:", v57);

            -[SMSFilterExtensionParams setFolderName:](v50, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_COUPONS"));
            -[SMSFilterExtensionParams setIconName:](v50, "setIconName:", CFSTR("wallet.pass"));
            v54 = a1;
            v55 = 18;
            goto LABEL_41;
          case 11:
            -[SMSFilterExtensionParams setFilterModeStringValue:](v50, "setFilterModeStringValue:", CFSTR("IMMessageFilterSubActionSMSOffers"));
            -[SMSFilterExtensionParams setSubCategory:](v50, "setSubCategory:", 11);
            -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v50, "setOrderOfPlacementInUI:", 10);
            -[SMSFilterExtensionParams label](v50, "label");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "stringByAppendingString:", CFSTR("_of"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSFilterExtensionParams setLabel:](v50, "setLabel:", v53);

            -[SMSFilterExtensionParams setFolderName:](v50, "setFolderName:", CFSTR("FILTERHANDLE_FOLDER_NAME_OFFERS"));
            -[SMSFilterExtensionParams setIconName:](v50, "setIconName:", CFSTR("tag"));
            v54 = a1;
            v55 = 19;
LABEL_41:
            objc_msgSend(v54, "IMMetricsCollectorForSMSSubClassification:", v55);
            goto LABEL_43;
        }
        -[SMSFilterExtensionParams setFilterModeStringValue:](v50, "setFilterModeStringValue:", &stru_1E3FBBA48);
        -[SMSFilterExtensionParams setSubCategory:](v50, "setSubCategory:", 0);
        -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v50, "setOrderOfPlacementInUI:", 0);
        -[SMSFilterExtensionParams setLabel:](v50, "setLabel:", CFSTR("none"));
        -[SMSFilterExtensionParams setFolderName:](v50, "setFolderName:", CFSTR("None"));
        -[SMSFilterExtensionParams setIconName:](v50, "setIconName:", 0);
LABEL_43:
        objc_msgSend(v10, "addObject:", v50);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v46);
  }

  objc_msgSend(v10, "sortUsingComparator:", &unk_1E3FB3428);
  v60 = (void *)objc_msgSend(v10, "copy");
  v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v75 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v60, 1, &v75);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v75;
  if (v63)
  {
    v64 = v73;
    if (_IMWillLog())
      _IMAlwaysLog();
  }
  else
  {
    objc_msgSend(v61, "setValue:forKey:", v62, CFSTR("spamFilterExtensionParams"));
    CFPreferencesSetAppValue(CFSTR("spamFilterExtensionParams"), v61, CFSTR("com.apple.MobileSMS"));
    v65 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), v65, (CFStringRef)*MEMORY[0x1E0C9B230]);
    +[IMSMSFilterHelper updateSMSFilterExtensionParams](IMSMSFilterHelper, "updateSMSFilterExtensionParams");
    if (_IMWillLog())
      _IMAlwaysLog();
    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "isSMSFilterSyncEnabled");

    v64 = v73;
    if (v67)
    {
      if (+[IMSpamFilterHelper isFilterUnknownSendersEnabled](IMSpamFilterHelper, "isFilterUnknownSendersEnabled"))
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CKSMSFilterExtensionParamsUpdateDistributedNotification"), 0, 0, 1u);
      }
      +[IMSMSFilterCapabilitiesSyncHelper updateSMSFilterCapabilitiesOptionsForSelf](IMSMSFilterCapabilitiesSyncHelper, "updateSMSFilterCapabilitiesOptionsForSelf");
    }
    else
    {
      v69 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v69, CFSTR("CKSMSFilterExtensionParamsUpdateDistributedNotification"), 0, 0, 1u);
    }
  }

  return 0;
}

+ (void)handleSMSFilterCapabilitiesOptionsChange
{
  unint64_t v3;
  void *v4;
  int v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
  {
    v3 = +[IMSMSFilterCapabilitiesSyncHelper fetchSMSFilterCapabilitiesOptions](IMSMSFilterCapabilitiesSyncHelper, "fetchSMSFilterCapabilitiesOptions");
    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSMSFilterSyncEnabled");

    if (!v5)
      return;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = 1;
    while (1)
    {
      if (v7 > 9)
      {
        if (+[IMSMSFilterCapabilitiesSyncHelper isSubActionActiveInSMSFilterCapabilitiesOptions:subAction:action:](IMSMSFilterCapabilitiesSyncHelper, "isSubActionActiveInSMSFilterCapabilitiesOptions:subAction:action:", v3, v7, 3))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[IMSMSFilterCapabilitiesBinder deLocalizeSubAction:action:](IMSMSFilterCapabilitiesBinder, "deLocalizeSubAction:action:", v7, 3));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v6;
          goto LABEL_9;
        }
      }
      else if (+[IMSMSFilterCapabilitiesSyncHelper isSubActionActiveInSMSFilterCapabilitiesOptions:subAction:action:](IMSMSFilterCapabilitiesSyncHelper, "isSubActionActiveInSMSFilterCapabilitiesOptions:subAction:action:", v3, v7, 4))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[IMSMSFilterCapabilitiesBinder deLocalizeSubAction:action:](IMSMSFilterCapabilitiesBinder, "deLocalizeSubAction:action:", v7, 4));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
LABEL_9:
        objc_msgSend(v9, "addObject:", v8);

      }
      if (++v7 == 13)
      {
        v10 = _IMWillLog();
        v11 = v14;
        if ((v10 & 1) != 0)
        {
          v12 = v14;
          v13 = v6;
          _IMAlwaysLog();
          v11 = v14;
        }
        objc_msgSend(a1, "executeCompletionBlockForFilterParamsUpdate:promo:", v11, v6, v12, v13);

        return;
      }
    }
  }
  if (_IMWillLog())
    _IMAlwaysLog();
}

@end
