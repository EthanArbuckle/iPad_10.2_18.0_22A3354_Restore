@implementation BCSShareActionPickerItem

- (BCSShareActionPickerItem)initWithAction:(id)a3
{
  id v4;
  BCSShareActionPickerItem *v5;
  uint64_t v6;
  NSMutableArray *itemsToShare;
  NSMutableArray *v8;
  void *v9;
  BCSShareActionPickerItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSShareActionPickerItem;
  v5 = -[BCSActionPickerItem initWithAction:](&v12, sel_initWithAction_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    itemsToShare = v5->_itemsToShare;
    v5->_itemsToShare = (NSMutableArray *)v6;

    v8 = v5->_itemsToShare;
    objc_msgSend(v4, "urlThatCanBeOpened");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v8, "addObject:", v9);

    v10 = v5;
  }

  return v5;
}

- (id)label
{
  return _BCSLocalizedString(CFSTR("Share…"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)icon
{
  return (id)objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("square.and.arrow.up"));
}

- (void)performActionWithFBOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(objc_alloc((Class)getUIActivityViewControllerClass()), "initWithActivityItems:applicationActivities:", self->_itemsToShare, 0);
  objc_msgSend(v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSActionPickerItem action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewControllerForAction:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "_setCentersPopoverIfSourceViewNotSet:", 1);
    objc_msgSend(v8, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[BCSShareActionPickerItem performActionWithFBOptions:].cold.1();
  }

}

- (BOOL)canGroupInSubmenu
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToShare, 0);
}

- (void)performActionWithFBOptions:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSShareActionPickerItem: can't find presenting view controller, please set up the action's delegate.", v0, 2u);
}

@end
