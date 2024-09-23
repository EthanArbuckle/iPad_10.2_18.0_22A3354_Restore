@implementation LSBundleRecordBuilder

- (void)setRegistrationInfo:(id)a3 alias:(id)a4
{
  id v6;
  LSRegistrationInfo *v7;
  LSRegistrationInfo *registrationInfo;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
    v7 = (LSRegistrationInfo *)objc_msgSend(v9, "mutableCopy");
  else
    v7 = objc_alloc_init(LSRegistrationInfo);
  registrationInfo = self->_registrationInfo;
  self->_registrationInfo = v7;

  self->_bundleClass = self->_registrationInfo->bundleClass;
  self->_itemFlags = self->_registrationInfo->itemFlags;
  if (v6)
    objc_storeStrong((id *)&self->_bundleAlias, a4);
  *(_QWORD *)&self->_hfsCreator = self->_registrationInfo->inoExec;

}

- (void)addBundleFlag:(unint64_t)a3
{
  self->_bundleFlags |= a3;
}

- (void)addPlistFlag:(unsigned int)a3
{
  self->_plistContentFlags |= a3;
}

- (void)addIconFlag:(unsigned __int8)a3
{
  self->_iconFlags |= a3;
}

- (void)addItemInfoFlag:(unsigned int)a3
{
  self->_itemFlags |= a3;
}

- (int)registerQueriableSchemes:(id)a3 bundleData:(LSBundleData *)a4
{
  id v5;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *context;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  context = (void *)MEMORY[0x186DAE7A0]();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0;
  v6 = self->_exportedTypes;
  if (v6)
  {
    v7 = v6;
    -[LSBundleRecordBuilder truncate:queriableSchemesIfNeeded:](self, "truncate:queriableSchemesIfNeeded:", &v28, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v8);
  }
  else
  {
    v8 = 0;
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_documentClaims;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    v12 = *MEMORY[0x1E0C9AB30];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v15 = objc_opt_class();
          objc_msgSend(v14, "objectForKey:", v12);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15 && v16)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
LABEL_16:

              continue;
            }
          }
          else if (!v16)
          {
            goto LABEL_16;
          }
          objc_msgSend(v5, "addObjectsFromArray:", v17);
          goto LABEL_16;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v19 = 0;
    a4->types = 0;
LABEL_27:
    if (v28)
      *(_WORD *)&self->_moreFlags |= 0x40u;
    goto LABEL_29;
  }
  objc_msgSend(v5, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  a4->types = _LSDatabaseCreateStringArray(v23, v18, 1, 0);

  if (a4->types)
    v19 = 0;
  else
    v19 = -9493;
  if (a4->types)
    goto LABEL_27;
LABEL_29:

  objc_autoreleasePoolPop(context);
  return v19;
}

- (id)truncate:(BOOL *)a3 queriableSchemesIfNeeded:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  __int128 v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  NSNumber *installType;
  uint64_t v15;
  _BYTE v16[32];
  __int16 v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  _LSMakeVersionNumber(15, 0, 0, &v19);
  +[_LSCanOpenURLManager sharedManager](_LSCanOpenURLManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "schemeQueryLimit");

  v9 = *(_OWORD *)&self->_sdkVersionNumber._opaque[8];
  *(_OWORD *)v16 = *(_OWORD *)&self->_supportedGameControllers;
  *(_OWORD *)&v16[16] = v9;
  v21[0] = v19;
  v21[1] = v20;
  if ((unint64_t)_LSVersionNumberCompare(v16, v21) > 1 || objc_msgSend(v6, "count") <= v8)
  {
    v12 = 0;
    goto LABEL_9;
  }
  _LSInstallLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    installType = self->_installType;
    if (!installType)
      installType = (NSNumber *)self->_shortDisplayName;
    v15 = objc_msgSend(v6, "count");
    *(_DWORD *)v16 = 138413058;
    *(_QWORD *)&v16[4] = installType;
    *(_WORD *)&v16[12] = 2048;
    *(_QWORD *)&v16[14] = v15;
    *(_WORD *)&v16[22] = 2048;
    *(_QWORD *)&v16[24] = v8;
    v17 = 2048;
    v18 = v8;
    _os_log_error_impl(&dword_182882000, v10, OS_LOG_TYPE_ERROR, "Application %@ has requested permission to query %llu URL schemes, but the maximum queriable is %llu. Limiting to the first %llu listed in its Info.plist.", v16, 0x2Au);
  }

  objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  if (!v11)
  {
LABEL_9:
    v11 = v6;
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a3)
LABEL_6:
    *a3 = v12;
LABEL_7:

  return v11;
}

- (id)_LSBundleFlagMap
{
  if (-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken != -1)
    dispatch_once(&-[LSBundleRecordBuilder _LSBundleFlagMap]::onceToken, &__block_literal_global_18);
  return (id)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;
}

void __41__LSBundleRecordBuilder__LSBundleFlagMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[47];
  _QWORD v3[48];

  v3[47] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0C9AAC8];
  v2[1] = CFSTR("LSHasLocalizedDisplayName");
  v3[0] = &unk_1E1075180;
  v3[1] = &unk_1E1075180;
  v2[2] = *MEMORY[0x1E0C9AE88];
  v2[3] = CFSTR("LSUIElement");
  v3[2] = &unk_1E1075180;
  v3[3] = &unk_1E1075198;
  v2[4] = CFSTR("NSUIElement");
  v2[5] = CFSTR("UINewsstandApp");
  v3[4] = &unk_1E1075198;
  v3[5] = &unk_1E10751B0;
  v2[6] = CFSTR("LSBackgroundOnly");
  v2[7] = CFSTR("NSBGOnly");
  v3[6] = &unk_1E10751C8;
  v3[7] = &unk_1E10751C8;
  v2[8] = CFSTR("LSMultipleInstancesProhibited");
  v2[9] = CFSTR("_LSIsExecutableForParentBundle");
  v3[8] = &unk_1E10751E0;
  v3[9] = &unk_1E10751F8;
  v2[10] = CFSTR("_LSInfoPlistIsMissing");
  v2[11] = CFSTR("_LSNoExecutableInfo");
  v3[10] = &unk_1E1075210;
  v3[11] = &unk_1E1075228;
  v2[12] = CFSTR("LSFileQuarantineEnabled");
  v2[13] = CFSTR("_LSRequiresOldJavaStub");
  v3[12] = &unk_1E1075240;
  v3[13] = &unk_1E1075258;
  v2[14] = CFSTR("_LSRequiresJavaRuntime");
  v2[15] = CFSTR("_LSRequiresIPhoneSimulator");
  v3[14] = &unk_1E1075270;
  v3[15] = &unk_1E1075288;
  v2[16] = CFSTR("LSRequiresIPhoneOS");
  v2[17] = CFSTR("_LSBundleVersionTooLow");
  v3[16] = &unk_1E10752A0;
  v3[17] = &unk_1E10752B8;
  v2[18] = CFSTR("ASAccountAuthenticationModificationOptOutOfSecurityPromptsOnSignIn");
  v2[19] = CFSTR("is-purchased-redownload");
  v3[18] = &unk_1E10752D0;
  v3[19] = &unk_1E10752E8;
  v2[20] = CFSTR("DeviceBasedVPP");
  v2[21] = CFSTR("IsPlaceholder");
  v3[20] = &unk_1E1075300;
  v3[21] = &unk_1E1075318;
  v2[22] = CFSTR("HasMIDBasedSINF");
  v2[23] = CFSTR("MissingSINF");
  v3[22] = &unk_1E1075330;
  v3[23] = &unk_1E1075348;
  v2[24] = CFSTR("RestrictedDownload");
  v2[25] = CFSTR("IsParallelPlaceholder");
  v3[24] = &unk_1E1075360;
  v3[25] = &unk_1E1075378;
  v2[26] = CFSTR("IsUpdatedSystemApp");
  v2[27] = CFSTR("IsDeletable");
  v3[26] = &unk_1E1075378;
  v3[27] = &unk_1E1075390;
  v2[28] = CFSTR("IsAdHocSigned");
  v2[29] = CFSTR("HasSettingsBundle");
  v3[28] = &unk_1E10753A8;
  v3[29] = &unk_1E10753C0;
  v2[30] = CFSTR("NSSupportsPurgeableLocalStorage");
  v2[31] = CFSTR("HasCustomNotificationKey");
  v3[30] = &unk_1E10753D8;
  v3[31] = &unk_1E10753F0;
  v2[32] = CFSTR("HasWatchGlance");
  v2[33] = CFSTR("SkipWatchAppInstall");
  v3[32] = &unk_1E1075408;
  v3[33] = &unk_1E1075420;
  v2[34] = CFSTR("SupportsAudiobooks");
  v2[35] = CFSTR("MPSupportsExternallyPlayableContent");
  v3[34] = &unk_1E1075438;
  v3[35] = &unk_1E1075450;
  v2[36] = CFSTR("UIFileSharingEnabled");
  v2[37] = CFSTR("LSSupportsOpeningDocumentsInPlace");
  v3[36] = &unk_1E1075468;
  v3[37] = &unk_1E1075480;
  v2[38] = CFSTR("UISupportsDocumentBrowser");
  v2[39] = CFSTR("_LSBundleIsInGenerationalStorage");
  v3[38] = &unk_1E1075480;
  v3[39] = &unk_1E1075498;
  v2[40] = CFSTR("_LSBundleIsApplet");
  v2[41] = CFSTR("LSApplicationIsStickerProvider");
  v3[40] = &unk_1E10754B0;
  v3[41] = &unk_1E10754C8;
  v2[42] = CFSTR("LSApplicationLaunchProhibited");
  v2[43] = CFSTR("initialODRSize");
  v3[42] = &unk_1E10754C8;
  v3[43] = &unk_1E10754E0;
  v2[44] = CFSTR("gameCenterEnabled");
  v2[45] = CFSTR("gameCenterEverEnabled");
  v3[44] = &unk_1E10754F8;
  v3[45] = &unk_1E1075510;
  v2[46] = CFSTR("NSApplicationRequiresArcade");
  v3[46] = &unk_1E1075528;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 47);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap;
  -[LSBundleRecordBuilder _LSBundleFlagMap]::bundleFlagMap = v0;

}

- (id)_LSPlistRaritiesMap
{
  if (-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken != -1)
    dispatch_once(&-[LSBundleRecordBuilder _LSPlistRaritiesMap]::onceToken, &__block_literal_global_134_0);
  return (id)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;
}

void __44__LSBundleRecordBuilder__LSPlistRaritiesMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[17];
  _QWORD v3[18];

  v3[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("LSLaunchDLabel");
  v2[1] = CFSTR("LSFileQuarantineExcludedPathPatterns");
  v3[0] = &unk_1E1075540;
  v3[1] = &unk_1E1075558;
  v2[2] = CFSTR("MKDirectionsApplicationSupportedModes");
  v2[3] = CFSTR("UIBackgroundModes");
  v3[2] = &unk_1E1075570;
  v3[3] = &unk_1E1075588;
  v2[4] = CFSTR("AudioComponents");
  v2[5] = CFSTR("UIVPNPlugin");
  v3[4] = &unk_1E10755A0;
  v3[5] = &unk_1E10755B8;
  v2[6] = CFSTR("SBAppTags");
  v2[7] = CFSTR("UIRequiredDeviceCapabilities");
  v3[6] = &unk_1E10755D0;
  v3[7] = &unk_1E10755E8;
  v2[8] = CFSTR("UISupportedExternalAccessoryProtocols");
  v2[9] = CFSTR("LSMinimumSystemVersionByArchitecture");
  v3[8] = &unk_1E1075600;
  v3[9] = &unk_1E1075618;
  v2[10] = CFSTR("LSEnvironment");
  v2[11] = CFSTR("storeCohort");
  v3[10] = &unk_1E1075630;
  v3[11] = &unk_1E1075648;
  v2[12] = CFSTR("subgenres");
  v2[13] = CFSTR("INIntentsSupported");
  v3[12] = &unk_1E1075660;
  v3[13] = &unk_1E1075678;
  v2[14] = CFSTR("INIntentsRestrictedWhileLocked");
  v2[15] = CFSTR("INIntentsRestrictedWhileProtectedDataUnavailable");
  v3[14] = &unk_1E1075678;
  v3[15] = &unk_1E1075678;
  v2[16] = CFSTR("INSupportedMediaCategories");
  v3[16] = &unk_1E1075678;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap;
  -[LSBundleRecordBuilder _LSPlistRaritiesMap]::plistMap = v0;

}

- (id)_LSKeyTypeMap
{
  if (-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken != -1)
    dispatch_once(&-[LSBundleRecordBuilder _LSKeyTypeMap]::onceToken, &__block_literal_global_184);
  return (id)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;
}

void __38__LSBundleRecordBuilder__LSKeyTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("LSLaunchDLabel");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("LSFileQuarantineExcludedPathPatterns");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("MKDirectionsApplicationSupportedModes");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("UIBackgroundModes");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("AudioComponents");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("SBAppTags");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("UIRequiredDeviceCapabilities");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("UISupportedExternalAccessoryProtocols");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("LSMinimumSystemVersionByArchitecture");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("LSEnvironment");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("storeCohort");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("subgenres");
  v3[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap;
  -[LSBundleRecordBuilder _LSKeyTypeMap]::typeMap = v0;

}

- (void)setFlagsFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  LSRegistrationInfo *registrationInfo;
  char v13;
  _QWORD v14[4];
  id v15;
  LSBundleRecordBuilder *v16;

  v4 = a3;
  -[LSBundleRecordBuilder _LSBundleFlagMap](self, "_LSBundleFlagMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke;
  v14[3] = &unk_1E1042198;
  v6 = v4;
  v15 = v6;
  v16 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 2);
  objc_msgSend(v6, "objectForKey:", CFSTR("Java"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x2000);
  v9 = objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("UIApplicationSceneManifest"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
      goto LABEL_14;
    }
  }
  else if (!v10)
  {
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "_LS_BoolForKey:", CFSTR("CPSupportsDashboardNavigationScene")))
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x4000000000000000);
  if (objc_msgSend(v11, "_LS_BoolForKey:", CFSTR("CPSupportsInstrumentClusterNavigationScene")))
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x8000000000000000);
LABEL_14:

  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    if (registrationInfo->bundleClass == 2)
    {
      v13 = 0;
      -[LSBundleRecordBuilder addItemInfoFlag:](self, "addItemInfoFlag:", _LSGetApplicationFlagsFromPlist((const __CFDictionary *)v6, 0, (LOBYTE(registrationInfo->itemFlags) >> 3) & 1, 0, 0, &v13));
      if (v13)
        -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x2000000000);
    }
  }

}

void __48__LSBundleRecordBuilder_setFlagsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_LS_BoolForKey:", v6))
    objc_msgSend(*(id *)(a1 + 40), "addBundleFlag:", objc_msgSend(v5, "unsignedLongLongValue"));

}

- (void)setRaritiesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LSBundleRecordBuilder _LSPlistRaritiesMap](self, "_LSPlistRaritiesMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke;
  v7[3] = &unk_1E1042198;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __51__LSBundleRecordBuilder_setRaritiesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_LSKeyTypeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "objectForKey:", v14);

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v9 = 0;
      goto LABEL_9;
    }
  }
  else if (!v8)
  {
    goto LABEL_9;
  }
  v10 = *(_QWORD **)(a1 + 32);
  if (!v10[15])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 120);
    *(_QWORD *)(v12 + 120) = v11;

    v10 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v10, "addPlistFlag:", objc_msgSend(v5, "unsignedLongLongValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKey:", v9, v14);
LABEL_9:

}

- (void)setCommonInfoPlistKeysFromDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke;
  v3[3] = &unk_1E10421C0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __62__LSBundleRecordBuilder_setCommonInfoPlistKeysFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (_NSIsNSString() && _LSBundleInfoPlistKeyIsCommon(v10))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    if (!v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 128);
      *(_QWORD *)(v8 + 128) = v7;

      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v10);
  }

}

