@implementation CKBalloonImageView

- (void)setCurrentFrameIndex:(int64_t)a3
{
  self->_currentFrameIndex = a3;
}

- (void)prepareForReuse
{
  -[CKBalloonImageView setImageHidden:](self, "setImageHidden:", 0);
  -[CKBalloonImageView setCurrentFrameIndex:](self, "setCurrentFrameIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)setImageHidden:(BOOL)a3
{
  if (self->_imageHidden != a3)
  {
    self->_imageHidden = a3;
    -[CKBalloonImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKBalloonImageView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKBalloonImageView;
  -[CKBalloonImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[CKBalloonImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v4 = (UIImage *)a3;
  if (self->_image != v4)
  {
    v6 = v4;
    v5 = (UIImage *)-[UIImage copy](v4, "copy");

    objc_storeStrong((id *)&self->_image, v5);
    -[CKBalloonImageView setNeedsLayout](self, "setNeedsLayout");
    v4 = v5;
  }

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contentsTransform")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKBalloonImageView;
    v5 = -[CKBalloonImageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKBalloonImageView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKBalloonImageView;
  -[CKBalloonImageView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[CKBalloonImageView setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[CKBalloonImageView image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v5 = *MEMORY[0x1E0CEB4B0];
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    goto LABEL_8;
  }
  objc_msgSend(v2, "alignmentRectInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v3, "imageOrientation");
  if (!v12)
  {
LABEL_7:
    v14 = v7;
    goto LABEL_8;
  }
  v13 = v12;
  if (v12 != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CKGeometry.h"), 429, CFSTR("CKEdgeInsetsWithImageOrientation %ld hasn't been implemented"), v13);

    goto LABEL_7;
  }
  v14 = v11;
  v11 = v7;
LABEL_8:

  v17 = v5;
  v18 = v14;
  v19 = v9;
  v20 = v11;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  double v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKBalloonImageView;
  -[CKBalloonImageView layoutSubviews](&v26, sel_layoutSubviews);
  -[CKBalloonImageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonImageView image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKBalloonImageView imageHidden](self, "imageHidden");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isScheduledMessagesCoreEnabled");

  if (v7)
  {
    if (!v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_4;
    }
  }
  else if (!v5)
  {
LABEL_4:
    v8 = objc_retainAutorelease(v4);
    objc_msgSend(v3, "setContents:", objc_msgSend(v8, "CGImage"));
    objc_msgSend(v8, "scale");
    objc_msgSend(v3, "setContentsScale:");
    goto LABEL_7;
  }
  objc_msgSend(v3, "setContents:", 0);
LABEL_7:
  objc_msgSend(v4, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "capInsets");
  objc_msgSend(v3, "setContentsCenter:", v16 / v10, v13 / v12, (v10 - v16 - v14) / v10, (v12 - v13 - v15) / v12);
  if (objc_msgSend(v4, "imageOrientation") == 4)
  {
    -[CKBalloonImageView bounds](self, "bounds");
    v25 = 0uLL;
    v18 = v17;
    v19 = -1.0;
    v20 = 1.0;
  }
  else
  {
    v19 = *MEMORY[0x1E0C9BAA8];
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v21 = v19;
  v22 = v25;
  v23 = v20;
  v24 = v18;
  objc_msgSend(v3, "setContentsTransform:", &v21);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CKBalloonImageView image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 0;
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (UIImage)invisibleInkEffectImage
{
  return self->_invisibleInkEffectImage;
}

- (void)setInvisibleInkEffectImage:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleInkEffectImage, a3);
}

- (BOOL)imageHidden
{
  return self->_imageHidden;
}

- (NSString)stickerAccessibilityDescription
{
  return self->_stickerAccessibilityDescription;
}

- (void)setStickerAccessibilityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_stickerAccessibilityDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerAccessibilityDescription, 0);
  objc_storeStrong((id *)&self->_invisibleInkEffectImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
