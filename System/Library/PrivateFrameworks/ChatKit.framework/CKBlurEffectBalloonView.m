@implementation CKBlurEffectBalloonView

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKImageBalloonView animatedImage](self, "animatedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKBlurEffectBalloonView;
  -[CKImageBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKBlurEffectBalloonView animatedImage:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKBlurEffectBalloonView)initWithFrame:(CGRect)a3
{
  CKBlurEffectBalloonView *v3;
  CKBlurEffectBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBlurEffectBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKBlurEffectBalloonView blurEffectView](v3, "blurEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlurEffectBalloonView addSubview:](v4, "addSubview:", v5);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CKBlurEffectBalloonView;
  -[CKImageBalloonView layoutSubviews](&v33, sel_layoutSubviews);
  if (CKIsRunningInMessagesNotificationExtension()
    || CKIsRunningInMessagesNotificationViewService())
  {
    -[CKBlurEffectBalloonView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContents:", 0);

  }
  -[CKBlurEffectBalloonView blurEffectView](self, "blurEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlurEffectBalloonView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[CKBlurEffectBalloonView blurEffectView](self, "blurEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlurEffectBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v5);

  -[CKImageBalloonView tailMask](self, "tailMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKBlurEffectBalloonView blurEffectView](self, "blurEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView tailMask](self, "tailMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlurEffectBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v8, v9);

  }
  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlurEffectBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v10);

  -[CKBlurEffectBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "verticalBalloonBadgeInset");
    v14 = v13;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalBalloonBadgeInset");
    v17 = v16;

    -[CKBlurEffectBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeToFit");

    -[CKBlurEffectBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;

    -[CKBlurEffectBalloonView frame](self, "frame");
    v25 = v24 - v21 - v17;
    -[CKBlurEffectBalloonView frame](self, "frame");
    v27 = v26 - v23 - v14;
    if (-[CKBalloonView orientation](self, "orientation") == 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "balloonMaskTailSizeForTailShape:", 1);
      v25 = v25 - v29;

    }
    -[CKBlurEffectBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v25, v27, v21, v23);

  }
  -[CKBlurEffectBalloonView blurEffectView](self, "blurEffectView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[CKBlurEffectBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlurEffectBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v32, v31);

  }
}

- (UIVisualEffectView)blurEffectView
{
  UIVisualEffectView *blurEffectView;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;

  blurEffectView = self->_blurEffectView;
  if (!blurEffectView)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v4);
    v6 = self->_blurEffectView;
    self->_blurEffectView = v5;

    blurEffectView = self->_blurEffectView;
  }
  return blurEffectView;
}

- (UIView)commSafetyBadgeView
{
  UIView *commSafetyBadgeView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *v9;

  -[CKImageBalloonView setIsIrisAsset:](self, "setIsIrisAsset:", 0);
  -[CKImageBalloonView setIsMonoskiAsset:](self, "setIsMonoskiAsset:", 0);
  commSafetyBadgeView = self->_commSafetyBadgeView;
  if (!commSafetyBadgeView)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("eye.slash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithSymbolConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7);
    v9 = self->_commSafetyBadgeView;
    self->_commSafetyBadgeView = v8;

    commSafetyBadgeView = self->_commSafetyBadgeView;
  }
  return commSafetyBadgeView;
}

- (void)setBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffectView, a3);
}

- (void)setCommSafetyBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_commSafetyBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetyBadgeView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
}

@end
