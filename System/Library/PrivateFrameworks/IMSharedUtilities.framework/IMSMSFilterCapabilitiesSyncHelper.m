@implementation IMSMSFilterCapabilitiesSyncHelper

+ (id)fetchSMSFilterSyncDeviceParams
{
  void *v3;
  int v4;
  id v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (!v4)
  {
LABEL_5:
    v5 = (id)qword_1EE503E38;
    return v5;
  }
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
  {
    if (!qword_1EE503E38)
      objc_msgSend(a1, "updateSMSFilterSyncDeviceParamsCache");
    goto LABEL_5;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  v5 = 0;
  return v5;
}

+ (BOOL)shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSMSFilterSyncEnabled");

  if (v11)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v17, "deviceUniqueID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "isEqualToString:", v8)
              && objc_msgSend(v17, "smsFilterCapabilitiesOptions") == a4)
            {
              objc_msgSend(v17, "filterExtensionName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v9);

              if (v20)
              {
                if (_IMWillLog())
                  _IMAlwaysLog();
                v21 = 0;
                goto LABEL_23;
              }
            }
            else
            {

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v14)
            continue;
          break;
        }
      }
      v21 = 1;
LABEL_23:

    }
    else
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      v21 = 0;
    }
  }
  else
  {
    v21 = 1;
  }

  return v21;
}

+ (void)updateSMSFilterCapabilitiesOptionsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  int v12;
  void *v13;
  id v14;
  SMSFilterSyncDeviceParams *v15;
  SMSFilterSyncDeviceParams *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  unint64_t v33;
  id v34;
  id v35;
  SMSFilterSyncDeviceParams *v36;
  id v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a5;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSMSFilterSyncEnabled");

  if (v10)
  {
    v11 = +[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering");
    v12 = _IMWillLog();
    if (v11)
    {
      if (v12)
      {
        v33 = a4;
        v34 = v8;
        v32 = v39;
        _IMAlwaysLog();
      }
      v35 = a1;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams", v32, v33, v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = objc_alloc_init(SMSFilterSyncDeviceParams);
      v16 = v15;
      if (a4)
      {
        -[SMSFilterSyncDeviceParams setDeviceUniqueID:](v15, "setDeviceUniqueID:", v39);
        v17 = a4;
        -[SMSFilterSyncDeviceParams setSmsFilterCapabilitiesOptions:](v16, "setSmsFilterCapabilitiesOptions:", a4);
        -[SMSFilterSyncDeviceParams setFilterExtensionName:](v16, "setFilterExtensionName:", v8);
        objc_msgSend(v14, "addObject:", v16);
        v18 = 1;
      }
      else
      {
        v17 = 0;
        v18 = 2;
      }
      v36 = v16;
      v37 = v8;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v13;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v24, "deviceUniqueID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v39);

            if ((v26 & 1) != 0)
            {
              if (v17)
                v18 = 3;
              v21 |= v17 == 0;
            }
            else
            {
              objc_msgSend(v14, "addObject:", v24);
            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
      }

      if (v17 || (v21 & 1) != 0)
      {
        v27 = v14;
        objc_msgSend(v35, "storeSMSFilterSyncDeviceParams:", v14);
        CFPreferencesSetAppValue(CFSTR("sForceDisableSMSFilteringIpadCompleted"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.MobileSMS"));
        v44[0] = CFSTR("IMMetricsCollectorEventSMSFilterSyncDeviceCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v28;
        v44[1] = CFSTR("IMMetricsCollectorEventSMSFilterSyncStateChangedTypeKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventSMSFilterSyncStateChanged"), v30);

      }
      else
      {

      }
      v8 = v37;
    }
    else if (v12)
    {
      _IMAlwaysLog();
    }
  }

}

+ (void)updateFilterExtensionName
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v11, "filterExtensionName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length");

            if (v13)
            {
              objc_msgSend(v11, "filterExtensionName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v14);

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      v15 = (void *)objc_msgSend(v5, "count");
      if (_IMWillLog())
        _IMAlwaysLog();
      if (v15)
      {
        if (v15 == (void *)1)
        {
          objc_msgSend(v5, "anyObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingString:", CFSTR(" filters"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      if (_IMWillLog())
        _IMAlwaysLog();
      CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionName"), v15, CFSTR("com.apple.MobileSMS"));

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

+ (void)storeSMSFilterSyncDeviceParams:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v4 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (!v6)
    goto LABEL_18;
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
  {
    objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToArray:", v7);

    if (v8)
    {
      if (_IMWillLog())
        goto LABEL_7;
      goto LABEL_18;
    }
    qword_1ECFC6640 = -1;
    v9 = (void *)qword_1EE503E38;
    qword_1EE503E38 = 0;

    if (objc_msgSend(v4, "count"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = (void *)objc_msgSend(v4, "copy");
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
      if (v13)
      {
        v14 = v13;
        if (_IMWillLog())
          _IMAlwaysLog();

LABEL_17:
        goto LABEL_18;
      }
      objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("smsFilterSyncDeviceParams"));

    }
    else
    {
      v10 = 0;
    }
    CFPreferencesSetAppValue(CFSTR("smsFilterSyncDeviceParams"), v10, CFSTR("com.apple.MobileSMS"));
    v15 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), v15, (CFStringRef)*MEMORY[0x1E0C9B230]);
    objc_msgSend(a1, "updateFilterExtensionName");
    objc_msgSend(a1, "updateSMSFilterCapabilitiesOptions");
    if (objc_msgSend(a1, "isSMSFilteringEnabledInSMSFilterCapabilitiesOptions"))
      +[IMSMSFilterCapabilitiesBinder handleSMSFilterCapabilitiesOptionsChange](IMSMSFilterCapabilitiesBinder, "handleSMSFilterCapabilitiesOptionsChange");
    goto LABEL_17;
  }
  if (_IMWillLog())
LABEL_7:
    _IMAlwaysLog();
LABEL_18:

}

+ (void)updateSMSFilterSyncDeviceParamsCache
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSMSFilterSyncEnabled");

  if (v3)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      IMGetCachedDomainValueForKey();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4 || !objc_msgSend(v4, "count"))
        goto LABEL_16;
      objc_msgSend(v5, "objectForKey:", CFSTR("smsFilterSyncDeviceParams"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v16);
      v8 = v16;
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_enableStrictSecureDecodingMode");
      if (_IMWillLog())
        _IMAlwaysLog();
      objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x1E0CB2CD0]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)qword_1EE503E38;
      qword_1EE503E38 = v12;

      v14 = qword_1EE503E38;
      v15 = _IMWillLog();
      if (!v14 || v8)
      {
        if (v15)
LABEL_14:
          _IMAlwaysLog();
      }
      else if ((v15 & 1) != 0)
      {
        goto LABEL_14;
      }

LABEL_16:
      return;
    }
    if (_IMWillLog())
      _IMAlwaysLog();
  }
}

