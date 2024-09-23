@implementation CKGroupCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKGroupAvatarCollectionViewCell_reuseIdentifier");
}

- (CKGroupCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKGroupCollectionViewCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKGroupCollectionViewCell;
  v3 = -[CKGroupCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKGroupCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setAvatarView:(id)a3
{
  UIView *v5;
  UIView *avatarView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  avatarView = self->_avatarView;
  if (avatarView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](avatarView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_avatarView, a3);
    -[CKGroupCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_avatarView);

    -[CKGroupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKGroupCollectionViewCell;
  -[CKGroupCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[CKGroupCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupAvatarViewSize");
  v8 = v7;

  LODWORD(v9) = 1132068864;
  LODWORD(v10) = 1148846080;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_avatarView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, v8, v9, v10);
  -[UIView setFrame:](self->_avatarView, "setFrame:", (v5 - v11) * 0.5, 0.0, v11, v8);
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        -[CKGroupCollectionViewCell contentView](self, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "locationInView:", v13);
        v15 = v14;
        v17 = v16;

        -[CKGroupCollectionViewCell contentView](self, "contentView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "convertPoint:toView:", self->_avatarView, v15, v17);
        v20 = v19;
        v22 = v21;

        -[UIView hitTest:withEvent:](self->_avatarView, "hitTest:withEvent:", v7, v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24.receiver = self;
          v24.super_class = (Class)CKGroupCollectionViewCell;
          -[CKGroupCollectionViewCell touchesBegan:withEvent:](&v24, sel_touchesBegan_withEvent_, v6, v7);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
