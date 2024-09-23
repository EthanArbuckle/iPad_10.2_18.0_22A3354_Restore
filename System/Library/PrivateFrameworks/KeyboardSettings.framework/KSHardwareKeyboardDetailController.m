@implementation KSHardwareKeyboardDetailController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSHardwareKeyboardDetailController;
  -[KSHardwareKeyboardDetailController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardDetailController;
  -[KSHardwareKeyboardDetailController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KSHardwareKeyboardDetailController;
  -[KSHardwareKeyboardDetailController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v4 = (void *)-[KSHardwareKeyboardDetailController specifier](self, "specifier");
  v5 = (void *)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  if (v5)
    objc_msgSend((id)-[KSHardwareKeyboardDetailController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)objc_msgSend(v5, "titleLabel"), "text"));
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[KSHardwareKeyboardDetailController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)newSpecifiers
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = -[KSHardwareKeyboardDetailController inputMode](self, "inputMode");
  obj = (id)UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count") + 1);
  v5 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", 0);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v23 = v4;
  v21 = v5;
  objc_msgSend(v4, "addObject:", v5);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(v6);
      if (-[NSString isEqualToString:](v3, "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
      {
        v11 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("hw"));
        if (objc_msgSend(v11, "length"))
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v11 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = *MEMORY[0x24BE75AC0];
    v16 = *MEMORY[0x24BE75C20];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v19 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", +[KSKeyboardListController displayNameForHardwareLayout:inputMode:](KSKeyboardListController, "displayNameForHardwareLayout:inputMode:", v18, -[KSHardwareKeyboardDetailController uiKeyboardinputMode](self, "uiKeyboardinputMode")), self, 0, 0, 0, 3, 0);
        objc_msgSend(v19, "setProperty:forKey:", v18, v15);
        if (objc_msgSend(v11, "isEqualToString:", v18))
          objc_msgSend(v21, "setProperty:forKey:", v19, v16);
        objc_msgSend(v23, "addObject:", v19);
        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }
  return v23;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KSHardwareKeyboardDetailController;
  -[KSHardwareKeyboardDetailController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_);
  v7 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "specifier");
    v9 = (void *)objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    if (objc_msgSend(v9, "length"))
      -[KSHardwareKeyboardDetailController setHardwareLayout:](self, "setHardwareLayout:", v9);
  }
}

- (NSString)inputMode
{
  NSString *result;
  void *v4;

  result = self->_inputMode;
  if (!result)
  {
    v4 = (void *)-[KSHardwareKeyboardDetailController specifier](self, "specifier");
    result = (NSString *)objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]), "copy");
    self->_inputMode = result;
  }
  return result;
}

- (UIKeyboardInputMode)uiKeyboardinputMode
{
  UIKeyboardInputMode *result;
  void *v4;
  void *v5;

  result = self->_uiKeyboardinputMode;
  if (!result)
  {
    v4 = (void *)MEMORY[0x24BEBD6E8];
    v5 = (void *)-[KSHardwareKeyboardDetailController specifier](self, "specifier");
    result = (UIKeyboardInputMode *)objc_msgSend((id)objc_msgSend(v4, "keyboardInputModeWithIdentifier:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75AC0])), "copy");
    self->_uiKeyboardinputMode = result;
  }
  return result;
}

- (void)setHardwareLayout:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;

  v5 = (id)objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  if (!objc_msgSend(v5, "count"))
    -[KSHardwareKeyboardDetailController setHardwareLayout:].cold.1();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v13 = v6 - 1;
LABEL_5:
      v10 = v8;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v10);
        if (-[NSString isEqualToString:](-[KSHardwareKeyboardDetailController inputMode](self, "inputMode"), "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
        {
          v11 = (id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy");
          v12 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("hw"));
          if (!v12 || !objc_msgSend(v12, "isEqualToString:", a3))
          {
            objc_msgSend(v11, "setObject:forKey:", a3, CFSTR("hw"));
            objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v10, UIKeyboardInputModeGetIdentifierFromComponents());
            v8 = v10 + 1;
            v9 = 1;
            if (v13 != v10)
              goto LABEL_5;
            goto LABEL_14;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      if ((v9 & 1) == 0)
        return;
LABEL_14:
      +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v5);
    }
  }
}

- (void)setUiKeyboardinputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (void)setHardwareLayout:.cold.1()
{
  __assert_rtn("-[KSHardwareKeyboardDetailController setHardwareLayout:]", "KSHardwareKeyboardDetailController.m", 130, "newInputModes.count > 0");
}

@end