+ (id)fetchFilterExtensionNameForDeviceID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v12, "deviceUniqueID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v4);

            if (v14)
            {
              if (_IMWillLog())
              {
                objc_msgSend(v12, "filterExtensionName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v4;
                _IMAlwaysLog();

              }
              objc_msgSend(v12, "filterExtensionName", v17, v18);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

+ (unint64_t)fetchSMSFilterCapabilitiesOptionsForDeviceID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v12, "deviceUniqueID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v4);

            if (v14)
            {
              if (_IMWillLog())
              {
                v17 = objc_msgSend(v12, "smsFilterCapabilitiesOptions");
                v18 = v4;
                _IMAlwaysLog();
              }
              v15 = objc_msgSend(v12, "smsFilterCapabilitiesOptions", v17, v18);

              goto LABEL_15;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

+ (BOOL)isValidSubActionForDeviceID:(id)a3 action:(int64_t)a4 subAction:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;

  v8 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSMSFilterSyncEnabled");

  if (v10)
  {
    v11 = objc_msgSend(a1, "fetchSMSFilterCapabilitiesOptionsForDeviceID:", v8);
    v12 = (objc_msgSend(a1, "IMSMSFilterCapabilitiesOptionForFilterSubAction:action:", a5, a4) & v11) != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)verifyCurrentRelayDevicesActive:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSMSFilterSyncEnabled");

  if (v6)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams", 0);
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
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v13, "deviceUniqueID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v4, "containsObject:", v14);

            if (v15)
              objc_msgSend(v7, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      objc_msgSend(a1, "storeSMSFilterSyncDeviceParams:", v7);
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }

}

+ (BOOL)isValidSMSFilterCapabilitiesOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  char v5;

  v3 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSMSFilterSyncEnabled");

  return v3 & v5;
}

+ (BOOL)isSMSFilteringEnabledInSMSFilterCapabilitiesOptions
{
  void *v3;
  int v4;
  uint64_t v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (!v4)
    goto LABEL_6;
  if (!+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering](IMSMSFilterHelper, "supportsIncomingSMSRelayFiltering"))
  {
    LODWORD(v5) = _IMWillLog();
    if (!(_DWORD)v5)
      return v5;
    _IMAlwaysLog();
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  return ((unint64_t)objc_msgSend(a1, "fetchSMSFilterCapabilitiesOptions") >> 1) & 1;
}

+ (unint64_t)fetchSMSFilterCapabilitiesOptions
{
  void *v3;
  int v4;
  BOOL v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
    v5 = qword_1ECFC6640 == -1;
  else
    v5 = 0;
  if (v5)
    objc_msgSend(a1, "updateSMSFilterCapabilitiesOptionsCache");
  if (_IMWillLog())
    _IMAlwaysLog();
  return qword_1ECFC6640;
}

+ (void)updateSMSFilterCapabilitiesOptionsForSelf
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4 && !IMSharedHelperDeviceIsiPad())
  {
    +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        v10 = 3;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (objc_msgSend(v12, "subAction"))
              v10 |= objc_msgSend(a1, "IMSMSFilterCapabilitiesOptionForFilterSubAction:action:", objc_msgSend(v12, "subAction"), objc_msgSend(v12, "action"));
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
      else
      {
        v10 = 3;
      }

    }
    else
    {
      v10 = 1;
    }
    if (_IMWillLog())
    {
      v13 = v10;
      _IMAlwaysLog();
    }
    objc_msgSend(a1, "storeSMSFilterCapabilitiesOptions:", v10, v13);

  }
}

