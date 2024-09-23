@implementation HUMediaServiceAccountCell

- (HUMediaServiceAccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUMediaServiceAccountCell *v4;
  HUMediaServiceAccountCell *v5;
  HUMediaServiceAccountView *v6;
  void *v7;
  uint64_t v8;
  HUMediaServiceAccountView *mediaServiceAccountView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceAccountCell;
  v4 = -[HUMediaServiceAccountCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUMediaServiceAccountCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[HUMediaServiceAccountCell setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    v6 = [HUMediaServiceAccountView alloc];
    -[HUMediaServiceAccountCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = -[HUMediaServiceAccountView initWithFrame:](v6, "initWithFrame:");
    mediaServiceAccountView = v5->_mediaServiceAccountView;
    v5->_mediaServiceAccountView = (HUMediaServiceAccountView *)v8;

    -[HUMediaServiceAccountCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_mediaServiceAccountView);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceAccountCell;
  -[HUMediaServiceAccountCell layoutSubviews](&v13, sel_layoutSubviews);
  -[HUMediaServiceAccountCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUMediaServiceAccountCell mediaServiceAccountView](self, "mediaServiceAccountView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUMediaServiceAccountCell mediaServiceAccountView](self, "mediaServiceAccountView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HUMediaServiceAccountCell mediaServiceAccountView](self, "mediaServiceAccountView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUMediaServiceAccountCell mediaServiceAccountView](self, "mediaServiceAccountView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUMediaServiceAccountCell mediaServiceAccountView](self, "mediaServiceAccountView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (HUMediaServiceAccountView)mediaServiceAccountView
{
  return self->_mediaServiceAccountView;
}

- (void)setMediaServiceAccountView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceAccountView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceAccountView, 0);
}

@end
