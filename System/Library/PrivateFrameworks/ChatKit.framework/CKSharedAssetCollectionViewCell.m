@implementation CKSharedAssetCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedAssetCollectionViewCell_reuseIdentifier");
}

- (CKSharedAssetCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKSharedAssetCollectionViewCell *v3;
  CKSharedAssetCollectionViewCell *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKSharedAssetCollectionViewCell;
  v3 = -[CKSharedAssetCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKSharedAssetCollectionViewCell cornerRadius](v3, "cornerRadius");
    v6 = v5;
    -[CKSharedAssetCollectionViewCell layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", v6);

    -[CKSharedAssetCollectionViewCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSharedAssetCollectionViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
  return v4;
}

- (double)cornerRadius
{
  return 3.0;
}

- (UIView)previewView
{
  UIView *previewView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  previewView = self->_previewView;
  if (!previewView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = self->_previewView;
    self->_previewView = v4;

    v6 = self->_previewView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedContentsCellBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[CKSharedAssetCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_previewView);

    previewView = self->_previewView;
  }
  return previewView;
}

- (UILabel)previewTitleLabel
{
  UILabel *previewTitleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;

  previewTitleLabel = self->_previewTitleLabel;
  if (!previewTitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v5 = self->_previewTitleLabel;
    self->_previewTitleLabel = v4;

    v6 = self->_previewTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](self->_previewTitleLabel, "setTextAlignment:", 1);
    v8 = self->_previewTitleLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sharedContentsCellTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v11);

    -[UILabel setNumberOfLines:](self->_previewTitleLabel, "setNumberOfLines:", 2);
    v12 = self->_previewTitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[CKSharedAssetCollectionViewCell previewTitleContainerView](self, "previewTitleContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_previewTitleLabel);

    previewTitleLabel = self->_previewTitleLabel;
  }
  return previewTitleLabel;
}

- (UIView)previewTitleContainerView
{
  UIView *previewTitleContainerView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  previewTitleContainerView = self->_previewTitleContainerView;
  if (!previewTitleContainerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = self->_previewTitleContainerView;
    self->_previewTitleContainerView = v4;

    v6 = self->_previewTitleContainerView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedContentsCellBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[CKSharedAssetCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_previewTitleContainerView);

    previewTitleContainerView = self->_previewTitleContainerView;
  }
  return previewTitleContainerView;
}

- (id)formattedTitleFromPreviewTitle:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  id v6;

  v3 = (__CFString *)a3;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR(" ");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v6, "setLineHeightMultiple:", 0.7);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v6, 0, -[__CFString length](v4, "length"));
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1108], &unk_1E2871410, 0, -[__CFString length](v4, "length"));

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
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double Width;
  double v14;
  void *v15;
  double v16;
  double Height;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v37.receiver = self;
  v37.super_class = (Class)CKSharedAssetCollectionViewCell;
  -[CKSharedAssetCollectionViewCell layoutSubviews](&v37, sel_layoutSubviews);
  -[CKSharedAssetCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  Width = CGRectGetWidth(v38);
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  v14 = CGRectGetWidth(v39);
  objc_msgSend(v12, "setFrame:", v5, v7, Width, v14);
  -[CKSharedAssetCollectionViewCell previewTitleContainerView](self, "previewTitleContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  v16 = CGRectGetWidth(v40);
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  Height = CGRectGetHeight(v41);
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = Width;
  v42.size.height = v14;
  v18 = Height - CGRectGetHeight(v42) + -1.0;
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = Width;
  v43.size.height = v14;
  objc_msgSend(v15, "setFrame:", 0.0, CGRectGetMaxY(v43) + 1.0, v16, v18);
  -[CKSharedAssetCollectionViewCell previewTitleContainerView](self, "previewTitleContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44.origin.x = v21;
  v44.origin.y = v23;
  v44.size.width = v25;
  v44.size.height = v27;
  v29 = CGRectGetWidth(v44) + -10.0;
  v45.origin.x = v21;
  v45.origin.y = v23;
  v45.size.width = v25;
  v45.size.height = v27;
  v30 = CGRectGetHeight(v45);
  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeThatFits:", v29, v30);
  v33 = v32;
  v35 = v34;

  v46.origin.x = v21;
  v46.origin.y = v23;
  v46.size.width = v25;
  v46.size.height = v27;
  v36 = CGRectGetWidth(v46) * 0.5 - v33 * 0.5;
  v47.origin.x = v21;
  v47.origin.y = v23;
  v47.size.width = v25;
  v47.size.height = v27;
  objc_msgSend(v28, "setFrame:", v36, CGRectGetHeight(v47) * 0.5 - v35 * 0.5, v33, v35 + 2.0);

}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (void)setPreviewTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_previewTitleLabel, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setPreviewTitleContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_previewTitleContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewTitleContainerView, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previewTitleLabel, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
