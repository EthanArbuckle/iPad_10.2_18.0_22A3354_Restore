@implementation EditUserWordController

- (EditUserWordController)initWithUserWord:(id)a3
{
  EditUserWordController *v4;
  EditUserWordController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EditUserWordController;
  v4 = -[EditUserWordController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[EditUserWordController setOldEntry:](v4, "setOldEntry:", a3);
    if (!a3)
      a3 = objc_alloc_init(MEMORY[0x24BE5E6A0]);
    -[EditUserWordController setNextEntry:](v5, "setNextEntry:", a3);
  }
  return v5;
}

- (EditUserWordController)init
{
  return -[EditUserWordController initWithUserWord:](self, "initWithUserWord:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EditUserWordController;
  -[EditUserWordController dealloc](&v3, sel_dealloc);
}

- (NSString)target
{
  return (NSString *)-[_KSTextReplacementEntry phrase](-[EditUserWordController nextEntry](self, "nextEntry"), "phrase");
}

- (void)setTarget:(id)a3
{
  -[_KSTextReplacementEntry setPhrase:](-[EditUserWordController nextEntry](self, "nextEntry"), "setPhrase:", a3);
}

- (NSString)shortcut
{
  return (NSString *)-[_KSTextReplacementEntry shortcut](-[EditUserWordController nextEntry](self, "nextEntry"), "shortcut");
}

- (void)setShortcut:(id)a3
{
  -[_KSTextReplacementEntry setShortcut:](-[EditUserWordController nextEntry](self, "nextEntry"), "setShortcut:", a3);
}

+ (id)propertyTitles
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("WORD"), CFSTR("SHORTCUT"), 0);
}

- (BOOL)_shouldSetDefaultFirstResponder
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EditUserWordController;
  v5 = -[EditUserWordController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "wantsToDelegate:", objc_msgSend((id)objc_msgSend(v5, "specifier"), "identifier"))&& (EditUserWordController *)objc_msgSend((id)objc_msgSend(v5, "textField"), "delegate") != self)
  {
    objc_setAssociatedObject((id)objc_msgSend(v5, "textField"), "kTextFieldOriginalDelegate", (id)objc_msgSend((id)objc_msgSend(v5, "textField"), "delegate"), 0);
    objc_msgSend((id)objc_msgSend(v5, "textField"), "setDelegate:", self);
  }
  return v5;
}

+ (BOOL)wantsToDelegate:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "propertyTitles"), "containsObject:", a3);
}

