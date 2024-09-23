@implementation AXCCShortcutModule

- (AXCCShortcutModule)init
{
  AXCCShortcutModule *v2;
  AXCCShortcutModuleViewController *v3;
  const char *v4;
  uint64_t v5;
  AXCCShortcutModuleViewController *contentViewController;
  const char *v7;
  const char *v8;
  AXCCShortcutModuleViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  AXCCShortcutModuleViewController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  AXCCShortcutModuleViewController *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t isSelected;
  const char *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)AXCCShortcutModule;
  v2 = -[AXCCShortcutModule init](&v39, sel_init);
  if (v2)
  {
    v3 = [AXCCShortcutModuleViewController alloc];
    v5 = objc_msgSend_initWithNibName_bundle_(v3, v4, 0, 0);
    contentViewController = v2->_contentViewController;
    v2->_contentViewController = (AXCCShortcutModuleViewController *)v5;

    objc_msgSend_setShortcutDelegate_(v2->_contentViewController, v7, (uint64_t)v2);
    objc_msgSend_setModule_(v2->_contentViewController, v8, (uint64_t)v2);
    v9 = v2->_contentViewController;
    v10 = (void *)MEMORY[0x24BDF6AC8];
    v11 = (void *)MEMORY[0x24BDD1488];
    v12 = objc_opt_class();
    objc_msgSend_bundleForClass_(v11, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v10, v15, (uint64_t)CFSTR("AccessibilityIcon"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(v9, v17, (uint64_t)v16);

    v18 = v2->_contentViewController;
    v19 = (void *)MEMORY[0x24BDF6AC8];
    v20 = (void *)MEMORY[0x24BDD1488];
    v21 = objc_opt_class();
    objc_msgSend_bundleForClass_(v20, v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v19, v24, (uint64_t)CFSTR("AccessibilityIcon"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedGlyphImage_(v18, v26, (uint64_t)v25);

    v27 = v2->_contentViewController;
    objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedGlyphColor_(v27, v31, (uint64_t)v30);

    if ((objc_msgSend_isExpanded(v2->_contentViewController, v32, v33) & 1) == 0)
    {
      isSelected = objc_msgSend_isSelected(v2, v34, v35);
      objc_msgSend_setSelected_(v2->_contentViewController, v37, isSelected);
    }
  }
  return v2;
}

- (id)glyphState
{
  uint64_t v2;

  if (objc_msgSend_appearsSelected(self, a2, v2))
    return CFSTR("enabled");
  else
    return CFSTR("disabled");
}

- (void)optionToggled
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t isSelected;
  const char *v7;

  if ((objc_msgSend_isExpanded(self->_contentViewController, a2, v2) & 1) == 0)
  {
    isSelected = objc_msgSend_isSelected(self, v4, v5);
    objc_msgSend_setSelected_(self->_contentViewController, v7, isSelected);
  }
}

- (void)openAccessibilityShortcutSettings
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  id v7;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("prefs:root=ACCESSIBILITY&path=TRIPLE_CLICK_TITLE"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openURL_completionHandler_(v5, v6, (uint64_t)v7, 0);

}

- (void)expandModule
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  id v32;

  objc_msgSend_visibleShortcuts(self->_contentViewController, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7 == 1)
  {
    objc_msgSend_visibleShortcuts(self->_contentViewController, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_intValue(v13, v14, v15);

    LODWORD(v10) = objc_msgSend_valueForTripleClickOption_(MEMORY[0x24BE00738], v17, v16);
    v18 = v10 ^ 1;
    objc_msgSend_contentModuleContext(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BE19B78];
    objc_msgSend_titleForTripleClickOption_(MEMORY[0x24BE00738], v23, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v10)
      objc_msgSend_statusUpdateWithMessage_type_(v22, v24, (uint64_t)v25, 2);
    else
      objc_msgSend_statusUpdateWithMessage_type_(v22, v24, (uint64_t)v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enqueueStatusUpdate_(v21, v27, (uint64_t)v26);

    objc_msgSend_setSelected_(self->_contentViewController, v28, v18);
    objc_msgSend_toggleTripleClickOption_(MEMORY[0x24BE00738], v29, v16);
  }
  else
  {
    objc_msgSend_contentModuleContext(self, v8, v9);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestExpandModule(v32, v30, v31);

  }
}

- (BOOL)isSelected
{
  uint64_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  const char *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend_visibleShortcuts(self->_contentViewController, a2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = (void *)MEMORY[0x24BE00738];
        v11 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i), v5, v6);
        if ((objc_msgSend_valueForTripleClickOption_(v10, v12, v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (AXCCShortcutModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