- (void)parseArchitecturesFromDict:(id)a3
{
  NSDictionary *v4;
  NSDictionary *mobileInstallIDs;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("_LSSliceInfosKey"));
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  mobileInstallIDs = self->_mobileInstallIDs;
  self->_mobileInstallIDs = v4;

}

- (id)iconsDictionaryFromDict:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];
  const __CFString *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIcons"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  v9 = objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("UIPrerenderedIcon"));
  if ((_DWORD)v9)
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 2);
  v10 = objc_opt_class();
  objc_msgSend(v7, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10 || !v11)
  {
    if (!v11)
      goto LABEL_15;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("CFBundleIconName");
    v32[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("CFBundlePrimaryIcon"));

    v15 = objc_msgSend(v13, "copy");
    v7 = (void *)v15;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_14;

  v12 = 0;
LABEL_15:
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIconFiles"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v17 = v16;
      v18 = 0;
      if (!v17)
        goto LABEL_29;
      goto LABEL_23;
    }
    if (_NSIsNSString())
    {
      v18 = v16;
      if (v18)
        goto LABEL_22;
    }
    else
    {
      v22 = objc_opt_class();
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AAD8]);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v22 && v23 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v18 = 0;
      }
      else
      {
        v18 = v24;
        if (v24)
        {
LABEL_22:
          v30 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
LABEL_29:

            goto LABEL_30;
          }
LABEL_23:
          v28 = CFSTR("CFBundlePrimaryIcon");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9, CFSTR("CFBundleIconFiles"), CFSTR("UIPrerenderedIcon"), v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v21 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v21;
          goto LABEL_29;
        }
      }
    }
    v17 = 0;
    goto LABEL_29;
  }
LABEL_30:

  return v7;
}

- (void)parseIconFilenamesFromDict:(id)a3 forPlatform:(unsigned int)a4
{
  NSString *v6;
  NSString *alternatePrimaryIconName;
  NSDictionary *v8;
  NSDictionary *distributorInfo;
  id v10;

  v10 = a3;
  -[LSBundleRecordBuilder iconsDictionaryFromDict:](self, "iconsDictionaryFromDict:");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  alternatePrimaryIconName = self->_alternatePrimaryIconName;
  self->_alternatePrimaryIconName = v6;

  if (_LSIconDictionarySupportsAssetCatalogs(self->_alternatePrimaryIconName))
  {
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 4);
    _LSIconDictionaryGetPrimaryIconName(self->_alternatePrimaryIconName);
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    distributorInfo = self->_distributorInfo;
    self->_distributorInfo = v8;

  }
  if (a4 - 13 <= 0xFFFFFFFD && _LSIconDictionarySupportsAlternateIcons((NSDictionary *)self->_alternatePrimaryIconName))
    -[LSBundleRecordBuilder addIconFlag:](self, "addIconFlag:", 8);

}

- (void)parseDeviceFamilyFromDict:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *activityTypes;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("UIDeviceFamily"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DeviceFamily"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("ProductType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (_NSIsNSArray())
  {
    objc_storeStrong((id *)&self->_activityTypes, v5);
  }
  else if ((_NSIsNSString() & 1) != 0 || _NSIsNSNumber())
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    activityTypes = self->_activityTypes;
    self->_activityTypes = v6;

  }
}

- (void)parseDocumentClaimsFromDict:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSArray *v6;
  BOOL v7;
  NSArray *libraryItems;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0C9AAD0]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  libraryItems = self->_libraryItems;
  self->_libraryItems = v6;

  v9 = self->_libraryItems;
  if (!v9)
    goto LABEL_26;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v11)
    goto LABEL_25;
  v12 = *(_QWORD *)v21;
  v13 = *MEMORY[0x1E0C9AB18];
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (_NSIsNSDictionary())
      {
        v16 = objc_opt_class();
        objc_msgSend(v15, "objectForKey:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v18 = 0;
LABEL_20:

            continue;
          }
        }
        else if (!v17)
        {
          goto LABEL_20;
        }
        if (!objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("Shell")))
        {
          *(_WORD *)&self->_moreFlags |= 0x4000u;

          goto LABEL_25;
        }
        goto LABEL_20;
      }
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
      continue;
    break;
  }
LABEL_25:

LABEL_26:
}

- (void)parseURLClaimsFromDict:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  void *v13;
  NSArray *documentClaims;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("PrivateURLSchemes"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  v9 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AB38]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    if (v7)
      goto LABEL_14;
    v11 = 0;
LABEL_17:
    objc_storeStrong((id *)&self->_documentClaims, v11);
    goto LABEL_18;
  }
  if (!v7)
    goto LABEL_17;
  if (!v11)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_15;
  }
  v12 = (NSArray *)objc_msgSend(v11, "mutableCopy");
LABEL_15:
  v15[0] = *MEMORY[0x1E0C9AB30];
  v15[1] = CFSTR("CFBundleURLIsPrivate");
  v16[0] = v7;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v13);
  documentClaims = self->_documentClaims;
  self->_documentClaims = v12;

LABEL_18:
}

- (BOOL)parseInfoPlist:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *installType;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *maxSystemVersion;
  NSString *v13;
  __int128 v14;
  void *v15;
  char v16;
  __int16 v17;
  int v18;
  LSBundleMoreFlags *p_moreFlags;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  LSBundleMoreFlags *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  char v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  NSArray *iconFileNames;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *sdkVersion;
  uint64_t v47;
  uint64_t v48;
  NSNumber *v49;
  NSNumber *installFailureReason;
  uint64_t baseFlags;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSString *minSystemVersion;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSString *appStoreToolsBuildVersion;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSString *shortDisplayName;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSString *identifier;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSString *displayName;
  uint64_t v72;
  uint64_t v73;
  NSDictionary *v74;
  NSDictionary *localizedShortNames;
  uint64_t v76;
  uint64_t v77;
  NSDictionary *v78;
  NSDictionary *localizedMicrophoneUsageDescription;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  NSString *secondCategoryType;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  NSString *signerOrganization;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  NSString *itemName;
  uint64_t v92;
  uint64_t v93;
  NSNumber *v94;
  NSNumber *storefront;
  uint64_t v96;
  uint64_t v97;
  NSNumber *v98;
  NSNumber *v99;
  uint64_t v100;
  uint64_t v101;
  NSNumber *v102;
  NSNumber *versionID;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  NSString *sourceAppBundleID;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  NSString *shortVersionString;
  uint64_t v112;
  uint64_t v113;
  NSNumber *v114;
  NSNumber *ratingRank;
  uint64_t v116;
  uint64_t v117;
  NSNumber *v118;
  NSNumber *genreID;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  NSString *appVariant;
  NSMutableSet *v124;
  NSMutableSet *counterpartAppBundleIDs;
  NSString *v126;
  NSString *managementDeclarationIdentifier;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  char isKindOfClass;
  uint64_t v135;
  uint64_t v136;
  NSArray *v137;
  NSArray *supportedComplicationFamilies;
  uint64_t v139;
  uint64_t v140;
  NSArray *v141;
  NSArray *machOUUIDs;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  NSString *ratingLabel;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  NSString *genre;
  uint64_t v151;
  uint64_t v152;
  NSURL *v153;
  NSURL *bundleContainerURL;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  NSString *categoryType;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  char v163;
  NSURL *v164;
  NSURL *v165;
  void *v166;
  char v167;
  NSString *v168;
  NSString *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  NSString *execPath;
  uint64_t v174;
  uint64_t v175;
  NSArray *v176;
  NSArray *exportedTypes;
  uint64_t v178;
  uint64_t v179;
  NSNumber *v180;
  NSNumber *staticDiskUsage;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  NSString *libraryPath;
  uint64_t v186;
  uint64_t v187;
  NSArray *v188;
  NSArray *importedTypes;
  uint64_t v190;
  uint64_t v191;
  NSArray *v192;
  NSArray *URLClaims;
  uint64_t v194;
  uint64_t v195;
  NSArray *v196;
  NSArray *queriableSchemes;
  uint64_t v198;
  uint64_t v199;
  NSDictionary *v200;
  NSDictionary *extensionSDK;
  uint64_t v202;
  uint64_t v203;
  NSDictionary *v204;
  NSDictionary *intentDefinitionURLs;
  uint64_t v206;
  uint64_t v207;
  NSArray *v208;
  NSArray *bgPermittedIdentifiers;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  __int16 v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  NSMutableDictionary *v217;
  NSMutableDictionary *commonInfoPlistEntries;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  __int16 v222;
  int v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  NSDictionary *v242;
  NSDictionary *localizedStrings;
  uint64_t v244;
  uint64_t v245;
  NSDictionary *v246;
  NSDictionary *unlocalizedNamesWithContext;
  void *v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  NSArray *v252;
  NSArray *bundlePersonas;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  char v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  char v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  _BOOL4 v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  char v276;
  BOOL v277;
  NSObject *v278;
  NSNumber *v279;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  void *v284;
  void *v285;
  _QWORD v286[4];
  id v287;
  id v288;
  _QWORD v289[5];
  _OWORD v290[2];
  uint8_t buf[16];
  __int128 v292;
  uint64_t v293;

  v293 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_NSIsNSDictionary() & 1) == 0)
    goto LABEL_38;
  v5 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (NSNumber *)v6;
  if (v5 && v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  installType = self->_installType;
  self->_installType = v7;

  if (!self->_installType)
  {
LABEL_38:
    v32 = 0;
    goto LABEL_345;
  }
  v9 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSExecutableSDKVersion"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  maxSystemVersion = self->_maxSystemVersion;
  self->_maxSystemVersion = (NSString *)v11;

  v13 = self->_maxSystemVersion;
  if (v13)
  {
    _LSVersionNumberMakeWithString(buf, v13);
    v14 = v292;
    *(_OWORD *)&self->_supportedGameControllers = *(_OWORD *)buf;
    *(_OWORD *)&self->_sdkVersionNumber._opaque[8] = v14;
  }
  -[LSBundleRecordBuilder setFlagsFromDictionary:](self, "setFlagsFromDictionary:", v4);
  -[LSBundleRecordBuilder setRaritiesFromDictionary:](self, "setRaritiesFromDictionary:", v4);
  -[LSBundleRecordBuilder setCommonInfoPlistKeysFromDictionary:](self, "setCommonInfoPlistKeysFromDictionary:", v4);
  objc_msgSend(v4, "valueForKey:", CFSTR("LSIsSecuredSystemContent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "BOOLValue"))
    v16 = 16;
  else
    v16 = 0;
  *((_BYTE *)&self->_moreFlags + 3) = *((_BYTE *)&self->_moreFlags + 3) & 0xEF | v16;

  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationSupportsAlwaysOnDisplay"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  if (v285 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v285, "BOOLValue"))
      v17 = 512;
    else
      v17 = 0;
    v18 = *(_WORD *)&self->_moreFlags & 0xFDFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFDFF | v17;
    *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v18);
  }
  p_moreFlags = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("UIDefaultsToPrivateAlwaysOnDisplayTreatment")))
    v20 = 1024;
  else
    v20 = 0;
  v21 = *(_WORD *)&self->_moreFlags & 0xFBFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFBFF | v20;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v21);
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("LSRequiresPostProcessing")))
    v22 = 0x2000;
  else
    v22 = 0;
  v23 = *(_WORD *)&self->_moreFlags & 0xDFFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)p_moreFlags & 0xDFFF | v22;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v23);
  v24 = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("NSSupportsLiveActivities")))
    v25 = 2048;
  else
    v25 = 0;
  v26 = *(_WORD *)&self->_moreFlags & 0xF7FF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)v24 = *(_WORD *)&self->_moreFlags & 0xF7FF | v25;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v26);
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("NSSupportsLiveActivitiesFrequentUpdates")))
    v27 = 4096;
  else
    v27 = 0;
  v28 = *(_WORD *)&self->_moreFlags & 0xEFFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)v24 = *(_WORD *)v24 & 0xEFFF | v27;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v28);
  v29 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSIsLinkEnabled"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (!v29 || !v30)
  {
    if (!v30)
      goto LABEL_45;
    goto LABEL_40;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_40:
    if (objc_msgSend(v31, "BOOLValue"))
      v33 = 8;
    else
      v33 = 0;
    *((_BYTE *)&self->_moreFlags + 3) = *((_BYTE *)&self->_moreFlags + 3) & 0xF7 | v33;
  }

LABEL_45:
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSIsLinkEnabled"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "BOOLValue"))
    v35 = 8;
  else
    v35 = 0;
  *((_BYTE *)&self->_moreFlags + 3) = *((_BYTE *)&self->_moreFlags + 3) & 0xF7 | v35;

  v36 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("PurchaserID"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (NSArray *)v37;
  if (v36 && v37 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v38 = 0;
  }
  iconFileNames = self->_iconFileNames;
  self->_iconFileNames = v38;

  self->_minSystemVersionPlatform = _LSGetRawOSTypeForPossibleString((const __CFString *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AAE0]));
  self->_baseFlags = 0;
  v40 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSExecutablePlatformKey"));
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v40 && v41)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
  if (v41)
  {
LABEL_57:
    self->_baseFlags = (LSBundleBaseFlags)objc_msgSend(v42, "unsignedLongLongValue");
LABEL_58:

  }
  v43 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("DTAppStoreToolsBuild"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v43 && v44 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v45 = 0;
  }
  sdkVersion = self->_sdkVersion;
  self->_sdkVersion = (NSString *)v45;

  v47 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (NSNumber *)v48;
  if (v47 && v48 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v49 = 0;
  }
  installFailureReason = self->_installFailureReason;
  self->_installFailureReason = v49;

  baseFlags = self->_baseFlags;
  _LSVersionNumberMakeWithString(v290, self->_maxSystemVersion);
  _LSGetMinimumOSVersionStringAndReferencePlatformForPlatformSDKLinkage(v4, baseFlags, v290, (id *)&self->_version, &self->_platform);
  v52 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSMaximumSystemVersion"));
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v52 && v53 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v54 = 0;
  }
  minSystemVersion = self->_minSystemVersion;
  self->_minSystemVersion = (NSString *)v54;

  v56 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AAF0]);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  if (v56 && v57 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v58 = 0;
  }
  appStoreToolsBuildVersion = self->_appStoreToolsBuildVersion;
  self->_appStoreToolsBuildVersion = (NSString *)v58;

  v60 = objc_opt_class();
  v282 = *MEMORY[0x1E0C9AE88];
  objc_msgSend(v4, "objectForKey:");
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v61;
  if (v60 && v61 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v62 = 0;
  }
  shortDisplayName = self->_shortDisplayName;
  self->_shortDisplayName = (NSString *)v62;

  v64 = objc_opt_class();
  v281 = *MEMORY[0x1E0C9AAC8];
  objc_msgSend(v4, "objectForKey:");
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v65;
  if (v64 && v65 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v66 = 0;
  }
  identifier = self->_identifier;
  self->_identifier = (NSString *)v66;

  v68 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", v282);
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v69;
  if (v68 && v69 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v70 = 0;
  }
  displayName = self->_displayName;
  self->_displayName = (NSString *)v70;

  v72 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSMicrophoneUsageDescription"));
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (NSDictionary *)v73;
  if (v72 && v73 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v74 = 0;
  }
  localizedShortNames = self->_localizedShortNames;
  self->_localizedShortNames = v74;

  v76 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSIdentityUsageDescription"));
  v77 = objc_claimAutoreleasedReturnValue();
  v78 = (NSDictionary *)v77;
  if (v76 && v77 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v78 = 0;
  }
  localizedMicrophoneUsageDescription = self->_localizedMicrophoneUsageDescription;
  self->_localizedMicrophoneUsageDescription = v78;

  v80 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("artistName"));
  v81 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)v81;
  if (v80 && v81 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v82 = 0;
  }
  secondCategoryType = self->_secondCategoryType;
  self->_secondCategoryType = (NSString *)v82;

  v84 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("itemName"));
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v85;
  if (v84 && v85 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v86 = 0;
  }
  signerOrganization = self->_signerOrganization;
  self->_signerOrganization = (NSString *)v86;

  v88 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("s"));
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v89;
  if (v88 && v89 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v90 = 0;
  }
  itemName = self->_itemName;
  self->_itemName = (NSString *)v90;

  v92 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("softwareVersionExternalIdentifier"));
  v93 = objc_claimAutoreleasedReturnValue();
  v94 = (NSNumber *)v93;
  if (v92 && v93 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v94 = 0;
  }
  storefront = self->_storefront;
  self->_storefront = v94;

  if (!self->_storefront)
  {
    v96 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("betaExternalVersionIdentifier"));
    v97 = objc_claimAutoreleasedReturnValue();
    v98 = (NSNumber *)v97;
    if (v96 && v97 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v98 = 0;
    }
    v99 = self->_storefront;
    self->_storefront = v98;

  }
  v100 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("sourceApp"));
  v101 = objc_claimAutoreleasedReturnValue();
  v102 = (NSNumber *)v101;
  if (v100 && v101 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v102 = 0;
  }
  versionID = self->_versionID;
  self->_versionID = v102;

  v104 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("variantID"));
  v105 = objc_claimAutoreleasedReturnValue();
  v106 = (void *)v105;
  if (v104 && v105 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v106 = 0;
  }
  sourceAppBundleID = self->_sourceAppBundleID;
  self->_sourceAppBundleID = (NSString *)v106;

  v108 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSExecutablePath"));
  v109 = objc_claimAutoreleasedReturnValue();
  v110 = (void *)v109;
  if (v108 && v109 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v110 = 0;
  }
  shortVersionString = self->_shortVersionString;
  self->_shortVersionString = (NSString *)v110;

  v112 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("genre"));
  v113 = objc_claimAutoreleasedReturnValue();
  v114 = (NSNumber *)v113;
  if (v112 && v113 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v114 = 0;
  }
  ratingRank = self->_ratingRank;
  self->_ratingRank = v114;

  v116 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("distributorInfo"));
  v117 = objc_claimAutoreleasedReturnValue();
  v118 = (NSNumber *)v117;
  if (v116 && v117 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v118 = 0;
  }
  genreID = self->_genreID;
  self->_genreID = v118;

  v120 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("managementDeclarationIdentifier"));
  v121 = objc_claimAutoreleasedReturnValue();
  v122 = (void *)v121;
  if (v120 && v121 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v122 = 0;
  }
  appVariant = self->_appVariant;
  self->_appVariant = (NSString *)v122;

  v124 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  counterpartAppBundleIDs = self->_counterpartAppBundleIDs;
  self->_counterpartAppBundleIDs = v124;

  v126 = (NSString *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  managementDeclarationIdentifier = self->_managementDeclarationIdentifier;
  self->_managementDeclarationIdentifier = v126;

  v128 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSCounterpartIdentifiers"));
  v129 = objc_claimAutoreleasedReturnValue();
  v283 = (void *)v129;
  v130 = v129;
  if (v128 && v129)
  {
    v130 = v129;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_147:
      v283 = 0;
      goto LABEL_148;
    }
  }
  else if (!v129)
  {
    goto LABEL_147;
  }
  -[NSString addObjectsFromArray:](self->_managementDeclarationIdentifier, "addObjectsFromArray:", v130);
  -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v130);
