@implementation TIHardwareKeyboardModifierRemapController

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
    v5 = -[TIHardwareKeyboardModifierRemapController newSpecifiers](self, "newSpecifiers");
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)subtitleForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIHardwareKeyboardModifierRemapController valueForRemappingKey:](self, "valueForRemappingKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  attributedTitleForKey(v5, self->_currentKeyboard, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *eventSystemClient;
  objc_super v4;

  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient)
    CFRelease(eventSystemClient);
  v4.receiver = self;
  v4.super_class = (Class)TIHardwareKeyboardModifierRemapController;
  -[TIHardwareKeyboardModifierRemapController dealloc](&v4, sel_dealloc);
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v3;
  id v4;

  -[TIHardwareKeyboardModifierRemapController specifiers](self, "specifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TIHardwareKeyboardModifierRemapController newSpecifiers](self, "newSpecifiers");
  -[TIHardwareKeyboardModifierRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, objc_msgSend(v4, "count"), v3);

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
  TIHardwareKeyboardModifierRemapController *v20;
  __IOHIDServiceClient *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSMutableArray *keyboards;
  TIHardwareKeyboardModifierRemapController *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFArray *obj;
  __IOHIDServiceClient *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id location;
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[5];

  v55[2] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  if (!self->_eventSystemClient)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v54[0] = CFSTR("DeviceUsagePage");
      v54[1] = CFSTR("DeviceUsage");
      v55[0] = &unk_24E73E1F8;
      v55[1] = &unk_24E73E210;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDEventSystemClientSetMatching();
      v46 = MEMORY[0x24BDAC760];
      v47 = 3221225472;
      v48 = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke;
      v49 = &unk_24E7324B0;
      objc_copyWeak(&v50, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v50);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  v5 = IOHIDEventSystemClientCopyServices(self->_eventSystemClient);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v6 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    v32 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      v33 = v7;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(obj);
        v10 = *(__IOHIDServiceClient **)(*((_QWORD *)&v42 + 1) + 8 * v9);
        v11 = (void *)IOHIDServiceClientCopyProperty(v10, CFSTR("DeviceUsagePairs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = v10;
          v36 = v11;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v39;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v39 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v17, "objectForKey:", CFSTR("DeviceUsagePage"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", CFSTR("DeviceUsage"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v18, "isEqual:", &unk_24E73E1F8)
                    && objc_msgSend(v19, "isEqual:", &unk_24E73E210))
                  {
                    -[NSMutableArray addObject:](v31, "addObject:", v35);
                    objc_copyWeak(&v37, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v37);

                    goto LABEL_23;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_23:

          v8 = v32;
          v7 = v33;
          v11 = v36;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](v31, "count"))
  {
    v20 = v30;
    if (!v30->_currentKeyboard || (-[NSMutableArray containsObject:](v31, "containsObject:") & 1) == 0)
    {
      -[NSMutableArray firstObject](v31, "firstObject");
      v21 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      v30->_currentKeyboard = v21;
LABEL_33:

    }
  }
  else
  {
    v20 = v30;
    v30->_currentKeyboard = 0;
    -[TIHardwareKeyboardModifierRemapController navigationController](v30, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "viewControllers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "indexOfObject:", v30);

    if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIHardwareKeyboardModifierRemapController navigationController](v30, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "viewControllers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", v24 - 1);
      v21 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();

      -[TIHardwareKeyboardModifierRemapController navigationController](v30, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v27, "popToViewController:animated:", v21, 1);

      goto LABEL_33;
    }
  }
  keyboards = v20->_keyboards;
  v20->_keyboards = v31;

  objc_destroyWeak(&location);
}

void __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke(uint64_t a1)
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
    block[2] = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_24E7321B8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersWithAnimation");
}

void __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
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
    block[2] = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_24E7321B8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiersWithAnimation");
}