+ (void)updateSMSFilterCapabilitiesOptions
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a1, "fetchSMSFilterSyncDeviceParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "smsFilterCapabilitiesOptions");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 1;
    }

    if (_IMWillLog())
    {
      v11 = v9;
      _IMAlwaysLog();
    }
    objc_msgSend(a1, "storeSMSFilterCapabilitiesOptions:", v9, v11);
  }
}

+ (void)storeSMSFilterCapabilitiesOptions:(unint64_t)a3
{
  void *v4;
  int v5;
  const __CFString *v6;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSMSFilterSyncEnabled");

  if (v5)
  {
    qword_1ECFC6640 = -1;
    CFPreferencesSetAppValue(CFSTR("spamFilterExtensionCapabilitiesOptions"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("com.apple.MobileSMS"));
    v6 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), v6, (CFStringRef)*MEMORY[0x1E0C9B230]);
  }
}

+ (void)updateSMSFilterCapabilitiesOptionsCache
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMSFilterSyncEnabled");

  if (v4)
  {
    IMGetCachedDomainValueForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (objc_msgSend(a1, "updateSMSFilterCapabilitiesOptionsForSelf"),
          IMGetCachedDomainValueForKey(),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = objc_msgSend(v5, "unsignedIntegerValue");

    }
    else
    {
      v6 = 0;
    }
    qword_1ECFC6640 = v6;
  }
}

+ (unint64_t)IMSMSFilterCapabilitiesOptionForFilterSubAction:(int64_t)a3 action:(int64_t)a4
{
  char v5;
  void *v6;
  int v7;
  unint64_t v8;

  v5 = a3;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSMSFilterSyncEnabled");

  if (!v7)
    return 0;
  v8 = 1 << (v5 + 1);
  if (a4 != 4)
    v8 = 0;
  if (a4 == 3)
    return 1 << (v5 + 7);
  else
    return v8;
}

+ (BOOL)isSubActionActiveInSMSFilterCapabilitiesOptions:(unint64_t)a3 subAction:(int64_t)a4 action:(int64_t)a5
{
  void *v8;
  int v9;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSMSFilterSyncEnabled");

  return v9
      && (+[IMSMSFilterCapabilitiesSyncHelper IMSMSFilterCapabilitiesOptionForFilterSubAction:action:](IMSMSFilterCapabilitiesSyncHelper, "IMSMSFilterCapabilitiesOptionForFilterSubAction:action:", a4, a5) & a3) != 0;
}

@end
