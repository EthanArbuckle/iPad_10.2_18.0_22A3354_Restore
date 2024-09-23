@implementation BCSDataDetectionActionPickerItem

- (BCSDataDetectionActionPickerItem)initWithAction:(id)a3 ddAction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BCSDataDetectionActionPickerItem *v10;
  BCSDataDetectionActionPickerItem *v11;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)BCSDataDetectionActionPickerItem;
  v10 = -[BCSActionPickerItem initWithLabel:action:](&v13, sel_initWithLabel_action_, v9, v8);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_ddAction, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)shouldDismissAlertWhenActionIsTaken
{
  return -[DDAction hasUserInterface](self->_ddAction, "hasUserInterface") ^ 1;
}

- (BOOL)isCopyActionItem
{
  getDDCopyActionClass();
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)label
{
  return (id)-[DDAction localizedName](self->_ddAction, "localizedName");
}

- (id)icon
{
  void *v2;
  void *v3;
  id v4;

  -[DDAction icon](self->_ddAction, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSymbolImage"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)targetApplicationBundleIdentifier
{
  return (id)-[DDAction notificationIconBundleIdentifier](self->_ddAction, "notificationIconBundleIdentifier");
}

- (id)actionURL
{
  return (id)-[DDAction notificationURL](self->_ddAction, "notificationURL");
}

- (CNContact)contact
{
  return (CNContact *)-[DDAction contact](self->_ddAction, "contact");
}

- (NSString)icsString
{
  void *v2;
  void *v3;
  id v4;

  -[DDAction context](self->_ddAction, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ICS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (void)performActionWithFBOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSDataDetectionActionPickerItem: performing action", v7, 2u);
  }
  -[BCSActionPickerItem actionPickerItemDelegate](self, "actionPickerItemDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPickerItemAlertController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getDDDetectionControllerClass(), "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performAction:fromAlertController:interactionDelegate:", self->_ddAction, v5, self);

  -[BCSActionPickerItem didPerformAction](self, "didPerformAction");
}

- (void)action:(id)a3 didDismissAlertController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[BCSActionPickerItem actionPickerItemDelegate](self, "actionPickerItemDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPickerItem:didDismissAlertController:", self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ddAction, 0);
}

@end
