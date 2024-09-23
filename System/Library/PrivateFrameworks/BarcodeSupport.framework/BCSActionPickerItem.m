@implementation BCSActionPickerItem

+ (id)actionPickerItemWithLabel:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:actionHandler:", v7, v6);

  return v8;
}

- (BCSActionPickerItem)initWithLabel:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  BCSActionPickerItem *v8;
  uint64_t v9;
  NSString *label;
  BCSActionPickerItem *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSActionPickerItem;
  v8 = -[BCSActionPickerItem init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    objc_storeStrong((id *)&v8->_action, a4);
    v11 = v8;
  }

  return v8;
}

- (BCSActionPickerItem)initWithLabel:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  BCSActionPickerItem *v8;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  id actionHandler;
  BCSActionPickerItem *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCSActionPickerItem;
  v8 = -[BCSActionPickerItem init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    actionHandler = v8->_actionHandler;
    v8->_actionHandler = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (BCSActionPickerItem)initWithAction:(id)a3
{
  id v4;
  void *v5;
  BCSActionPickerItem *v6;

  v4 = a3;
  objc_msgSend(v4, "localizedDefaultActionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSActionPickerItem initWithLabel:action:](self, "initWithLabel:action:", v5, v4);

  return v6;
}

- (void)performAction
{
  -[BCSActionPickerItem performActionWithFBOptions:](self, "performActionWithFBOptions:", 0);
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4;
  BCSAction *action;
  uint8_t v6[16];

  v4 = a3;
  if (self->_actionHandler)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSActionPickerItem: _actionHandler called in -performAction", v6, 2u);
    }
    (*((void (**)(void))self->_actionHandler + 2))();
  }
  action = self->_action;
  if (action)
    -[BCSAction performActionWithOptions:completion:](action, "performActionWithOptions:completion:", v4, &__block_literal_global);
  -[BCSActionPickerItem didPerformAction](self, "didPerformAction");

}

- (void)didPerformAction
{
  BCSAction *action;
  BCSAction *v3;
  id v4;

  action = self->_action;
  if (action)
  {
    v3 = action;
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logBarcodeActivatedEventForAction:", v3);

  }
}

- (BOOL)shouldDismissAlertWhenActionIsTaken
{
  return 1;
}

- (int64_t)dataType
{
  void *v2;
  int64_t v3;

  -[BCSAction data](self->_action, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (NSString)localizedDefaultActionDescription
{
  return -[BCSAction localizedDefaultActionDescription](self->_action, "localizedDefaultActionDescription");
}

- (BCSActionPickerItemDelegate)actionPickerItemDelegate
{
  return (BCSActionPickerItemDelegate *)objc_loadWeakRetained((id *)&self->_actionPickerItemDelegate);
}

- (void)setActionPickerItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionPickerItemDelegate, a3);
}

- (NSString)label
{
  return self->_label;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BCSAction)action
{
  return self->_action;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSString)targetApplicationBundleIdentifier
{
  return self->_targetApplicationBundleIdentifier;
}

- (BOOL)isCopyActionItem
{
  return self->_copyActionItem;
}

- (BOOL)useInlineMenu
{
  return self->_useInlineMenu;
}

- (BOOL)canGroupInSubmenu
{
  return self->_canGroupInSubmenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_actionPickerItemDelegate);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
