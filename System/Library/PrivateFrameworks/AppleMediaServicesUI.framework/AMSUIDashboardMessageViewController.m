@implementation AMSUIDashboardMessageViewController

- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3
{
  id v4;
  AMSUIDashboardMessageViewController *v5;
  AMSUIDashboardMessageAppearance *v6;
  AMSUIDashboardMessageAppearance *preferredAppearance;
  AMSUIDashboardMessageAppearance *v8;
  void *v9;
  uint64_t v10;
  AMSUIDashboardMessageAppearance *requestAppearance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIDashboardMessageViewController;
  v5 = -[AMSUIBaseMessageViewController initWithRequest:](&v13, sel_initWithRequest_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIDashboardMessageAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIDashboardMessageAppearance alloc];
    objc_msgSend(v4, "appearanceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIDashboardMessageAppearance initWithDictionary:](v8, "initWithDictionary:", v9);
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIDashboardMessageAppearance *)v10;

  }
  return v5;
}

- (AMSUIDashboardMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIDashboardMessageViewController;
  return -[AMSUIBaseMessageViewController initWithRequest:bag:account:](&v6, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIDashboardMessageViewController *v20;
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
  v25.super_class = (Class)AMSUIDashboardMessageViewController;
  -[AMSUIBaseMessageViewController _setDialogRequest:](&v25, sel__setDialogRequest_, v4);
  v20 = self;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v4;
  objc_msgSend(v4, "buttonActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v9 || objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "style") != 2)
        {
          if ((unint64_t)objc_msgSend(v5, "count") > 1)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "OSLogObject");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v27 = v15;
              v16 = v15;
              _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v5, "addObject:", v12);
          }
        }
        else
        {
          v9 = v12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v17)
    objc_msgSend(v18, "setBodyDialogAction:target:action:", v17, v20, sel__didTapActionButton_);
  if (v9)
    objc_msgSend(v18, "setAccessoryViewForDialogAction:target:action:", v9, v20, sel__didTapActionButton_);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v18, "setFooterForDialogActions:target:action:", v5, v20, sel__didTapActionButton_);

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
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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
      -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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

  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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
      -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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

  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
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
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[AMSUIDashboardMessageViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryButtonColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryButtonColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "accessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v12 && v9)
    objc_msgSend(v12, "setPreferredForegroundColor:", v9);
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryButtonFont");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;

  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_15;
  }
  objc_msgSend(v12, "setPreferredFont:", v15);

LABEL_15:
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundColor");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;

  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_19;
  }
  objc_msgSend(v5, "setBackgroundColor:", v18);

LABEL_19:
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "backgroundImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:", v21);

  if (!v20)
  {

  }
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "footerButtonColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "footerButtonColor");
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "footerButtonFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v54 = v12;
  if (v29)
  {
    v31 = v29;
  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "footerButtonFont");
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  v33 = v9;

  objc_msgSend(v5, "footerButtonViews");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (v26)
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setPreferredForegroundColor:", v26);
        if (v31)
          objc_msgSend(v41, "setPreferredFont:", v31);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v38);
  }

  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageTintColor");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;

  }
  else
  {
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "imageTintColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
      goto LABEL_47;
  }
  objc_msgSend(v5, "setIconColor:", v44);

LABEL_47:
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "separatorColor");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;

LABEL_50:
    objc_msgSend(v5, "setSeparatorColor:", v48);

    goto LABEL_51;
  }
  -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "separatorColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    goto LABEL_50;
LABEL_51:
  -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "ams_imageWithRenderingMode:", -[AMSUIDashboardMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setImage:", v52);

  }
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  objc_msgSend(v54, "commitAppearance");

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
  -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconAnimationPlayCount");

    if (v7 != -90)
    {
      -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "iconAnimationPlayCount");

    }
  }
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iconAnimationPlayCount");

    if (v12 != -90)
    {
      -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "iconAnimationPlayCount");

    }
  }
  return v3;
}

- (unint64_t)_messageStyle
{
  return 5;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[AMSUIDashboardMessageViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE210], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != 5)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
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

  -[AMSUIDashboardMessageViewController _defaultPreferredImageSymbolConfiguration](self, "_defaultPreferredImageSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AMSUIDashboardMessageAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  -[AMSUIDashboardMessageViewController _commitAppearance](self, "_commitAppearance");
}

- (int64_t)_primaryImageRenderingMode
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AMSUIDashboardMessageViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryImageRenderingMode");

  -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryImageRenderingMode");

  if (v6)
  {
    -[AMSUIDashboardMessageViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "primaryImageRenderingMode");

  }
  return v4;
}

- (AMSUIDashboardMessageAppearance)requestAppearance
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
