@implementation ScheduleSettingsController

- (id)initForContentSize:(CGSize)a3
{
  ScheduleSettingsController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ScheduleSettingsController;
  v3 = -[ScheduleSettingsController init](&v6, sel_init, a3.width, a3.height);
  if (v3)
  {
    v3->_accountStore = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    v3->_isLowPowerMode = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "isLowPowerModeEnabled");
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__lowPowerModeChangedNotification_, *MEMORY[0x24BDD1160], 0);
  }
  return v3;
}

- (ScheduleSettingsController)init
{
  return (ScheduleSettingsController *)-[ScheduleSettingsController initForContentSize:](self, "initForContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)ScheduleSettingsController;
  -[ScheduleSettingsController dealloc](&v3, sel_dealloc);
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  _QWORD block[5];

  self->_isLowPowerMode = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo", a3), "isLowPowerModeEnabled");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ScheduleSettingsController__lowPowerModeChangedNotification___block_invoke;
  block[3] = &unk_24E147818;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __63__ScheduleSettingsController__lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  objc_class *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (uint64_t *)MEMORY[0x24BE75A18];
  if (!v4)
  {
    v6 = (objc_class *)(id)-[ScheduleSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("ScheduleSettings"), self);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;
    if (self->_isLowPowerMode)
    {
      objc_msgSend((id)-[objc_class specifierForID:](v6, "specifierForID:", CFSTR("ENABLE_PUSH")), "setProperty:forKey:", &unk_24E148B28, *v5);
      v7 = CFSTR("LPM_PUSH");
    }
    else
    {
      v7 = CFSTR("ENABLE_PUSH_TEXT");
    }
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v7, &stru_24E147A80, CFSTR("ScheduleSettings"));
    v9 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("pushSwitchGroup"));
    v10 = *MEMORY[0x24BE75A68];
    objc_msgSend(v9, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);
    LODWORD(v8) = objc_msgSend(v8, "_isNaturallyRTL");
    v11 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("pushSwitchGroup"));
    if ((_DWORD)v8)
      v12 = 2;
    else
      v12 = 0;
    v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
    v14 = *MEMORY[0x24BE75A28];
    objc_msgSend(v11, "setProperty:forKey:", v13, *MEMORY[0x24BE75A28]);
    v15 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("fetchGroup"));
    objc_msgSend(v15, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("WHEN_NOT_PUSHING_TEXT"), &stru_24E147A80, CFSTR("ScheduleSettings")), v10);
    v16 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("fetchGroup"));
    objc_msgSend(v16, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12), v14);
    v17 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("fetchGroup"));
    v18 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
    objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75860]);
    v19 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "mutableCopy");
    v20 = objc_msgSend(v19, "indexOfObject:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("accountsGroup")));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = (void *)objc_msgSend(-[ScheduleSettingsController _makeMCCSpecifiers](self, "_makeMCCSpecifiers"), "reverseObjectEnumerator");
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = v20 + 1;
      v25 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v21);
          objc_msgSend(v19, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v24);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v19;
    if ((-[ScheduleSettingsController getGroup:row:ofSpecifierID:](self, "getGroup:row:ofSpecifierID:", &self->_radioGroup, 0, CFSTR("radioGroup")) & 1) == 0)NSLog(CFSTR("Unable to find poll group"));
    -[ScheduleSettingsController _readScheduleSettings](self, "_readScheduleSettings");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    v5 = (uint64_t *)MEMORY[0x24BE75A18];
    if (self->_isLowPowerMode)
    {
      v27 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("15_MINUTES"));
      v28 = *v5;
      v29 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v27, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v5);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("30_MINUTES")), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("60_MINUTES")), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("AUTOMATICALLY")), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("MANUALLY")), "setProperty:forKey:", v29, v28);
      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
  }
  self->_fetchDividerRow = objc_msgSend(v4, "indexOfObject:", objc_msgSend(v4, "specifierForID:", CFSTR("FETCH_DIVIDER")));
  v30 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", CFSTR("FETCH_DIVIDER"));
  objc_msgSend(v30, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v5);
  return *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (id)_makeMCCSpecifiers
{
  void *v3;
  id v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)-[ACAccountStore allAccountTypes](self->_accountStore, "allAccountTypes");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (!-[ScheduleSettingsController isExcludedAccountType:](self, "isExcludedAccountType:", v7))
        {
          v8 = -[ACAccountStore accountsWithAccountType:](self->_accountStore, "accountsWithAccountType:", v7);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v20 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                v14 = -[ScheduleSettingsController _specifiersForMCCAccount:](self, "_specifiersForMCCAccount:", v13);
                if (objc_msgSend(v14, "count"))
                {
                  objc_msgSend(v3, "addObjectsFromArray:", v14);
                  objc_msgSend(v4, "addObject:", objc_msgSend(v13, "identifier"));
                }
              }
              v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v10);
          }
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }
  objc_msgSend(v4, "addObject:", *MEMORY[0x24BE71A58]);
  PCSettingsPurgeDictionariesExceptForCurrent();

  return v3;
}

