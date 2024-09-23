@implementation KSHardwareKeyboardKeyboardTypeRemapController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = -[KSHardwareKeyboardKeyboardTypeRemapController newSpecifiers](self, "newSpecifiers");
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *eventSystemClient;
  objc_super v4;

  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient)
    CFRelease(eventSystemClient);
  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  -[KSHardwareKeyboardKeyboardTypeRemapController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  -[KSHardwareKeyboardKeyboardTypeRemapController viewDidLoad](&v2, sel_viewDidLoad);
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v3;
  id v4;

  -[KSHardwareKeyboardKeyboardTypeRemapController specifiers](self, "specifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[KSHardwareKeyboardKeyboardTypeRemapController newSpecifiers](self, "newSpecifiers");
  -[KSHardwareKeyboardKeyboardTypeRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, objc_msgSend(v4, "count"), v3);

}

- (void)loadKeyboards
{
  KSHardwareKeyboardKeyboardTypeRemapController *v2;
  __IOHIDEventSystemClient *v3;
  void *v4;
  CFArrayRef v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KSHardwareKeyboardKeyboardTypeRemapController *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __IOHIDServiceClient *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __IOHIDServiceClient *v27;
  id v28;
  NSMutableArray *keyboards;
  NSMutableArray *v31;
  const __CFArray *obj;
  uint64_t v33;
  uint64_t v34;
  __IOHIDServiceClient *service;
  uint64_t i;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void *v59;
  id v60;
  id location;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = self;
  if (!self->_eventSystemClient)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v65[0] = CFSTR("DeviceUsagePage");
      v65[1] = CFSTR("DeviceUsage");
      v66[0] = &unk_251083A20;
      v66[1] = &unk_251083A38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDEventSystemClientSetMatching();
      v56 = MEMORY[0x24BDAC760];
      v57 = 3221225472;
      v58 = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke;
      v59 = &unk_251079918;
      objc_copyWeak(&v60, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v60);

      v2 = self;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v5 = IOHIDEventSystemClientCopyServices(v2->_eventSystemClient);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v34 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v53 != v33)
          objc_enumerationMutation(obj);
        service = *(__IOHIDServiceClient **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v37 = (void *)IOHIDServiceClientCopyProperty(service, CFSTR("DeviceUsagePairs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v6 = v37;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
          if (v7)
          {
            v8 = *(_QWORD *)v49;
            while (2)
            {
              for (j = 0; j != v7; ++j)
              {
                if (*(_QWORD *)v49 != v8)
                  objc_enumerationMutation(v6);
                v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v10, "objectForKey:", CFSTR("DeviceUsagePage"));
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "objectForKey:", CFSTR("DeviceUsage"));
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v11, "isEqual:", &unk_251083A20)
                    && objc_msgSend(v12, "isEqual:", &unk_251083A38))
                  {
                    IOHIDServiceClientGetRegistryID(service);
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "unsignedLongLongValue");
                    if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(CFSTR("KeyboardTypeCustomization"), CFSTR("com.apple.keyboard.preferences"), 0))
                    {
                      -[NSMutableArray addObject:](v31, "addObject:", service);
                    }
                    v43 = MEMORY[0x24BDAC760];
                    v44 = 3221225472;
                    v45 = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3;
                    v46 = &unk_251079918;
                    objc_copyWeak(&v47, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v47);

                    goto LABEL_26;
                  }

                }
              }
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
              if (v7)
                continue;
              break;
            }
          }
LABEL_26:

        }
      }
      v34 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v34);
  }

  v14 = self;
  if (-[NSMutableArray count](v31, "count"))
  {
    if (!self->_currentKeyboard || (-[NSMutableArray containsObject:](v31, "containsObject:") & 1) == 0)
    {
      BKSHIDKeyboardGetDeviceProperties();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = v31;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v40;
        while (2)
        {
          for (k = 0; k != v16; ++k)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v15);
            v19 = *(__IOHIDServiceClient **)(*((_QWORD *)&v39 + 1) + 8 * k);
            v20 = (void *)IOHIDServiceClientCopyProperty(v19, CFSTR("StandardType"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = objc_msgSend(v38, "standardType");
              if (v21 == objc_msgSend(v20, "intValue"))
              {
                self->_currentKeyboard = v19;

                goto LABEL_46;
              }
            }

          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v62, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_46:

      if (self->_currentKeyboard)
        goto LABEL_49;
      -[NSMutableArray firstObject](v15, "firstObject");
      v27 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      self->_currentKeyboard = v27;
LABEL_48:

LABEL_49:
      v14 = self;
    }
  }
  else
  {
    self->_currentKeyboard = 0;
    -[KSHardwareKeyboardKeyboardTypeRemapController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "viewControllers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "indexOfObject:", self);

    v14 = self;
    if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[KSHardwareKeyboardKeyboardTypeRemapController navigationController](self, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "viewControllers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", v24 - 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[KSHardwareKeyboardKeyboardTypeRemapController navigationController](self, "navigationController");
      v27 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      v28 = (id)-[__IOHIDServiceClient popToViewController:animated:](v27, "popToViewController:animated:", v38, 1);
      goto LABEL_48;
    }
  }
  keyboards = v14->_keyboards;
  v14->_keyboards = v31;

  objc_destroyWeak(&location);
}

void __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_2510798F0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersWithAnimation");
}