- (id)originalDelegateForTextField:(id)a3
{
  id result;

  result = objc_getAssociatedObject(a3, "kTextFieldOriginalDelegate");
  if (!result)
    result = (id)objc_msgSend(a3, "delegate");
  if (result == self)
    return 0;
  return result;
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EditUserWordController;
  -[EditUserWordController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_save));
  objc_msgSend((id)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 0);
  objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SHORTCUT_VIEW_TITLE"), &stru_24E732B90, CFSTR("Keyboard")));
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  UITextField *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EditUserWordController;
  -[EditUserWordController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v4 = -[EditUserWordController targetTextField](self, "targetTextField");
  if (!-[NSString length](-[UITextField text](v4, "text"), "length"))
    goto LABEL_5;
  if (-[EditUserWordController _shouldSetDefaultFirstResponder](self, "_shouldSetDefaultFirstResponder")
    || !-[NSString length](-[UITextField text](-[EditUserWordController shortcutTextField](self, "shortcutTextField"), "text"), "length"))
  {
    v4 = -[EditUserWordController shortcutTextField](self, "shortcutTextField");
LABEL_5:
    -[UITextField becomeFirstResponder](v4, "becomeFirstResponder");
  }
  objc_msgSend((id)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", -[NSString length](-[UITextField text](-[EditUserWordController shortcutTextField](self, "shortcutTextField"), "text"), "length") != 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EditUserWordController;
  -[EditUserWordController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[UIAlertController dismissViewControllerAnimated:completion:](-[EditUserWordController keyboardAlertController](self, "keyboardAlertController"), "dismissViewControllerAnimated:completion:", 1, 0);
  -[EditUserWordController setKeyboardAlertController:](self, "setKeyboardAlertController:", 0);
}

- (id)specifiers
{
  uint64_t v3;
  id result;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if (!-[NSString length](-[EditUserWordController footerTitle](self, "footerTitle"), "length"))
      -[EditUserWordController setFooterTitle:](self, "setFooterTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("USER_WORD_EXPLANATORY_TEXT"), &stru_24E732B90, CFSTR("Keyboard")));
    v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v7 = -[EditUserWordController footerTitle](self, "footerTitle");
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);
    objc_msgSend(v5, "addObject:", v6);
    -[EditUserWordController setGroupSpecifier:](self, "setGroupSpecifier:", v6);
    v8 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("WORD"), &stru_24E732B90, CFSTR("Keyboard")), self, sel_setTarget_, sel_target, 0, 8, 0);
    v9 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v8, "setProperty:forKey:", CFSTR("WORD"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v8, "setKeyboardType:autoCaps:autoCorrection:", 0, 0, 1);
    objc_msgSend(v5, "addObject:", v8);
    if (-[NSString isEqualToString:](-[EditUserWordController target](self, "target"), "isEqualToString:", -[EditUserWordController shortcut](self, "shortcut")))
    {
      -[EditUserWordController setShortcut:](self, "setShortcut:", &stru_24E732B90);
    }
    v10 = (void *)objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SHORTCUT_FIELD_TITLE"), &stru_24E732B90, CFSTR("Keyboard")), self, sel_setShortcut_, sel_shortcut, 0, 8, 0);
    if ((-[NSString _containsIdeographicCharacters](-[EditUserWordController target](self, "target"), "_containsIdeographicCharacters") & 1) == 0)objc_msgSend(v10, "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("OPTIONAL"), &stru_24E732B90, CFSTR("Keyboard")));
    objc_msgSend(v10, "setProperty:forKey:", CFSTR("SHORTCUT"), v9);
    objc_msgSend(v10, "setKeyboardType:autoCaps:autoCorrection:", 0, 0, 1);
    objc_msgSend(v5, "addObject:", v10);
    result = v5;
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (UITextField)targetTextField
{
  return (UITextField *)objc_msgSend((id)-[EditUserWordController cachedCellForSpecifierID:](self, "cachedCellForSpecifierID:", CFSTR("WORD")), "editableTextField");
}

- (UITextField)shortcutTextField
{
  return (UITextField *)objc_msgSend((id)-[EditUserWordController cachedCellForSpecifierID:](self, "cachedCellForSpecifierID:", CFSTR("SHORTCUT")), "editableTextField");
}

- (id)validationErrorStringFromError:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", off_24E7327C8[a3 - 1], &stru_24E732B90, CFSTR("Keyboard"));
}

- (void)_dismiss
{
  objc_msgSend((id)-[EditUserWordController navigationController](self, "navigationController"), "popViewControllerAnimated:", 1);
}

- (void)_unpackTextReplacementError:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  if (objc_msgSend(a3, "code") == 11)
  {
    v5 = (void *)objc_msgSend(a3, "userInfo");
    v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE5E6B8]), "firstObject");
    v7 = (void *)objc_msgSend(a3, "userInfo");
    v8 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE5E6A8]), "firstObject");
    if (v6)
    {
      v8 = (id)v6;
    }
    else if (!v8)
    {
      return;
    }
    goto LABEL_8;
  }
  v9 = (void *)objc_msgSend(a3, "domain");
  if (objc_msgSend(v9, "isEqual:", *MEMORY[0x24BE5E6B0]))
  {
    v8 = a3;
LABEL_8:
    v10 = objc_msgSend(v8, "code");
    goto LABEL_9;
  }
  v10 = -2;
LABEL_9:
  -[EditUserWordController _handleValidationWithError:](self, "_handleValidationWithError:", v10);
}

- (void)_handleValidationWithError:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = -[EditUserWordController validationErrorStringFromError:](self, "validationErrorStringFromError:");
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1);
      v6 = (void *)MEMORY[0x24BDF67E8];
      v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("USER_WORD_BUTTON_OK"), &stru_24E732B90, CFSTR("Keyboard"));
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __53__EditUserWordController__handleValidationWithError___block_invoke;
      v9[3] = &unk_24E732780;
      v9[4] = v5;
      objc_msgSend(v5, "addAction:", objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v9));
      -[EditUserWordController setKeyboardAlertController:](self, "setKeyboardAlertController:", v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "_viewControllerForFullScreenPresentationFromView:", -[EditUserWordController view](self, "view")), "presentViewController:animated:completion:", -[EditUserWordController keyboardAlertController](self, "keyboardAlertController"), 1, 0);
    }
  }
  else
  {
    TIStatisticGetKey();
    -[NSString length](-[UITextField text](-[EditUserWordController targetTextField](self, "targetTextField"), "text"), "length");
    TIStatisticDistributionPushValue();
    TIStatisticGetKey();
    -[NSString length](-[UITextField text](-[EditUserWordController shortcutTextField](self, "shortcutTextField"), "text"), "length");
    TIStatisticDistributionPushValue();
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = CFSTR("shortcut");
    v11[0] = -[EditUserWordController shortcut](self, "shortcut");
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("EditUserWordShortcutDidUpdateNotification"), self, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    -[EditUserWordController _dismiss](self, "_dismiss");
  }
}

