@implementation AMSUIToastViewController

- (AMSUIToastViewController)initWithRequest:(id)a3
{
  id v4;
  AMSUIToastViewController *v5;
  AMSUIToastAppearance *v6;
  AMSUIToastAppearance *preferredAppearance;
  AMSUIToastAppearance *v8;
  void *v9;
  uint64_t v10;
  AMSUIToastAppearance *requestAppearance;
  AMSUIToastTransitioningDelegate *v12;
  AMSUIToastTransitioningDelegate *transitionDelegate;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIToastViewController;
  v5 = -[AMSUIBaseMessageViewController initWithRequest:](&v16, sel_initWithRequest_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIToastAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIToastAppearance alloc];
    objc_msgSend(v4, "appearanceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIToastAppearance initWithDictionary:](v8, "initWithDictionary:", v9);
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIToastAppearance *)v10;

    v12 = objc_alloc_init(AMSUIToastTransitioningDelegate);
    transitionDelegate = v5->_transitionDelegate;
    v5->_transitionDelegate = v12;

    -[AMSUIToastViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 4);
    -[AMSUIToastViewController transitionDelegate](v5, "transitionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIToastViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v14);

    -[AMSUIToastViewController setViewRespectsSystemMinimumLayoutMargins:](v5, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  }

  return v5;
}

- (AMSUIToastViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIToastViewController;
  return -[AMSUIBaseMessageViewController initWithRequest:bag:account:](&v6, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIToastViewController;
  -[AMSUIBaseMessageViewController _setDialogRequest:](&v9, sel__setDialogRequest_, v4);
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;

LABEL_4:
    objc_msgSend(v5, "setAccessoryViewForDialogAction:target:action:", v8, self, sel__didTapActionButton_);

    goto LABEL_5;
  }
  objc_msgSend(v4, "defaultAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
LABEL_5:

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
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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
      -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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

  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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
      -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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

  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
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
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
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
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[AMSUIToastViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryButtonColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryButtonColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v30, "accessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11 && v8)
    objc_msgSend(v11, "setPreferredForegroundColor:", v8);
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessoryButtonFont");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;

  }
  else
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_16;
  }
  objc_msgSend(v11, "setPreferredFont:", v14);

LABEL_16:
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "backgroundColor");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;

  }
  else
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_20;
  }
  objc_msgSend(v30, "setBackgroundColor:", v17);

LABEL_20:
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backgroundImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v30, "backgroundImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v20);

  if (!v19)
  {

  }
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageTintColor");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;

LABEL_27:
    objc_msgSend(v30, "setIconColor:", v24);

    goto LABEL_28;
  }
  -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageTintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    goto LABEL_27;
LABEL_28:
  -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ams_imageWithRenderingMode:", -[AMSUIToastViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v28);

  }
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  objc_msgSend(v11, "commitAppearance");

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
  -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconAnimationPlayCount");

    if (v7 != -90)
    {
      -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "iconAnimationPlayCount");

    }
  }
  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iconAnimationPlayCount");

    if (v12 != -90)
    {
      -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "iconAnimationPlayCount");

    }
  }
  return v3;
}

- (id)_effectiveImageSymbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSymbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (unint64_t)_messageStyle
{
  return 4;
}

- (AMSUIToastAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  -[AMSUIToastViewController _commitAppearance](self, "_commitAppearance");
}

- (int64_t)_primaryImageRenderingMode
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AMSUIToastViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryImageRenderingMode");

  -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryImageRenderingMode");

  if (v6)
  {
    -[AMSUIToastViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "primaryImageRenderingMode");

  }
  return v4;
}

- (AMSUIToastAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_requestAppearance, a3);
}

- (AMSUIToastTransitioningDelegate)transitionDelegate
{
  return self->_transitionDelegate;
}

- (void)setTransitionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_transitionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionDelegate, 0);
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
}

@end