void __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_2510798F0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersWithAnimation");
}

- (id)newSpecifiers
{
  id v3;
  NSMutableArray *keyboards;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  keyboards = self->_keyboards;
  if (!keyboards)
  {
    -[KSHardwareKeyboardKeyboardTypeRemapController loadKeyboards](self, "loadKeyboards");
    keyboards = self->_keyboards;
  }
  if (-[NSMutableArray count](keyboards, "count"))
  {
    -[KSHardwareKeyboardKeyboardTypeRemapController keyboardsSectionSpecifiers](self, "keyboardsSectionSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    -[KSHardwareKeyboardKeyboardTypeRemapController keyboardTypeSectionSpecifiers](self, "keyboardTypeSectionSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  return v3;
}

- (id)keyboardsSectionSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __IOHIDServiceClient *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *obj;
  id obja;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((unint64_t)-[NSMutableArray count](self->_keyboards, "count") < 2)
  {
    self->_keysSectionStart = 0;
    return v3;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SELECT_KEYBOARD"), &stru_25107A038, CFSTR("Keyboard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    v41 = v3;
    v34 = v7;
    objc_msgSend(v3, "addObject:", v7);
    v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = self->_keyboards;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(obj);
          v12 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v46 + 1) + 8 * i), CFSTR("Product"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v40, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "integerValue");

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14 + 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKey:", v15, v12);

          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v9);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = self->_keyboards;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v16)
    {
      v17 = v16;
      v36 = 0;
      v37 = *MEMORY[0x24BE75AC0];
      obja = *(id *)v43;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(id *)v43 != obja)
            objc_enumerationMutation(v35);
          v19 = *(__IOHIDServiceClient **)(*((_QWORD *)&v42 + 1) + 8 * j);
          v20 = (void *)IOHIDServiceClientCopyProperty(v19, CFSTR("Product"));
          v21 = (void *)IOHIDServiceClientCopyProperty(v19, CFSTR("ProductID"));
          v22 = (void *)IOHIDServiceClientCopyProperty(v19, CFSTR("Transport"));
          v23 = v20;
          objc_opt_class();
          v24 = v23;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v40, "objectForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "integerValue");

            v24 = v23;
            if (v26 >= 2)
            {
              v27 = CFSTR("%@ (Smart Connector)");
              if ((objc_msgSend(v22, "isEqual:", CFSTR("AID")) & 1) != 0
                || (v27 = CFSTR("%@ (Bluetooth)"), (objc_msgSend(v22, "isEqual:", CFSTR("Bluetooth")) & 1) != 0)
                || (v27 = CFSTR("%@ (USB)"), v24 = v23, objc_msgSend(v22, "isEqual:", CFSTR("USB"))))
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "localizedStringForKey:value:table:", v27, &stru_25107A038, CFSTR("Keyboard"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v29, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
          }
          if (self->_currentKeyboard)
            v30 = v36 + j == -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:");
          else
            v30 = 0;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%d"), v23, v21, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, self, 0, 0, 0, 3, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setProperty:forKey:", v31, v37);
          objc_msgSend(v41, "addObject:", v32);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v36 += j;
      }
      while (v17);
    }

    self->_keysSectionStart = 1;
    return v41;
  }
}

- (id)keyboardTypeSectionSpecifiers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_currentKeyboard)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Keys"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = objc_msgSend(&unk_251083798, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      v7 = *MEMORY[0x24BE75AC0];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(&unk_251083798);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_25107A038, CFSTR("Keyboard"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 3, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setProperty:forKey:", v9, v7);
          objc_msgSend(v3, "addObject:", v13);

          ++v8;
        }
        while (v5 != v8);
        v5 = objc_msgSend(&unk_251083798, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  -[KSHardwareKeyboardKeyboardTypeRemapController tableView:cellForRowAtIndexPath:](&v12, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "section") == self->_keysSectionStart - 1)
  {
    if (self->_currentKeyboard)
      objc_msgSend(v7, "setChecked:", -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:") == objc_msgSend(v6, "row"));
  }
  else if (objc_msgSend(v6, "section") == self->_keysSectionStart)
  {
    IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unsignedLongLongValue");
    BKSHIDKeyboardGetDeviceProperties();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "standardType");
    if (v10 == -1)
      v10 = 2 * (objc_msgSend(v9, "countryCode") == 15);
    objc_msgSend(v7, "setChecked:", objc_msgSend(v6, "row") == v10);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __IOHIDServiceClient *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  v8 = self->_keysSectionStart - 1;
  v9 = objc_msgSend(v6, "row");
  if (v7 == v8)
  {
    if (v9 < -[NSMutableArray count](self->_keyboards, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_keyboards, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v10 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      self->_currentKeyboard = v10;

      -[KSHardwareKeyboardKeyboardTypeRemapController reloadSpecifiers](self, "reloadSpecifiers");
      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
    }
  }
  else
  {
    IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unsignedLongLongValue");
    BKSHIDServicesSetStandardType();
    -[KSHardwareKeyboardKeyboardTypeRemapController reloadSpecifiers](self, "reloadSpecifiers");
    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboards, 0);
}

@end
