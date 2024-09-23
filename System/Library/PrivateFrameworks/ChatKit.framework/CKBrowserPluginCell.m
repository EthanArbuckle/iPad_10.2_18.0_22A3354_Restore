@implementation CKBrowserPluginCell

+ (id)reuseIdentifier
{
  return CFSTR("CKBrowserPluginCell");
}

- (id)iconView
{
  void *v3;
  id v4;
  void *v5;

  -[CKBrowserPluginCell browserImage](self, "browserImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKBrowserPluginCell setBrowserImage:](self, "setBrowserImage:", v5);

  }
  return -[CKBrowserPluginCell browserImage](self, "browserImage");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *selectionOutline;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  if (-[CKBrowserPluginCell isSelected](self, "isSelected") != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKBrowserPluginCell;
    -[CKBrowserPluginCell setSelected:](&v15, sel_setSelected_, v3);
    v5 = 0.0;
    if (v3)
    {
      v5 = 1.0;
      if (!self->_selectionOutline)
      {
        v6 = objc_alloc(MEMORY[0x1E0CEA658]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "theme");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appSelectionOutline");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v9);
        selectionOutline = self->_selectionOutline;
        self->_selectionOutline = v10;

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "theme");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appSelectionOutlineColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setTintColor:](self->_selectionOutline, "setTintColor:", v14);

        -[CKBrowserPluginCell addSubview:](self, "addSubview:", self->_selectionOutline);
        -[CKBrowserPluginCell sendSubviewToBack:](self, "sendSubviewToBack:", self->_selectionOutline);
        -[CKBrowserPluginCell setNeedsLayout](self, "setNeedsLayout");
      }
    }
    -[UIImageView setAlpha:](self->_selectionOutline, "setAlpha:", v5);
  }
}

- (void)layoutSubviews
{
  UIImageView *selectionOutline;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserPluginCell;
  -[CKBrowserCell layoutSubviews](&v4, sel_layoutSubviews);
  selectionOutline = self->_selectionOutline;
  -[CKBrowserCell selectionFrame](self, "selectionFrame");
  -[UIImageView setFrame:](selectionOutline, "setFrame:");
}

- (void)_setImageForPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKBrowserPluginCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBrowserPluginCell browserImage](self, "browserImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

}

- (void)setPlugin:(id)a3
{
  -[CKBrowserPluginCell setPlugin:hideShinyStatus:](self, "setPlugin:hideShinyStatus:", a3, 0);
}

- (void)setPlugin:(id)a3 hideShinyStatus:(BOOL)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CKBrowserSelectionLabelAccessoryView *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[CKBrowserPluginCell _setImageForPlugin:](self, "_setImageForPlugin:", v23);
  objc_msgSend(v23, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  -[CKBrowserCell browserLabel](self, "browserLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MEMOJI_STICKERS_SHORT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v12;
    objc_msgSend(v10, "setText:", v12);

    goto LABEL_7;
  }
  objc_msgSend(v23, "browserShortDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v23, "browserDisplayName");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v10, "setText:", v11);
LABEL_7:

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "badgeValueForPlugin:", v15);

  -[CKBrowserCell badgeView](self, "badgeView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:", v16);

  -[CKBrowserCell badgeView](self, "badgeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", v16 == 0);

  objc_storeStrong((id *)&self->_plugin, a3);
  -[CKBrowserPluginCell _updateShinyStatus](self, "_updateShinyStatus");
  -[CKBrowserCell shinyStatusView](self, "shinyStatusView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeFromSuperview");

  if (!a4
    && (-[CKBrowserCell shinyStatus](self, "shinyStatus") || -[CKBrowserCell shinyStatus](self, "shinyStatus") != 3))
  {
    v20 = -[CKBrowserSelectionLabelAccessoryView initWithLabelAccessoryType:]([CKBrowserSelectionLabelAccessoryView alloc], "initWithLabelAccessoryType:", -[CKBrowserCell shinyStatus](self, "shinyStatus"));
    -[CKBrowserCell setShinyStatusView:](self, "setShinyStatusView:", v20);

    -[CKBrowserPluginCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserCell shinyStatusView](self, "shinyStatusView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

  }
  -[CKBrowserPluginCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateShinyStatus
{
  void *v3;
  int v4;
  CKBrowserPluginCell *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[CKBrowserPluginCell plugin](self, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBetaPlugin");

  if (v4)
  {
    v5 = self;
    v6 = 2;
  }
  else
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "launchStatusForPlugin:", self->_plugin);

    v5 = self;
    if (v8 == 1)
    {
      v6 = 0;
    }
    else if (v8)
    {
      v6 = 3;
    }
    else
    {
      v6 = 1;
    }
  }
  -[CKBrowserCell setShinyStatus:](v5, "setShinyStatus:", v6);
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (UIImageView)browserImage
{
  return self->_browserImage;
}

- (void)setBrowserImage:(id)a3
{
  objc_storeStrong((id *)&self->_browserImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserImage, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_selectionOutline, 0);
}

@end