- (BOOL)isExcludedAccountType:(id)a3
{
  uint64_t v4;

  if (isExcludedAccountType__onceToken != -1)
    dispatch_once(&isExcludedAccountType__onceToken, &__block_literal_global);
  v4 = objc_msgSend(a3, "identifier");
  if (v4)
    LOBYTE(v4) = objc_msgSend((id)isExcludedAccountType__excludedAccountTypeIdentifiers, "containsObject:", objc_msgSend(a3, "identifier"));
  return v4;
}

uint64_t __52__ScheduleSettingsController_isExcludedAccountType___block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x24BDB4118], 0);
  isExcludedAccountType__excludedAccountTypeIdentifiers = result;
  return result;
}

- (id)_specifiersForMCCAccount:(id)a3
{
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (objc_msgSend(a3, "parentAccount"))
    return v5;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_msgSend(a3, "enabledDataclasses", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
    return v5;
  v9 = v8;
  v10 = *(_QWORD *)v17;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if (ScheduleSettingsDataclassIsFetchy_onceToken == -1)
      {
        if (!v12)
          goto LABEL_11;
      }
      else
      {
        dispatch_once(&ScheduleSettingsDataclassIsFetchy_onceToken, &__block_literal_global_166);
        if (!v12)
          goto LABEL_11;
      }
      if ((objc_msgSend((id)ScheduleSettingsDataclassIsFetchy_fetchyDataclassSet, "containsObject:", v12) & 1) != 0)
      {
        v14 = (void *)objc_msgSend(a3, "enabledDataclasses");
        v15 = objc_msgSend(a3, "supportsPush");
        if (objc_msgSend(v14, "count"))
          objc_msgSend(v5, "addObject:", -[ScheduleSettingsController _specifierForMCCAccount:dataclasses:canPush:canFetch:canManual:](self, "_specifierForMCCAccount:dataclasses:canPush:canFetch:canManual:", a3, objc_msgSend(v14, "allObjects"), v15, 1, 1));
        return v5;
      }
LABEL_11:
      ++v11;
    }
    while (v9 != v11);
    v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v9 = v13;
    if (v13)
      continue;
    return v5;
  }
}

- (id)_specifierForMCCAccount:(id)a3 dataclasses:(id)a4 canPush:(BOOL)a5 canFetch:(BOOL)a6 canManual:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  char *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v19[3] = *MEMORY[0x24BDAC8D0];
  v13 = (char *)objc_msgSend(MEMORY[0x24BE00EE0], "specifierWithStyle:account:detailControllerClass:presentationStyle:", 3, a3, objc_opt_class(), 1);
  v19[0] = a4;
  v18[0] = CFSTR("ScheduleSettingsDataclassesKey");
  v18[1] = CFSTR("ScheduleSettingsAccountUniqueIdentifierKey");
  v18[2] = CFSTR("ScheduleSettingsAccountKey");
  v19[1] = objc_msgSend(a3, "identifier");
  v19[2] = a3;
  objc_msgSend(v13, "setUserInfo:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  objc_msgSend(v13, "setTarget:", self);
  *(_QWORD *)&v13[*MEMORY[0x24BE75750]] = sel__mccSchedule_;
  *(_QWORD *)&v13[*MEMORY[0x24BE75760]] = sel__setMCCSchedule_specifier_;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v9 && !self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PUSH"), &stru_24E147A80, CFSTR("ScheduleSettings")));
    if (!v8)
      goto LABEL_7;
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  if (!self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("FETCH"), &stru_24E147A80, CFSTR("ScheduleSettings")));
  }
