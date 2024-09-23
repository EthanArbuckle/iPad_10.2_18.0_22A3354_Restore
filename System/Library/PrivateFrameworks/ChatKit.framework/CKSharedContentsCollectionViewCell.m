@implementation CKSharedContentsCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedContentsCollectionViewCell_reuseIdentifier");
}

- (CKSharedContentsCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKSharedContentsCollectionViewCell *v3;
  CKSharedContentsCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsCollectionViewCell;
  v3 = -[CKSharedAssetCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CKSharedContentsCollectionViewCell setupTapGestureRecognizer](v3, "setupTapGestureRecognizer");
  return v4;
}

- (void)setupTapGestureRecognizer
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTap_);
  objc_msgSend(v4, "setDelegate:", self);
  -[CKSharedContentsCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

  -[CKSharedContentsCollectionViewCell setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v4);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)CKSharedContentsCollectionViewCell;
  -[CKSharedAssetCollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedContentsCollectionViewCell checkmarkView](self, "checkmarkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "setHighlighted:", -[CKSharedContentsCollectionViewCell isSelected](self, "isSelected"));
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    Width = CGRectGetWidth(v23);
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    objc_msgSend(v12, "setFrame:", Width - CGRectGetWidth(v24), 0.0, v18, v20);
  }

}

- (void)copy:(id)a3
{
  id v5;

  -[CKSharedContentsCollectionViewCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forSharedContentsCollectionViewCell:", a2, self);

}

- (void)delete:(id)a3
{
  id v5;

  -[CKSharedContentsCollectionViewCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forSharedContentsCollectionViewCell:", a2, self);

}

- (void)more:(id)a3
{
  id v5;

  -[CKSharedContentsCollectionViewCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forSharedContentsCollectionViewCell:", a2, self);

}

- (void)saveAttachment:(id)a3
{
  id v5;

  -[CKSharedContentsCollectionViewCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forSharedContentsCollectionViewCell:", a2, self);

}

- (void)handleTap:(id)a3
{
  id v4;

  -[CKSharedContentsCollectionViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedContentsCollectionViewCellDidTap:", self);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsCollectionViewCell;
  -[CKSharedContentsCollectionViewCell setSelected:](&v6, sel_setSelected_);
  -[CKSharedContentsCollectionViewCell checkmarkView](self, "checkmarkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[CKSharedContentsCollectionViewCell toggleCheckmarkViewWithEnabled:](self, "toggleCheckmarkViewWithEnabled:");
    -[CKSharedContentsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)toggleCheckmarkViewWithEnabled:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("BlueCheckUnselected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("BlueCheckSelected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "initWithImage:highlightedImage:", v5, v6);

    -[CKSharedContentsCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[CKSharedContentsCollectionViewCell setCheckmarkView:](self, "setCheckmarkView:", v9);
  }
  else
  {
    -[CKSharedContentsCollectionViewCell checkmarkView](self, "checkmarkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[CKSharedContentsCollectionViewCell setCheckmarkView:](self, "setCheckmarkView:", 0);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CKSharedContentsCollectionViewCell tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    return !-[CKSharedContentsCollectionViewCell isEditing](self, "isEditing");
  else
    return 1;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewImage, a3);
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (CKSharedContentsCollectionViewCellDelegate)delegate
{
  return (CKSharedContentsCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
}

@end
