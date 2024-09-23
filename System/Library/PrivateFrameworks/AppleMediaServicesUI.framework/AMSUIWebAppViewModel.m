@implementation AMSUIWebAppViewModel

- (AMSUIWebAppViewModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebAppViewModel *v8;
  void *v9;
  NSString *v10;
  NSString *accessibilityLabel;
  void *v12;
  NSString *v13;
  NSString *bundleIdentifier;
  void *v15;
  id v16;
  uint64_t v17;
  NSURL *iconURL;
  void *v19;
  NSString *v20;
  NSString *title;
  NSString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AMSUIWebAppViewModel;
  v8 = -[AMSUIWebAppViewModel init](&v32, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    accessibilityLabel = v8->_accessibilityLabel;
    v8->_accessibilityLabel = v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iconURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v16);
      iconURL = v8->_iconURL;
      v8->_iconURL = (NSURL *)v17;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    title = v8->_title;
    v8->_title = v20;

    if (!v8->_title)
    {
      v22 = v8->_bundleIdentifier;
      v31 = 0;
      objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v22, 1, &v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31;
      if (v23)
      {
        objc_msgSend(v23, "localizedName");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v8->_title;
        v8->_title = (NSString *)v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v26, "OSLogObject");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_opt_class();
          objc_msgSend(v7, "logKey");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v28;
          v35 = 2114;
          v36 = v29;
          _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get bundle record", buf, 0x16u);

        }
      }

    }
  }

  return v8;
}

- (id)_makeBarButtonItemView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  AMSUICommonLabel *v12;
  void *v13;
  void *v14;
  AMSUICommonStackView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  objc_msgSend(v3, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  +[AMSUICommonScreen scale](AMSUICommonScreen, "scale");
  -[AMSUIWebAppViewModel iconWithSize:scale:](self, "iconWithSize:scale:", 30.0, 30.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke;
  v22[3] = &unk_24CB50A28;
  v23 = v3;
  v11 = v3;
  objc_msgSend(v9, "addSuccessBlock:", v22);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke_2;
  v21[3] = &unk_24CB4F560;
  v21[4] = self;
  objc_msgSend(v9, "addErrorBlock:", v21);
  v12 = objc_alloc_init(AMSUICommonLabel);
  -[AMSUIWebAppViewModel title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonLabel setText:](v12, "setText:", v13);

  -[AMSUICommonLabel setTextAlignment:](v12, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonLabel setTextColor:](v12, "setTextColor:", v14);

  v15 = objc_alloc_init(AMSUICommonStackView);
  -[AMSUICommonStackView setSpacing:](v15, "setSpacing:", 8.0);
  -[AMSUICommonStackView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24[0] = v11;
  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonStackView addArrangedSubviews:](v15, "addArrangedSubviews:", v16);

  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_appTint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v17);

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE220], 2, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonLabel setFont:](v12, "setFont:", v19);

  -[AMSUICommonStackView setAxis:](v15, "setAxis:", 0);
  return v15;
}

uint64_t __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_setImage_, a2, 0);
}

void __46__AMSUIWebAppViewModel__makeBarButtonItemView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v2;
    v5 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load image %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (id)iconWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  height = a3.height;
  width = a3.width;
  -[AMSUIWebAppViewModel iconURL](self, "iconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSUIImageLoader defaultLoader](AMSUIImageLoader, "defaultLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchImageWithURL:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BE08340]);
    v12 = objc_alloc(MEMORY[0x24BE51A90]);
    -[AMSUIWebAppViewModel bundleIdentifier](self, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", width, height, a4);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__AMSUIWebAppViewModel_iconWithSize_scale___block_invoke;
    v16[3] = &unk_24CB50A50;
    v10 = v11;
    v17 = v10;
    objc_msgSend(v9, "getCGImageForImageDescriptor:completion:", v14, v16);

  }
  return v10;
}

void __43__AMSUIWebAppViewModel_iconWithSize_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", a2);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    AMSError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:");
  }

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AMSUIWebAppViewModel accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIWebAppViewModel accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("accessibilityLabel"));

  }
  -[AMSUIWebAppViewModel bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSUIWebAppViewModel bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bundleIdentifier"));

  }
  -[AMSUIWebAppViewModel iconURL](self, "iconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIWebAppViewModel iconURL](self, "iconURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("iconURL"));

  }
  -[AMSUIWebAppViewModel title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSUIWebAppViewModel title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("title"));

  }
  objc_msgSend(v3, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

+ (BOOL)validateJSObject:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityLabel, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