LABEL_148:
  v131 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSEquivalentBundleIdentifiers"));
  v132 = objc_claimAutoreleasedReturnValue();
  v284 = (void *)v132;
  v133 = (void *)v132;
  if (v131 && v132)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    v133 = v284;
    if ((isKindOfClass & 1) == 0)
    {

LABEL_154:
      v284 = 0;
      goto LABEL_155;
    }
  }
  else if (!v132)
  {
    goto LABEL_154;
  }
  -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v133);
LABEL_155:
  v135 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("label"));
  v136 = objc_claimAutoreleasedReturnValue();
  v137 = (NSArray *)v136;
  if (v135 && v136 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v137 = 0;
  }
  supportedComplicationFamilies = self->_supportedComplicationFamilies;
  self->_supportedComplicationFamilies = v137;

  v139 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("itemId"));
  v140 = objc_claimAutoreleasedReturnValue();
  v141 = (NSArray *)v140;
  if (v139 && v140 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v141 = 0;
  }
  machOUUIDs = self->_machOUUIDs;
  self->_machOUUIDs = v141;

  v143 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("rank"));
  v144 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)v144;
  if (v143 && v144 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v145 = 0;
  }
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = (NSString *)v145;

  v147 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("genreId"));
  v148 = objc_claimAutoreleasedReturnValue();
  v149 = (void *)v148;
  if (v147 && v148 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v149 = 0;
  }
  genre = self->_genre;
  self->_genre = (NSString *)v149;

  v151 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSApplicationCategoryType"));
  v152 = objc_claimAutoreleasedReturnValue();
  v153 = (NSURL *)v152;
  if (v151 && v152 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v153 = 0;
  }
  bundleContainerURL = self->_bundleContainerURL;
  self->_bundleContainerURL = v153;

  v155 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSApplicationSecondaryCategoryType"));
  v156 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v156;
  if (v155 && v156 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v157 = 0;
  }
  categoryType = self->_categoryType;
  self->_categoryType = (NSString *)v157;

  if (!self->_bundleContainerURL && !self->_categoryType)
  {
    v159 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("categories"));
    v160 = objc_claimAutoreleasedReturnValue();
    v161 = (void *)v160;
    if (v159 && v160 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v161 = 0;
    }
    objc_msgSend(v161, "firstObject");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v163 = objc_opt_isKindOfClass();

    if ((v163 & 1) != 0)
    {
      objc_msgSend(v161, "firstObject");
      v164 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v165 = self->_bundleContainerURL;
      self->_bundleContainerURL = v164;

      if ((unint64_t)objc_msgSend(v161, "count") >= 2)
      {
        objc_msgSend(v161, "objectAtIndex:", 1);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v167 = objc_opt_isKindOfClass();

        if ((v167 & 1) != 0)
        {
          objc_msgSend(v161, "objectAtIndex:", 1);
          v168 = (NSString *)objc_claimAutoreleasedReturnValue();
          v169 = self->_categoryType;
          self->_categoryType = v168;

        }
      }
    }

  }
  v170 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("MachOUUIDs"));
  v171 = objc_claimAutoreleasedReturnValue();
  v172 = (void *)v171;
  if (v170 && v171 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v172 = 0;
  }
  execPath = self->_execPath;
  self->_execPath = (NSString *)v172;

  v174 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSApplicationQueriesSchemes"));
  v175 = objc_claimAutoreleasedReturnValue();
  v176 = (NSArray *)v175;
  if (v174 && v175 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v176 = 0;
  }
  exportedTypes = self->_exportedTypes;
  self->_exportedTypes = v176;

  v178 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSBundleLibraryPath"));
  v179 = objc_claimAutoreleasedReturnValue();
  v180 = (NSNumber *)v179;
  if (v178 && v179 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v180 = 0;
  }
  staticDiskUsage = self->_staticDiskUsage;
  self->_staticDiskUsage = v180;

  v182 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSBundleLibraryItems"));
  v183 = objc_claimAutoreleasedReturnValue();
  v184 = (void *)v183;
  if (v182 && v183 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v184 = 0;
  }
  libraryPath = self->_libraryPath;
  self->_libraryPath = (NSString *)v184;

  v186 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("UTExportedTypeDeclarations"));
  v187 = objc_claimAutoreleasedReturnValue();
  v188 = (NSArray *)v187;
  if (v186 && v187 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v188 = 0;
  }
  importedTypes = self->_importedTypes;
  self->_importedTypes = v188;

  v190 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("UTImportedTypeDeclarations"));
  v191 = objc_claimAutoreleasedReturnValue();
  v192 = (NSArray *)v191;
  if (v190 && v191 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v192 = 0;
  }
  URLClaims = self->_URLClaims;
  self->_URLClaims = v192;

  -[LSBundleRecordBuilder parseDocumentClaimsFromDict:](self, "parseDocumentClaimsFromDict:", v4);
  v194 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSBundlePlugins"));
  v195 = objc_claimAutoreleasedReturnValue();
  v196 = (NSArray *)v195;
  if (v194 && v195 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v196 = 0;
  }
  queriableSchemes = self->_queriableSchemes;
  self->_queriableSchemes = v196;

  v198 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSIntentDefinitionURLs"));
  v199 = objc_claimAutoreleasedReturnValue();
  v200 = (NSDictionary *)v199;
  if (v198 && v199 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v200 = 0;
  }
  extensionSDK = self->_extensionSDK;
  self->_extensionSDK = v200;

  v202 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("BGTaskSchedulerPermittedIdentifiers"));
  v203 = objc_claimAutoreleasedReturnValue();
  v204 = (NSDictionary *)v203;
  if (v202 && v203 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v204 = 0;
  }
  intentDefinitionURLs = self->_intentDefinitionURLs;
  self->_intentDefinitionURLs = v204;

  v206 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CARInstrumentClusterURLSchemes"));
  v207 = objc_claimAutoreleasedReturnValue();
  v208 = (NSArray *)v207;
  if (v206 && v207 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v208 = 0;
  }
  bgPermittedIdentifiers = self->_bgPermittedIdentifiers;
  self->_bgPermittedIdentifiers = v208;

  v210 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("GCSupportsControllerUserInteraction"));
  v211 = objc_claimAutoreleasedReturnValue();
  v212 = (void *)v211;
  if (v210 && v211)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_239:

      goto LABEL_240;
    }
LABEL_235:
    if (objc_msgSend(v212, "BOOLValue"))
      v213 = 4;
    else
      v213 = 0;
    v214 = *(_WORD *)&self->_moreFlags & 0xFFFB | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFFB | v213;
    *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v214);
    goto LABEL_239;
  }
  if (v211)
    goto LABEL_235;
LABEL_240:
  v215 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("GCSupportedGameControllers"));
  v216 = objc_claimAutoreleasedReturnValue();
  v217 = (NSMutableDictionary *)v216;
  if (v215 && v216 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v217 = 0;
  }
  commonInfoPlistEntries = self->_commonInfoPlistEntries;
  self->_commonInfoPlistEntries = v217;

  v219 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CoreSpotlightContinuation"));
  v220 = objc_claimAutoreleasedReturnValue();
  v221 = (void *)v220;
  if (v219 && v220)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_253:

      goto LABEL_254;
    }
LABEL_249:
    if (objc_msgSend(v221, "BOOLValue"))
      v222 = 8;
    else
      v222 = 0;
    v223 = *(_WORD *)&self->_moreFlags & 0xFFF7 | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
    *(_WORD *)&self->_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFF7 | v222;
    *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v223);
    goto LABEL_253;
  }
  if (v220)
    goto LABEL_249;
LABEL_254:
  v224 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CoreSpotlightActions"));
  v225 = objc_claimAutoreleasedReturnValue();
  v226 = (void *)v225;
  if (v224 && v225)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_260;
    goto LABEL_259;
  }
  if (v225)
  {
LABEL_259:
    *(_WORD *)&self->_moreFlags |= 0x10u;
LABEL_260:

  }
  v227 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSLocalizedStringsDictionary"));
  v228 = objc_claimAutoreleasedReturnValue();
  v229 = (void *)v228;
  if (v227 && v228)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v229 = 0;
      goto LABEL_282;
    }
  }
  else if (!v228)
  {
    goto LABEL_282;
  }
  v230 = (void *)objc_opt_class();
  v231 = (void *)objc_opt_class();
  if (_LSIsDictionaryWithKeysAndValuesOfClass(v229, v230, v231))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&v292 = 0x2020000000;
    v232 = MEMORY[0x1E0C809B0];
    BYTE8(v292) = 1;
    v289[0] = MEMORY[0x1E0C809B0];
    v289[1] = 3221225472;
    v289[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke;
    v289[3] = &unk_1E10421E8;
    v289[4] = buf;
    objc_msgSend(v229, "enumerateKeysAndObjectsUsingBlock:", v289);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_storeStrong((id *)&self->_localizedIdentityUsageDescription, v229);
      objc_msgSend(v229, "objectForKeyedSubscript:", v281);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = v233;
      if (v233 && objc_msgSend(v233, "count"))
        objc_storeStrong((id *)&self->_carPlayInstrumentClusterURLSchemes, v234);

      objc_msgSend(v229, "objectForKeyedSubscript:", v282);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = v235;
      if (v235 && objc_msgSend(v235, "count"))
        objc_storeStrong((id *)&self->_localizedNames, v236);

      objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("NSMicrophoneUsageDescription"));
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v237;
      if (v237 && objc_msgSend(v237, "count"))
        objc_storeStrong((id *)&self->_microphoneUsageDescription, v238);

      objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("NSIdentityUsageDescription"));
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = v239;
      if (v239 && objc_msgSend(v239, "count"))
        objc_storeStrong((id *)&self->_identityUsageDescription, v240);

      v286[0] = v232;
      v286[1] = 3221225472;
      v286[2] = __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2;
      v286[3] = &unk_1E1042210;
      v241 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v287 = v241;
      v288 = v4;
      _LSBundleDisplayNameContextEnumerate(v286);
      v242 = (NSDictionary *)objc_msgSend(v241, "copy");
      localizedStrings = self->_localizedStrings;
      self->_localizedStrings = v242;

    }
    _Block_object_dispose(buf, 8);
  }
LABEL_282:

  v244 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("bundlePersonas"));
  v245 = objc_claimAutoreleasedReturnValue();
  v246 = (NSDictionary *)v245;
  if (v244 && v245 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v246 = 0;
  }
  unlocalizedNamesWithContext = self->_unlocalizedNamesWithContext;
  self->_unlocalizedNamesWithContext = v246;

  objc_msgSend(v4, "objectForKey:", CFSTR("_LSUsesSystemPersona"));
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = objc_msgSend(v248, "BOOLValue");

  if (v249)
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x100000000000000);
  v250 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSDirectoryClass"));
  v251 = objc_claimAutoreleasedReturnValue();
  v252 = (NSArray *)v251;
  if (v250 && v251 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v252 = 0;
  }
  bundlePersonas = self->_bundlePersonas;
  self->_bundlePersonas = v252;

  -[LSBundleRecordBuilder parseURLClaimsFromDict:](self, "parseURLClaimsFromDict:", v4);
  -[LSBundleRecordBuilder parseIconFilenamesFromDict:forPlatform:](self, "parseIconFilenamesFromDict:forPlatform:", v4, *(_DWORD *)&self->_baseFlags);
  -[LSBundleRecordBuilder parseDeviceFamilyFromDict:](self, "parseDeviceFamilyFromDict:", v4);
  -[LSBundleRecordBuilder parseArchitecturesFromDict:](self, "parseArchitecturesFromDict:", v4);
  v254 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSRequiresGarbageCollection"));
  v255 = objc_claimAutoreleasedReturnValue();
  v256 = (void *)v255;
  if (v254 && v255)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_301:

      goto LABEL_302;
    }
LABEL_297:
    if (objc_msgSend(v256, "BOOLValue"))
      v257 = 2;
    else
      v257 = 0;
    *((_BYTE *)&self->_moreFlags + 3) = *((_BYTE *)&self->_moreFlags + 3) & 0xFD | v257;
    goto LABEL_301;
  }
  if (v255)
    goto LABEL_297;
LABEL_302:
  v258 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("NSBuiltWithThreadSanitizer"));
  v259 = objc_claimAutoreleasedReturnValue();
  v260 = (void *)v259;
  if (v258 && v259)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_311:

      goto LABEL_312;
    }
LABEL_307:
    if (objc_msgSend(v260, "BOOLValue"))
      v261 = 4;
    else
      v261 = 0;
    *((_BYTE *)&self->_moreFlags + 3) = *((_BYTE *)&self->_moreFlags + 3) & 0xFB | v261;
    goto LABEL_311;
  }
  if (v259)
    goto LABEL_307;
