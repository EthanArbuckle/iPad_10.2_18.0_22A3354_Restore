@implementation BookmarksBarLabelButton

+ (id)labelButtonWithButtonStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(v4, "setButtonStyle:", a3);
  if (a3 <= 1)
    objc_msgSend(v4, "_installFaviconView");
  return v4;
}

+ (id)labelButtonWithSiteIcon
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v2, "_installFaviconView");
  return v2;
}

+ (id)labelButton
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  return v2;
}

- (BookmarksBarLabelButton)initWithFrame:(CGRect)a3
{
  BookmarksBarLabelButton *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v6;
  id v7;
  uint64_t v8;
  UIEditMenuInteraction *editMenuInteraction;
  BookmarksBarLabelButton *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BookmarksBarLabelButton;
  v3 = -[BookmarksBarLabelButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__handleLongPressGestureRecognizer_);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    -[BookmarksBarLabelButton addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressGestureRecognizer);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC40D0]), "initWithTarget:action:", v3, sel__handleLongPressGestureRecognizer_);
    -[BookmarksBarLabelButton addGestureRecognizer:](v3, "addGestureRecognizer:", v6);

    objc_initWeak(&location, v3);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __41__BookmarksBarLabelButton_initWithFrame___block_invoke;
    v15 = &unk_1E9CF2DC0;
    objc_copyWeak(&v16, &location);
    -[BookmarksBarLabelButton setPointerStyleProvider:](v3, "setPointerStyleProvider:", &v12);
    v7 = objc_alloc(MEMORY[0x1E0DC37A0]);
    v8 = objc_msgSend(v7, "initWithDelegate:", v3, v12, v13, v14, v15);
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = (UIEditMenuInteraction *)v8;

    -[BookmarksBarLabelButton addInteraction:](v3, "addInteraction:", v3->_editMenuInteraction);
    v10 = v3;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v3;
}

id __41__BookmarksBarLabelButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "contentRectForBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "titleRectForContentRect:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v3, "imageRectForContentRect:", v6, v8, v10, v12);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  if (!CGRectIsEmpty(v43))
  {
    v44.origin.x = v14;
    v44.origin.y = v16;
    v44.size.width = v18;
    v44.size.height = v20;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v45 = CGRectUnion(v44, v48);
    v14 = v45.origin.x;
    v16 = v45.origin.y;
    v18 = v45.size.width;
    v20 = v45.size.height;
  }
  if (objc_msgSend(WeakRetained, "_canShowIcon"))
  {
    v25 = v14 + -29.0;
    v26 = v16 + -6.0;
    v27 = v18 + 37.0;
    v28 = v20 + 12.0;
  }
  else
  {
    v46.origin.x = v14;
    v46.origin.y = v16;
    v46.size.width = v18;
    v46.size.height = v20;
    v47 = CGRectInset(v46, -8.0, -6.0);
    v25 = v47.origin.x;
    v26 = v47.origin.y;
    v27 = v47.size.width;
    v28 = v47.size.height;
  }
  objc_msgSend(v3, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertRect:fromView:", v3, v25, v26, v27, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v3);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", v31, v33, v35, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (BOOL)_canShowIcon
{
  return self->_faviconView && !self->_hasLeadingEmoji;
}

- (void)_installFaviconView
{
  SFFaviconView *v3;
  SFFaviconView *faviconView;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_faviconView)
  {
    v3 = (SFFaviconView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC78]), "initWithFrame:", 0.0, 0.0, 18.0, 18.0);
    faviconView = self->_faviconView;
    self->_faviconView = v3;

    -[SFFaviconView setIconContentMode:](self->_faviconView, "setIconContentMode:", 1);
    -[SFFaviconView setUserInteractionEnabled:](self->_faviconView, "setUserInteractionEnabled:", 0);
    -[BookmarksBarLabelButton addSubview:](self, "addSubview:", self->_faviconView);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__BookmarksBarLabelButton__installFaviconView__block_invoke;
    v5[3] = &unk_1E9CF25A0;
    objc_copyWeak(&v6, &location);
    -[SFFaviconView setTrailingInsetChangeHandler:](self->_faviconView, "setTrailingInsetChangeHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __46__BookmarksBarLabelButton__installFaviconView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 1)
  {
    v4 = (void *)MEMORY[0x1E0DC3798];
    objc_msgSend(v6, "locationInView:", self);
    objc_msgSend(v4, "configurationWithIdentifier:sourcePoint:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v5);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_openInNewTabs:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksBarLabelButtonDidSelectOpenInNewTab:", self);

}

- (void)_editBookmark:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksBarLabelButtonDidSelectEdit:", self);

}

- (void)_setIcon:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (-[BookmarksBarLabelButton _canShowIcon](self, "_canShowIcon"))
    v4 = v5;
  else
    v4 = 0;
  -[SFFaviconView setIcon:](self->_faviconView, "setIcon:", v4);

}

