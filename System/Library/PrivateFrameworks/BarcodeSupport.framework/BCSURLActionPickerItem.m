@implementation BCSURLActionPickerItem

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6 preferApplicationIcon:(BOOL)a7
{
  id v13;
  id v14;
  BCSURLActionPickerItem *v15;
  BCSURLActionPickerItem *v16;
  BCSURLActionPickerItem *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BCSURLActionPickerItem;
  v15 = -[BCSActionPickerItem initWithLabel:action:](&v19, sel_initWithLabel_action_, a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a5);
    objc_storeStrong((id *)&v16->_applicationRecord, a6);
    v16->_preferApplicationIcon = a7;
    v17 = v16;
  }

  return v16;
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6
{
  return -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:preferApplicationIcon:](self, "initWithLabel:action:url:applicationRecord:preferApplicationIcon:", a3, a4, a5, a6, 0);
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6
{
  return -[BCSURLActionPickerItem initWithLabel:action:appLink:codePayload:preferApplicationIcon:](self, "initWithLabel:action:appLink:codePayload:preferApplicationIcon:", a3, a4, a5, a6, 0);
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6 preferApplicationIcon:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  BCSURLActionPickerItem *v15;
  BCSURLActionPickerItem *v16;
  uint64_t v17;
  LSApplicationRecord *applicationRecord;
  BCSURLActionPickerItem *v19;
  objc_super v21;

  v7 = a7;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)BCSURLActionPickerItem;
  v15 = -[BCSActionPickerItem initWithLabel:action:](&v21, sel_initWithLabel_action_, a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appLink, a5);
    objc_storeStrong((id *)&v16->_codePayload, a6);
    v16->_preferApplicationIcon = v7;
    if (v7)
    {
      -[LSAppLink targetApplicationRecord](v16->_appLink, "targetApplicationRecord");
      v17 = objc_claimAutoreleasedReturnValue();
      applicationRecord = v16->_applicationRecord;
      v16->_applicationRecord = (LSApplicationRecord *)v17;

    }
    v19 = v16;
  }

  return v16;
}

- (id)icon
{
  void *v3;
  char v4;
  id UIImageClass;
  void *v6;
  float v7;
  void *v8;
  const __CFString *v9;

  -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  if ((v4 & 1) != 0)
    goto LABEL_7;
  if (!self->_preferApplicationIcon
    || !self->_applicationRecord
    || (UIImageClass = getUIImageClass(),
        -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        MGGetFloat32Answer(),
        objc_msgSend(UIImageClass, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    if (!self->_url && !self->_appLink)
    {
      v9 = CFSTR("arrow.up.forward.app");
      goto LABEL_8;
    }
LABEL_7:
    v9 = CFSTR("safari");
LABEL_8:
    objc_msgSend(getUIImageClass(), "systemImageNamed:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4;
  LSAppLink *appLink;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSURL *url;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LSApplicationRecord *applicationRecord;
  void *v27;
  void *v28;
  NSURL *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint8_t buf[16];

  v4 = a3;
  appLink = self->_appLink;
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (appLink)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLActionPickerItem: opening app link", buf, 2u);
    }
    _bcs_openAppLinkIgnoringOpenStrategy(self->_appLink, v4, self->_codePayload);
    +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink targetApplicationProxy](self->_appLink, "targetApplicationProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink URL](self->_appLink, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredBundleIdentifier:forURL:", v9, v10);

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLActionPickerItem: opening url", buf, 2u);
    }
    if (-[NSURL _bcs_isUPIURL](self->_url, "_bcs_isUPIURL"))
    {
      +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPreferredBundleIdentifier:forURL:", v12, self->_url);

    }
    -[BCSActionPickerItem action](self, "action");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasSensitiveURL");

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      v40 = 0;
      v17 = objc_msgSend(v15, "openSensitiveURL:withOptions:error:", url, v4, &v40);
      v18 = v40;

      if ((v17 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSURLActionPickerItem performActionWithFBOptions:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      applicationRecord = self->_applicationRecord;
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = self->_url;
      if (applicationRecord)
      {
        -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v29, v30, 0, 0, 0, 0, v4, 0);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "start");
      }
      else
      {
        v39 = 0;
        v31 = objc_msgSend(v27, "openURL:withOptions:error:", v29, v4, &v39);
        v18 = v39;

        if ((v31 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BCSURLActionPickerItem performActionWithFBOptions:].cold.1((uint64_t)v18, v32, v33, v34, v35, v36, v37, v38);
      }
    }

    -[BCSActionPickerItem didPerformAction](self, "didPerformAction");
  }

}

- (void)performAction
{
  -[BCSURLActionPickerItem performActionWithFBOptions:](self, "performActionWithFBOptions:", 0);
}

- (id)targetApplicationBundleIdentifier
{
  void *v2;
  void *v3;

  if (self->_appLink)
  {
    -[LSAppLink targetApplicationProxy](self->_appLink, "targetApplicationProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)actionURL
{
  NSURL *v2;

  if (self->_appLink)
  {
    -[LSAppLink URL](self->_appLink, "URL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_url;
  }
  return v2;
}

- (BOOL)useInlineMenu
{
  void *v3;
  char v4;

  -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  return (v4 & 1) == 0 && self->_applicationRecord != 0;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (BCSCodePayload)codePayload
{
  return self->_codePayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codePayload, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)performActionWithFBOptions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: cannot open Home app with sensitive URL with error: %{private}@", a5, a6, a7, a8, 3u);
}

@end