LABEL_312:
  v262 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSExecutableFormat"));
  v263 = objc_claimAutoreleasedReturnValue();
  v264 = (void *)v263;
  if (v262 && v263)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v264 = 0;
      goto LABEL_319;
    }
  }
  else if (!v263)
  {
    goto LABEL_319;
  }
  if (objc_msgSend(v264, "isEqualToString:", CFSTR("LSExecutable#!Format")))
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 16);
LABEL_319:
  if (*(_QWORD *)&self->_hfsCreator)
  {
    v265 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AE70]);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    v265 = v266 != 0;

  }
  v267 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSEligibilityInstallPredicate"));
  v268 = objc_claimAutoreleasedReturnValue();
  v269 = (void *)v268;
  if (!v267 || !v268)
  {
    if (!v268)
      goto LABEL_328;
LABEL_327:

LABEL_333:
    -[LSBundleRecordBuilder addPlistFlag:](self, "addPlistFlag:", 0x2000000);
    goto LABEL_334;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_327;

LABEL_328:
  v270 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSEligibilityUninstallPredicate"));
  v271 = objc_claimAutoreleasedReturnValue();
  v272 = (void *)v271;
  if (v270 && v271 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v272 = 0;
  }

  if (v272)
    goto LABEL_333;
LABEL_334:
  v273 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSRequiredFeatureFlags"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = v274;
  if (v273 && v274)
  {
    v276 = objc_opt_isKindOfClass();

    if ((v276 & 1) == 0)
      goto LABEL_340;
    goto LABEL_339;
  }
  v277 = v274 == 0;

  if (!v277)
LABEL_339:
    -[LSBundleRecordBuilder addPlistFlag:](self, "addPlistFlag:", 0x4000000);
LABEL_340:
  if (v265)
  {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 512);
    _LSInstallLog();
    v278 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
    {
      v279 = self->_installType;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v279;
      _os_log_impl(&dword_182882000, v278, OS_LOG_TYPE_DEFAULT, "Placeholder detected - Flagging bundle %@ incomplete", buf, 0xCu);
    }

  }
  v32 = 1;
LABEL_345:

  return v32;
}

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_opt_class();
  v7 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v8, v6, v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __40__LSBundleRecordBuilder_parseInfoPlist___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;

  v6 = *(void **)(a1 + 40);
  v7 = objc_opt_class();
  objc_msgSend(v6, "objectForKey:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (id)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v11;
    }
    else
    {

      v9 = 0;
    }
  }
  v12 = v9;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, a4);

}

- (BOOL)parseInstallationInfo:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *groupContainers;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSURL *v14;
  NSURL *dataContainerURL;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSNumber *v22;
  NSNumber *compatibilityState;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  NSArray *deviceFamily;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSArray *v32;
  NSArray *alternateNames;
  uint64_t v34;
  uint64_t v35;
  NSNumber *v36;
  NSNumber *signatureVersion;
  void *v38;
  NSArray *iconFileNames;
  uint64_t v40;
  uint64_t v41;
  NSArray *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  NSNumber *v46;
  NSNumber *purchaserDSID;
  uint64_t v48;
  uint64_t v49;
  NSNumber *v50;
  NSNumber *downloaderDSID;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSString *appType;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSString *signerIdentity;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSString *codeInfoIdentifier;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSString *vendorName;
  NSObject *v68;
  NSNumber *installType;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  NSArray *parentApplicationIdentifiers;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSString *watchKitVersion;
  uint64_t v78;
  uint64_t v79;
  NSNumber *v80;
  NSNumber *familyID;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSString *complicationPrincipalClass;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  NSArray *v91;
  NSArray *driverExtensionPaths;
  uint64_t v93;
  uint64_t v94;
  NSDictionary *v95;
  NSDictionary *entitlements;
  uint64_t v97;
  uint64_t v98;
  NSDictionary *v99;
  NSDictionary *pluginPlists;
  uint64_t v101;
  uint64_t v102;
  NSDictionary *v103;
  NSDictionary *pluginMIDicts;
  NSNumber *v105;
  NSNumber *itemID;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  NSMutableSet *v112;
  NSMutableSet *equivalentBundleIDs;
  id v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  NSNumber *v121;
  NSNumber *directoryClass;
  LSBundleMoreFlags *p_moreFlags;
  __int16 v124;
  int v125;
  __int16 v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  NSDictionary *v130;
  NSDictionary *stashedAppInfo;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  NSString *applicationManagementDomain;
  uint64_t v136;
  uint64_t v137;
  NSArray *v138;
  NSArray *slices;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  NSString *primaryIconName;
  LSBundleMoreFlags *v144;
  BOOL v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  int v150;
  NSNumber *v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _NSIsNSDictionary();
  if ((v5 & 1) == 0)
    goto LABEL_160;
  v6 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("Entitlements"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSDictionary *)v7;
  if (v6 && v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  groupContainers = self->_groupContainers;
  self->_groupContainers = v8;

  v10 = self->_groupContainers;
  if (v10 && (*(_WORD *)&self->_moreFlags & 0x8000) == 0)
    -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](v10, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, &__block_literal_global_343);
  v11 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("BundleContainer"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 && v12)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v12)
  {
LABEL_14:
    v14 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v13, 1);
    dataContainerURL = self->_dataContainerURL;
    self->_dataContainerURL = v14;

LABEL_15:
  }
  -[LSBundleRecordBuilder setFlagsFromDictionary:](self, "setFlagsFromDictionary:", v4);
  -[LSBundleRecordBuilder setRaritiesFromDictionary:](self, "setRaritiesFromDictionary:", v4);
  v16 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CompatibilityState"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16 && v17 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v18 = 0;
  }
  v19 = *(void **)&self->_containerized;
  *(_QWORD *)&self->_containerized = v18;

  v20 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("PlaceholderFailureReason"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (NSNumber *)v21;
  if (v20 && v21 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v22 = 0;
  }
  compatibilityState = self->_compatibilityState;
  self->_compatibilityState = v22;

  v24 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSInstallType"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (NSArray *)v25;
  if (v24 && v25 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v26 = 0;
  }
  deviceFamily = self->_deviceFamily;
  self->_deviceFamily = v26;

  v28 = objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("IsContainerized"));
  self->_sdkVersionNumber._opaque[24] = v28;
  if (v28)
  {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x4000000000);
    v29 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("Container"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v29 && v30)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
    if (v30)
    {
LABEL_34:
      v32 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v31, 1);
      alternateNames = self->_alternateNames;
      self->_alternateNames = v32;

LABEL_35:
    }
  }
  v34 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("StashedVersionInfo"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (NSNumber *)v35;
  if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v36 = 0;
  }
  signatureVersion = self->_signatureVersion;
  self->_signatureVersion = v36;

  objc_msgSend(v4, "objectForKey:", CFSTR("ApplicationDSID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    iconFileNames = self->_iconFileNames;
    if (iconFileNames)
    {
      self->_iconFileNames = 0;

    }
    v40 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("ApplicationDSID"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (NSArray *)v41;
    if (v40 && v41 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v42 = 0;
    }
    v43 = self->_iconFileNames;
    self->_iconFileNames = v42;

  }
  v44 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("DownloaderDSID"));
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (NSNumber *)v45;
  if (v44 && v45 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v46 = 0;
  }
  purchaserDSID = self->_purchaserDSID;
  self->_purchaserDSID = v46;

  v48 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("FamilyID"));
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (NSNumber *)v49;
  if (v48 && v49 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v50 = 0;
  }
  downloaderDSID = self->_downloaderDSID;
  self->_downloaderDSID = v50;

  v52 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("SignerIdentity"));
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v52 && v53 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v54 = 0;
  }
  appType = self->_appType;
  self->_appType = (NSString *)v54;

  v56 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("CodeInfoIdentifier"));
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  if (v56 && v57 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v58 = 0;
  }
  signerIdentity = self->_signerIdentity;
  self->_signerIdentity = (NSString *)v58;

  v60 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("SignerOrganization"));
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v61;
  if (v60 && v61 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v62 = 0;
  }
  codeInfoIdentifier = self->_codeInfoIdentifier;
  self->_codeInfoIdentifier = (NSString *)v62;

  v64 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("ApplicationType"));
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v65;
  if (v64 && v65 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v66 = 0;
  }
  vendorName = self->_vendorName;
  self->_vendorName = (NSString *)v66;

  if (-[NSString isEqualToString:](self->_vendorName, "isEqualToString:", CFSTR("SystemAppPlaceholder")))
  {
    self->_bundleClass = 14;
    _LSRegistrationLog();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      installType = self->_installType;
      v150 = 138412290;
      v151 = installType;
      _os_log_impl(&dword_182882000, v68, OS_LOG_TYPE_DEBUG, "Setting LSBundleClassSystemPlaceholder for app %@", (uint8_t *)&v150, 0xCu);
    }

  }
  v70 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("WatchKitVersion"));
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (NSArray *)v71;
  if (v70 && v71 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v72 = 0;
  }
  parentApplicationIdentifiers = self->_parentApplicationIdentifiers;
  self->_parentApplicationIdentifiers = v72;

  v74 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("ComplicationPrincipalClass"));
  v75 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v75;
  if (v74 && v75 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v76 = 0;
  }
  watchKitVersion = self->_watchKitVersion;
  self->_watchKitVersion = (NSString *)v76;

  v78 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("StaticDiskUsage"));
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (NSNumber *)v79;
  if (v78 && v79 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v80 = 0;
  }
  familyID = self->_familyID;
  self->_familyID = v80;

  v82 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("SupportedComplicationFamilies"));
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v83;
  if (v82 && v83 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v84 = 0;
  }
  complicationPrincipalClass = self->_complicationPrincipalClass;
  self->_complicationPrincipalClass = (NSString *)v84;

  v86 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LSCounterpartIdentifiers"));
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v87;
  if (v86 && v87)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v88 = 0;
      goto LABEL_98;
    }
  }
  else if (!v87)
  {
    goto LABEL_98;
  }
  -[NSString addObjectsFromArray:](self->_managementDeclarationIdentifier, "addObjectsFromArray:", v88);
  -[NSMutableSet addObjectsFromArray:](self->_counterpartAppBundleIDs, "addObjectsFromArray:", v88);
