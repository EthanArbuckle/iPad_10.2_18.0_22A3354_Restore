@implementation HUMediaSourceListItemCell

- (HUMediaSourceListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUMediaSourceListItemCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIActivityIndicatorView *spinner;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUMediaSourceListItemCell;
  v4 = -[HUTitleDescriptionCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HUIconCell iconView](v4, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = (void *)objc_msgSend(v5, "initWithFrame:");
    -[HUMediaSourceListItemCell setServiceIconView:](v4, "setServiceIconView:", v7);

    -[HUMediaSourceListItemCell serviceIconView](v4, "serviceIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    -[HUMediaSourceListItemCell serviceIconView](v4, "serviceIconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 5.0);

    -[HUMediaSourceListItemCell serviceIconView](v4, "serviceIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClipsToBounds:", 1);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v12;

    -[HUIconCell iconView](v4, "iconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSourceListItemCell serviceIconView](v4, "serviceIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

  }
  return v4;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceListItemCell;
  -[HUTitleDescriptionCell updateUIWithAnimation:](&v21, sel_updateUIWithAnimation_, a3);
  -[HUIconCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSourceListItemCell serviceIconView](self, "serviceIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  -[HUIconCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loadingState");

  if (v9)
  {
    -[HUMediaSourceListItemCell spinner](self, "spinner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSourceListItemCell setAccessoryView:](self, "setAccessoryView:", v10);

    -[HUMediaSourceListItemCell spinner](self, "spinner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAnimating");

  }
  else
  {
    -[HUMediaSourceListItemCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[HUMediaSourceListItemCell spinner](self, "spinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopAnimating");

    objc_opt_class();
    -[HUIconCell item](self, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = objc_msgSend(v15, "success");
    if ((v16 & 1) != 0)
    {
      v17 = 1;
      -[HUMediaSourceListItemCell setAccessoryType:](self, "setAccessoryType:", 1);
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      goto LABEL_10;
    }
    -[HUMediaSourceListItemCell setAccessoryType:](self, "setAccessoryType:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v19 = 1;
LABEL_10:
  -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v18);

  if (v19)
  if (v17)

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaSourceListItemCell;
  -[HUTitleDescriptionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUMediaSourceListItemCell serviceIconView](self, "serviceIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[HUMediaSourceListItemCell setAccessoryView:](self, "setAccessoryView:", 0);
}

- (UIImageView)serviceIconView
{
  return self->_serviceIconView;
}

- (void)setServiceIconView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIconView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_serviceIconView, 0);
}

@end