uint64_t __53__EditUserWordController__handleValidationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)save
{
  TIUserWordsManager *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _KSTextReplacementEntry *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[EditUserWordController setTarget:](self, "setTarget:", -[UITextField text](-[EditUserWordController targetTextField](self, "targetTextField"), "text"));
  -[EditUserWordController setShortcut:](self, "setShortcut:", -[UITextField text](-[EditUserWordController shortcutTextField](self, "shortcutTextField"), "text"));
  if (-[EditUserWordController oldEntry](self, "oldEntry"))
    -[_KSTextReplacementEntry setPriorValue:](-[EditUserWordController nextEntry](self, "nextEntry"), "setPriorValue:", -[EditUserWordController oldEntry](self, "oldEntry"));
  v3 = -[EditUserWordController dictionaryController](self, "dictionaryController");
  v8[0] = -[EditUserWordController nextEntry](self, "nextEntry");
  v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  if (-[EditUserWordController oldEntry](self, "oldEntry"))
  {
    v7 = -[EditUserWordController oldEntry](self, "oldEntry");
    v5 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  }
  else
  {
    v5 = 0;
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__EditUserWordController_save__block_invoke;
  v6[3] = &unk_24E7327A8;
  v6[4] = self;
  -[TIUserWordsManager addEntries:removeEntries:withCompletionHandler:](v3, "addEntries:removeEntries:withCompletionHandler:", v4, v5, v6);
}

uint64_t __30__EditUserWordController_save__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unpackTextReplacementError:", a2);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v10 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if (-[EditUserWordController targetTextField](self, "targetTextField") == a3)
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5);
    v12 = objc_msgSend(v11, "_containsIdeographicCharacters");
    v13 = (void *)objc_msgSend(-[EditUserWordController specifiers](self, "specifiers"), "objectAtIndex:", 2);
    if (v12)
      v14 = CFSTR(" ");
    else
      v14 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("OPTIONAL"), &stru_24E732B90, CFSTR("Keyboard"));
    objc_msgSend(v13, "setPlaceholder:", v14);
    v15 = objc_msgSend(v11, "length");
    v16 = (void *)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    if (v15)
    {
      objc_msgSend(v16, "setEnabled:", 1);
      if (!v12 || -[NSString length](-[EditUserWordController shortcut](self, "shortcut"), "length"))
        goto LABEL_10;
      v16 = (void *)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    }
    objc_msgSend(v16, "setEnabled:", 0);
LABEL_10:
    -[EditUserWordController reloadSpecifier:](self, "reloadSpecifier:", v13);
  }
  if (-[EditUserWordController shortcutTextField](self, "shortcutTextField") == a3)
  {
    v17 = (void *)objc_msgSend((id)objc_msgSend(a3, "text"), "stringByReplacingCharactersInRange:withString:", location, length, a5);
    v18 = -[NSString length](-[EditUserWordController target](self, "target"), "length");
    v19 = (void *)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    if (v18)
    {
      objc_msgSend(v19, "setEnabled:", 1);
      if (!-[NSString _containsIdeographicCharacters](-[EditUserWordController target](self, "target"), "_containsIdeographicCharacters")|| objc_msgSend(v17, "length"))
      {
        goto LABEL_17;
      }
      v19 = (void *)objc_msgSend((id)-[EditUserWordController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    }
    objc_msgSend(v19, "setEnabled:", 0);
  }
LABEL_17:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v10, "textField:shouldChangeCharactersInRange:replacementString:", a3, location, length, a5);
  else
    return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v4, "textFieldShouldBeginEditing:", a3);
  else
    return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "textFieldDidBeginEditing:", a3);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v4, "textFieldShouldEndEditing:", a3);
  else
    return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "textFieldDidEndEditing:", a3);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v4, "textFieldShouldClear:", a3);
  else
    return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;

  v4 = -[EditUserWordController originalDelegateForTextField:](self, "originalDelegateForTextField:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v4, "textFieldShouldReturn:", a3);
  else
    return 1;
}

- (TIUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1376);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (UIAlertController)keyboardAlertController
{
  return self->_keyboardAlertController;
}

- (void)setKeyboardAlertController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1400);
}

- (_KSTextReplacementEntry)oldEntry
{
  return self->_oldEntry;
}

- (void)setOldEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (_KSTextReplacementEntry)nextEntry
{
  return self->_nextEntry;
}

- (void)setNextEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

@end
