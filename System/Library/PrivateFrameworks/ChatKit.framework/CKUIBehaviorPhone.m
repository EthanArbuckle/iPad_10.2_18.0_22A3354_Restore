@implementation CKUIBehaviorPhone

- (double)welcomeViewContentViewLeadingAnchorLayoutConstraintConstant
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  -[CKUIBehavior welcomeViewContentViewLeadingAnchorLayoutConstraintConstant](&v7, sel_welcomeViewContentViewLeadingAnchorLayoutConstraintConstant);
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  result = 16.0;
  if (v5 != 1)
    return v3;
  return result;
}

- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  -[CKUIBehavior welcomeViewContentViewTopAnchorLayoutConstraintConstant](&v7, sel_welcomeViewContentViewTopAnchorLayoutConstraintConstant);
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  result = 88.0;
  if (v5 != 4)
    return v3;
  return result;
}

- (double)whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  -[CKUIBehavior whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant](&v7, sel_whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant);
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  result = 16.0;
  if (v5 != 1)
    return v3;
  return result;
}

- (double)whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  double result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  -[CKUIBehavior whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant](&v7, sel_whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant);
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  result = 16.0;
  if (v5 != 1)
    return v3;
  return result;
}

- (id)whatsNewViewApplePayImage
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  -[CKUIBehavior whatsNewViewApplePayImage](&v7, sel_whatsNewViewApplePayImage);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ck_screenSizeCategory");

  if (v4 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("CKSurfEducationScreen_D22"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

- (CGSize)detonatedItemBalloonViewSize
{
  double v2;
  double v3;
  CGSize result;

  if (detonatedItemBalloonViewSize_once != -1)
    dispatch_once(&detonatedItemBalloonViewSize_once, &__block_literal_global_4366);
  v2 = *(double *)&detonatedItemBalloonViewSize_sBehavior_0;
  v3 = *(double *)&detonatedItemBalloonViewSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __49__CKUIBehaviorPhone_detonatedItemBalloonViewSize__block_invoke()
{
  detonatedItemBalloonViewSize_sBehavior_0 = 0x4064000000000000;
  detonatedItemBalloonViewSize_sBehavior_1 = 0x405E000000000000;
}

- (CGSize)detonatedItemDocumentIconSize
{
  double v2;
  double v3;
  CGSize result;

  if (detonatedItemDocumentIconSize_once != -1)
    dispatch_once(&detonatedItemDocumentIconSize_once, &__block_literal_global_4367);
  v2 = *(double *)&detonatedItemDocumentIconSize_sBehavior_0;
  v3 = *(double *)&detonatedItemDocumentIconSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __50__CKUIBehaviorPhone_detonatedItemDocumentIconSize__block_invoke()
{
  detonatedItemDocumentIconSize_sBehavior_0 = 0x404B000000000000;
  detonatedItemDocumentIconSize_sBehavior_1 = 0x404E000000000000;
}

@end