LABEL_7:
  if (v7 && !self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MANUAL"), &stru_24E147A80, CFSTR("ScheduleSettings")));
  }
  if (self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("LOW_POWER"), &stru_24E147A80, CFSTR("ScheduleSettings")));
  }
  objc_msgSend(v13, "setValues:titles:", v14, v15);
  if (self->_isLowPowerMode)
    v16 = &unk_24E148B28;
  else
    v16 = &unk_24E148B40;
  objc_msgSend(v13, "setProperty:forKey:", v16, *MEMORY[0x24BE75A18]);

  return v13;
}

- (int)styleForAccount:(id)a3 uniqueIdentifier:(id)a4
{
  int result;

  if (!a4)
    return objc_msgSend(a3, "supportsPush") ^ 1;
  result = _PCSettingsGetStyle();
  if (!result)
    return objc_msgSend(a3, "supportsPush") ^ 1;
  return result;
}

- (id)_mccSchedule:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("ScheduleSettingsAccountKey"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("ScheduleSettingsAccountUniqueIdentifierKey"));
  v7 = (void *)MEMORY[0x24BDD16E0];
  if (self->_isLowPowerMode)
    v8 = 2;
  else
    v8 = -[ScheduleSettingsController styleForAccount:uniqueIdentifier:](self, "styleForAccount:uniqueIdentifier:", v5, v6);
  return (id)objc_msgSend(v7, "numberWithLong:", v8);
}

- (void)_setMCCSchedule:(id)a3 specifier:(id)a4
{
  uint64_t v7;
  int v8;

  v7 = objc_msgSend((id)objc_msgSend(a4, "userInfo"), "objectForKey:", CFSTR("ScheduleSettingsAccountUniqueIdentifierKey"));
  v8 = objc_msgSend(a3, "intValue");
  if (v7 && objc_msgSend(-[ScheduleSettingsController _mccSchedule:](self, "_mccSchedule:", a4), "longValue") != v8)
    PCSettingsSetStyle();
  objc_msgSend((id)-[ScheduleSettingsController table](self, "table"), "reloadData");
}

- (void)_readScheduleSettings
{
  int ClassPollInterval;
  PSSpecifier *checkedSpecifier;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ClassPollInterval = PCSettingsGetClassPollInterval();

  self->_checkedSpecifier = 0;
  if (!self->_isLowPowerMode)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (int)*MEMORY[0x24BE756E0];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(v11, "propertyForKey:", CFSTR("interval"));
        if (v12)
        {
          if (objc_msgSend(v12, "integerValue") == ClassPollInterval)
            break;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_12;
        }
      }
      checkedSpecifier = v11;
      self->_checkedSpecifier = checkedSpecifier;
      if (checkedSpecifier)
        goto LABEL_16;
    }
    else
    {
LABEL_12:
      checkedSpecifier = self->_checkedSpecifier;
      if (checkedSpecifier)
        goto LABEL_16;
    }
    checkedSpecifier = (PSSpecifier *)(id)-[ScheduleSettingsController specifierForID:](self, "specifierForID:", CFSTR("MANUALLY"));
    self->_checkedSpecifier = checkedSpecifier;
    goto LABEL_16;
  }
  checkedSpecifier = (PSSpecifier *)(id)-[ScheduleSettingsController specifierForID:](self, "specifierForID:", CFSTR("MANUALLY"));
  self->_checkedSpecifier = checkedSpecifier;
  v5 = (int)*MEMORY[0x24BE756E0];
LABEL_16:
  self->_rowToSelect = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "indexOfObject:", checkedSpecifier);
  -[ScheduleSettingsController updateRadioGroupText](self, "updateRadioGroupText");
}

- (id)pushEnabled:(id)a3
{
  if (self->_isLowPowerMode)
    return &unk_24E148B28;
  else
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PCSettingsGetClassPushEnabled() != 0);
}

- (void)setPushEnabled:(id)a3 specifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  PCSettingsSetClassPushEnabled();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]), "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
}

- (void)setPollInterval:(id)a3 specifier:(id)a4
{
  PSSpecifier *checkedSpecifier;
  void *v7;
  PSSpecifier *v8;

  checkedSpecifier = self->_checkedSpecifier;
  if (checkedSpecifier != a4)
  {
    v7 = (void *)-[PSSpecifier propertyForKey:](checkedSpecifier, "propertyForKey:", *MEMORY[0x24BE75D18]);
    objc_msgSend(v7, "setChecked:", 0);
    objc_msgSend(v7, "setValue:", 0);

    v8 = (PSSpecifier *)a4;
    self->_checkedSpecifier = v8;
    self->_rowToSelect = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "indexOfObject:", v8);
    objc_msgSend((id)-[PSSpecifier propertyForKey:](self->_checkedSpecifier, "propertyForKey:", CFSTR("interval")), "intValue");
    PCSettingsSetClassPollInterval();
    -[ScheduleSettingsController updateRadioGroupText](self, "updateRadioGroupText");
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]), "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
  }
}

