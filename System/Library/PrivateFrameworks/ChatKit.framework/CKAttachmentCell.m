@implementation CKAttachmentCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKAttachmentCell setDelegate:](self, "setDelegate:", 0);
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCell;
  -[CKAttachmentCell dealloc](&v4, sel_dealloc);
}

- (CKAttachmentCell)initWithFrame:(CGRect)a3
{
  CKAttachmentCell *v3;
  CKAttachmentCell *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKAttachmentCell;
  v3 = -[CKAttachmentCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKAttachmentCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (CKMainScreenScale_once_11 != -1)
      dispatch_once(&CKMainScreenScale_once_11, &__block_literal_global_23);
    v7 = *(double *)&CKMainScreenScale_sMainScreenScale_11;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_11 == 0.0)
      v7 = 1.0;
    objc_msgSend(v6, "setBorderWidth:", ceil(v7 * 0.5) / v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel_tapGestureRecognized_);
    objc_msgSend(v8, "setDelegate:", v4);
    -[CKAttachmentCell addGestureRecognizer:](v4, "addGestureRecognizer:", v8);
    -[CKAttachmentCell setTapRecognizer:](v4, "setTapRecognizer:", v8);

  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKAttachmentCell;
  -[CKAttachmentCell setSelected:](&v6, sel_setSelected_);
  -[CKAttachmentCell checkmarkView](self, "checkmarkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (void)setEditing:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("BlueCheckUnselected"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("BlueCheckSelected"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v4, "initWithImage:highlightedImage:", v5, v6);

      -[CKAttachmentCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      -[CKAttachmentCell setCheckmarkView:](self, "setCheckmarkView:", v7);
    }
    else
    {
      -[CKAttachmentCell checkmarkView](self, "checkmarkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[CKAttachmentCell setCheckmarkView:](self, "setCheckmarkView:", 0);
    }
    -[CKAttachmentCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CKAttachmentCell;
  -[CKAttachmentCell layoutSubviews](&v36, sel_layoutSubviews);
  -[CKAttachmentCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemBackgroundColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSecondarySystemBackgroundColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  -[CKAttachmentCell checkmarkView](self, "checkmarkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "setHighlighted:", -[CKAttachmentCell isSelected](self, "isSelected"));
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    -[CKAttachmentCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    objc_msgSend(v7, "bounds");
    v16 = v14 - v15;
    -[CKAttachmentCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    objc_msgSend(v7, "bounds");
    v21 = v19 - v20;

    objc_msgSend(v7, "setFrame:", v16, v21, v9, v11);
  }
  -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "verticalBalloonBadgeInset");
    v25 = v24;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "horizontalBalloonBadgeInset");
    v28 = v27;

    -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sizeToFit");

    -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    v34 = v33;

    -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v28, v25, v32, v34);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCell;
  -[CKAttachmentCell prepareForReuse](&v4, sel_prepareForReuse);
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  -[CKAttachmentCell setImage:](self, "setImage:", 0);
  -[CKAttachmentCell setFrames:](self, "setFrames:", 0);
  -[CKAttachmentCell setAnimatedImage:](self, "setAnimatedImage:", 0);
  -[CKAttachmentCell setAlpha:](self, "setAlpha:", 1.0);
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;

  -[CKAttachmentCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentCellTapped:", self);

}

- (void)copy:(id)a3
{
  id v5;

  -[CKAttachmentCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forAttachmentCell:", a2, self);

}

- (void)delete:(id)a3
{
  id v5;

  -[CKAttachmentCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forAttachmentCell:", a2, self);

}

- (void)more:(id)a3
{
  id v5;

  -[CKAttachmentCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forAttachmentCell:", a2, self);

}

- (void)saveAttachment:(id)a3
{
  id v5;

  -[CKAttachmentCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forAttachmentCell:", a2, self);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  void *v6;
  void *v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[CKAttachmentCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setContents:", -[CKAttachmentCell _cgImageForUIImage:](self, "_cgImageForUIImage:", self->_image));
    objc_msgSend(v7, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    objc_msgSend(v7, "setMasksToBounds:", 1);

    v5 = v8;
  }

}

- (void)setIconImage:(id)a3
{
  void *v4;
  id v5;

  -[CKAttachmentCell setImage:](self, "setImage:", a3);
  -[CKAttachmentCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setContentsGravity:", *MEMORY[0x1E0CD2F78]);
  objc_msgSend(v5, "setMasksToBounds:", 0);

}

- (void)setAnimatedImage:(id)a3
{
  CKAnimatedImage *v5;
  void *v6;
  void *v7;
  CKAnimatedImage *v8;

  v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[CKAnimatedImage frames](self->_animatedImage, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAttachmentCell setFrames:](self, "setFrames:", v6);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v6, "objectAtIndex:", 0);
    else
      -[CKAnimatedImage image](v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAttachmentCell setImage:](self, "setImage:", v7);

    -[CKAttachmentCell updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
    v5 = v8;
  }

}

- (void)setIsIrisAsset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsBalloonBadges");

  if (v6 && self->_isIrisAsset != v3)
  {
    self->_isIrisAsset = v3;
    -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {

      if (!v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0CEA658]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "livePhotoBadgeImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v9, "initWithImage:", v11);

        objc_msgSend(v18, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = 0.5;
        objc_msgSend(v12, "setShadowOpacity:", v13);

        objc_msgSend(v18, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setShadowOffset:", 0.0, 0.0);

        objc_msgSend(v18, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setShadowRadius:", 1.0);

        -[CKAttachmentCell contentView](self, "contentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v18);

        -[CKAttachmentCell setIrisBadgeView:](self, "setIrisBadgeView:", v18);
        -[CKAttachmentCell setNeedsLayout](self, "setNeedsLayout");
        -[CKAttachmentCell layoutIfNeeded](self, "layoutIfNeeded");

      }
    }
    else
    {

      if (v8)
      {
        -[CKAttachmentCell irisBadgeView](self, "irisBadgeView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFromSuperview");

        -[CKAttachmentCell setIrisBadgeView:](self, "setIrisBadgeView:", 0);
      }
    }
  }
}

- (CGImage)_cgImageForUIImage:(id)a3
{
  id v3;
  id v4;
  CGImage *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "image");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (CGImage *)objc_msgSend(v4, "CGImage");

  }
  else
  {
    v5 = (CGImage *)objc_msgSend(objc_retainAutorelease(v3), "CGImage");
  }

  return v5;
}

- (void)updateAnimationTimerObserving
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[CKAttachmentCell frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 < 2)
    objc_msgSend(v5, "removeAnimationTimerObserver:", self);
  else
    objc_msgSend(v5, "addAnimationTimerObserver:", self);

}

- (void)animationTimerFired:(double)a3
{
  id v4;

  -[CKAnimatedImage frameForAnimationTime:](self->_animatedImage, "frameForAnimationTime:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentCell setImage:](self, "setImage:", v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CKAttachmentCell tapRecognizer](self, "tapRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    return !-[CKAttachmentCell isEditing](self, "isEditing");
  else
    return 1;
}

- (UIImage)image
{
  return self->_image;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (CKAttachmentCellDelegate)delegate
{
  return (CKAttachmentCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKAttachmentItem)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong((id *)&self->_representedObject, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (UIImageView)irisBadgeView
{
  return self->_irisBadgeView;
}

- (void)setIrisBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_irisBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisBadgeView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
