@implementation TIHardwareKeyboardKeyboardTypeRemapController

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
    v5 = -[TIHardwareKeyboardKeyboardTypeRemapController newSpecifiers](self, "newSpecifiers");
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
  v4.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  -[TIHardwareKeyboardKeyboardTypeRemapController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  -[TIHardwareKeyboardKeyboardTypeRemapController viewDidLoad](&v2, sel_viewDidLoad);
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v3;
  id v4;

  -[TIHardwareKeyboardKeyboardTypeRemapController specifiers](self, "specifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TIHardwareKeyboardKeyboardTypeRemapController newSpecifiers](self, "newSpecifiers");
  -[TIHardwareKeyboardKeyboardTypeRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, objc_msgSend(v4, "count"), v3);

}

- (void)loadKeyboards
{
  __IOHIDEventSystemClient *v3;
  void *v4;
  CFArrayRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __IOHIDServiceClient *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TIHardwareKeyboardKeyboardTypeRemapController *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __IOHIDServiceClient *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __IOHIDServiceClient *v36;
  id v37;
  NSMutableArray *keyboards;
  TIHardwareKeyboardKeyboardTypeRemapController *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFArray *obj;
  __IOHIDServiceClient *service;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  id v67;
  id location;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  if (!self->_eventSystemClient)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v72[0] = CFSTR("DeviceUsagePage");
      v72[1] = CFSTR("DeviceUsage");
      v73[0] = &unk_24E73E408;
      v73[1] = &unk_24E73E420;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDEventSystemClientSetMatching();
      v63 = MEMORY[0x24BDAC760];
      v64 = 3221225472;
      v65 = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke;
      v66 = &unk_24E7324B0;
      objc_copyWeak(&v67, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v67);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = self;
  v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v5 = IOHIDEventSystemClientCopyServices(self->_eventSystemClient);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v6 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v60;
    v41 = *(_QWORD *)v60;
    do
    {
      v9 = 0;
      v42 = v7;
      do
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(obj);
        v10 = *(__IOHIDServiceClient **)(*((_QWORD *)&v59 + 1) + 8 * v9);
        v11 = (void *)IOHIDServiceClientCopyProperty(v10, CFSTR("DeviceUsagePairs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          service = v10;
          v45 = v11;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v56;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v56 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v17, "objectForKey:", CFSTR("DeviceUsagePage"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", CFSTR("DeviceUsage"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v18, "isEqual:", &unk_24E73E408)
                    && objc_msgSend(v19, "isEqual:", &unk_24E73E420))
                  {
                    IOHIDServiceClientGetRegistryID(service);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "unsignedLongLongValue");
                    if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(CFSTR("KeyboardTypeCustomization"), CFSTR("com.apple.keyboard.preferences"), 0))
                    {
                      -[NSMutableArray addObject:](v40, "addObject:", service, v39);
                    }
                    v50 = MEMORY[0x24BDAC760];
                    v51 = 3221225472;
                    v52 = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3;
                    v53 = &unk_24E7324B0;
                    objc_copyWeak(&v54, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v54);

                    goto LABEL_26;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_26:

          v8 = v41;
          v7 = v42;
          v11 = v45;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](v40, "count"))
  {
    v21 = v39;
    if (!v39->_currentKeyboard || (-[NSMutableArray containsObject:](v40, "containsObject:") & 1) == 0)
    {
      BKSHIDKeyboardGetDeviceProperties();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v23 = v40;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v47;
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v47 != v26)
              objc_enumerationMutation(v23);
            v28 = *(__IOHIDServiceClient **)(*((_QWORD *)&v46 + 1) + 8 * j);
            v29 = (void *)IOHIDServiceClientCopyProperty(v28, CFSTR("StandardType"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = objc_msgSend(v22, "standardType");
              if (v30 == objc_msgSend(v29, "intValue"))
              {
                v39->_currentKeyboard = v28;

                goto LABEL_46;
              }
            }

          }
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
          if (v25)
            continue;
          break;
        }
      }
LABEL_46:

      v21 = v39;
      if (v39->_currentKeyboard)
        goto LABEL_49;
      -[NSMutableArray firstObject](v23, "firstObject");
      v36 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      v39->_currentKeyboard = v36;
LABEL_48:

LABEL_49:
    }
  }
  else
  {
    v21 = v39;
    v39->_currentKeyboard = 0;
    -[TIHardwareKeyboardKeyboardTypeRemapController navigationController](v39, "navigationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "viewControllers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "indexOfObject:", v39);

    if (v33 && v33 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIHardwareKeyboardKeyboardTypeRemapController navigationController](v39, "navigationController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "viewControllers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndex:", v33 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIHardwareKeyboardKeyboardTypeRemapController navigationController](v39, "navigationController");
      v36 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      v37 = (id)-[__IOHIDServiceClient popToViewController:animated:](v36, "popToViewController:animated:", v22, 1);
      goto LABEL_48;
    }
  }
  keyboards = v21->_keyboards;
  v21->_keyboards = v40;

  objc_destroyWeak(&location);
}

void __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke(uint64_t a1)
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
    block[2] = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_24E7321B8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersWithAnimation");
}

void __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
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
    block[2] = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_24E7321B8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
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
    -[TIHardwareKeyboardKeyboardTypeRemapController loadKeyboards](self, "loadKeyboards");
    keyboards = self->_keyboards;
  }
  if (-[NSMutableArray count](keyboards, "count"))
  {
    -[TIHardwareKeyboardKeyboardTypeRemapController keyboardsSectionSpecifiers](self, "keyboardsSectionSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    -[TIHardwareKeyboardKeyboardTypeRemapController keyboardTypeSectionSpecifiers](self, "keyboardTypeSectionSpecifiers");
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
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SELECT_KEYBOARD"), &stru_24E732B90, CFSTR("Keyboard"));
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
                objc_msgSend(v28, "localizedStringForKey:value:table:", v27, &stru_24E732B90, CFSTR("Keyboard"));
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
    v4 = objc_msgSend(&unk_24E73E078, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
            objc_enumerationMutation(&unk_24E73E078);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_24E732B90, CFSTR("Keyboard"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 3, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setProperty:forKey:", v9, v7);
          objc_msgSend(v3, "addObject:", v13);

          ++v8;
        }
        while (v5 != v8);
        v5 = objc_msgSend(&unk_24E73E078, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
  v12.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  -[TIHardwareKeyboardKeyboardTypeRemapController tableView:cellForRowAtIndexPath:](&v12, sel_tableView_cellForRowAtIndexPath_, a3, v6);
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

      -[TIHardwareKeyboardKeyboardTypeRemapController reloadSpecifiers](self, "reloadSpecifiers");
      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
    }
  }
  else
  {
    IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unsignedLongLongValue");
    BKSHIDServicesSetStandardType();
    -[TIHardwareKeyboardKeyboardTypeRemapController reloadSpecifiers](self, "reloadSpecifiers");
    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboards, 0);
}

@end