LABEL_98:
  v89 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("GroupContainers"));
  v90 = objc_claimAutoreleasedReturnValue();
  v91 = (NSArray *)v90;
  if (v89 && v90 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v91 = 0;
  }
  driverExtensionPaths = self->_driverExtensionPaths;
  self->_driverExtensionPaths = v91;

  v93 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("EnvironmentVariables"));
  v94 = objc_claimAutoreleasedReturnValue();
  v95 = (NSDictionary *)v94;
  if (v93 && v94 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v95 = 0;
  }
  entitlements = self->_entitlements;
  self->_entitlements = v95;

  v97 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LSBundlePlugins"));
  v98 = objc_claimAutoreleasedReturnValue();
  v99 = (NSDictionary *)v98;
  if (v97 && v98 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v99 = 0;
  }
  pluginPlists = self->_pluginPlists;
  self->_pluginPlists = v99;

  v101 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("DriverKitExtensionPaths"));
  v102 = objc_claimAutoreleasedReturnValue();
  v103 = (NSDictionary *)v102;
  if (v101 && v102 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v103 = 0;
  }
  pluginMIDicts = self->_pluginMIDicts;
  self->_pluginMIDicts = v103;

  _LSGetTeamIdentifierFromInstallDict(v4);
  v105 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  self->_itemID = v105;

  v107 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("IsOnDemandInstallCapable"));
  v108 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v108;
  if (v107 && v108 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v109 = 0;
  }
  if (objc_msgSend(v109, "BOOLValue"))
  {
    -[LSBundleRecordBuilder addBundleFlag:](self, "addBundleFlag:", 0x1000000000000000);
    v110 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("ParentIdentifiers"));
    v111 = objc_claimAutoreleasedReturnValue();
    v112 = (NSMutableSet *)v111;
    if (v110 && v111 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v112 = 0;
    }
    equivalentBundleIDs = self->_equivalentBundleIDs;
    self->_equivalentBundleIDs = v112;

  }
  -[LSBundleRecordBuilder setProfileValidationState:](self, "setProfileValidationState:", _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)v4));
  v114 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v115 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("UniqueInstallID"));
  v116 = objc_claimAutoreleasedReturnValue();
  v117 = (void *)v116;
  if (v115 && v116 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v117 = 0;
  }
  objc_msgSend(v114, "setObject:forKeyedSubscript:", v117, CFSTR("UniqueInstallID"));

  v118 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("InstallSessionID"));
  v119 = objc_claimAutoreleasedReturnValue();
  v120 = (void *)v119;
  if (v118 && v119 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v120 = 0;
  }
  objc_msgSend(v114, "setObject:forKeyedSubscript:", v120, CFSTR("InstallSessionID"));

  if (objc_msgSend(v114, "count"))
  {
    v121 = (NSNumber *)objc_msgSend(v114, "copy");
    directoryClass = self->_directoryClass;
    self->_directoryClass = v121;

  }
  p_moreFlags = &self->_moreFlags;
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("CodeSigningInfoNotAuthoritative")))
    v124 = 32;
  else
    v124 = 0;
  v125 = *(_WORD *)&self->_moreFlags & 0xFFDF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFFDF | v124;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v125);
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("IsSwiftPlaygroundsApp")))
    v126 = 256;
  else
    v126 = 0;
  v127 = *(_WORD *)&self->_moreFlags & 0xFEFF | (*((unsigned __int8 *)&self->_moreFlags + 2) << 16);
  *(_WORD *)p_moreFlags = *(_WORD *)&self->_moreFlags & 0xFEFF | v126;
  *((_BYTE *)&self->_moreFlags + 2) = BYTE2(v127);
  v128 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("AppManagementDomain"));
  v129 = objc_claimAutoreleasedReturnValue();
  v130 = (NSDictionary *)v129;
  if (v128 && v129 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v130 = 0;
  }
  stashedAppInfo = self->_stashedAppInfo;
  self->_stashedAppInfo = v130;

  v132 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("LinkedParentBundleID"));
  v133 = objc_claimAutoreleasedReturnValue();
  v134 = (void *)v133;
  if (v132 && v133 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v134 = 0;
  }
  applicationManagementDomain = self->_applicationManagementDomain;
  self->_applicationManagementDomain = (NSString *)v134;

  v136 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("SignatureVersion"));
  v137 = objc_claimAutoreleasedReturnValue();
  v138 = (NSArray *)v137;
  if (v136 && v137 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v138 = 0;
  }
  slices = self->_slices;
  self->_slices = v138;

  v140 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("AlternateIconName"));
  v141 = objc_claimAutoreleasedReturnValue();
  v142 = (void *)v141;
  if (v140 && v141 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v142 = 0;
  }
  primaryIconName = self->_primaryIconName;
  self->_primaryIconName = (NSString *)v142;

  self->_sdkVersionNumber._opaque[25] = objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("IsWebNotificationBundle"));
  v144 = &self->_moreFlags;
  v145 = objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("IsEligibleForWatchAppInstall")) != 0;
  v146 = (*(_WORD *)v144 | (*((unsigned __int8 *)v144 + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)v144 = *(_WORD *)v144;
  *((_BYTE *)v144 + 2) = BYTE2(v146) | v145;
  if (objc_msgSend(v4, "_LS_BoolForKey:", CFSTR("IsMarketplace")))
    v147 = 0x40000;
  else
    v147 = 0;
  v148 = (*(_WORD *)v144 | (*((unsigned __int8 *)v144 + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)v144 = *(_WORD *)v144;
  *((_BYTE *)v144 + 2) = (v148 | v147) >> 16;

LABEL_160:
  return v5;
}

- (void)parseActivityTypesFromDictionary:(id)a3
{
  const __CFDictionary *v4;
  NSDictionary *groupContainers;
  uint64_t v6;
  uint64_t v7;
  __CFString *itemID;
  BOOL v9;
  NSNumber *installType;
  char isKindOfClass;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  CFArrayRef v15;
  CFArrayRef v16;
  NSDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;

  v4 = (const __CFDictionary *)a3;
  v21 = 0;
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    v6 = objc_opt_class();
    -[NSDictionary objectForKey:](groupContainers, "objectForKey:", CFSTR("useractivity-team-identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    itemID = (__CFString *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      if (v7)
      {
LABEL_12:
        v21 = itemID;
LABEL_19:
        installType = self->_installType;
        goto LABEL_20;
      }
    }
    else
    {
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        goto LABEL_12;

    }
    v12 = self->_groupContainers;
    v13 = objc_opt_class();
    -[NSDictionary objectForKey:](v12, "objectForKey:", CFSTR("com.apple.developer.team-identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    itemID = (__CFString *)v14;
    if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      itemID = 0;
    }
    v21 = itemID;
    if (itemID)
      goto LABEL_19;
    v17 = self->_groupContainers;
    v18 = objc_opt_class();
    -[NSDictionary objectForKey:](v17, "objectForKey:", CFSTR("application-identifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18 && v19)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v20 = 0;
        goto LABEL_30;
      }
    }
    else if (!v19)
    {
      goto LABEL_30;
    }
    _LSSplitApplicationIdentifier(v20, (void **)&v21, 0);
LABEL_30:

    itemID = v21;
    installType = self->_installType;
    if (v21)
      goto LABEL_20;
    goto LABEL_10;
  }
  installType = self->_installType;
LABEL_10:
  itemID = (__CFString *)self->_itemID;
LABEL_20:
  v15 = _LSCopyActivityTypesClaimedHashedAdvertisingStrings((uint64_t)installType, itemID, v4, (const __CFDictionary *)self->_groupContainers);
  v16 = v15;
  if (v15 && -[__CFArray count](v15, "count"))
    objc_storeStrong((id *)&self->_teamID, v16);

}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(id)a3
{
  void *v4;
  NSDictionary *groupContainers;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *sandboxEnvironmentVariables;
  void *context;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  context = (void *)MEMORY[0x186DAE7A0]();
  v4 = (void *)objc_opt_new();
  groupContainers = self->_groupContainers;
  if (groupContainers)
  {
    -[NSDictionary objectForKey:](groupContainers, "objectForKey:", CFSTR("com.apple.private.coreservices.definesExtensionPoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(self->_inode) = 1;
      v7 = objc_opt_class();
      objc_msgSend(v26, "objectForKey:", CFSTR("NSExtensionSDK"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }
      objc_msgSend(v4, "addEntriesFromDictionary:", v9);

    }
    else
    {
      LOBYTE(self->_inode) = 0;
    }
  }
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsUnentitledExtensionPointDeclaration"))
  {
    v10 = objc_opt_class();
    objc_msgSend(v26, "objectForKey:", CFSTR("_LSBundleExtensionPoints"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v12 = 0;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _LSExtensionsLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = (objc_class *)objc_opt_class();
              NSStringFromClass(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[LSBundleRecordBuilder parseNSExtensionSDKDefinitionsFromDictionary:].cold.1(v22, buf, v20);
            }

            goto LABEL_30;
          }
          _LSExtensionsLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v17;
            _os_log_impl(&dword_182882000, v18, OS_LOG_TYPE_DEFAULT, "Registering extension point definition: %@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v4, "addEntriesFromDictionary:", v19);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_30:

  }
  if (objc_msgSend(v4, "count"))
  {
    v23 = (NSDictionary *)objc_msgSend(v4, "copy");
    sandboxEnvironmentVariables = self->_sandboxEnvironmentVariables;
    self->_sandboxEnvironmentVariables = v23;

  }
  objc_autoreleasePoolPop(context);

}

- (LSBundleData)buildBundleData:(SEL)a3 error:(id)a4
{
  id v7;
  unsigned __int8 retries;
  NSData *bundleAlias;
  unsigned int v10;
  int v11;
  LSRegistrationInfo *registrationInfo;
  CFAbsoluteTime Current;
  CFAbsoluteTime v14;
  unsigned int minSystemVersionPlatform;
  void *v16;
  unsigned int *v17;
  NSObject *v18;
  unsigned int *installType;
  NSNumber *compatibilityState;
  unsigned int *v21;
  NSObject *v22;
  unsigned int *v23;
  id v24;
  NSArray *alternateNames;
  NSURL *dataContainerURL;
  unsigned int v27;
  NSNumber *installFailureReason;
  __int128 *v29;
  NSString *appStoreToolsBuildVersion;
  __int128 v31;
  NSString *version;
  NSString *minSystemVersion;
  __int128 v34;
  NSArray *deviceFamily;
  unsigned int previousInstallType;
  NSNumber *purchaserDSID;
  NSArray *iconFileNames;
  NSNumber *downloaderDSID;
  NSString *ratingLabel;
  NSString *genre;
  NSArray *machOUUIDs;
  NSNumber *familyID;
  NSString *itemName;
  NSNumber *storefront;
  NSString *vendorName;
  int StringForCFString;
  const __CFString *v48;
  NSString *managementDeclarationIdentifier;
  void *v50;
  NSMutableSet *counterpartAppBundleIDs;
  void *v52;
  NSMutableSet *equivalentBundleIDs;
  void *v54;
  NSDictionary *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  unsigned int v62;
  std::vector<unsigned int>::pointer end;
  unsigned int *v64;
  std::vector<unsigned int>::pointer begin;
  int64_t v66;
  unint64_t v67;
  int64_t v68;
  unint64_t v69;
  char *v70;
  unsigned int *v71;
  unsigned int v72;
  unsigned int v73;
  NSObject *v74;
  uint64_t carPlayInstrumentClusterURLSchemes;
  uint64_t appContainerAlias;
  NSArray *bundlePersonas;
  unsigned __int8 v78;
  __CFString *v79;
  NSArray *activityTypes;
  NSArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  signed int v86;
  unsigned int v87;
  std::vector<unsigned int>::pointer v88;
  unsigned int *v89;
  std::vector<unsigned int>::pointer v90;
  int64_t v91;
  unint64_t v92;
  int64_t v93;
  unint64_t v94;
  char *v95;
  unsigned int *v96;
  unsigned int v97;
  int v98;
  NSString *execPath;
  NSDictionary *iconsDict;
  unsigned int StringArray;
  id v102;
  void *v103;
  void *v104;
  NSMutableDictionary *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t k;
  unsigned int v109;
  unsigned int v110;
  std::vector<unsigned int>::pointer v111;
  unsigned int *v112;
  std::vector<unsigned int>::pointer v113;
  int64_t v114;
  unint64_t v115;
  int64_t v116;
  unint64_t v117;
  char *v118;
  unsigned int *v119;
  unsigned int v120;
  unsigned int *v121;
  LSBundleData *v122;
  LSBundleData *v123;
  NSString *libraryPath;
  unsigned int v125;
  LSBundleRecordBuilder *v126;
  NSArray *importedTypes;
  unsigned int v128;
  NSArray *v129;
  NSArray *URLClaims;
  NSArray *documentClaims;
  unsigned int v132;
  NSArray *v133;
  NSArray *libraryItems;
  NSArray *queriableSchemes;
  unsigned int v136;
  NSDictionary *sandboxEnvironmentVariables;
  unsigned int v138;
  NSDictionary *pluginMIDicts;
  LSBundleRecordBuilder *v140;
  NSNumber *v141;
  char v142;
  NSString *v143;
  BOOL v144;
  BOOL v145;
  BOOL v146;
  BOOL v147;
  _BOOL4 v148;
  NSString *v149;
  NSNumber *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const __CFString *itemID;
  LSBundleRecordBuilder *v156;
  uint64_t v157;
  NSObject *v158;
  unsigned int *v159;
  NSString *teamID;
  unsigned int v161;
  LSBundleRecordBuilder *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t m;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t n;
  void *v175;
  NSDictionary *groupContainers;
  void *v177;
  BOOL v178;
  void *v179;
  BOOL v180;
  LSRegistrationInfo *v181;
  unint64_t bundleFlags;
  unsigned __int16 *v183;
  unsigned int itemFlags;
  char v185;
  int v186;
  unsigned __int16 *v187;
  int v188;
  void *v189;
  int v190;
  void *v191;
  int v192;
  LSBundleData *result;
  int v195;
  unsigned int v196;
  id v197;
  id v198;
  id v199;
  LSBundleData *v200;
  int obj;
  NSArray *obja;
  LSBundleRecordBuilder *v203;
  void *v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _QWORD v213[5];
  id v214;
  std::vector<unsigned int> *p_buf;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  id v228;
  id v229;
  id v230;
  _BYTE v231[128];
  _BYTE v232[128];
  std::vector<unsigned int> buf;
  void *(*v234)(uint64_t, uint64_t);
  uint64_t (*v235)();
  const char *v236;
  _BYTE v237[560];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[12];
  __int16 v241;
  uint64_t v242;
  _BYTE v243[128];
  _OWORD v244[2];
  _OWORD v245[2];
  _QWORD v246[4];
  _QWORD v247[7];

  v247[4] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  bzero(retstr, 0x230uLL);
  retries = self->_retries;
  LOBYTE(retstr->activityTypes) = 11;
  BYTE1(retstr->activityTypes) = retries;
  retstr->_clas = self->_bundleClass;
  v203 = self;
  v204 = v7;
  bundleAlias = self->_bundleAlias;
  v230 = 0;
  obj = _LSAliasAdd(v7, bundleAlias, &v230);
  v198 = v230;
  v10 = obj;
  if (!obj)
  {
    v11 = _LSGetOSStatusFromNSError(v198);
    v10 = 0;
    if (v11)
    {
      v24 = v198;
LABEL_152:
      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v11, (uint64_t)"-[LSBundleRecordBuilder buildBundleData:error:]", 2119, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_308;
    }
  }
  retstr->base.bookmark = v10;
  registrationInfo = self->_registrationInfo;
  if (registrationInfo)
  {
    retstr->base.container = registrationInfo->containerUnit;
    _LSBundleDataSetModTime((uint64_t)retstr, (int)registrationInfo->contentModDate);
  }
  else
  {
    retstr->base.container = 0;
  }
  Current = CFAbsoluteTimeGetCurrent();
  _LSBundleDataSetRegTime((uint64_t)retstr, (int)Current);
  v14 = CFAbsoluteTimeGetCurrent();
  minSystemVersionPlatform = self->_minSystemVersionPlatform;
  retstr->sandboxEnvironmentVariables = (int)v14;
  *(_DWORD *)&retstr->_iconFlags = minSystemVersionPlatform;
  retstr->base.platform = self->_baseFlags;
  v16 = *(void **)&self->_containerized;
  v200 = retstr;
  if (v16)
  {
    v17 = (unsigned int *)objc_msgSend(v16, "unsignedLongLongValue");
    retstr->sequenceNumber = (unint64_t)v17;
    if (v17)
    {
      _LSRegistrationLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        installType = (unsigned int *)v203->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = installType;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v17;
        _os_log_impl(&dword_182882000, v18, OS_LOG_TYPE_DEBUG, "Registering app %@ with compatibility state %llu", (uint8_t *)&buf, 0x16u);
      }

    }
  }
  compatibilityState = v203->_compatibilityState;
  if (compatibilityState)
  {
    v21 = -[NSNumber unsignedLongLongValue](compatibilityState, "unsignedLongLongValue");
    *(_QWORD *)&retstr->shortVersionString = v21;
    if (v21)
    {
      _LSRegistrationLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (unsigned int *)v203->_installType;
        LODWORD(buf.__begin_) = 138412546;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = v23;
        WORD2(buf.__end_) = 2048;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__end_ + 6) = v21;
        _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_ERROR, "Registering app %@ with install failure reason %llu", (uint8_t *)&buf, 0x16u);
      }

    }
  }
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0)
  {
    v196 = 0;
    v24 = v198;
  }
  else
  {
    alternateNames = v203->_alternateNames;
    v24 = v198;
    if (alternateNames)
    {
      v229 = v198;
      v196 = _LSAliasAddURL(v7, alternateNames, &v229);
      v24 = v229;

      if (!v196)
      {
        v11 = _LSGetOSStatusFromNSError(v24);
        v196 = 0;
        v195 = 0;
        if (v11)
          goto LABEL_146;
      }
    }
    else
    {
      v196 = 0;
    }
  }
  retstr->base.dataContainerAlias = v196;
  dataContainerURL = v203->_dataContainerURL;
  if (dataContainerURL)
  {
    v228 = v24;
    v27 = _LSAliasAddURL(v7, dataContainerURL, &v228);
    v199 = v228;

    if (!v27)
    {
      v11 = _LSGetOSStatusFromNSError(v199);
      v27 = 0;
      if (v11)
      {
        v195 = 0;
        goto LABEL_145;
      }
    }
  }
  else
  {
    v27 = 0;
    v199 = v24;
  }
  v195 = v27;
  retstr->extensionPoints = v27;
  installFailureReason = v203->_installFailureReason;
  if (installFailureReason)
  {
    v29 = (__int128 *)v247;
    _LSVersionNumberMakeWithString(v247, installFailureReason);
  }
  else
  {
    appStoreToolsBuildVersion = v203->_appStoreToolsBuildVersion;
    if (appStoreToolsBuildVersion)
    {
      v29 = (__int128 *)v246;
      _LSVersionNumberMakeWithString(v246, appStoreToolsBuildVersion);
    }
    else
    {
      v29 = &kLSVersionNumberNull;
    }
  }
  v31 = v29[1];
  *(_OWORD *)retstr->base.version._opaque = *v29;
  *(_OWORD *)&retstr->base.version._opaque[16] = v31;
  version = v203->_version;
  if (version)
  {
    _LSVersionNumberMakeWithString(v245, version);
    *(_OWORD *)&retstr->_mtime = v245[0];
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = v245[1];
  }
  else
  {
    *(_OWORD *)&retstr->_mtime = kLSVersionNumberNull;
    *(_OWORD *)&retstr->_minSystemVersion._opaque[8] = *(_OWORD *)algn_1829FAD90;
  }
  retstr->_hfsType = v203->_platform;
  minSystemVersion = v203->_minSystemVersion;
  if (minSystemVersion)
  {
    _LSVersionNumberMakeWithString(v244, minSystemVersion);
    *(_OWORD *)&retstr->_minSystemVersion._opaque[24] = v244[0];
    *(_OWORD *)&retstr->_maxSystemVersion._opaque[8] = v244[1];
  }
  else
  {
    *(_OWORD *)&retstr->_minSystemVersion._opaque[24] = kLSVersionNumberNull;
    *(_OWORD *)&retstr->_maxSystemVersion._opaque[8] = *(_OWORD *)algn_1829FAD90;
  }
  v34 = *(_OWORD *)&v203->_sdkVersionNumber._opaque[8];
  *(_OWORD *)retstr->base.execSDKVersion._opaque = *(_OWORD *)&v203->_supportedGameControllers;
  *(_OWORD *)&retstr->base.execSDKVersion._opaque[16] = v34;
  *(_DWORD *)&retstr->_maxSystemVersion._opaque[24] = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_sdkVersion, 0);
  deviceFamily = v203->_deviceFamily;
  if (deviceFamily && -[NSArray unsignedLongLongValue](deviceFamily, "unsignedLongLongValue"))
  {
    previousInstallType = -[NSArray unsignedLongLongValue](v203->_deviceFamily, "unsignedLongLongValue");
  }
  else
  {
    previousInstallType = v203->_previousInstallType;
    if (!previousInstallType)
      goto LABEL_44;
  }
  retstr->bundleVersion = previousInstallType;
LABEL_44:
  *(_QWORD *)&retstr->_maxSystemVersion._opaque[28] = v203->_sequenceNumber;
  purchaserDSID = v203->_purchaserDSID;
  if (purchaserDSID)
    retstr->purchaserDSID = -[NSNumber unsignedLongLongValue](purchaserDSID, "unsignedLongLongValue");
  iconFileNames = v203->_iconFileNames;
  if (iconFileNames)
    retstr->staticDiskUsage = -[NSArray unsignedLongLongValue](iconFileNames, "unsignedLongLongValue");
  downloaderDSID = v203->_downloaderDSID;
  if (downloaderDSID)
    retstr->downloaderDSID = -[NSNumber unsignedLongLongValue](downloaderDSID, "unsignedLongLongValue");
  ratingLabel = v203->_ratingLabel;
  if (ratingLabel)
    *(_QWORD *)&retstr->sourceAppBundleID = -[NSString unsignedLongLongValue](ratingLabel, "unsignedLongLongValue");
  genre = v203->_genre;
  if (genre)
    *(_QWORD *)(&retstr->managementDeclarationIdentifier + 1) = -[NSString unsignedLongLongValue](genre, "unsignedLongLongValue");
  machOUUIDs = v203->_machOUUIDs;
  if (machOUUIDs)
    retstr->compatibilityState = -[NSArray unsignedLongLongValue](machOUUIDs, "unsignedLongLongValue");
  familyID = v203->_familyID;
  if (familyID)
    *(_QWORD *)&retstr->vendorName = -[NSNumber unsignedLongLongValue](familyID, "unsignedLongLongValue");
  itemName = v203->_itemName;
  if (itemName)
    *(unint64_t *)((char *)&retstr->familyID + 4) = -[NSString unsignedLongLongValue](itemName, "unsignedLongLongValue");
  storefront = v203->_storefront;
  if (storefront)
    *(_QWORD *)(&retstr->itemName + 1) = -[NSNumber unsignedLongLongValue](storefront, "unsignedLongLongValue");
  HIDWORD(retstr->storefront) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_versionID, 0);
  HIDWORD(retstr->itemID) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_installType, 1);
  retstr->base.exactIdentifier = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_installType, 0);
  retstr->base.bundleName = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_shortDisplayName, 0);
  retstr->base.execPath = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_shortVersionString, 0);
  retstr->base.displayName = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_identifier, 0);
  retstr->secondaryCategoryType = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_installFailureReason, 0);
  retstr->filename = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_appStoreToolsBuildVersion, 0);
  LODWORD(retstr->installFailureReason) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_secondCategoryType, 0);
  vendorName = v203->_vendorName;
  if (vendorName)
  {
    if (-[NSString isEqualToString:](vendorName, "isEqualToString:", CFSTR("CoreServices")))
    {
      StringForCFString = _LSDatabaseCreateStringForCFString(v204, CFSTR("Hidden"), 0);
      goto LABEL_68;
    }
    v48 = (const __CFString *)v203->_vendorName;
  }
  else
  {
    v48 = 0;
  }
  StringForCFString = _LSDatabaseCreateStringForCFString(v204, v48, 0);