- (void)_updateFaviconForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id faviconToken;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (self->_faviconView)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A8E8]), "initWithURL:iconSize:fallbackType:iconDownloadingEnabled:", v4, 1, 1, 16.0, 16.0);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__BookmarksBarLabelButton__updateFaviconForURL___block_invoke;
    v9[3] = &unk_1E9CF2DE8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "registerRequest:priority:responseHandler:", v5, 2, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    faviconToken = self->_faviconToken;
    self->_faviconToken = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __48__BookmarksBarLabelButton__updateFaviconForURL___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "favicon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setIcon:", v4);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  v7 = v6;
  if (self->_buttonStyle == 1)
  {
    -[BookmarksBarLabelButton imageForState:](self, "imageForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = 25.0;
    else
      v9 = 21.0;
  }
  else
  {
    v9 = v5;
    if (-[BookmarksBarLabelButton _canShowIcon](self, "_canShowIcon"))
    {
      v9 = v9 + 21.0;
      if (width > 0.0)
        v9 = fmax(width, v9);
    }
  }
  v10 = v9;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setBookmark:(id)a3
{
  WebBookmark *v5;
  WebBookmark **p_bookmark;
  __CFString *v7;
  int v8;
  int64_t buttonStyle;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  WebBookmark *v19;

  v5 = (WebBookmark *)a3;
  p_bookmark = &self->_bookmark;
  if (self->_bookmark == v5)
    goto LABEL_17;
  v19 = v5;
  objc_storeStrong((id *)&self->_bookmark, a3);
  -[WebBookmark title](*p_bookmark, "title");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  self->_hasLeadingEmoji = -[__CFString safari_hasLeadingEmojiSafariIsRightToLeft:](v7, "safari_hasLeadingEmojiSafariIsRightToLeft:", -[BookmarksBarLabelButton _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") ^ 1);
  v8 = -[WebBookmark showIconOnly](*p_bookmark, "showIconOnly");
  buttonStyle = self->_buttonStyle;
  if (v8)
  {
    if (buttonStyle != 2)
    {
      self->_buttonStyle = 1;
LABEL_6:
      if (-[WebBookmark isFolder](*p_bookmark, "isFolder") && !self->_hasLeadingEmoji)
      {
        self->_buttonStyle = 0;
      }
      else if (self->_buttonStyle == 1)
      {
        if (self->_hasLeadingEmoji)
        {
          -[__CFString safari_leadingEmojiSafariIsRightToLeft:](v7, "safari_leadingEmojiSafariIsRightToLeft:", -[BookmarksBarLabelButton _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") ^ 1);
          v10 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v10;
        }
        else
        {

          v7 = &stru_1E9CFDBB0;
        }
      }
    }
  }
  else if (buttonStyle == 1)
  {
    goto LABEL_6;
  }
  -[BookmarksBarLabelButton setTitle:forState:](self, "setTitle:forState:", v7, 0);
  if (-[WebBookmark isFolder](*p_bookmark, "isFolder"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksBarLabelButton setImage:forState:](self, "setImage:forState:", v11, 0);

    v12 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationWithFont:scale:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksBarLabelButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("folder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksBarLabelButton _setIcon:](self, "_setIcon:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksBarLabelButton _setIcon:](self, "_setIcon:", v16);

    v17 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[WebBookmark address](*p_bookmark, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v17, "initWithString:", v18);

    -[BookmarksBarLabelButton _updateFaviconForURL:](self, "_updateFaviconForURL:", v15);
  }

  -[BookmarksBarLabelButton setNeedsLayout](self, "setNeedsLayout");
  v5 = v19;
LABEL_17:

}

- (void)setThemeColor:(id)a3
{
  -[SFFaviconView setThemeColor:](self->_faviconView, "setThemeColor:", a3);
}

- (UIColor)themeColor
{
  return (UIColor *)-[SFFaviconView themeColor](self->_faviconView, "themeColor");
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double Width;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v30.receiver = self;
  v30.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton titleRectForContentRect:](&v30, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  if (-[BookmarksBarLabelButton _canShowIcon](self, "_canShowIcon"))
  {
    -[SFFaviconView frame](self->_faviconView, "frame");
    v9 = v8;
    -[SFFaviconView frame](self->_faviconView, "frame");
    if (v7 >= v9)
    {
      v14 = v10;
      -[SFFaviconView frame](self->_faviconView, "frame");
      v16 = (v7 - v15) * 0.5;
      -[SFFaviconView frame](self->_faviconView, "frame");
      v18 = v17;
      -[SFFaviconView frame](self->_faviconView, "frame");
      -[SFFaviconView setFrame:](self->_faviconView, "setFrame:", v14, v16, v18);
      v12 = 0.0;
    }
    else
    {
      v12 = (v11 - v7) * 0.5;
    }
    -[SFFaviconView trailingInset](self->_faviconView, "trailingInset");
    v13 = 21.0 - v19;
    -[BookmarksBarLabelButton imageForState:](self, "imageForState:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[BookmarksBarLabelButton _imageView](self, "_imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v23 = v22;

    }
    else
    {
      v23 = 0.0;
    }

    v31.origin.x = v13;
    v31.origin.y = v12;
    v31.size.width = v5;
    v31.size.height = v7;
    Width = CGRectGetWidth(v31);
    -[BookmarksBarLabelButton bounds](self, "bounds");
    v25 = CGRectGetWidth(v32);
    v33.origin.x = v13;
    v33.origin.y = v12;
    v33.size.width = v5;
    v33.size.height = v7;
    v5 = fmin(Width, v25 - CGRectGetMinX(v33) - v23);
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v26 = v13;
  v27 = v12;
  v28 = v5;
  v29 = v7;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MinY;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  objc_super v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BookmarksBarLabelButton titleRectForContentRect:](self, "titleRectForContentRect:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v38.receiver = self;
  v38.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton titleRectForContentRect:](&v38, sel_titleRectForContentRect_, x, y, width, height);
  v35 = v17;
  v36 = v16;
  v33 = v19;
  v34 = v18;
  v37.receiver = self;
  v37.super_class = (Class)BookmarksBarLabelButton;
  -[BookmarksBarLabelButton imageRectForContentRect:](&v37, sel_imageRectForContentRect_, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v39.origin.x = v9;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  CGRectGetMaxX(v39);
  _SFRoundFloatToPixels();
  v27 = v26;
  v40.origin.x = v9;
  v40.origin.y = v11;
  v40.size.width = v13;
  v40.size.height = v15;
  MinY = CGRectGetMinY(v40);
  v41.origin.y = v35;
  v41.origin.x = v36;
  v41.size.height = v33;
  v41.size.width = v34;
  v29 = v21 + MinY - CGRectGetMinY(v41);
  v30 = v27;
  v31 = v23;
  v32 = v25;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (CGRect)_bookmarksBarLabelButtonHitRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[BookmarksBarLabelButton bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  UIEdgeInsetsMin();
  v11 = v5 + v10;
  v14 = v7 - (v12 + v13);
  v16 = v9 - (v10 + v15);
  v17 = v3 + v12;
  v18 = v11;
  v19 = v14;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[BookmarksBarLabelButton _bookmarksBarLabelButtonHitRect](self, "_bookmarksBarLabelButtonHitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[BookmarksBarLabelButton _bookmarksBarLabelButtonHitRect](self, "_bookmarksBarLabelButtonHitRect", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", CFSTR("BookmarksBarLabelButton"));
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksBarLabelButton bookmark](self, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "bookmarkContainsLeafBookmark:", v8);

  if (v9)
  {
    -[BookmarksBarLabelButton bookmark](self, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isFolder");
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3678], "commandWithTitle:image:action:propertyList:", v11, 0, sel__openInNewTabs_, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("OpenInNewTab"));
    objc_msgSend(v6, "addObject:", v12);

  }
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3678], "commandWithTitle:image:action:propertyList:", v13, 0, sel__editBookmark_, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Edit"));
  objc_msgSend(v6, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("SafariContextMenu"));

  return v15;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[BookmarksBarLabelButton bounds](self, "bounds", a3, a4);
  if (self->_buttonStyle == 1)
  {
    if (!-[BookmarksBarLabelButton _canShowIcon](self, "_canShowIcon"))
    {
      -[BookmarksBarLabelButton titleLabel](self, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v6 = v8;

      goto LABEL_6;
    }
    -[SFFaviconView bounds](self->_faviconView, "bounds");
  }
  v6 = v5;
LABEL_6:
  -[BookmarksBarLabelButton convertRect:fromView:](self, "convertRect:fromView:", self, 0.0, 0.0, v6, 15.0);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)accessibilityIdentifier
{
  int v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Type");
  v3 = -[WebBookmark isFolder](self->_bookmark, "isFolder");
  v4 = CFSTR("Bookmark");
  if (v3)
    v4 = CFSTR("Folder");
  v13[0] = v4;
  v12[1] = CFSTR("PerBookmarkShowTitle");
  v5 = -[WebBookmark showIconOnly](self->_bookmark, "showIconOnly");
  v6 = CFSTR("true");
  if (v5)
    v6 = CFSTR("false");
  v13[1] = v6;
  v12[2] = CFSTR("ShowingIcon");
  v7 = -[BookmarksBarLabelButton _canShowIcon](self, "_canShowIcon");
  v8 = CFSTR("Emoji");
  if (v7)
    v8 = CFSTR("Favicon");
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (BOOL)usesLightControls
{
  return self->_usesLightControls;
}

- (void)setUsesLightControls:(BOOL)a3
{
  self->_usesLightControls = a3;
}

- (BookmarksBarLabelButtonDelegate)delegate
{
  return (BookmarksBarLabelButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)cursorRegionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cursorRegionInset.top;
  left = self->_cursorRegionInset.left;
  bottom = self->_cursorRegionInset.bottom;
  right = self->_cursorRegionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCursorRegionInset:(UIEdgeInsets)a3
{
  self->_cursorRegionInset = a3;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_faviconView, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
}

@end
