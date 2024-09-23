@implementation AXCCShortcutModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id location;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];
  _QWORD v63[14];
  __int128 buf;
  Class (*v65)(uint64_t);
  void *v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)AXCCShortcutModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v57, sel_viewDidLoad);
  self->_suppressGuidedAccess = 1;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(MEMORY[0x24BDF6AC8], v7, (uint64_t)CFSTR("AccessibilityIcon"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphImage_(self, v9, (uint64_t)v8);
  if (AXIsInternalInstall() && (AXCurrentRootLooksLikeBNI() & 1) == 0)
  {
    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      AXCurrentRootDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_230F70000, v12, OS_LOG_TYPE_DEFAULT, "This device is running with an Accessibility root: %@", (uint8_t *)&buf, 0xCu);

    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    sub_230F71F08(CFSTR("ask.sheet.title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXCurrentRootDescription();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("%@\nInternal Only:\n %@"), v10, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(self, v18, (uint64_t)v17);

  }
  else
  {
    sub_230F71F08(CFSTR("ask.sheet.title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(self, v11, (uint64_t)v10);
  }

  objc_msgSend__updateShortcutActions(self, v19, v20);
  v21 = *MEMORY[0x24BED26F8];
  v63[0] = *MEMORY[0x24BED26F0];
  v63[1] = v21;
  v22 = *MEMORY[0x24BED2970];
  v63[2] = *MEMORY[0x24BED2870];
  v63[3] = v22;
  v23 = *MEMORY[0x24BED28E8];
  v63[4] = *MEMORY[0x24BED29C0];
  v63[5] = v23;
  v24 = *MEMORY[0x24BED2938];
  v63[6] = *MEMORY[0x24BED2760];
  v63[7] = v24;
  v25 = *MEMORY[0x24BED2770];
  v63[8] = *MEMORY[0x24BED2730];
  v63[9] = v25;
  v26 = *MEMORY[0x24BED2740];
  v63[10] = *MEMORY[0x24BED28E0];
  v63[11] = v26;
  v27 = *MEMORY[0x24BED2888];
  v63[12] = *MEMORY[0x24BED28B0];
  v63[13] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, (uint64_t)v63, 14);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v53, v62, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v54;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v54 != v32)
          objc_enumerationMutation(v29);
        v34 = *(const __CFString **)(*((_QWORD *)&v53 + 1) + 8 * v33);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_230F71F88, v34, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v53, v62, 16);
    }
    while (v31);
  }

  objc_initWeak(&location, self);
  objc_msgSend_sharedInstance(MEMORY[0x24BE006C0], v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_230F71F90;
  v50[3] = &unk_24FFC1C78;
  objc_copyWeak(&v51, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v39, v41, (uint64_t)v50, sel_touchAccommodationsEnabled, self);

  v58 = 0;
  v59 = &v58;
  v60 = 0x2050000000;
  v42 = (void *)qword_255EAE188;
  v61 = qword_255EAE188;
  if (!qword_255EAE188)
  {
    *(_QWORD *)&buf = v40;
    *((_QWORD *)&buf + 1) = 3221225472;
    v65 = sub_230F72C10;
    v66 = &unk_24FFC1D68;
    v67 = &v58;
    sub_230F72C10((uint64_t)&buf);
    v42 = (void *)v59[3];
  }
  v43 = objc_retainAutorelease(v42);
  _Block_object_dispose(&v58, 8);
  objc_msgSend_sharedInstance(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v40;
  v48[1] = 3221225472;
  v48[2] = sub_230F71FBC;
  v48[3] = &unk_24FFC1C78;
  objc_copyWeak(&v49, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v46, v47, (uint64_t)v48, sel_comfortSoundsEnabled, self);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXCCShortcutModuleViewController;
  -[AXCCShortcutModuleViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  objc_super v9;
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230F720D8;
  v10[3] = &unk_24FFC1CA0;
  v10[4] = self;
  v7 = a4;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v10, 0);
  v9.receiver = self;
  v9.super_class = (Class)AXCCShortcutModuleViewController;
  -[CCUIMenuModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)_updateShortcutActions
{
  MEMORY[0x24BEDD108](self, sel__updateShortcutActions_, 1);
}

- (void)_updateShortcutActionsIfVisible
{
  MEMORY[0x24BEDD108](self, sel__updateShortcutActions_, 0);
}

- (void)_updateShortcutActions:(BOOL)a3
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_moduleNeedsLiveUpdates || a3)
  {
    objc_msgSend_visibleShortcuts(self, a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend_count(v5, v7, v8))
    {
      objc_msgSend_setIndentation_(self, v9, 2);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v5;
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v32, 16);
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v10);
            objc_msgSend__menuItemForOption_(self, v13, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v6, v18, (uint64_t)v17);

          }
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v32, 16);
        }
        while (v14);
      }
    }
    else
    {
      objc_msgSend_setIndentation_(self, v9, 0);
      objc_msgSend__menuItemOpenAccessibilityShortcutSettings(self, v19, v20);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v6, v21, (uint64_t)v10);
    }

    objc_msgSend_setMenuItems_(self, v22, (uint64_t)v6);
    objc_msgSend_shortcutDelegate(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_optionToggled(v25, v26, v27);

  }
}