LABEL_68:
  HIDWORD(retstr->installFailureReason) = StringForCFString;
  LODWORD(retstr->familyID) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_signerOrganization, 0);
  LODWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_sourceAppBundleID, 0);
  HIDWORD(retstr->versionIdentifier) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_appVariant, 0);
  managementDeclarationIdentifier = v203->_managementDeclarationIdentifier;
  if (managementDeclarationIdentifier)
  {
    -[NSString allObjects](managementDeclarationIdentifier, "allObjects");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->deviceFamilies = _LSDatabaseCreateStringArray(v204, v50, 0, 0);

  }
  counterpartAppBundleIDs = v203->_counterpartAppBundleIDs;
  if (counterpartAppBundleIDs)
  {
    -[NSMutableSet allObjects](counterpartAppBundleIDs, "allObjects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->identifier = _LSDatabaseCreateStringArray(v204, v52, 0, 0);

  }
  equivalentBundleIDs = v203->_equivalentBundleIDs;
  if (equivalentBundleIDs)
    *(_DWORD *)&retstr->revision = _LSDatabaseCreateStringArray(v204, equivalentBundleIDs, 0, 0);
  if (-[NSDictionary count](v203->_unlocalizedNamesWithContext, "count"))
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](v203->_unlocalizedNamesWithContext, "count"));
    memset(&buf, 0, sizeof(buf));
    std::vector<unsigned int>::reserve(&buf, -[NSDictionary count](v203->_unlocalizedNamesWithContext, "count"));
    v226 = 0u;
    v227 = 0u;
    v224 = 0u;
    v225 = 0u;
    v55 = v203->_unlocalizedNamesWithContext;
    v56 = -[NSDictionary countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v224, v243, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v225;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v225 != v57)
            objc_enumerationMutation(v55);
          v59 = *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * i);
          -[_LSDatabase store](v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v60);

          v61 = -[_LSPersonaWithAttributes personaType](v59);
          v62 = v61;
          end = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            begin = buf.__begin_;
            v66 = buf.__end_ - buf.__begin_;
            v67 = v66 + 1;
            if ((unint64_t)(v66 + 1) >> 62)
              abort();
            v68 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v67)
              v67 = v68 >> 1;
            if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL)
              v69 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v69 = v67;
            if (v69)
            {
              v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v69);
              end = buf.__end_;
              begin = buf.__begin_;
            }
            else
            {
              v70 = 0;
            }
            v71 = (unsigned int *)&v70[4 * v66];
            *v71 = v62;
            v64 = v71 + 1;
            while (end != begin)
            {
              v72 = *--end;
              *--v71 = v72;
            }
            buf.__begin_ = v71;
            buf.__end_ = v64;
            buf.__end_cap_.__value_ = (unsigned int *)&v70[4 * v69];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *buf.__end_ = v61;
            v64 = end + 1;
          }
          buf.__end_ = v64;
        }
        v56 = -[NSDictionary countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v224, v243, 16);
      }
      while (v56);
    }

    retstr->carPlayInstrumentClusterURLSchemes = _LSDatabaseCreateStringArray(v204, v54, 0, 0);
    v73 = _CSArrayCreate();
    retstr->appContainerAlias = v73;
    if (!retstr->carPlayInstrumentClusterURLSchemes || !v73)
    {
      _LSRegistrationLog();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        carPlayInstrumentClusterURLSchemes = retstr->carPlayInstrumentClusterURLSchemes;
        appContainerAlias = retstr->appContainerAlias;
        *(_DWORD *)v240 = 134218240;
        *(_QWORD *)&v240[4] = carPlayInstrumentClusterURLSchemes;
        v241 = 2048;
        v242 = appContainerAlias;
        _os_log_impl(&dword_182882000, v74, OS_LOG_TYPE_ERROR, "failed to allocate personas (%llx) or persona types (%llx) CSArray", v240, 0x16u);
      }

      *(_QWORD *)&retstr->carPlayInstrumentClusterURLSchemes = 0;
    }
    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }

  }
  bundlePersonas = v203->_bundlePersonas;
  if (bundlePersonas)
    v78 = -[NSArray unsignedLongLongValue](bundlePersonas, "unsignedLongLongValue");
  else
    v78 = -1;
  retstr->base.containingDirectoryClass = v78;
  retstr->base.profileValidationState = -[LSBundleRecordBuilder profileValidationState](v203, "profileValidationState");
  retstr->managementDeclarationIdentifier = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_supportedComplicationFamilies, 0);
  HIDWORD(retstr->ratingRank) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_ratingRank, 0);
  retstr->ratingLabel = _LSPlistAdd((uint64_t)v204, v203->_genreID);
  +[FSNode nameForBookmarkData:error:](FSNode, "nameForBookmarkData:error:", v203->_bundleAlias, 0);
  v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v79)
    retstr->categoryType = _LSDatabaseCreateStringForCFString(v204, v79, 1);

  if (!retstr->categoryType)
  {
    v11 = -10817;
    goto LABEL_145;
  }
  retstr->counterpartIdentifiers = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_bundleContainerURL, 0);
  retstr->equivalentBundleIdentifiers = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_categoryType, 0);
  activityTypes = v203->_activityTypes;
  if (activityTypes)
  {
    memset(&buf, 0, sizeof(buf));
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v81 = activityTypes;
    v82 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v220, v239, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v221;
      do
      {
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v221 != v83)
            objc_enumerationMutation(v81);
          v85 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v86 = objc_msgSend(v85, "intValue");
            v87 = v86;
            if (v86 >= 1)
            {
              v88 = buf.__end_;
              if (buf.__end_ >= buf.__end_cap_.__value_)
              {
                v90 = buf.__begin_;
                v91 = buf.__end_ - buf.__begin_;
                v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 62)
                  abort();
                v93 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
                if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v92)
                  v92 = v93 >> 1;
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
                  v94 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v94 = v92;
                if (v94)
                {
                  v95 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v94);
                  v88 = buf.__end_;
                  v90 = buf.__begin_;
                }
                else
                {
                  v95 = 0;
                }
                v96 = (unsigned int *)&v95[4 * v91];
                *v96 = v87;
                v89 = v96 + 1;
                while (v88 != v90)
                {
                  v97 = *--v88;
                  *--v96 = v97;
                }
                buf.__begin_ = v96;
                buf.__end_ = v89;
                buf.__end_cap_.__value_ = (unsigned int *)&v95[4 * v94];
                if (v90)
                  operator delete(v90);
              }
              else
              {
                *buf.__end_ = v86;
                v89 = v88 + 1;
              }
              buf.__end_ = v89;
            }
          }
        }
        v82 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v220, v239, 16);
      }
      while (v82);
    }

    *(_QWORD *)v240 = 0;
    v98 = _CSArrayCreate();
    LODWORD(v200->itemID) = v98;
    if (v98)
      v11 = 0;
    else
      v11 = _LSGetOSStatusFromNSError(*(void **)v240);

    if (buf.__begin_)
    {
      buf.__end_ = buf.__begin_;
      operator delete(buf.__begin_);
    }
    retstr = v200;
    if (v11)
      goto LABEL_145;
  }
  execPath = v203->_execPath;
  if (execPath)
    retstr->base.machOUUIDs = _LSDatabaseCreateStringArray(v204, execPath, 0, 0);
  v11 = -[LSBundleRecordBuilder registerQueriableSchemes:bundleData:](v203, "registerQueriableSchemes:bundleData:", v204, retstr);
  if (v11)
    goto LABEL_145;
  *(&retstr->ratingLabel + 1) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_distributorInfo, 0);
  LODWORD(retstr->genreID) = _LSDatabaseCreateStringForCFString(v204, (const __CFString *)v203->_primaryIconName, 0);
  HIDWORD(retstr->genreID) = _LSPlistAdd((uint64_t)v204, v203->_alternatePrimaryIconName);
  iconsDict = v203->_iconsDict;
  if (iconsDict)
  {
    StringArray = _LSDatabaseCreateStringArray(v204, iconsDict, 0, 0);
    retstr->genre = StringArray;
    if (!StringArray)
      goto LABEL_313;
  }
  if (objc_msgSend(*(id *)&v203->_canDefineSystemExtensionPoint, "count")
    || -[NSMutableDictionary count](v203->_plistRarities, "count"))
  {
    v102 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v103 = v102;
    if (*(_QWORD *)&v203->_canDefineSystemExtensionPoint)
      objc_msgSend(v102, "addEntriesFromDictionary:");
    if (v203->_plistRarities)
      objc_msgSend(v103, "addEntriesFromDictionary:");
    retstr->base.infoDictionary = _LSPlistAdd((uint64_t)v204, v103);

    retstr = v200;
  }
  else
  {
    retstr->base.infoDictionary = 0;
  }
  retstr->base.groupContainers = _LSPlistAdd((uint64_t)v204, v203->_driverExtensionPaths);
  retstr->base.entitlements = _LSPlistAdd((uint64_t)v204, v203->_groupContainers);
  retstr->queriableSchemes = _LSPlistAdd((uint64_t)v204, v203->_entitlements);
  retstr->base.intentDefinitionURLs = _LSPlistAdd((uint64_t)v204, v203->_extensionSDK);
  retstr->plugins = _LSDatabaseCreateStringArray(v204, v203->_intentDefinitionURLs, 0, 0);
  retstr->driverExtensions = _LSDatabaseCreateStringArray(v204, v203->_bgPermittedIdentifiers, 0, 0);
  v104 = (void *)MEMORY[0x186DAE7A0]();
  memset(&buf, 0, sizeof(buf));
  v216 = 0u;
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v105 = v203->_commonInfoPlistEntries;
  v106 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v216, v238, 16);
  if (v106)
  {
    v107 = *(_QWORD *)v217;
    do
    {
      for (k = 0; k != v106; ++k)
      {
        if (*(_QWORD *)v217 != v107)
          objc_enumerationMutation(v105);
        v109 = _LSPlistAdd((uint64_t)v204, *(void **)(*((_QWORD *)&v216 + 1) + 8 * k));
        v110 = v109;
        if (v109)
        {
          v111 = buf.__end_;
          if (buf.__end_ >= buf.__end_cap_.__value_)
          {
            v113 = buf.__begin_;
            v114 = buf.__end_ - buf.__begin_;
            v115 = v114 + 1;
            if ((unint64_t)(v114 + 1) >> 62)
              abort();
            v116 = (char *)buf.__end_cap_.__value_ - (char *)buf.__begin_;
            if (((char *)buf.__end_cap_.__value_ - (char *)buf.__begin_) >> 1 > v115)
              v115 = v116 >> 1;
            if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
              v117 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v117 = v115;
            if (v117)
            {
              v118 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&buf.__end_cap_, v117);
              v111 = buf.__end_;
              v113 = buf.__begin_;
            }
            else
            {
              v118 = 0;
            }
            v119 = (unsigned int *)&v118[4 * v114];
            *v119 = v110;
            v112 = v119 + 1;
            while (v111 != v113)
            {
              v120 = *--v111;
              *--v119 = v120;
            }
            buf.__begin_ = v119;
            buf.__end_ = v112;
            buf.__end_cap_.__value_ = (unsigned int *)&v118[4 * v117];
            if (v113)
              operator delete(v113);
          }
          else
          {
            *buf.__end_ = v109;
            v112 = v111 + 1;
          }
          buf.__end_ = v112;
        }
      }
      v106 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v216, v238, 16);
    }
    while (v106);
  }

  v121 = buf.__begin_;
  if (buf.__begin_ == buf.__end_)
  {
    v122 = v200;
    if (!buf.__begin_)
      goto LABEL_194;
    goto LABEL_193;
  }
  v122 = v200;
  v200->localizedNameWithContext[0] = _CSArrayCreate();
  v121 = buf.__begin_;
  if (buf.__begin_)
  {
LABEL_193:
    buf.__end_ = v121;
    operator delete(v121);
  }
