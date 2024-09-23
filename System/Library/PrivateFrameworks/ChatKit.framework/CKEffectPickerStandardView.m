@implementation CKEffectPickerStandardView

- (void)activateTextSizeDependentConstraintsForSendButtonFrame:(CGRect)a3
{
  double y;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  y = a3.origin.y;
  v19.receiver = self;
  v19.super_class = (Class)CKEffectPickerStandardView;
  -[CKEffectPickerView activateTextSizeDependentConstraintsForSendButtonFrame:](&v19, sel_activateTextSizeDependentConstraintsForSendButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView closeButton](self, "closeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, self, 3, 1.0, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerStandardView addConstraint:](self, "addConstraint:", v7);
  -[CKEffectPickerView setCloseButtonBottomConstraint:](self, "setCloseButtonBottomConstraint:", v7);
  v8 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v10, 3, 1.0, -25.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerStandardView addConstraint:](self, "addConstraint:", v11);
  v12 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView roundedContainerView](self, "roundedContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerView closeButton](self, "closeButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 3, 0, v14, 3, 1.0, -25.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerStandardView addConstraint:](self, "addConstraint:", v15);
  -[CKEffectPickerView setRoundedContainerViewTopConstraint:](self, "setRoundedContainerViewTopConstraint:", v15);
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[CKEffectPickerView sendMomentButton](self, "sendMomentButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, 0, self, 3, 1.0, y + -60.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerStandardView addConstraint:](self, "addConstraint:", v18);
}

- (void)setCloseButtonYPosition:(double)a3
{
  id v4;

  -[CKEffectPickerView closeButtonBottomConstraint](self, "closeButtonBottomConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)marginBetweenPickerDotButtons
{
  int v2;
  double result;

  v2 = objc_msgSend((id)objc_opt_class(), "shouldUseLargeScreenDimension");
  result = 36.0;
  if (v2)
    return 48.0;
  return result;
}

- (void)_updateRoundedContainerView
{
  void *v3;
  unint64_t v4;
  double v5;
  float v6;
  id v7;

  -[CKEffectPickerView effectLabels](self, "effectLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CKEffectPickerStandardView marginBetweenPickerDotButtons](self, "marginBetweenPickerDotButtons");
  v6 = (double)v4 * 9.0 + 36.0 + v5 * (double)(v4 - 1);
  -[CKEffectPickerView roundedContainerViewTopConstraint](self, "roundedContainerViewTopConstraint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", -(v6 + 25.0));

}

- (CGRect)_updateBalloonViewOrigin:(CGRect)a3 forButtonFrame:(CGRect)a4
{
  double y;
  double x;
  double height;
  double width;
  double v9;
  void *v10;
  double v11;
  double v12;
  double MaxY;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect result;

  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)CKEffectPickerStandardView;
  -[CKEffectPickerView _updateBalloonViewOrigin:forButtonFrame:](&v22, sel__updateBalloonViewOrigin_forButtonFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = x - (width + 20.0);
  -[CKEffectPickerView closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v23.origin.x = v9;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);

  if (v12 >= MaxY || height < 40.0)
  {
    v18 = y + -13.0;
  }
  else
  {
    -[CKEffectPickerView effectLabelFont](self, "effectLabelFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_scaledValueForValue:useLanguageAwareScaling:", 1, 20.0);
    v17 = v16;

    v18 = y - fmin(20.0 - (v17 + -20.0), 20.0);
  }
  v19 = v9;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (double)offsetYForLabelAtIndex:(int64_t)a3 withInitialY:(double)a4
{
  return a4 + -30.0;
}

@end
