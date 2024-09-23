@implementation CKPinnedConversationMediaObjectBubble

- (CKPinnedConversationMediaObjectBubble)initWithMediaObjectActivityItem:(id)a3
{
  id v5;
  id v6;
  CKPinnedConversationMediaObjectBubble *v7;
  CKPinnedConversationMediaObjectBubble *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  objc_msgSend(v6, "setContentMode:", 2);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  v11.receiver = self;
  v11.super_class = (Class)CKPinnedConversationMediaObjectBubble;
  v7 = -[CKPinnedConversationTailedActivityItemView initWithActivityItem:contentView:needsContentViewStroke:](&v11, sel_initWithActivityItem_contentView_needsContentViewStroke_, v5, v6, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaObjectActivityItem, a3);
    objc_storeStrong((id *)&v8->_imageView, v6);
    -[CKPinnedConversationMediaObjectBubble _updateMediaObjectPreview](v8, "_updateMediaObjectPreview");
    -[CKPinnedConversationMediaObjectBubble _updatePillCornerRadius](v8, "_updatePillCornerRadius");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v8;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updatePillCornerRadius
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  UIRoundToViewScale();
  self->_pillCornerRadius = v4;

}

- (void)setActivityItem:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKPinnedConversationMediaObjectBubble;
  -[CKPinnedConversationTailedActivityItemView setActivityItem:](&v6, sel_setActivityItem_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mediaObjectActivityItem, a3);
    -[CKPinnedConversationMediaObjectBubble _updateMediaObjectPreview](self, "_updateMediaObjectPreview");
  }

}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 0;
}

- (id)_previewImage
{
  void *v2;
  void *v3;

  -[CKPinnedConversationMediaObjectActivityItem mediaObject](self->_mediaObjectActivityItem, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPinnedConversationMediaObjectActivityItem previewImageForMediaObject:](CKPinnedConversationMediaObjectActivityItem, "previewImageForMediaObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateMediaObjectPreview
{
  int64_t v3;
  uint64_t v4;
  id v5;

  -[CKPinnedConversationMediaObjectBubble _previewImage](self, "_previewImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);
  v3 = -[CKPinnedConversationMediaObjectBubble contentViewContentMode](self, "contentViewContentMode");
  if (v3)
    v4 = 2 * (v3 == 1);
  else
    v4 = 1;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v4);
  -[CKPinnedConversationMediaObjectBubble setNeedsLayout](self, "setNeedsLayout");

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKPinnedConversationMediaObjectBubble _updatePillCornerRadius](self, "_updatePillCornerRadius", a3);
  -[CKPinnedConversationMediaObjectBubble setNeedsLayout](self, "setNeedsLayout");
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[CKPinnedConversationTailedActivityItemView parentAvatarViewSize](self, "parentAvatarViewSize");
  if (v7 != width || v6 != height)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKPinnedConversationMediaObjectBubble;
    -[CKPinnedConversationTailedActivityItemView setParentAvatarViewSize:](&v9, sel_setParentAvatarViewSize_, width, height);
    -[CKPinnedConversationMediaObjectBubble _updateImageViewSizeConstraints](self, "_updateImageViewSizeConstraints");
  }
}

- (CGSize)_imageViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[CKPinnedConversationTailedActivityItemView parentAvatarViewSize](self, "parentAvatarViewSize");
  v4 = v3 * 0.55;
  v6 = v5 * 0.55;
  v7 = -[CKPinnedConversationMediaObjectBubble contentViewContentMode](self, "contentViewContentMode");
  if (v7 == 1)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    if (!v7)
    {
      -[CKPinnedConversationMediaObjectBubble _previewImage](self, "_previewImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v13 = v11 <= v12;
      v14 = v6 * (v11 / v12);
      v15 = v4 * (v12 / v11);
      if (v13)
        v9 = v14;
      else
        v9 = v4;
      if (v13)
        v8 = v6;
      else
        v8 = v15;

    }
  }
  v16 = v9;
  v17 = v8;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_updateImageViewSizeConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSLayoutConstraint *imageViewWidthConstraint;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *imageViewHeightConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;

  -[CKPinnedConversationMediaObjectBubble _imageViewSize](self, "_imageViewSize");
  v4 = v3;
  v6 = v5;
  imageViewWidthConstraint = self->_imageViewWidthConstraint;
  if (imageViewWidthConstraint)
  {
    -[NSLayoutConstraint setConstant:](imageViewWidthConstraint, "setConstant:", v3);
  }
  else
  {
    -[CKPinnedConversationMediaObjectBubble imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", v4);
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v11 = self->_imageViewWidthConstraint;
    self->_imageViewWidthConstraint = v10;

    -[NSLayoutConstraint setActive:](self->_imageViewWidthConstraint, "setActive:", 1);
  }
  imageViewHeightConstraint = self->_imageViewHeightConstraint;
  if (imageViewHeightConstraint)
  {
    -[NSLayoutConstraint setConstant:](imageViewHeightConstraint, "setConstant:", v6);
  }
  else
  {
    -[CKPinnedConversationMediaObjectBubble imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", v6);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v16 = self->_imageViewHeightConstraint;
    self->_imageViewHeightConstraint = v15;

    -[NSLayoutConstraint setActive:](self->_imageViewHeightConstraint, "setActive:", 1);
  }
}

- (BOOL)isSticker
{
  void *v2;
  void *v3;
  char v4;

  -[CKPinnedConversationMediaObjectActivityItem mediaObject](self->_mediaObjectActivityItem, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSticker");

  return v4;
}

- (BOOL)isAnimojiVideo
{
  void *v2;
  char v3;

  -[CKPinnedConversationMediaObjectActivityItem mediaObject](self->_mediaObjectActivityItem, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isJellyfishVideo");
  else
    v3 = 0;

  return v3;
}

- (int64_t)contentViewContentMode
{
  if (-[CKPinnedConversationMediaObjectBubble isSticker](self, "isSticker"))
    return 0;
  else
    return -[CKPinnedConversationMediaObjectBubble isAnimojiVideo](self, "isAnimojiVideo") ^ 1;
}

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  return 0.0;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CKPinnedConversationMediaObjectActivityItem)mediaObjectActivityItem
{
  return self->_mediaObjectActivityItem;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, a3);
}

- (NSLayoutConstraint)imageViewHeightConstraint
{
  return self->_imageViewHeightConstraint;
}

- (void)setImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_mediaObjectActivityItem, 0);
}

@end