- (void)resetRemapping
{
  -[NSMutableDictionary removeAllObjects](self->_remapping, "removeAllObjects");
  -[TIHardwareKeyboardModifierRemapController saveRemapping](self, "saveRemapping");
  -[TIHardwareKeyboardModifierRemapController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)loadRemapping
{
  NSMutableDictionary *v2;
  NSMutableDictionary *remapping;
  __IOHIDServiceClient *currentKeyboard;
  void *v5;
  id v6;
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
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (initializeDictionaries_onceToken != -1)
    dispatch_once(&initializeDictionaries_onceToken, &__block_literal_global_2);
  -[TIHardwareKeyboardModifierRemapController loadKeyboards](self, "loadKeyboards");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  remapping = self->_remapping;
  self->_remapping = v2;

  currentKeyboard = self->_currentKeyboard;
  if (currentKeyboard)
  {
    v5 = (void *)IOHIDServiceClientCopyProperty(currentKeyboard, CFSTR("HIDKeyboardModifierMappingPairs"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = (void *)_keyCodeToKey;
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HIDKeyboardModifierMappingSrc"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = (void *)_keyCodeToKey;
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HIDKeyboardModifierMappingDst"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
                v18 = v17 == 0;
              else
                v18 = 1;
              if (!v18)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remapping, "setObject:forKeyedSubscript:", v17, v14);
                }
              }

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v8);
      }

    }
  }
}

- (void)saveRemapping
{
  TIHardwareKeyboardModifierRemapController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  __IOHIDServiceClient *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  TIHardwareKeyboardModifierRemapController *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSMutableDictionary *obj;
  id obja;
  CFTypeRef property;
  CFTypeRef propertya;
  id v56;
  NSMutableArray *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (self->_currentKeyboard)
  {
    v2 = self;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v2->_remapping;
    v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v63;
      v6 = CFSTR("HIDKeyboardModifierMappingSrc");
      v7 = CFSTR("HIDKeyboardModifierMappingDst");
      v8 = 0x24BDBC000uLL;
      v48 = v2;
      v45 = *(_QWORD *)v63;
      do
      {
        v9 = 0;
        v50 = v4;
        do
        {
          if (*(_QWORD *)v63 != v5)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v9);
          -[NSMutableDictionary objectForKeyedSubscript:](v2->_remapping, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
          {
            v56 = v9;
            objc_msgSend((id)_keyToKeyCode, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            property = v11;
            objc_msgSend((id)_keyToKeyCode, "objectForKeyedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v8;
            v15 = v7;
            v16 = v6;
            if (objc_msgSend(v12, "count"))
            {
              v17 = 0;
              do
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v13, "count");
                if (v17 >= v19 - 1)
                  v20 = v19 - 1;
                else
                  v20 = v17;
                objc_msgSend(v13, "objectAtIndexedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v67[0] = v16;
                v67[1] = v15;
                v68[0] = v18;
                v68[1] = v21;
                objc_msgSend(*(id *)(v14 + 3696), "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "addObject:", v22);

                ++v17;
              }
              while (v17 < objc_msgSend(v12, "count"));
            }

            v2 = v48;
            v5 = v45;
            v4 = v50;
            v6 = v16;
            v7 = v15;
            v8 = v14;
            v11 = (void *)property;
            v9 = v56;
          }

          v9 = (char *)v9 + 1;
        }
        while (v9 != (id)v4);
        v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v4);
    }

    v23 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, CFSTR("ProductID"));
    v24 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, CFSTR("VendorID"));
    v25 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, CFSTR("HIDVirtualDevice"));
    BKSHIDServicesProductIdentifierFromServiceProperties();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v47 = v25;
      v51 = v24;
      obja = v23;
      v28 = v26;
      v29 = v49;
      v30 = (const __CFString *)*MEMORY[0x24BE0B5E8];
      v31 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BE0B5E8], CFSTR("com.apple.keyboard.preferences"));
      if (v31)
      {
        v32 = v31;
        v33 = (void *)objc_msgSend(v31, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v46 = v27;
      if (objc_msgSend(v29, "count"))
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v29, v28);
      else
        objc_msgSend(v33, "removeObjectForKey:", v28);
      v35 = (void *)objc_msgSend(v33, "copy");

      CFPreferencesSetAppValue(v30, v35, CFSTR("com.apple.keyboard.preferences"));
      propertya = v29;

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v57 = v2->_keyboards;
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v59 != v38)
              objc_enumerationMutation(v57);
            v40 = *(__IOHIDServiceClient **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v41 = (void *)IOHIDServiceClientCopyProperty(v40, CFSTR("ProductID"));
            v42 = (void *)IOHIDServiceClientCopyProperty(v40, CFSTR("VendorID"));
            v43 = (void *)IOHIDServiceClientCopyProperty(v40, CFSTR("HIDVirtualDevice"));
            BKSHIDServicesProductIdentifierFromServiceProperties();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v28, "isEqual:", v44))
            {
              if (!IOHIDServiceClientSetProperty(v40, CFSTR("HIDKeyboardModifierMappingPairs"), propertya))
                NSLog(CFSTR("Error: Can not save modifier key mapping."));
            }

          }
          v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v37);
      }

      v34 = v49;
      v24 = v51;
      v23 = obja;
      v27 = v46;
      v25 = v47;
    }
    else
    {
      NSLog(CFSTR("Can not save remapping: keyboardIdentifier is nil."));
      v34 = v49;
    }

  }
}

