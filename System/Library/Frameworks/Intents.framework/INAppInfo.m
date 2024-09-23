@implementation INAppInfo

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "if_extensionAttributesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SupportedMediaCategories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

uint64_t __42__INAppInfo_appInfoWithApplicationRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.intents-service"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedIntentsGroupedByExtensionPoints, 0);
  objc_storeStrong((id *)&self->_definedIntents, 0);
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_actionsRestrictedWhileProtectedDataUnavailable, 0);
  objc_storeStrong((id *)&self->_actionsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_supportedActionsByExtensions, 0);
  objc_storeStrong((id *)&self->_supportedIntentsByApp, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_developmentRegion, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

+ (id)_appInfoWithApplicationRecord:(id)a3 applicationExtensionRecords:(id)a4 userActivityTypes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id obj;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v60 = a5;
  v61 = v7;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "supportedIntents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "intentsRestrictedWhileLocked");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "intentsRestrictedWhileProtectedDataUnavailable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "supportedIntentMediaCategories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v65 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v21, "if_extensionAttributesDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v21, "extensionPointRecord");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, v25);

          objc_msgSend(v63, "addObjectsFromArray:", v23);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v18);
  }

  v27 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(obj, "if_flatMap:", &__block_literal_global_22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(obj, "if_flatMap:", &__block_literal_global_23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(obj, "if_flatMap:", &__block_literal_global_24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_alloc_init((Class)objc_opt_class());
  v37 = v61;
  if (v61)
  {
    objc_msgSend(v61, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setApplicationIdentifier:", v38);

    objc_msgSend(v61, "infoDictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:ofClass:", *MEMORY[0x1E0C9AE68], objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDevelopmentRegion:", v40);

    objc_msgSend(v36, "setSupportsMultiwindow:", objc_msgSend(v61, "supportsMultiwindow"));
    v69 = 0;
    v70 = &v69;
    v71 = 0x2050000000;
    v41 = (void *)getPDCPreflightManagerClass_softClass;
    v72 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __getPDCPreflightManagerClass_block_invoke;
      v68[3] = &unk_1E22953C0;
      v68[4] = &v69;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)v68);
      v41 = (void *)v70[3];
    }
    v42 = objc_retainAutorelease(v41);
    _Block_object_dispose(&v69, 8);
    v43 = (void *)objc_msgSend([v42 alloc], "initWithTargetQueue:", 0);
    objc_msgSend(v36, "setRequiresAppLaunchPreflight:", objc_msgSend(v43, "requiresPreflightForApplicationRecord:", v61));

    objc_msgSend(v61, "counterpartIdentifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCounterpartIdentifiers:", v44);

    v37 = v61;
  }
  v45 = v37 == 0;
  objc_msgSend(v36, "setSupportedIntentsByApp:", v59);
  v46 = (void *)objc_msgSend(v60, "mutableCopy");
  objc_msgSend(v46, "unionSet:", v63);
  objc_msgSend(v36, "setSupportedActions:", v46);

  objc_msgSend(v61, "in_supportedIntents");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSupportedIntents:", v47);

  objc_msgSend(v36, "setSupportedActionsByExtensions:", v63);
  objc_msgSend(v36, "setSupportedIntentsGroupedByExtensionPoints:", v17);
  v48 = (void *)objc_msgSend(v60, "mutableCopy");
  objc_msgSend(v48, "minusSet:", v63);
  objc_msgSend(v48, "minusSet:", v59);
  objc_msgSend(v48, "unionSet:", v29);
  objc_msgSend(v48, "unionSet:", v32);
  objc_msgSend(v48, "unionSet:", v57);
  objc_msgSend(v48, "unionSet:", v58);
  objc_msgSend(v36, "setActionsRestrictedWhileLocked:", v48);

  v49 = (void *)objc_msgSend(v32, "mutableCopy");
  objc_msgSend(v49, "unionSet:", v58);
  objc_msgSend(v36, "setActionsRestrictedWhileProtectedDataUnavailable:", v49);

  if (!v45)
  {
    v50 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v61, "intentDefinitionURLs");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allKeys");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDefinedIntents:", v53);

  }
  v54 = (void *)objc_msgSend(v35, "mutableCopy");
  objc_msgSend(v54, "unionSet:", v56);
  objc_msgSend(v36, "setSupportedMediaCategories:", v54);

  return v36;
}

