@implementation AssistantIntentsController

- (AssistantIntentsController)init
{
  AssistantIntentsController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantIntentsController;
  v2 = -[AssistantIntentsController init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)tccPreferencesChangedCallback, CFSTR("com.apple.tcc.access.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.tcc.access.changed"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AssistantIntentsController;
  -[AssistantIntentsController dealloc](&v4, sel_dealloc);
}

- (void)tccPreferencesChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantIntentsController_tccPreferencesChanged__block_invoke;
  v2[3] = &unk_24D33CC08;
  v2[4] = self;
  -[AssistantIntentsController _fetchIntentsSpecifiersWithCompletion:](self, "_fetchIntentsSpecifiersWithCompletion:", v2);
}

void __51__AssistantIntentsController_tccPreferencesChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(*(id *)(a1 + 32), "intentsSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 == v6 && objc_msgSend(v3, "count"))
  {
    v7 = 0;
    v8 = 0;
    v9 = *MEMORY[0x24BE75DA0];
    do
    {
      while (1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "propertyForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "intentsSpecifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "propertyForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v14)
          break;
        objc_msgSend(*(id *)(a1 + 32), "intentsSpecifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "propertyForKey:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setProperty:forKey:", v18, v9);

        ++v7;
        v8 = 1;
        if (objc_msgSend(v3, "count") <= v7)
          goto LABEL_10;
      }
      ++v7;
    }
    while (objc_msgSend(v3, "count") > v7);
    if ((v8 & 1) == 0)
      goto LABEL_11;
LABEL_10:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__AssistantIntentsController_tccPreferencesChanged__block_invoke_2;
    block[3] = &unk_24D33CBE0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
LABEL_11:

}

uint64_t __51__AssistantIntentsController_tccPreferencesChanged__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id from;
  id location;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[AssistantIntentsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Assistant_Intents"), self);
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;

    if (self->_intentsSpecifiers)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "arrayByAddingObjectsFromArray:");
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __40__AssistantIntentsController_specifiers__block_invoke;
      v10[3] = &unk_24D33CC58;
      objc_copyWeak(&v11, &from);
      objc_copyWeak(&v12, &location);
      -[AssistantIntentsController _fetchIntentsSpecifiersWithCompletion:](self, "_fetchIntentsSpecifiersWithCompletion:", v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

void __40__AssistantIntentsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIntentsSpecifiers:", v3);

  if (objc_msgSend(v3, "count"))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__AssistantIntentsController_specifiers__block_invoke_2;
      block[3] = &unk_24D33CC30;
      objc_copyWeak(&v10, v4);
      v8 = v3;
      v9 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v10);
    }

  }
}

void __40__AssistantIntentsController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "insertContiguousSpecifiers:afterSpecifier:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AssistantIntentsController__fetchIntentsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_24D33CC80;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[IntentsUtilities intentsAppsWithCompletion:](IntentsUtilities, "intentsAppsWithCompletion:", v6);

}

void __68__AssistantIntentsController__fetchIntentsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v23 = a1;
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APPS_GROUP"));
    v22 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v21 = *(_QWORD *)v25;
      v20 = *MEMORY[0x24BE75B70];
      v7 = *MEMORY[0x24BDBD270];
      v8 = *MEMORY[0x24BE75B88];
      v9 = *MEMORY[0x24BE75DA0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v11, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, *(_QWORD *)(v23 + 32), sel_setAccess_forSpecifier_, sel_accesssForSpecifier_, 0, 6, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "appID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProperty:forKey:", v15, v20);

          objc_msgSend(v14, "setProperty:forKey:", v7, v8);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "accessGranted"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProperty:forKey:", v16, v9);

          objc_msgSend(v11, "appID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProperty:forKey:", v17, CFSTR("intentsAppID"));

          objc_msgSend(v22, "addObject:", v14);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }

    (*(void (**)(void))(*(_QWORD *)(v23 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = *MEMORY[0x24BE75DA0];
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "propertyForKey:", CFSTR("intentsAppID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", objc_msgSend(v10, "BOOLValue"), v9);
    objc_msgSend(v5, "setProperty:forKey:", v10, v6);

  }
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (void)viewDidTapLearnMore:(id)a3
{
  SiriAboutAssistantModalViewController *v4;

  v4 = objc_alloc_init(SiriAboutAssistantModalViewController);
  -[SiriModalTextViewController presentFromParentViewController:](v4, "presentFromParentViewController:", self);

}

- (NSArray)intentsSpecifiers
{
  return self->_intentsSpecifiers;
}

- (void)setIntentsSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_intentsSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsSpecifiers, 0);
}

@end