- (id)valueForRemappingKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_remapping, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v4;

  return v5;
}

- (void)setRemappingFromKey:(id)a3 toValue:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remapping, "setObject:forKeyedSubscript:", a4, a3);
  -[TIHardwareKeyboardModifierRemapController saveRemapping](self, "saveRemapping");
  -[TIHardwareKeyboardModifierRemapController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)newSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TIHardwareKeyboardModifierRemapController loadRemapping](self, "loadRemapping");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSMutableArray count](self->_keyboards, "count"))
  {
    -[TIHardwareKeyboardModifierRemapController keyboardsSectionSpecifiers](self, "keyboardsSectionSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    -[TIHardwareKeyboardModifierRemapController keysSectionSpecifiers](self, "keysSectionSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Restore Defaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MODIFIER_KEYS_RESTORE_DEFAULTS"), &stru_24E732B90, CFSTR("Keyboard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 13, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setButtonAction:", sel_resetRemapping);
    objc_msgSend(v3, "addObject:", v10);

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
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, self, 0, 0, objc_opt_class(), 3, 0);
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

- (id)keysSectionSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  __IOHIDServiceClient *currentKeyboard;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_currentKeyboard)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Keys"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MODIFIER_KEYS_FOOTER_TEXT"), &stru_24E732B90, CFSTR("Keyboard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

    v36 = v3;
    objc_msgSend(v38, "addObject:", v3);
    currentKeyboard = self->_currentKeyboard;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (currentKeyboard)
    {
      v8 = (void *)IOHIDServiceClientCopyProperty(currentKeyboard, CFSTR("Keyboard"));
      v9 = 0x24BDBC000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Elements"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = v10;
          v35 = v8;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v44;
            v37 = v11;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v44 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Usage"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UsagePage"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v19 = v9;
                      v20 = objc_msgSend(v17, "unsignedLongLongValue");
                      v21 = v20 | (objc_msgSend(v18, "unsignedLongLongValue") << 32);
                      v22 = (void *)_keyCodeToKey;
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "objectForKeyedSubscript:", v23);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v24)
                        objc_msgSend(v7, "addObject:", v24);

                      v9 = v19;
                      v11 = v37;
                    }
                  }

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
            }
            while (v13);
          }

          v10 = v34;
          v8 = v35;
        }

      }
    }
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = (id)_srcKeys;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      v29 = *MEMORY[0x24BE75AC0];
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          if (objc_msgSend(v7, "containsObject:", v31))
          {
            objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, objc_opt_class(), 2, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setProperty:forKey:", v31, v29);
            objc_msgSend(v38, "addObject:", v32);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v27);
    }

  }
  return v38;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TIHardwareKeyboardModifierRemapController;
  -[TIHardwareKeyboardModifierRemapController tableView:cellForRowAtIndexPath:](&v15, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "section") == self->_keysSectionStart - 1)
  {
    if (self->_currentKeyboard)
      objc_msgSend(v7, "setChecked:", -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:") == objc_msgSend(v6, "row"));
  }
  else if (objc_msgSend(v6, "section") == self->_keysSectionStart)
  {
    -[TIHardwareKeyboardModifierRemapController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    attributedTitleForKey(v9, self->_currentKeyboard, CFSTR(" Key"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v10);

    -[TIHardwareKeyboardModifierRemapController subtitleForSpecifier:](self, "subtitleForSpecifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedText:", v12);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  __IOHIDServiceClient *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == self->_keysSectionStart - 1)
  {
    v8 = objc_msgSend(v7, "row");
    if (v8 < -[NSMutableArray count](self->_keyboards, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_keyboards, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v9 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      self->_currentKeyboard = v9;

      -[TIHardwareKeyboardModifierRemapController reloadSpecifiers](self, "reloadSpecifiers");
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIHardwareKeyboardModifierRemapController;
    -[TIHardwareKeyboardModifierRemapController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remapping, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
}

@end