+ (id)appInfoWithApplicationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "if_userActivityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "applicationExtensionRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "if_objectsPassingTest:", &__block_literal_global_3878);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v4, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.shortcuts"));

  if ((v9 & 1) != 0)
  {
    v13 = CFSTR("com.apple.WorkflowKit.ShortcutsIntents");
LABEL_5:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v13, 0);
    objc_msgSend(v11, "if_addObjectIfNonNil:", v16);

    goto LABEL_6;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

  if (v15)
  {
    v13 = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(a1, "_appInfoWithApplicationRecord:applicationExtensionRecords:userActivityTypes:", v4, v11, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setSupportsMultiwindow:(BOOL)a3
{
  self->_supportsMultiwindow = a3;
}

- (void)setSupportedMediaCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSupportedIntentsGroupedByExtensionPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSupportedIntentsByApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSupportedIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSupportedActionsByExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSupportedActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRequiresAppLaunchPreflight:(BOOL)a3
{
  self->_requiresAppLaunchPreflight = a3;
}

- (void)setDevelopmentRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDefinedIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setCounterpartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setActionsRestrictedWhileProtectedDataUnavailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setActionsRestrictedWhileLocked:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (INAppInfo)init
{
  INAppInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INAppInfo;
  result = -[INAppInfo init](&v3, sel_init);
  if (result)
    result->_supportsMultiwindow = 0;
  return result;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "if_extensionAttributesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileLocked"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

id __89__INAppInfo__appInfoWithApplicationRecord_applicationExtensionRecords_userActivityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "if_extensionAttributesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileProtectedDataUnavailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSSet)supportedActionsByExtensions
{
  return self->_supportedActionsByExtensions;
}

+ (id)appInfoWithAppProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v13 = v10;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(v4, "applicationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = (id)objc_msgSend(v11, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, &v17);
    v9 = v17;

    if (!v9)
      goto LABEL_12;
    v14 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[INAppInfo appInfoWithAppProxy:]";
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_ERROR, "%s Unable to create app info with application record: %@", buf, 0x16u);
    }
  }

LABEL_12:
  if (v13)
  {
    objc_msgSend(a1, "appInfoWithApplicationRecord:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSSet)supportedIntents
{
  return self->_supportedIntents;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (NSString)companionApplicationIdentifier
{
  void *v2;
  void *v3;

  -[INAppInfo counterpartIdentifiers](self, "counterpartIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  void *v5;
  id v6;

  applicationIdentifier = self->_applicationIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  -[NSArray firstObject](self->_counterpartIdentifiers, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("companionApplicationIdentifier"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_counterpartIdentifiers, CFSTR("counterpartIdentifiers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_developmentRegion, CFSTR("developmentRegion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedActions, CFSTR("supportedActions"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedIntents, CFSTR("supportedIntents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedIntentsByApp, CFSTR("supportedIntentsByApp"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedActionsByExtensions, CFSTR("supportedActionsByExtensions"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedIntentsGroupedByExtensionPoints, CFSTR("supportedIntentsGroupedByExtensionPoints"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actionsRestrictedWhileLocked, CFSTR("actionsRestrictedWhileLocked"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actionsRestrictedWhileProtectedDataUnavailable, CFSTR("actionsRestrictedWhileProtectedDataUnavailable"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_definedIntents, CFSTR("definedIntents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedMediaCategories, CFSTR("supportedMediaCategories"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsMultiwindow, CFSTR("supportsMultiwindow"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresAppLaunchPreflight, CFSTR("requiresAppLaunchPreflight"));

}

- (INAppInfo)initWithCoder:(id)a3
{
  id v4;
  INAppInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)INAppInfo;
  v5 = -[INAppInfo init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppInfo setApplicationIdentifier:](v5, "setApplicationIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionApplicationIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("counterpartIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppInfo setCounterpartIdentifiers:](v5, "setCounterpartIdentifiers:", v11);

    -[INAppInfo counterpartIdentifiers](v5, "counterpartIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "if_arrayWithObjectIfNonNil:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppInfo setCounterpartIdentifiers:](v5, "setCounterpartIdentifiers:", v13);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developmentRegion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppInfo setDevelopmentRegion:](v5, "setDevelopmentRegion:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("supportedActions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[INAppInfo setSupportedActions:](v5, "setSupportedActions:", v18);
    }
    else
    {
      v19 = (void *)objc_opt_new();
      -[INAppInfo setSupportedActions:](v5, "setSupportedActions:", v19);

    }
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("supportedIntents"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[INAppInfo setSupportedIntents:](v5, "setSupportedIntents:", v23);
    }
    else
    {
      v24 = (void *)objc_opt_new();
      -[INAppInfo setSupportedIntents:](v5, "setSupportedIntents:", v24);

    }
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("supportedIntentsByApp"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[INAppInfo setSupportedIntentsByApp:](v5, "setSupportedIntentsByApp:", v28);
    }
    else
    {
      v29 = (void *)objc_opt_new();
      -[INAppInfo setSupportedIntentsByApp:](v5, "setSupportedIntentsByApp:", v29);

    }
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("supportedActionsByExtensions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[INAppInfo setSupportedActionsByExtensions:](v5, "setSupportedActionsByExtensions:", v33);
    }
    else
    {
      v34 = (void *)objc_opt_new();
      -[INAppInfo setSupportedActionsByExtensions:](v5, "setSupportedActionsByExtensions:", v34);

    }
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("supportedIntentsGroupedByExtensionPoints"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppInfo setSupportedIntentsGroupedByExtensionPoints:](v5, "setSupportedIntentsGroupedByExtensionPoints:", v39);

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("actionsRestrictedWhileLocked"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      -[INAppInfo setActionsRestrictedWhileLocked:](v5, "setActionsRestrictedWhileLocked:", v43);
    }
    else
    {
      v44 = (void *)objc_opt_new();
      -[INAppInfo setActionsRestrictedWhileLocked:](v5, "setActionsRestrictedWhileLocked:", v44);

    }
    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("actionsRestrictedWhileProtectedDataUnavailable"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      -[INAppInfo setActionsRestrictedWhileProtectedDataUnavailable:](v5, "setActionsRestrictedWhileProtectedDataUnavailable:", v48);
    }
    else
    {
      v49 = (void *)objc_opt_new();
      -[INAppInfo setActionsRestrictedWhileProtectedDataUnavailable:](v5, "setActionsRestrictedWhileProtectedDataUnavailable:", v49);

    }
    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("definedIntents"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      -[INAppInfo setDefinedIntents:](v5, "setDefinedIntents:", v53);
    }
    else
    {
      v54 = (void *)objc_opt_new();
      -[INAppInfo setDefinedIntents:](v5, "setDefinedIntents:", v54);

    }
    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("supportedMediaCategories"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      -[INAppInfo setSupportedMediaCategories:](v5, "setSupportedMediaCategories:", v58);
    }
    else
    {
      v59 = (void *)objc_opt_new();
      -[INAppInfo setSupportedMediaCategories:](v5, "setSupportedMediaCategories:", v59);

    }
    -[INAppInfo setSupportsMultiwindow:](v5, "setSupportsMultiwindow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsMultiwindow")));
    -[INAppInfo setRequiresAppLaunchPreflight:](v5, "setRequiresAppLaunchPreflight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAppLaunchPreflight")));

  }
  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (NSString)developmentRegion
{
  return self->_developmentRegion;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (BOOL)isRequiresAppLaunchPreflight
{
  return self->_requiresAppLaunchPreflight;
}

- (NSSet)supportedActions
{
  return self->_supportedActions;
}

- (NSSet)supportedIntentsByApp
{
  return self->_supportedIntentsByApp;
}

- (NSSet)actionsRestrictedWhileLocked
{
  return self->_actionsRestrictedWhileLocked;
}

- (NSSet)actionsRestrictedWhileProtectedDataUnavailable
{
  return self->_actionsRestrictedWhileProtectedDataUnavailable;
}

- (NSSet)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (NSSet)definedIntents
{
  return self->_definedIntents;
}

- (NSDictionary)supportedIntentsGroupedByExtensionPoints
{
  return self->_supportedIntentsGroupedByExtensionPoints;
}

- (void)setCompanionApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

+ (id)appInfoWithData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)appInfoWithIntent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    objc_msgSend(v4, "launchId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    INExtractAppInfoFromSiriLaunchId(v14, &v22, 0);
    v10 = v22;

    v21 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v21);
    v9 = v21;
    if (v9
      && (v15 = INSiriLogContextIntents,
          os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[INAppInfo appInfoWithIntent:]";
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Unable to create application record: %@", buf, 0x16u);
      if (v12)
        goto LABEL_9;
    }
    else if (v12)
    {
LABEL_9:
      objc_msgSend(a1, "appInfoWithApplicationRecord:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v10)
    {
      objc_msgSend(_INVCIntentDefinitionManagerClass(), "appInfoForBundleID:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v16 = 0;
    }
    goto LABEL_11;
  }
  v7 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v4, "extensionBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v9 = (id)objc_msgSend(v7, "initWithBundleIdentifier:error:", v8, &v20);
  v10 = v20;

  if (v10)
  {
    v11 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v17 = v11;
      objc_msgSend(v4, "extensionBundleId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "+[INAppInfo appInfoWithIntent:]";
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v10;
      _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Unable to create application extension record <%@>: %@", buf, 0x20u);

      if (v9)
        goto LABEL_5;
LABEL_13:
      v16 = 0;
      goto LABEL_14;
    }
  }
  if (!v9)
    goto LABEL_13;
LABEL_5:
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appInfoWithApplicationRecord:applicationExtensionRecords:userActivityTypes:", 0, v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v16 = (void *)v13;
LABEL_11:

LABEL_14:
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
