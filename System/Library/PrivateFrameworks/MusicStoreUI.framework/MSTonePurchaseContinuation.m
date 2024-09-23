@implementation MSTonePurchaseContinuation

- (MSTonePurchaseContinuation)initWithPurchase:(id)a3
{
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSPurchaseBatch.m"), 61, CFSTR("Must use with SSTonePurchase"));
  v7.receiver = self;
  v7.super_class = (Class)MSTonePurchaseContinuation;
  return -[SUPurchaseContinuation initWithPurchase:](&v7, sel_initWithPurchase_, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[MSTonePurchaseContinuation _destroyActionSheet](self, "_destroyActionSheet");
  -[MSTonePurchaseContinuation _destroyAlertView](self, "_destroyAlertView");
  -[CNContactPickerViewController setDelegate:](self->_contactPicker, "setDelegate:", 0);

  self->_contactPicker = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTonePurchaseContinuation;
  -[SUPurchaseContinuation dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  objc_super v3;

  -[UIActionSheet dismissWithClickedButtonIndex:animated:](self->_actionSheet, "dismissWithClickedButtonIndex:animated:", -[UIActionSheet cancelButtonIndex](self->_actionSheet, "cancelButtonIndex"), 0);
  -[MSTonePurchaseContinuation _destroyActionSheet](self, "_destroyActionSheet");
  -[UIAlertView dismissWithClickedButtonIndex:animated:](self->_alertView, "dismissWithClickedButtonIndex:animated:", -[UIAlertView cancelButtonIndex](self->_alertView, "cancelButtonIndex"), 0);
  -[MSTonePurchaseContinuation _destroyAlertView](self, "_destroyAlertView");
  -[MSTonePurchaseContinuation _dismissContactPicker](self, "_dismissContactPicker");
  v3.receiver = self;
  v3.super_class = (Class)MSTonePurchaseContinuation;
  -[SUPurchaseContinuation cancel](&v3, sel_cancel);
}

- (void)start
{
  id v3;
  UIAlertView *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = -[MSTonePurchaseContinuation _copyAllowedToneStyles](self, "_copyAllowedToneStyles");
  if (objc_msgSend(v3, "count"))
  {
    v4 = (UIAlertView *)objc_alloc_init(MEMORY[0x24BDF67F8]);
    self->_alertView = v4;
    -[UIAlertView setDelegate:](v4, "setDelegate:", self);
    -[UIAlertView setTitle:](self->_alertView, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_ALERT_TITLE"), &stru_24F1F2DD8, 0));
    v5 = -[SUPurchaseContinuation purchase](self, "purchase");
    v6 = (void *)objc_msgSend(v5, "valueForDownloadProperty:", *MEMORY[0x24BEB2470]);
    if (objc_msgSend(v6, "length"))
      -[UIAlertView setBodyText:](self->_alertView, "setBodyText:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_BODY_FORMAT"), &stru_24F1F2DD8, 0), v6));
    if (objc_msgSend(v3, "containsObject:", *MEMORY[0x24BEB2750]))
      -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_SET_AS_DEFAULT_RINGTONE"), &stru_24F1F2DD8, 0));
    if (objc_msgSend(v3, "containsObject:", *MEMORY[0x24BEB2758]))
      -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_SET_AS_DEFAULT_TEXT_TONE"), &stru_24F1F2DD8, 0));
    -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_ASSIGN_TO_CONTACT"), &stru_24F1F2DD8, 0));
    -[UIAlertView setCancelButtonIndex:](self->_alertView, "setCancelButtonIndex:", -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_DONE"), &stru_24F1F2DD8, 0)));
    -[UIAlertView show](self->_alertView, "show");
    v7.receiver = self;
    v7.super_class = (Class)MSTonePurchaseContinuation;
    -[SUPurchaseContinuation start](&v7, sel_start);
  }
  else
  {
    -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
  }

}

- (void)actionSheetCancel:(id)a3
{
  -[MSTonePurchaseContinuation _dismissContactPicker](self, "_dismissContactPicker", a3);
  -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
  -[MSTonePurchaseContinuation _destroyActionSheet](self, "_destroyActionSheet");
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  _QWORD *v5;

  if (!a4)
  {
    v5 = (_QWORD *)MEMORY[0x24BEB2750];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v5 = (_QWORD *)MEMORY[0x24BEB2758];
LABEL_5:
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase", a3), "setAssigneeToneStyle:", *v5);
  }
  -[MSTonePurchaseContinuation _dismissContactPicker](self, "_dismissContactPicker");
  -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
  -[MSTonePurchaseContinuation _destroyActionSheet](self, "_destroyActionSheet");
}

- (void)alertViewCancel:(id)a3
{
  -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate", a3);
  -[MSTonePurchaseContinuation _destroyAlertView](self, "_destroyAlertView");
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = -[MSTonePurchaseContinuation _copyAllowedToneStyles](self, "_copyAllowedToneStyles", a3);
  if (objc_msgSend(v10, "containsObject:", *MEMORY[0x24BEB2758]))
  {
    v6 = objc_msgSend(v10, "containsObject:", *MEMORY[0x24BEB2750]);
    v7 = 2;
    v8 = 1;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v6 & 1) != 0)
      v9 = 0;
    else
      v8 = 0;
    if ((v6 & 1) == 0)
      v7 = 1;
  }
  else
  {
    v9 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 1;
  }
  if (v9 == a4)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setShouldMakeDefaultRingtone:", 1);
