@implementation BCSStringAction

- (BCSStringAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSStringAction *v8;
  BCSStringAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v11.receiver = self;
  v11.super_class = (Class)BCSStringAction;
  v8 = -[BCSAction initWithData:codePayload:](&v11, sel_initWithData_codePayload_, v6, v7);
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)localizedDefaultActionDescription
{
  return _BCSLocalizedString(CFSTR("Search Web in Safari"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  _BCSLocalizedString(CFSTR("Search “%@”"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSAction extraPreviewText](self, "extraPreviewText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionIcon
{
  return (id)objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("safari.fill"));
}

- (id)actionPickerItems
{
  void *v3;
  BCSURLActionPickerItem *v4;
  void *v5;
  void *v6;
  BCSURLActionPickerItem *v7;
  BCSCopyActionPickerItem *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[BCSAction extraPreviewText](self, "extraPreviewText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [BCSURLActionPickerItem alloc];
  _BCSLocalizedString(CFSTR("Search Web"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "_bcs_searchURLWithQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:](v4, "initWithLabel:action:url:applicationRecord:", v5, self, v6, 0);

  v8 = -[BCSCopyActionPickerItem initWithAction:textToCopy:]([BCSCopyActionPickerItem alloc], "initWithAction:textToCopy:", self, v3);
  v11[0] = v7;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  return CFSTR("com.apple.mobilesafari");
}

- (void)performDefaultAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[BCSAction extraPreviewText](self, "extraPreviewText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bcs_searchURLWithQuery:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSStringAction: performing search", v8, 2u);
  }
  objc_msgSend(getUIApplicationClass(), "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

  +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logBarcodeActivatedEventForAction:", self);

}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[BCSStringAction actionPickerItems](self, "actionPickerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "performActionWithFBOptions:", v9);
  v6[2](v6, 0);

}

@end