- (void)updateRadioGroupText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[ScheduleSettingsController specifierForID:](self, "specifierForID:", CFSTR("radioGroup"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)-[PSSpecifier propertyForKey:](self->_checkedSpecifier, "propertyForKey:", CFSTR("interval"));
    if (v5 && !objc_msgSend(v5, "integerValue"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_msgSend(v6, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E147A80, CFSTR("ScheduleSettings"));
      v8 = objc_msgSend(v7, "_isNaturallyRTL");
      objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);
      if (v8)
        v9 = 2;
      else
        v9 = 0;
      v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
      objc_msgSend(v4, "setProperty:forKey:", v10, *MEMORY[0x24BE75A28]);
      v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
      objc_msgSend(v4, "setProperty:forKey:", v11, *MEMORY[0x24BE75860]);
    }
    else
    {
      objc_msgSend(v4, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
    }
    -[ScheduleSettingsController reloadSpecifier:](self, "reloadSpecifier:", v4);
  }
}

- (void)listItemSelected:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int *v8;
  int *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:");
  v6 = (char *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  if (-[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (int)*MEMORY[0x24BE75700];
    if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "cellForRowAtIndexPath:", -[ScheduleSettingsController indexPathForIndex:](self, "indexPathForIndex:")), "setChecked:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "cellForRowAtIndexPath:", a3), "setChecked:", 1);
  }
  v8 = (int *)MEMORY[0x24BE75760];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE75760]])
  {
    v9 = (int *)MEMORY[0x24BE75768];
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v6, "values");
      v11 = objc_msgSend(v10, "count");
      v12 = *(void **)&v6[*v9];
      v13 = *(_QWORD *)&v6[*v8];
      if (v11)
        v14 = objc_msgSend(v10, "objectAtIndex:", 0);
      else
        v14 = objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75D50]);
      objc_msgSend(v12, "performSelector:withObject:withObject:", v13, v14, v6);
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ScheduleSettingsController;
  v6 = -[ScheduleSettingsController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:", a4);
  if (v7 == self->_fetchDividerRow)
    -[ScheduleSettingsController configureFetchDividerCell:atIndexPath:](self, "configureFetchDividerCell:atIndexPath:", v6, a4);
  if ((objc_msgSend(v6, "tag") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v6, "setChecked:", v7 == self->_rowToSelect);
    objc_msgSend(v6, "setCellAction:", sel_listItemSelected_);
    objc_msgSend(v6, "setCellTarget:", self);
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  int64_t fetchDividerRow;

  v7 = -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:", a5);
  fetchDividerRow = self->_fetchDividerRow;
  if (v7 == fetchDividerRow || v7 + 1 == fetchDividerRow)
    objc_msgSend(a4, "_setShouldHaveFullLengthBottomSeparator:", 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  objc_super v8;

  v7 = -[ScheduleSettingsController specifierAtIndex:](self, "specifierAtIndex:", -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:", a4));
  if (*(_QWORD *)(v7 + (int)*MEMORY[0x24BE75738]) == 3)
  {
    -[ScheduleSettingsController listItemSelected:](self, "listItemSelected:", a4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ScheduleSettingsController;
    -[ScheduleSettingsController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
  }
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void)configureFetchDividerCell:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend((id)objc_msgSend(a3, "contentView"), "frame");
  v6 = (void *)objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "setContentMode:", 4);
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "tableSeparatorLightColor"));
  objc_msgSend((id)objc_msgSend(a3, "contentView"), "addSubview:", v6);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v6;
  double v7;
  uint64_t v8;
  double result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ScheduleSettingsController;
  -[ScheduleSettingsController tableView:heightForRowAtIndexPath:](&v10, sel_tableView_heightForRowAtIndexPath_, a3);
  v7 = v6;
  v8 = -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:", a4);
  result = 1.0;
  if (v8 != self->_fetchDividerRow)
    return v7;
  return result;
}

@end
