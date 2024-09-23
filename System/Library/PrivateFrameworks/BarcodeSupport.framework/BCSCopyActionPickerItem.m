@implementation BCSCopyActionPickerItem

- (BCSCopyActionPickerItem)initWithAction:(id)a3 textToCopy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BCSCopyActionPickerItem *v9;
  uint64_t v10;
  NSString *textToCopy;
  BCSCopyActionPickerItem *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  _BCSLocalizedString(CFSTR("Copy"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)BCSCopyActionPickerItem;
  v9 = -[BCSActionPickerItem initWithLabel:action:](&v14, sel_initWithLabel_action_, v8, v7);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    textToCopy = v9->_textToCopy;
    v9->_textToCopy = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (BCSCopyActionPickerItem)initWithAction:(id)a3 urlToCopy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BCSCopyActionPickerItem *v9;
  uint64_t v10;
  NSURL *urlToCopy;
  BCSCopyActionPickerItem *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  _BCSLocalizedString(CFSTR("Copy Link"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)BCSCopyActionPickerItem;
  v9 = -[BCSActionPickerItem initWithLabel:action:](&v14, sel_initWithLabel_action_, v8, v7);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    urlToCopy = v9->_urlToCopy;
    v9->_urlToCopy = (NSURL *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)icon
{
  return (id)objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("doc.on.doc"));
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSCopyActionPickerItem: performing action", v7, 2u);
  }
  objc_msgSend(getUIPasteboardClass(), "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_textToCopy)
    objc_msgSend(v5, "setString:");
  if (self->_urlToCopy)
    objc_msgSend(v6, "setURL:");
  -[BCSActionPickerItem didPerformAction](self, "didPerformAction");

}

- (BOOL)isCopyActionItem
{
  return 1;
}

- (BOOL)canGroupInSubmenu
{
  return 1;
}

- (NSString)textToCopy
{
  return self->_textToCopy;
}

- (NSURL)urlToCopy
{
  return self->_urlToCopy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToCopy, 0);
  objc_storeStrong((id *)&self->_textToCopy, 0);
}

@end
