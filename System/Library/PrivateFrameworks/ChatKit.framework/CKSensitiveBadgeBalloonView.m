@implementation CKSensitiveBadgeBalloonView

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
  v8.super_class = (Class)CKSensitiveBadgeBalloonView;
  -[CKImageBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKSensitiveBadgeBalloonView animatedImage:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKSensitiveBadgeBalloonView)initWithFrame:(CGRect)a3
{
  CKSensitiveBadgeBalloonView *v3;
  CKSensitiveBadgeBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSensitiveBadgeBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKSensitiveBadgeBalloonView commSafetyBadgeView](v3, "commSafetyBadgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSensitiveBadgeBalloonView addSubview:](v4, "addSubview:", v5);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKSensitiveBadgeBalloonView;
  -[CKImageBalloonView layoutSubviews](&v24, sel_layoutSubviews);
  -[CKSensitiveBadgeBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verticalBalloonBadgeInset");
    v6 = v5;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalBalloonBadgeInset");
    v9 = v8;

    -[CKSensitiveBadgeBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

    -[CKSensitiveBadgeBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;

    -[CKSensitiveBadgeBalloonView frame](self, "frame");
    v17 = v16 - v13 - v9;
    -[CKSensitiveBadgeBalloonView frame](self, "frame");
    v19 = v18 - v15 - v6;
    if (-[CKBalloonView orientation](self, "orientation") == 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "balloonMaskTailSizeForTailShape:", 1);
      v17 = v17 - v21;

    }
    -[CKSensitiveBadgeBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v17, v19, v13, v15);

  }
  -[CKSensitiveBadgeBalloonView commSafetyBadgeView](self, "commSafetyBadgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSensitiveBadgeBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v23);

}

- (UIView)commSafetyBadgeView
{
  UIView *commSafetyBadgeView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *v10;

  -[CKImageBalloonView setIsIrisAsset:](self, "setIsIrisAsset:", 0);
  -[CKImageBalloonView setIsMonoskiAsset:](self, "setIsMonoskiAsset:", 0);
  commSafetyBadgeView = self->_commSafetyBadgeView;
  if (!commSafetyBadgeView)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("eye.trianglebadge.exclamationmark.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "imageWithSymbolConfiguration:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
    v10 = self->_commSafetyBadgeView;
    self->_commSafetyBadgeView = v9;

    commSafetyBadgeView = self->_commSafetyBadgeView;
  }
  return commSafetyBadgeView;
}

- (void)setCommSafetyBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_commSafetyBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetyBadgeView, 0);
}

@end
