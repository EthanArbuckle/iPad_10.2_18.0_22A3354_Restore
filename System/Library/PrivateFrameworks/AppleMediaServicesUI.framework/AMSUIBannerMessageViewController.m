@implementation AMSUIBannerMessageViewController

- (AMSUIBannerMessageViewController)initWithRequest:(id)a3
{
  id v4;
  AMSUIBannerMessageViewController *v5;
  AMSUIBannerAppearance *v6;
  AMSUIBannerAppearance *preferredAppearance;
  AMSUIBannerAppearance *v8;
  void *v9;
  uint64_t v10;
  AMSUIBannerAppearance *requestAppearance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBannerMessageViewController;
  v5 = -[AMSUIBaseMessageViewController initWithRequest:](&v13, sel_initWithRequest_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIBannerAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIBannerAppearance alloc];
    objc_msgSend(v4, "appearanceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIBannerAppearance initWithDictionary:](v8, "initWithDictionary:", v9);
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIBannerAppearance *)v10;

  }
  return v5;
}

- (AMSUIBannerMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIBannerMessageViewController;
  return -[AMSUIBaseMessageViewController initWithRequest:bag:account:](&v6, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIBannerMessageViewController;
  -[AMSUIBaseMessageViewController _setDialogRequest:](&v25, sel__setDialogRequest_, v4);
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "buttonActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (!v8)
  {

    v11 = 0;
    v10 = 0;
    if (!v6)
      goto LABEL_24;
LABEL_23:
    objc_msgSend(v5, "setBodyDialogAction:target:action:", v6, self, sel__didTapActionButton_);
    goto LABEL_24;
  }
  v9 = v8;
  v20 = v5;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (v11 || objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "style") != 2)
      {
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "OSLogObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v27 = v18;
            v19 = v18;
            _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);

          }
          goto LABEL_19;
        }
        v10 = v14;
      }
      else
      {
        v11 = v14;
      }
      v15 = v14;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v9)
      continue;
    break;
  }
LABEL_19:

  if (v11)
  {
    v5 = v20;
    objc_msgSend(v20, "setAccessoryViewForDialogAction:target:action:", v11, self, sel__didTapActionButton_);
    if (!v6)
      goto LABEL_24;
    goto LABEL_23;
  }
  v5 = v20;
  if (v10)
    objc_msgSend(v20, "setAccessoryViewForDialogAction:target:action:", v10, self, sel__didTapActionButton_);
  v11 = 0;
  if (v6)
    goto LABEL_23;
LABEL_24:

}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_messageFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_messageFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "messageFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_messageTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_titleFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_titleFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_titleTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_commitAppearance
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[AMSUIBannerMessageViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryButtonColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v6 && v10)
    objc_msgSend(v6, "setPreferredForegroundColor:", v10);
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessoryButtonFont");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;

  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_16;
  }
  objc_msgSend(v6, "setPreferredFont:", v13);

LABEL_16:
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;

  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_20;
  }
  objc_msgSend(v33, "setBackgroundColor:", v16);

LABEL_20:
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backgroundImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v33, "backgroundImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v19);

  if (!v18)
  {

  }
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageTintColor");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;

  }
  else
  {
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageTintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_28;
  }
  objc_msgSend(v33, "setIconColor:", v23);

LABEL_28:
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "separatorColor");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;

LABEL_31:
    objc_msgSend(v33, "setSeparatorColor:", v27);

    goto LABEL_32;
  }
  -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "separatorColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    goto LABEL_31;
LABEL_32:
  -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ams_imageWithRenderingMode:", -[AMSUIBannerMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:", v31);

  }
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  objc_msgSend(v6, "commitAppearance");

}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = 1;
  -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconAnimationPlayCount");

    if (v7 != -90)
    {
      -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "iconAnimationPlayCount");

    }
  }
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iconAnimationPlayCount");

    if (v12 != -90)
    {
      -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "iconAnimationPlayCount");

    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[AMSUIBannerMessageViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 5)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE210], 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_effectiveImageSymbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AMSUIBannerMessageViewController _defaultPreferredImageSymbolConfiguration](self, "_defaultPreferredImageSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_messageStyle
{
  return 1;
}

- (AMSUIBannerAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  -[AMSUIBannerMessageViewController _commitAppearance](self, "_commitAppearance");
}

- (int64_t)_primaryImageRenderingMode
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AMSUIBannerMessageViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryImageRenderingMode");

  -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryImageRenderingMode");

  if (v6)
  {
    -[AMSUIBannerMessageViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "primaryImageRenderingMode");

  }
  return v4;
}

- (AMSUIBannerAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_requestAppearance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
}

@end
