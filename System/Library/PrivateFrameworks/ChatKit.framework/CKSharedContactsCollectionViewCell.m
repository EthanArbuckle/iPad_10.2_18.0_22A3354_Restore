@implementation CKSharedContactsCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedContactsCollectionViewCell_reuseIdentifier");
}

- (void)configureWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedAssetCollectionViewCell formattedTitleFromPreviewTitle:](self, "formattedTitleFromPreviewTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v6);

  -[CKSharedContactsCollectionViewCell avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContact:", v4);

  -[CKSharedContactsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[CKSharedContactsCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (CNAvatarView)avatarView
{
  CNAvatarView *avatarView;
  id v4;
  CNAvatarView *v5;
  CNAvatarView *v6;
  void *v7;

  avatarView = self->_avatarView;
  if (!avatarView)
  {
    v4 = objc_alloc(MEMORY[0x1E0C97468]);
    v5 = (CNAvatarView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_avatarView;
    self->_avatarView = v5;

    -[CNAvatarView setShowsContactOnTap:](self->_avatarView, "setShowsContactOnTap:", 0);
    -[CNAvatarView setForcePressView:](self->_avatarView, "setForcePressView:", self->_avatarView);
    -[CNAvatarView setUserInteractionEnabled:](self->_avatarView, "setUserInteractionEnabled:", 1);
    -[CNAvatarView setShowsActionsOnForcePress:](self->_avatarView, "setShowsActionsOnForcePress:", 1);
    -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_avatarView);

    avatarView = self->_avatarView;
  }
  return avatarView;
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
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect rect;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = CKSharedContactsCollectionViewCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedContactsCollectionViewCell avatarView](self, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v14 = CGRectGetWidth(v20) * 0.5;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v15 = CGRectGetHeight(v21) * 0.5;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v16 = CGRectGetWidth(v22) * 0.5;
  v23.origin.x = rect.origin.x;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  v17 = v16 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v18 = CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v17;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  objc_msgSend(v12, "setFrame:", v17, v18 - CGRectGetHeight(v25) * 0.5, v14, v15);

}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
