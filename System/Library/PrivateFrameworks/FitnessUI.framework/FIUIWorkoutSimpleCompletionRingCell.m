@implementation FIUIWorkoutSimpleCompletionRingCell

+ (double)preferredHeightForWorkout:(id)a3 fittingWidth:(double)a4
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "fiui_activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIWorkoutSimpleCompletionRingCell preferredHeightForActivityType:fittingWidth:plural:](FIUIWorkoutSimpleCompletionRingCell, "preferredHeightForActivityType:fittingWidth:plural:", v5, 0, a4);
  v7 = v6;

  return v7;
}

+ (double)preferredHeightForActivityType:(id)a3 fittingWidth:(double)a4 plural:(BOOL)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (a5)
  {
    objc_msgSend(a3, "workoutActivityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedNamePlural");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a3, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[FIUIWorkoutSimpleCompletionRingCell preferredHeightForLocalizedName:fittingWidth:](FIUIWorkoutSimpleCompletionRingCell, "preferredHeightForLocalizedName:fittingWidth:", v7, a4);
  v9 = v8;

  return v9;
}

+ (double)preferredHeightForLocalizedName:(id)a3 fittingWidth:(double)a4
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;

  v5 = preferredHeightForLocalizedName_fittingWidth__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&preferredHeightForLocalizedName_fittingWidth__onceToken, &__block_literal_global_13);
  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "setText:", v6);

  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "sizeThatFits:", a4 + 5.5 * -2.0, 1.79769313e308);
  v8 = v7;
  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "_firstLineBaselineOffsetFromBoundsTop");
  return v8 - v9 + 5.5 + 40.0 + 20.0;
}

void __84__FIUIWorkoutSimpleCompletionRingCell_preferredHeightForLocalizedName_fittingWidth___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BEBD708]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v2 = (void *)preferredHeightForLocalizedName_fittingWidth__sizingLabel;
  preferredHeightForLocalizedName_fittingWidth__sizingLabel = v1;

  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "setNumberOfLines:", 0);
  _Font();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "setFont:", v3);

}

- (FIUIWorkoutSimpleCompletionRingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FIUIWorkoutSimpleCompletionRingCell *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  ARUIRingsView *ringsView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIImageView *ringImageView;
  uint64_t v17;
  UIImageView *iconImageView;
  uint64_t v19;
  UILabel *typeLabel;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)FIUIWorkoutSimpleCompletionRingCell;
  v4 = -[FIUIWorkoutSimpleCompletionRingCell initWithStyle:reuseIdentifier:](&v25, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01CC8]), "initWithNumberOfRings:", 1);
    HIDWORD(v6) = 1078198272;
    *(float *)&v6 = 40.0;
    objc_msgSend(v5, "setRingDiameter:", v6);
    HIDWORD(v7) = 1075052544;
    *(float *)&v7 = 5.0;
    objc_msgSend(v5, "setRingThickness:", v7);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE01CD8]), "initWithRingGroupController:", v5);
    ringsView = v4->_ringsView;
    v4->_ringsView = (ARUIRingsView *)v8;

    v10 = objc_alloc(MEMORY[0x24BEBD668]);
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], v12, v13, v14);
    ringImageView = v4->_ringImageView;
    v4->_ringImageView = (UIImageView *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v11, v12, v13, v14);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v11, v12, v13, v14);
    typeLabel = v4->_typeLabel;
    v4->_typeLabel = (UILabel *)v19;

    -[UILabel setNumberOfLines:](v4->_typeLabel, "setNumberOfLines:", 0);
    _Font();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_typeLabel, "setFont:", v21);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_typeLabel, "setTextColor:", v22);

    -[FIUIWorkoutSimpleCompletionRingCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v4->_ringImageView);
    objc_msgSend(v23, "addSubview:", v4->_iconImageView);
    objc_msgSend(v23, "addSubview:", v4->_typeLabel);

  }
  return v4;
}

- (void)configureWithWorkout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(MEMORY[0x24BE01CA8], "metricColorsForGoalTypeIdentifier:", objc_msgSend(v22, "_goalType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "_goalType"))
  {
    v5 = (void *)MEMORY[0x24BE01CD0];
    -[FIUIWorkoutSimpleCompletionRingCell ringsView](self, "ringsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fiui_completionFactor");
    v8 = v7;
    objc_msgSend(v4, "gradientLightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradientDarkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderSingleRingUsingRingsView:forPercentage:withDiameter:thickness:topColor:bottomColor:", v6, v9, v10, v8, 40.0, 5.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

  }
  else
  {
    FIUICircularWorkoutGradientImage(40.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v6);
  }

  +[FIUIWorkoutActivityType activityTypeWithWorkout:](FIUIWorkoutActivityType, "activityTypeWithWorkout:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIStaticWorkoutIconImage(v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v15);

  objc_msgSend(v4, "nonGradientTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v17);

  objc_msgSend(v22, "fiui_activityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

}

- (void)configurePluralViewWithWorkoutActivityType:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  FIUICircularWorkoutGradientImage(40.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  FIUIStaticWorkoutIconImage(v4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  objc_msgSend(MEMORY[0x24BE01CA8], "noMetricColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nonGradientTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  objc_msgSend(v4, "workoutActivityType");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localizedNamePlural");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  objc_super v36;
  CGRect v37;

  v36.receiver = self;
  v36.super_class = (Class)FIUIWorkoutSimpleCompletionRingCell;
  -[FIUIWorkoutSimpleCompletionRingCell layoutSubviews](&v36, sel_layoutSubviews);
  -[FIUIWorkoutSimpleCompletionRingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", 5.5, 5.5, 40.0, 40.0);

  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 5.5, 5.5, 28.0, 28.0);

  -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;
  v10 = v9;
  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenter:", v8, v10);

  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v12, "sizeThatFits:", v13 + 5.5 * -2.0, 1.79769313e308);
  v15 = v14;
  v17 = v16;

  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 5.5, 0.0, v15, v17);

  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  objc_msgSend(v19, "_setFirstLineBaselineFrameOriginY:", CGRectGetMaxY(v37) + 20.0);

  -[FIUIWorkoutSimpleCompletionRingCell ringImageView](self, "ringImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  FIUIFlipViewRightToLeftIfNeeded(v21, v22, v23, v24, v25);

  -[FIUIWorkoutSimpleCompletionRingCell iconImageView](self, "iconImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  FIUIFlipViewRightToLeftIfNeeded(v26, v27, v28, v29, v30);

  -[FIUIWorkoutSimpleCompletionRingCell typeLabel](self, "typeLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  FIUIFlipViewRightToLeftIfNeeded(v31, v32, v33, v34, v35);

}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (void)setRingsView:(id)a3
{
  objc_storeStrong((id *)&self->_ringsView, a3);
}

- (UIImageView)ringImageView
{
  return self->_ringImageView;
}

- (void)setRingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_ringImageView, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_ringImageView, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
