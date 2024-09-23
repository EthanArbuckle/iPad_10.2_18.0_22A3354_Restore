@implementation AssistantAppsSettingsController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle_5;
  if (!bundle_sAssistantBundle_5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle_5;
    bundle_sAssistantBundle_5 = v3;

    v2 = (void *)bundle_sAssistantBundle_5;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantAppsSettingsController;
  -[AssistantAppsSettingsController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantAppsSettingsController;
  -[AssistantAppsSettingsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend((id)objc_opt_class(), "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APPS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantAppsSettingsController setTitle:](self, "setTitle:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AssistantAppsSettingsController;
  -[AssistantAppsSettingsController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceSupported");

  if (v6)
    v7 = CFSTR("Apple Intelligence & Siri");
  else
    v7 = CFSTR("Siri");
  v8 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", v7, 0, v9, v11);

  -[AssistantAppsSettingsController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v12, MEMORY[0x24BDBD1A8], v4);
}

- (id)specifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSMutableSet *disabledSpotlightBundles;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableSet *disabledSpotlightDomains;
  uint64_t (*v10)(void);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *allAppsSpecifiers;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id *v26;
  id v27;
  id v28;
  id obj;
  AssistantAppsSettingsController *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  if (!self->_disabledSpotlightBundles)
  {
    v38 = 0;
    v39 = (uint64_t)&v38;
    v40 = 0x2020000000;
    v2 = getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    v41 = getSPGetDisabledBundleSetSymbolLoc_ptr_1;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr_1)
    {
      v3 = (void *)SearchLibrary_1();
      v2 = dlsym(v3, "SPGetDisabledBundleSet");
      *(_QWORD *)(v39 + 24) = v2;
      getSPGetDisabledBundleSetSymbolLoc_ptr_1 = v2;
    }
    _Block_object_dispose(&v38, 8);
    if (!v2)
      -[AssistantAppsSettingsController specifiers].cold.1();
    ((void (*)(uint64_t))v2)(1);
    v4 = objc_claimAutoreleasedReturnValue();
    disabledSpotlightBundles = v31->_disabledSpotlightBundles;
    v31->_disabledSpotlightBundles = (NSMutableSet *)v4;

    self = v31;
  }
  if (!self->_disabledSpotlightDomains)
  {
    v38 = 0;
    v39 = (uint64_t)&v38;
    v40 = 0x2020000000;
    v6 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    v41 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    if (!getSPGetDisabledDomainSetSymbolLoc_ptr)
    {
      v7 = (void *)SearchLibrary_1();
      v6 = dlsym(v7, "SPGetDisabledDomainSet");
      *(_QWORD *)(v39 + 24) = v6;
      getSPGetDisabledDomainSetSymbolLoc_ptr = v6;
    }
    _Block_object_dispose(&v38, 8);
    if (!v6)
      -[AssistantAppsSettingsController specifiers].cold.2();
    ((void (*)(uint64_t))v6)(1);
    v8 = objc_claimAutoreleasedReturnValue();
    disabledSpotlightDomains = v31->_disabledSpotlightDomains;
    v31->_disabledSpotlightDomains = (NSMutableSet *)v8;

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v10 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr_0;
  v46 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr_0;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr_0)
  {
    v38 = MEMORY[0x24BDAC760];
    v39 = 3221225472;
    v40 = (uint64_t)__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_0;
    v41 = &unk_24D33CD10;
    v42 = &v43;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_0((uint64_t)&v38);
    v10 = (uint64_t (*)(void))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v10)
    -[AssistantAppsSettingsController specifiers].cold.3();
  obj = (id)v10();
  if (!-[NSSet isEqual:](v31->_installedBundleIDs, "isEqual:", obj))
  {
    objc_storeStrong((id *)&v31->_installedBundleIDs, obj);
    v11 = (void *)objc_msgSend(obj, "mutableCopy");
    objc_msgSend(v11, "addObject:", CFSTR("com.apple.iCloudDriveApp"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = v11;
    v12 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v35;
      v14 = *MEMORY[0x24BE75948];
      v15 = *MEMORY[0x24BE759F8];
      v16 = *MEMORY[0x24BE75A18];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v32);
          objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          PSApplicationSpecifierForAssistantSection();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), v14);
            objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), v15);
            objc_msgSend(v19, "setDetailControllerClass:", objc_opt_class());
            objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v16);
            objc_msgSend(v33, "addObject:", v19);
          }

        }
        v12 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33);
    v20 = objc_claimAutoreleasedReturnValue();
    allAppsSpecifiers = v31->_allAppsSpecifiers;
    v31->_allAppsSpecifiers = (NSArray *)v20;

  }
  -[NSArray sortedArrayUsingComparator:](v31->_allAppsSpecifiers, "sortedArrayUsingComparator:", &__block_literal_global_9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v22);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (id *)((char *)&v31->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v27 = *v26;
  *v26 = (id)v25;

  v28 = *v26;
  return v28;
}

uint64_t __45__AssistantAppsSettingsController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
}

- (void)specifiers
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFSetRef PSSBSCopyDisplayIdentifiers(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AssistantAppsSettingsController.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_4());

  __break(1u);
}

@end