- (id)_menuItemOpenAccessibilityShortcutSettings
{
  void *v2;
  id v3;
  const char *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  sub_230F71F08(CFSTR("open.settings.accessibility.shortcuts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE19B60]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230F72398;
  v7[3] = &unk_24FFC1CC8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v3, v4, (uint64_t)v2, v2, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (id)_menuItemForOption:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE00738];
  v8 = objc_msgSend_intValue(v4, v6, v7);
  objc_msgSend_titleForTripleClickOption_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x24BE19B60]);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230F72524;
  v23[3] = &unk_24FFC1CF0;
  objc_copyWeak(&v25, &location);
  v12 = v4;
  v24 = v12;
  v14 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v11, v13, (uint64_t)v10, v10, v23);
  v15 = (void *)MEMORY[0x24BE00738];
  v18 = objc_msgSend_intValue(v12, v16, v17);
  v20 = objc_msgSend_valueForTripleClickOption_(v15, v19, v18);
  objc_msgSend_setSelected_(v14, v21, v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v14;
}

- (id)visibleShortcuts
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BE00738], sel_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess_, !self->_suppressGuidedAccess);
}

- (id)_titlesForVisibleShortcuts
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visibleShortcuts(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, v25, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v7);
        v15 = (void *)MEMORY[0x24BE00738];
        v16 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v14), v10, v11);
        objc_msgSend_titleForTripleClickOption_(v15, v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v19, (uint64_t)v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, v25, 16);
    }
    while (v12);
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXCCShortcutModuleViewController;
  -[AXCCShortcutModuleViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  self->_moduleNeedsLiveUpdates = 1;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F7280C;
  block[3] = &unk_24FFC1D18;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXCCShortcutModuleViewController;
  -[AXCCShortcutModuleViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_moduleNeedsLiveUpdates = 0;
}

- (void)_toggleOption:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_toggleTripleClickOption_(MEMORY[0x24BE00738], a2, a3);
  objc_msgSend_shortcutDelegate(self, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optionToggled(v8, v6, v7);

}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t isSelected;
  const char *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXCCShortcutModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v12, sel_willTransitionToExpandedContentMode_);
  if (v3)
  {
    objc_msgSend_setSelected_(self, v5, 0);
  }
  else
  {
    objc_msgSend_module(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isSelected = objc_msgSend_isSelected(v7, v8, v9);
    objc_msgSend_setSelected_(self, v11, isSelected);

  }
}

- (BOOL)switchControlRendersDeviceUnusable
{
  return 0;
}

- (BOOL)_hasScreenSwitch
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  objc_msgSend_sharedInstance(MEMORY[0x24BE006C0], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assistiveTouchSwitches(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230F72A98;
  v10[3] = &unk_24FFC1D40;
  v10[4] = &v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)v10);
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 1;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  const char *v4;
  uint64_t v5;
  id v6;

  objc_msgSend_shortcutDelegate(self, a2, (uint64_t)a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandModule(v6, v4, v5);

}

- (id)contentModuleContext
{
  return objc_loadWeakRetained((id *)&self->_contentModuleContext);
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeWeak((id *)&self->_contentModuleContext, a3);
}

- (CCUIToggleModule)module
{
  return (CCUIToggleModule *)objc_loadWeakRetained((id *)&self->_module);
}

- (void)setModule:(id)a3
{
  objc_storeWeak((id *)&self->_module, a3);
}

- (AXCCShortcutModuleViewControllerDelegate)shortcutDelegate
{
  return (AXCCShortcutModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_shortcutDelegate);
}

- (void)setShortcutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shortcutDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortcutDelegate);
  objc_destroyWeak((id *)&self->_module);
  objc_destroyWeak((id *)&self->_contentModuleContext);
}

@end