LABEL_14:
    -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
    goto LABEL_15;
  }
  if (v8 == a4)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setShouldMakeDefaultTextTone:", 1);
    goto LABEL_14;
  }
  if (v7 != a4)
    goto LABEL_14;
  -[MSTonePurchaseContinuation _showPeoplePicker](self, "_showPeoplePicker");
LABEL_15:
  -[MSTonePurchaseContinuation _destroyAlertView](self, "_destroyAlertView");

}

- (void)contactPickerDidCancel:(id)a3
{
  -[MSTonePurchaseContinuation _dismissContactPicker](self, "_dismissContactPicker", a3);
  -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  if (a4)
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase", a3), "setAssigneeContactIdentifier:", objc_msgSend(a4, "identifier"));
  -[MSTonePurchaseContinuation _pickAssigneeToneStyle](self, "_pickAssigneeToneStyle", a3);
}

- (id)_copyAllowedToneStyles
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  v2 = (void *)objc_msgSend((id)objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "allowedToneStyles"), "mutableCopy");
  v3 = objc_msgSend(v2, "count");
  v4 = (_QWORD *)MEMORY[0x24BEB2750];
  if (v3 >= 1)
  {
    v5 = *MEMORY[0x24BEB2750];
    v6 = *MEMORY[0x24BEB2758];
    v7 = v3 + 1;
    do
    {
      v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v7 - 2);
      if ((objc_msgSend(v8, "isEqualToString:", v5) & 1) == 0 && (objc_msgSend(v8, "isEqualToString:", v6) & 1) == 0)
        objc_msgSend(v2, "removeObjectAtIndex:", v7 - 2);
      --v7;
    }
    while (v7 > 1);
  }
  if ((MGGetBoolAnswer() & 1) == 0)
    objc_msgSend(v2, "removeObject:", *v4);
  return v2;
}

- (void)_destroyActionSheet
{
  -[UIActionSheet setDelegate:](self->_actionSheet, "setDelegate:", 0);

  self->_actionSheet = 0;
}

- (void)_destroyAlertView
{
  -[UIAlertView setDelegate:](self->_alertView, "setDelegate:", 0);

  self->_alertView = 0;
}

- (void)_dismissContactPicker
{
  -[CNContactPickerViewController dismissViewControllerAnimated:completion:](self->_contactPicker, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CNContactPickerViewController setDelegate:](self->_contactPicker, "setDelegate:", 0);

  self->_contactPicker = 0;
}

- (void)_pickAssigneeToneStyle
{
  UIActionSheet *v3;
  id v4;

  v4 = -[MSTonePurchaseContinuation _copyAllowedToneStyles](self, "_copyAllowedToneStyles");
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setAssigneeToneStyle:", objc_msgSend(v4, "objectAtIndex:", 0));
    -[MSTonePurchaseContinuation _dismissContactPicker](self, "_dismissContactPicker");
    -[SUContinuation sendFinishToDelegate](self, "sendFinishToDelegate");
  }
  else
  {
    v3 = (UIActionSheet *)objc_alloc_init(MEMORY[0x24BDF67C0]);
    self->_actionSheet = v3;
    -[UIActionSheet setDelegate:](v3, "setDelegate:", self);
    -[UIActionSheet addButtonWithTitle:](self->_actionSheet, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_SET_AS_RINGTONE"), &stru_24F1F2DD8, 0));
    -[UIActionSheet addButtonWithTitle:](self->_actionSheet, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BUY_TONE_SET_AS_TEXT_TONE"), &stru_24F1F2DD8, 0));
    -[UIActionSheet showInView:](self->_actionSheet, "showInView:", -[CNContactPickerViewController view](self->_contactPicker, "view"));
  }

}

- (void)_showPeoplePicker
{
  objc_class *v3;
  CNContactPickerViewController *v4;

  v3 = (objc_class *)ISWeakLinkedClassForString();
  if (v3)
  {
    v4 = (CNContactPickerViewController *)objc_alloc_init(v3);
    self->_contactPicker = v4;
    -[CNContactPickerViewController setDelegate:](v4, "setDelegate:", self);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8CE8], "sharedController"), "rootViewController"), "presentViewController:animated:completion:", self->_contactPicker, 1, 0);
  }
  else
  {
    -[MSTonePurchaseContinuation cancel](self, "cancel");
  }
}

@end
