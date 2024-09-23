@implementation IMSMSFilterHelper

+ (id)fetchSMSFilterExtensionParams
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v16;

  v2 = (void *)qword_1EE504598;
  if (qword_1EE504598)
    return v2;
  if ((IMGetDomainBoolForKey() & 1) != 0)
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || !objc_msgSend(v3, "count"))
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      +[IMSMSFilterCapabilitiesBinder handleSubClassificationFilterChange](IMSMSFilterCapabilitiesBinder, "handleSubClassificationFilterChange");
      goto LABEL_20;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("spamFilterExtensionParams"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v16);
    v7 = v16;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_enableStrictSecureDecodingMode");
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)qword_1EE504598;
    qword_1EE504598 = v11;

    v13 = qword_1EE504598;
    v14 = _IMWillLog();
    if (!v13 || v7)
    {
      if (v14)
LABEL_18:
        _IMAlwaysLog();
    }
    else if ((v14 & 1) != 0)
    {
      goto LABEL_18;
    }

LABEL_20:
    v2 = (void *)qword_1EE504598;
    return v2;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  return 0;
}

+ (void)updateSMSFilterExtensionParams
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;

  v2 = (void *)qword_1EE504598;
  qword_1EE504598 = 0;

  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("spamFilterExtensionParams"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v15);
    v7 = v15;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_enableStrictSecureDecodingMode");
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)qword_1EE504598;
    qword_1EE504598 = v11;

    v13 = qword_1EE504598;
    v14 = _IMWillLog();
    if (!v13 || v7)
    {
      if (v14)
LABEL_10:
        _IMAlwaysLog();
    }
    else if ((v14 & 1) != 0)
    {
      goto LABEL_10;
    }

  }
}

+ (id)fetchSMSFilterParamForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "action") == a3 && objc_msgSend(v11, "subAction") == a4)
        {
          v12 = v11;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)smsFilterParamForFilterMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_fetchSMSFilterParamForCategory_subCategory_);
}

+ (int64_t)filterActionForCategory:(int64_t)a3
{
  int64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 2;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "category") == a3)
        {
          v3 = objc_msgSend(v10, "action");
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_13:

  return v3;
}

+ (int64_t)filterSubActionForCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "category") == a3 && objc_msgSend(v11, "subCategory") == a4)
        {
          v12 = objc_msgSend(v11, "subAction");
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (id)filterLabelForAction:(int64_t)a3 subAction:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = CFSTR("filtered");
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "action") == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          objc_msgSend(v12, "label");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v10 = CFSTR("filtered");
  }
LABEL_13:

  return v10;
}

+ (BOOL)isValidActiveFilterAction:(int64_t)a3 subAction:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)qword_1EE504598;
  qword_1EE504598 = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[IMSMSFilterHelper fetchSMSFilterExtensionParams](IMSMSFilterHelper, "fetchSMSFilterExtensionParams", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "action") == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          v13 = 1;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (unint64_t)conversationFilterModeForMessageFilter:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = a3 & 0xF;
  v4 = 5;
  if (v3 != 3)
    v4 = 0;
  if (v3 != 4)
    v3 = v4;
  if (a3 >= 0x10)
    return v3;
  else
    return a3;
}

+ (BOOL)supportsIncomingSMSRelayFiltering
{
  void *v2;
  int v3;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSMSFilterSyncEnabled");

  return v3 && IMSharedHelperDeviceIsiPad();
}

+ (BOOL)IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:(int64_t)a3
{
  void *v4;
  char v5;

  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSMSFilterSyncEnabled");

  if (a3 == 4)
    return v5;
  else
    return 0;
}

@end