LABEL_194:
  objc_autoreleasePoolPop(v104);
  v122->base.localizedDisplayName = LaunchServices::LocalizedString::Add(v204, v203->_carPlayInstrumentClusterURLSchemes, v203->_identifier);
  v122->base.localizedShortDisplayName = LaunchServices::LocalizedString::Add(v204, v203->_localizedNames, v203->_displayName);
  v122->base.localizedMicrophoneUsageDescription = LaunchServices::LocalizedString::Add(v204, v203->_microphoneUsageDescription, v203->_localizedShortNames);
  v122->base.localizedIdentityUsageDescription = LaunchServices::LocalizedString::Add(v204, v203->_identityUsageDescription, v203->_localizedMicrophoneUsageDescription);
  buf.__begin_ = 0;
  buf.__end_ = (std::vector<unsigned int>::pointer)&buf;
  buf.__end_cap_.__value_ = (unsigned int *)0x26012000000;
  v234 = __Block_byref_object_copy__11;
  v235 = __Block_byref_object_dispose__11;
  v236 = "";
  memcpy(v237, v122, sizeof(v237));
  v213[0] = MEMORY[0x1E0C809B0];
  v213[1] = 3221225472;
  v213[2] = __47__LSBundleRecordBuilder_buildBundleData_error___block_invoke;
  v213[3] = &unk_1E1042278;
  v213[4] = v203;
  p_buf = &buf;
  v197 = v204;
  v214 = v197;
  _LSBundleDisplayNameContextEnumerate(v213);
  memcpy(v122, buf.__end_ + 12, 0x230uLL);

  _Block_object_dispose(&buf, 8);
  v123 = v200;
  v200->distributorInfo = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_staticDiskUsage, 0);
  libraryPath = v203->_libraryPath;
  if (libraryPath)
  {
    v125 = _LSDatabaseCreateStringArray(v197, libraryPath, 0, 0);
    v200->primaryIconName = v125;
    if (!v125)
    {
LABEL_313:
      v11 = -9493;
      goto LABEL_145;
    }
  }
  v126 = v203;
  if ((v203->_bundleFlags & 0x100) != 0)
    goto LABEL_223;
  importedTypes = v203->_importedTypes;
  if (importedTypes || v203->_URLClaims)
  {
    buf.__begin_ = 0;
    -[NSArray count](importedTypes, "count");
    -[NSArray count](v203->_URLClaims, "count");
    v128 = _CSArrayCreateWithCapacity();
    v200->iconsDict = v128;
    if (!v128)
    {
      v11 = _LSGetOSStatusFromNSError(buf.__begin_);
      if (v11)
        goto LABEL_316;
    }
    v129 = v203->_importedTypes;
    if (v129 && -[NSArray count](v129, "count")
      || (URLClaims = v203->_URLClaims) != 0 && -[NSArray count](URLClaims, "count"))
    {
      -[LSBundleRecordBuilder addPlistFlag:](v203, "addPlistFlag:", 0x10000);
    }

  }
  documentClaims = v203->_documentClaims;
  if (!documentClaims && !v203->_libraryItems)
    goto LABEL_217;
  buf.__begin_ = 0;
  -[NSArray count](documentClaims, "count");
  -[NSArray count](v203->_libraryItems, "count");
  v132 = _CSArrayCreateWithCapacity();
  v200->alternatePrimaryIconName = v132;
  if (!v132)
  {
    v11 = _LSGetOSStatusFromNSError(buf.__begin_);
    if (v11)
    {
LABEL_316:

      goto LABEL_145;
    }
  }
  v133 = v203->_documentClaims;
  if (v133 && -[NSArray count](v133, "count")
    || (libraryItems = v203->_libraryItems) != 0 && -[NSArray count](libraryItems, "count"))
  {
    -[LSBundleRecordBuilder addPlistFlag:](v203, "addPlistFlag:", 0x10000);
  }

LABEL_217:
  queriableSchemes = v203->_queriableSchemes;
  if (queriableSchemes)
  {
    buf.__begin_ = 0;
    -[NSArray count](queriableSchemes, "count");
    v136 = _CSArrayCreateWithCapacity();
    v200->iconFileNames = v136;
    if (v136)
    {

    }
    else
    {
      v11 = _LSGetOSStatusFromNSError(buf.__begin_);

      if (v11)
        goto LABEL_145;
    }
  }
  v126 = v203;
  sandboxEnvironmentVariables = v203->_sandboxEnvironmentVariables;
  v123 = v200;
  if (sandboxEnvironmentVariables)
  {
    buf.__begin_ = 0;
    -[NSDictionary count](sandboxEnvironmentVariables, "count");
    v138 = _CSArrayCreateWithCapacity();
    v200->libraryItems = v138;
    if (v138)
    {

      v123 = v200;
      v126 = v203;
      goto LABEL_223;
    }
    v11 = _LSGetOSStatusFromNSError(buf.__begin_);

    v123 = v200;
    v126 = v203;
    if (!v11)
      goto LABEL_223;
LABEL_145:
    v24 = v199;
LABEL_146:
    if (obj)
      _LSAliasRemove(v204, obj);
    if (v195)
      _LSAliasRemove(v204, v195);
    if (v196)
      _LSAliasRemove(v204, v196);
    goto LABEL_152;
  }
LABEL_223:
  pluginMIDicts = v126->_pluginMIDicts;
  if (pluginMIDicts)
    v123->libraryPath = _LSDatabaseCreateStringArray(v197, pluginMIDicts, 0, 0);
  v140 = v203;
  v141 = v203->_installType;
  if (v141)
  {
    v142 = -[NSNumber hasPrefix:](v141, "hasPrefix:", CFSTR("com.apple."));
    v140 = v203;
    if ((v142 & 1) != 0)
      goto LABEL_233;
  }
  v143 = v140->_vendorName;
  if (!v143)
    goto LABEL_253;
  v144 = -[NSString isEqualToString:](v143, "isEqualToString:", CFSTR("Internal"));
  v140 = v203;
  if (v144)
    goto LABEL_233;
  v145 = -[NSString isEqualToString:](v203->_vendorName, "isEqualToString:", CFSTR("System"));
  v140 = v203;
  if (v145
    || (v146 = -[NSString isEqualToString:](v203->_vendorName, "isEqualToString:", CFSTR("SystemAppPlaceholder")),
        v140 = v203,
        v146)
    || (v147 = -[NSString isEqualToString:](v203->_vendorName, "isEqualToString:", CFSTR("CoreServices")),
        v140 = v203,
        v147)
    || (v148 = -[NSString isEqualToString:](v203->_vendorName, "isEqualToString:", CFSTR("Hidden")), v140 = v203, v148))
  {
LABEL_233:
    *((_BYTE *)&v140->_moreFlags + 3) |= 1u;
  }
  v149 = v140->_vendorName;
  if (v149 && !-[NSString isEqualToString:](v149, "isEqualToString:", CFSTR("User")))
  {
    if ((v203->_plistContentFlags & 0x800) != 0)
    {
      v151 = *(void **)&v203->_canDefineSystemExtensionPoint;
      v152 = objc_opt_class();
      objc_msgSend(v151, "objectForKey:", CFSTR("SBAppTags"));
      v153 = objc_claimAutoreleasedReturnValue();
      v154 = (void *)v153;
      if (v152 && v153 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v154 = 0;
      }
      if (objc_msgSend(v154, "containsObject:", CFSTR("hidden")))
        -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x40000000000);

      v123 = v200;
    }
    else if (-[NSString isEqualToString:](v203->_vendorName, "isEqualToString:", CFSTR("CoreServices"))
           || (v150 = v203->_installType) != 0
           && -[NSNumber isEqualToString:](v150, "isEqualToString:", CFSTR("com.apple.purplebuddy")))
    {
      -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x40000000000);
    }
  }
LABEL_253:
  itemID = (const __CFString *)v203->_itemID;
  if (itemID)
  {
LABEL_256:
    v123->base.teamID = _LSDatabaseCreateStringForCFString(v197, itemID, 0);
    goto LABEL_257;
  }
  if ((*((_BYTE *)&v203->_moreFlags + 3) & 1) != 0)
  {
    itemID = CFSTR("0000000000");
    goto LABEL_256;
  }
LABEL_257:
  v156 = v203;
  if ((v203->_bundleFlags & 0x1000000000000000) != 0)
  {
    v157 = -[NSString count](v203->_teamID, "count");
    v156 = v203;
    if (v157)
    {
      _LSInstallLog();
      v158 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      {
        v159 = (unsigned int *)v203->_installType;
        LODWORD(buf.__begin_) = 138412290;
        *(std::vector<unsigned int>::pointer *)((char *)&buf.__begin_ + 4) = v159;
        _os_log_impl(&dword_182882000, v158, OS_LOG_TYPE_DEFAULT, "App %@ is an app clip; ignoring its activity types.",
          (uint8_t *)&buf,
          0xCu);
      }

      v123 = v200;
      goto LABEL_264;
    }
  }
  teamID = v156->_teamID;
  if (teamID)
  {
    v161 = _LSDatabaseCreateStringArray(v197, teamID, 0, 0);
    v123->claims = v161;
    if (!v161)
      goto LABEL_313;
  }
LABEL_264:
  v123->base.signerIdentity = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_appType, 0);
  v123->base.codeInfoIdentifier = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_signerIdentity, 0);
  v123->base.signerOrganization = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_codeInfoIdentifier, 0);
  v123->base.signatureVersion = -[NSArray unsignedLongLongValue](v203->_slices, "unsignedLongLongValue");
  v123->bundlePersonas = _LSPlistAdd((uint64_t)v197, v203->_directoryClass);
  v123->bundlePersonaTypes = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_stashedAppInfo, 0);
  v123->recordModificationTime = _LSDatabaseCreateStringForCFString(v197, (const __CFString *)v203->_applicationManagementDomain, 0);
  v162 = v203;
  if (v203->_documentClaims)
  {
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    obja = v203->_documentClaims;
    v163 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v209, v232, 16);
    if (v163)
    {
      v164 = *(_QWORD *)v210;
      v165 = *MEMORY[0x1E0C9AB30];
      do
      {
        for (m = 0; m != v163; ++m)
        {
          if (*(_QWORD *)v210 != v164)
            objc_enumerationMutation(obja);
          v167 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * m);
          if (_NSIsNSDictionary())
          {
            v168 = objc_opt_class();
            objc_msgSend(v167, "objectForKey:", v165);
            v169 = objc_claimAutoreleasedReturnValue();
            v170 = (void *)v169;
            if (v168 && v169 && (objc_opt_isKindOfClass() & 1) == 0)
            {

              v170 = 0;
            }
            v207 = 0u;
            v208 = 0u;
            v205 = 0u;
            v206 = 0u;
            v171 = v170;
            v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
            if (v172)
            {
              v173 = *(_QWORD *)v206;
              while (2)
              {
                for (n = 0; n != v172; ++n)
                {
                  if (*(_QWORD *)v206 != v173)
                    objc_enumerationMutation(v171);
                  v175 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * n);
                  if (_NSIsNSString() && !objc_msgSend(v175, "caseInsensitiveCompare:", CFSTR("file")))
                  {
                    -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x8000000);
                    goto LABEL_286;
                  }
                }
                v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
                if (v172)
                  continue;
                break;
              }
            }
LABEL_286:

          }
        }
        v163 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v209, v232, 16);
      }
      while (v163);
    }

    v123 = v200;
    v162 = v203;
  }
  groupContainers = v162->_groupContainers;
  if (groupContainers)
  {
    -[NSDictionary objectForKey:](groupContainers, "objectForKey:", CFSTR("beta-reports-active"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v177 == 0;

    v123 = v200;
    if (!v178)
      -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x200000);
    v162 = v203;
    if ((*((_BYTE *)&v203->_moreFlags + 3) & 0x10) == 0)
    {
      -[NSDictionary objectForKey:](v203->_groupContainers, "objectForKey:", CFSTR("com.apple.developer.web-browser-engine.host"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v179 == 0;

      v123 = v200;
      v162 = v203;
      if (!v180)
        *((_BYTE *)&v203->_moreFlags + 2) |= 2u;
    }
  }
  v123->appClipFields.parentAppIDs = _LSPlistAdd((uint64_t)v197, v162->_signatureVersion);
  v123->base._sliceMask = _LSSliceMaskForSliceArray(v203->_mobileInstallIDs);
  if (v203->_sdkVersionNumber._opaque[25])
    -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x8000000000);
  v181 = v203->_registrationInfo;
  if ((v181->options & 0x40) != 0 || v181->bundleClass == 16)
    -[LSBundleRecordBuilder addBundleFlag:](v203, "addBundleFlag:", 0x40000);
  bundleFlags = v203->_bundleFlags;
  *(_WORD *)((char *)&v123->_itemFlags + 1) = v203->_moreFlags;
  v183 = (unsigned __int16 *)((char *)&v123->_itemFlags + 1);
  *(_QWORD *)((char *)v183 - 17) = bundleFlags;
  *(_DWORD *)((char *)v183 - 9) = v203->_plistContentFlags;
  itemFlags = v203->_itemFlags;
  *((_BYTE *)v183 - 1) = v203->_iconFlags;
  *(_DWORD *)((char *)v183 - 5) = itemFlags;
  LOBYTE(bundleFlags) = *((_BYTE *)&v203->_moreFlags + 2);
  v185 = *((_BYTE *)&v203->_moreFlags + 3);
  *((_BYTE *)v183 + 2) = bundleFlags;
  *((_BYTE *)v183 - 25) = v185;
  v186 = bundleFlags;
  v187 = v183;
  v188 = *v183;
  +[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly](_LSDAppProtectionClient, "hiddenApplicationsForLSDUseOnly");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v189, "containsObject:", v203->_installType))
    v190 = 0x80000;
  else
    v190 = 0;

  +[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly](_LSDAppProtectionClient, "lockedApplicationsForLSDUseOnly");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v191, "containsObject:", v203->_installType))
    v192 = 0x100000;
  else
    v192 = 0;

  *v187 = v190 | v188 | v192;
  *((_BYTE *)v187 + 2) = (v190 | (v188 | (v186 << 16)) & 0xFFE7FFFF | v192) >> 16;
  v24 = v199;
LABEL_308:

  return result;
}

void __47__LSBundleRecordBuilder_buildBundleData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "objectForKeyedSubscript:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 800), "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 4 * a2 + 564) = LaunchServices::LocalizedString::Add(*(void **)(a1 + 40), v7, v8);

}

- (int)activateBindings:(id)a3 unitID:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  id v7;
  int v8;

  v7 = a3;
  v8 = _LSBindableActivate(v7, a4);
  if (!v8)
  {
    v8 = _LSBindableActivate(v7, a4);
    if (!v8 && (!a5->base.bundleName || (v8 = _LSBindableActivate(v7, a4)) == 0))
    {
      if (a5->recordModificationTime)
        v8 = _LSBindableActivate(v7, a4);
      else
        v8 = 0;
    }
  }

  return v8;
}

- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4
{
  NSArray *importedTypes;
  int v7;
  NSArray *URLClaims;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  const __CFDictionary *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  signed int v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unsigned int v43;
  id obj;
  id v45;
  LSBundleRecordBuilder *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned int v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE __dst[560];
  _OWORD __src[35];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v51 = 0;
  memset(__src, 0, 512);
  v45 = a3;
  v46 = self;
  -[LSBundleRecordBuilder buildBundleData:error:](self, "buildBundleData:error:");
  memcpy(__dst, __src, sizeof(__dst));
  v43 = _LSBundleAdd(v45, (uint64_t)__dst, &v51);
  if (v43)
  {
    v51 = 0;
  }
  else
  {
    v43 = -[LSBundleRecordBuilder activateBindings:unitID:bundleData:](self, "activateBindings:unitID:bundleData:", v45, v51, __src);
    if (!v43)
    {
      v43 = 0;
      importedTypes = self->_importedTypes;
      v7 = DWORD2(__src[29]);
      if (importedTypes && DWORD2(__src[29]))
      {
        v43 = _LSRegisterTypeDeclarationsForBundle(v45, v51, (uint64_t)__src, importedTypes, self->_localizedIdentityUsageDescription);
        v7 = DWORD2(__src[29]);
      }
      URLClaims = self->_URLClaims;
      if (URLClaims && v7)
        v43 = _LSRegisterTypeDeclarationsForBundle(v45, v51, (uint64_t)__src, URLClaims, self->_localizedIdentityUsageDescription);
      v9 = DWORD1(__src[29]);
      if (self->_libraryItems && DWORD1(__src[29]))
      {
        v43 = _LSRegisterDocumentTypes((uint64_t)v45);
        v9 = DWORD1(__src[29]);
      }
      if (self->_documentClaims && v9)
        v43 = _LSRegisterURLTypes((uint64_t)v45);
      if (DWORD2(__src[30]))
        v43 = _LSBundleActivateBindingsForUserActivityTypes(v45, v51, (uint64_t)__src);
      if (!self->_registrationInfo
        || !self->_queriableSchemes
        || !HIDWORD(__src[29])
        || _LSBundleDataIsInUnsupportedLocation((uint64_t)v45, (uint64_t)__src)
        || _LSBundleDataGetUnsupportedFormatFlag()
        || (BYTE12(__src[10]) & 0x80) != 0)
      {
        _LSExtensionsLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[LSBundleRecordBuilder registerBundleRecord:error:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

      }
      else
      {
        _LSExtensionsLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[LSBundleRecordBuilder registerBundleRecord:error:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

        v43 = _LSRegisterPlugins(v45, self->_registrationInfo->containerUnit, v51, (uint64_t)self->_queriableSchemes, self->_pluginPlists, 0);
      }
      if (self->_sandboxEnvironmentVariables && DWORD1(__src[30]))
      {
        objc_msgSend((id)getEXEnumeratorClass(), "extensionPointDefinitionEnumeratorWithSDKDictionary:", self->_sandboxEnvironmentVariables);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v48 != v27)
                objc_enumerationMutation(obj);
              v29 = *(__CFString **)(*((_QWORD *)&v47 + 1) + 8 * i);
              -[__CFString identifier](v29, "identifier");
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v31 = -[__CFString platform](v29, "platform");
              -[__CFString SDKDictionary](v29, "SDKDictionary");
              v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              -[__CFString url](v29, "url");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (LOBYTE(v46->_inode)
                || !-[__CFString hasPrefix:](v30, "hasPrefix:", CFSTR("com.apple.")))
              {
                _LSExtensionsLog();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v53 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  v54 = 2112;
                  v55 = v29;
                  _os_log_debug_impl(&dword_182882000, v35, OS_LOG_TYPE_DEBUG, "%s Registering extension point: %@", buf, 0x16u);
                }

                _LSRegisterExtensionPoint(v45, v51, v30, v31, v32, v33);
              }
              else
              {
                _LSExtensionsLog();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  -[LSBundleRecordBuilder identifier](v46, "identifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v53 = "-[LSBundleRecordBuilder registerBundleRecord:error:]";
                  v54 = 2112;
                  v55 = v30;
                  v56 = 2112;
                  v57 = v36;
                  _os_log_error_impl(&dword_182882000, v34, OS_LOG_TYPE_ERROR, "%s Skipping extension point '%@' unentitled app '%@' is not permitted to register a system extension point", buf, 0x20u);

                }
              }

            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          }
          while (v26);
        }

      }
      _LSBundleSetSpecialApplicationTypes(v45, v51, 0, 0);
    }
  }
  v37 = v43;
  if (v43 && v51)
  {
    _LSBundleRemove(v45, v51, 0);
    v51 = 0;
    v37 = v43;
  }
  else if (!v43)
  {
    v46->_registerChildItemsTrusted = (BYTE12(__src[10]) & 0x80) == 0;
    goto LABEL_54;
  }
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v37, (uint64_t)"-[LSBundleRecordBuilder registerBundleRecord:error:]", 2298, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_54:
  if (v46->_installType)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsAlternateIcons"))
      v38 = (v46->_bundleFlags & 0x40000) == 0;
    else
      v38 = 0;
    v39 = (void *)MEMORY[0x186DAE7A0]();
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) == 0
      && (IconServicesLibrary(void)::frameworkLibrary
       || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0))
    {
      softLink_ISInvalidateCacheEntriesForBundleIdentifier((NSString *)&v46->_installType->super.super.isa);
    }
    if (v38)
    {
      +[LSAltIconManager sharedInstance](LSAltIconManager, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "clearAlternateNameForBundleIdentifier:validationDictionary:", v46->_installType, v46->_alternatePrimaryIconName);

    }
    objc_autoreleasePoolPop(v39);
  }
  v41 = v51;

  return v41;
}

- (unsigned)retries
{
  return self->_retries;
}

- (void)setRetries:(unsigned __int8)a3
{
  self->_retries = a3;
}

- (unsigned)previousInstallType
{
  return self->_previousInstallType;
}

- (void)setPreviousInstallType:(unsigned int)a3
{
  self->_previousInstallType = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)registerChildItemsTrusted
{
  return self->_registerChildItemsTrusted;
}

- (BOOL)containerized
{
  return self->_sdkVersionNumber._opaque[24];
}

- (BOOL)webNotificationPlaceholder
{
  return self->_sdkVersionNumber._opaque[25];
}

- (NSNumber)compatibilityState
{
  return *(NSNumber **)&self->_containerized;
}

- (NSNumber)installFailureReason
{
  return self->_compatibilityState;
}

- (NSString)version
{
  return (NSString *)&self->_installFailureReason->super.super.isa;
}

- (NSString)minSystemVersion
{
  return self->_version;
}

- (NSString)maxSystemVersion
{
  return self->_minSystemVersion;
}

- (NSString)sdkVersion
{
  return self->_maxSystemVersion;
}

- (NSString)appStoreToolsBuildVersion
{
  return self->_sdkVersion;
}

- (NSString)shortVersionString
{
  return self->_appStoreToolsBuildVersion;
}

- (NSString)execPath
{
  return self->_shortVersionString;
}

- (NSArray)machOUUIDs
{
  return (NSArray *)self->_execPath;
}

- (NSNumber)itemID
{
  return (NSNumber *)self->_machOUUIDs;
}

- (NSString)teamID
{
  return (NSString *)&self->_itemID->super.super.isa;
}

- (NSArray)activityTypes
{
  return (NSArray *)self->_teamID;
}

- (NSArray)deviceFamily
{
  return self->_activityTypes;
}

- (NSNumber)installType
{
  return (NSNumber *)self->_deviceFamily;
}

- (NSString)identifier
{
  return (NSString *)&self->_installType->super.super.isa;
}

- (NSString)displayName
{
  return self->_identifier;
}

- (NSString)shortDisplayName
{
  return self->_displayName;
}

- (NSString)bundleName
{
  return self->_shortDisplayName;
}

- (NSArray)alternateNames
{
  return (NSArray *)self->_bundleName;
}

- (NSURL)dataContainerURL
{
  return (NSURL *)self->_alternateNames;
}

- (NSURL)bundleContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)categoryType
{
  return (NSString *)&self->_bundleContainerURL->super.isa;
}

- (NSString)secondCategoryType
{
  return self->_categoryType;
}

- (NSString)vendorName
{
  return self->_secondCategoryType;
}

- (NSString)appType
{
  return self->_vendorName;
}

- (NSString)signerIdentity
{
  return self->_appType;
}

- (NSString)codeInfoIdentifier
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_codeInfoIdentifier;
}

- (NSString)itemName
{
  return self->_signerOrganization;
}

- (NSNumber)storefront
{
  return (NSNumber *)self->_itemName;
}

- (NSNumber)versionID
{
  return self->_storefront;
}

- (NSString)sourceAppBundleID
{
  return (NSString *)&self->_versionID->super.super.isa;
}

- (NSString)appVariant
{
  return self->_sourceAppBundleID;
}

- (NSString)managementDeclarationIdentifier
{
  return self->_appVariant;
}

- (NSMutableSet)counterpartAppBundleIDs
{
  return (NSMutableSet *)self->_managementDeclarationIdentifier;
}

- (NSMutableSet)equivalentBundleIDs
{
  return self->_counterpartAppBundleIDs;
}

- (NSArray)parentApplicationIdentifiers
{
  return (NSArray *)self->_equivalentBundleIDs;
}

- (NSString)watchKitVersion
{
  return (NSString *)&self->_parentApplicationIdentifiers->super.isa;
}

- (NSString)complicationPrincipalClass
{
  return self->_watchKitVersion;
}

- (NSArray)supportedComplicationFamilies
{
  return (NSArray *)self->_complicationPrincipalClass;
}

- (NSString)ratingLabel
{
  return (NSString *)&self->_supportedComplicationFamilies->super.isa;
}

- (NSNumber)ratingRank
{
  return (NSNumber *)self->_ratingLabel;
}

- (NSString)genre
{
  return (NSString *)&self->_ratingRank->super.super.isa;
}

- (NSNumber)genreID
{
  return (NSNumber *)self->_genre;
}

- (NSDictionary)distributorInfo
{
  return (NSDictionary *)self->_genreID;
}

- (NSString)primaryIconName
{
  return (NSString *)&self->_distributorInfo->super.isa;
}

- (NSString)alternatePrimaryIconName
{
  return self->_primaryIconName;
}

- (NSDictionary)iconsDict
{
  return (NSDictionary *)self->_alternatePrimaryIconName;
}

- (NSArray)iconFileNames
{
  return (NSArray *)self->_iconsDict;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)self->_iconFileNames;
}

- (NSNumber)downloaderDSID
{
  return self->_purchaserDSID;
}

- (NSNumber)familyID
{
  return self->_downloaderDSID;
}

- (NSNumber)staticDiskUsage
{
  return self->_familyID;
}

- (NSString)libraryPath
{
  return (NSString *)&self->_staticDiskUsage->super.super.isa;
}

- (NSArray)libraryItems
{
  return (NSArray *)self->_libraryPath;
}

- (NSArray)documentClaims
{
  return self->_libraryItems;
}

- (NSArray)URLClaims
{
  return self->_documentClaims;
}

- (NSArray)importedTypes
{
  return self->_URLClaims;
}

- (NSArray)exportedTypes
{
  return self->_importedTypes;
}

- (NSArray)queriableSchemes
{
  return self->_exportedTypes;
}

- (NSDictionary)pluginPlists
{
  return (NSDictionary *)self->_queriableSchemes;
}

- (NSDictionary)pluginMIDicts
{
  return self->_pluginPlists;
}

- (NSArray)driverExtensionPaths
{
  return (NSArray *)self->_pluginMIDicts;
}

- (NSDictionary)groupContainers
{
  return (NSDictionary *)self->_driverExtensionPaths;
}

- (NSDictionary)entitlements
{
  return self->_groupContainers;
}

- (NSDictionary)sandboxEnvironmentVariables
{
  return self->_entitlements;
}

- (NSDictionary)extensionSDK
{
  return self->_sandboxEnvironmentVariables;
}

- (NSDictionary)intentDefinitionURLs
{
  return self->_extensionSDK;
}

- (NSArray)bgPermittedIdentifiers
{
  return (NSArray *)self->_intentDefinitionURLs;
}

- (NSArray)carPlayInstrumentClusterURLSchemes
{
  return self->_bgPermittedIdentifiers;
}

- (unsigned)profileValidationState
{
  return self->_sdkVersionNumber._opaque[26];
}

- (void)setProfileValidationState:(unsigned __int8)a3
{
  self->_sdkVersionNumber._opaque[26] = a3;
}

- (NSDictionary)localizedNames
{
  return (NSDictionary *)self->_carPlayInstrumentClusterURLSchemes;
}

- (NSDictionary)localizedShortNames
{
  return self->_localizedNames;
}

- (NSString)microphoneUsageDescription
{
  return (NSString *)&self->_localizedShortNames->super.isa;
}

- (NSDictionary)localizedMicrophoneUsageDescription
{
  return (NSDictionary *)self->_microphoneUsageDescription;
}

- (NSString)identityUsageDescription
{
  return (NSString *)&self->_localizedMicrophoneUsageDescription->super.isa;
}

- (NSDictionary)localizedIdentityUsageDescription
{
  return (NSDictionary *)self->_identityUsageDescription;
}

- (NSDictionary)localizedStrings
{
  return self->_localizedIdentityUsageDescription;
}

- (NSDictionary)unlocalizedNamesWithContext
{
  return self->_localizedStrings;
}

- (NSArray)bundlePersonas
{
  return (NSArray *)self->_unlocalizedNamesWithContext;
}

- (NSNumber)directoryClass
{
  return (NSNumber *)self->_bundlePersonas;
}

- (NSDictionary)mobileInstallIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 832, 1);
}

- (NSArray)slices
{
  return (NSArray *)self->_mobileInstallIDs;
}

- (NSNumber)signatureVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 848, 1);
}

- (NSDictionary)stashedAppInfo
{
  return (NSDictionary *)self->_signatureVersion;
}

- (NSString)applicationManagementDomain
{
  return (NSString *)&self->_stashedAppInfo->super.isa;
}

- (NSString)linkedParentBundleID
{
  return self->_applicationManagementDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationManagementDomain, 0);
  objc_storeStrong((id *)&self->_stashedAppInfo, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_slices, 0);
  objc_storeStrong((id *)&self->_mobileInstallIDs, 0);
  objc_storeStrong((id *)&self->_directoryClass, 0);
  objc_storeStrong((id *)&self->_bundlePersonas, 0);
  objc_storeStrong((id *)&self->_unlocalizedNamesWithContext, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_localizedIdentityUsageDescription, 0);
  objc_storeStrong((id *)&self->_identityUsageDescription, 0);
  objc_storeStrong((id *)&self->_localizedMicrophoneUsageDescription, 0);
  objc_storeStrong((id *)&self->_microphoneUsageDescription, 0);
  objc_storeStrong((id *)&self->_localizedShortNames, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_carPlayInstrumentClusterURLSchemes, 0);
  objc_storeStrong((id *)&self->_bgPermittedIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentDefinitionURLs, 0);
  objc_storeStrong((id *)&self->_extensionSDK, 0);
  objc_storeStrong((id *)&self->_sandboxEnvironmentVariables, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_groupContainers, 0);
  objc_storeStrong((id *)&self->_driverExtensionPaths, 0);
  objc_storeStrong((id *)&self->_pluginMIDicts, 0);
  objc_storeStrong((id *)&self->_pluginPlists, 0);
  objc_storeStrong((id *)&self->_queriableSchemes, 0);
  objc_storeStrong((id *)&self->_exportedTypes, 0);
  objc_storeStrong((id *)&self->_importedTypes, 0);
  objc_storeStrong((id *)&self->_URLClaims, 0);
  objc_storeStrong((id *)&self->_documentClaims, 0);
  objc_storeStrong((id *)&self->_libraryItems, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_staticDiskUsage, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_iconFileNames, 0);
  objc_storeStrong((id *)&self->_iconsDict, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryIconName, 0);
  objc_storeStrong((id *)&self->_primaryIconName, 0);
  objc_storeStrong((id *)&self->_distributorInfo, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_supportedComplicationFamilies, 0);
  objc_storeStrong((id *)&self->_complicationPrincipalClass, 0);
  objc_storeStrong((id *)&self->_watchKitVersion, 0);
  objc_storeStrong((id *)&self->_parentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_equivalentBundleIDs, 0);
  objc_storeStrong((id *)&self->_counterpartAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_managementDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_appVariant, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleID, 0);
  objc_storeStrong((id *)&self->_versionID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_secondCategoryType, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_shortDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_installType, 0);
  objc_storeStrong((id *)&self->_deviceFamily, 0);
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_machOUUIDs, 0);
  objc_storeStrong((id *)&self->_execPath, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_appStoreToolsBuildVersion, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_maxSystemVersion, 0);
  objc_storeStrong((id *)&self->_minSystemVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_installFailureReason, 0);
  objc_storeStrong((id *)&self->_compatibilityState, 0);
  objc_storeStrong((id *)&self->_containerized, 0);
  objc_storeStrong((id *)&self->_commonInfoPlistEntries, 0);
  objc_storeStrong((id *)&self->_plistRarities, 0);
  objc_storeStrong((id *)&self->_canDefineSystemExtensionPoint, 0);
  objc_storeStrong((id *)&self->_bundleAlias, 0);
  objc_storeStrong((id *)&self->_registrationInfo, 0);
}

- (void)parseNSExtensionSDKDefinitionsFromDictionary:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "-[LSBundleRecordBuilder parseNSExtensionSDKDefinitionsFromDictionary:]";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = CFSTR("_LSBundleExtensionPoints");

}

- (void)registerBundleRecord:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a1, a3, "%s Skipped registering extensions", a5, a6, a7, a8, 2u);
}

- (void)registerBundleRecord:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a1, a3, "%s Registering extensions", a5, a6, a7, a8, 2u);
}

@end
