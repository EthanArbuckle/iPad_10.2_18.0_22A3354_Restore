@implementation FIUIWorkoutCompletionPercentageRingViewCell

+ (double)rowHeightForWorkout:(id)a3 width:(double)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v6 = (void *)MEMORY[0x24BEBB520];
  v7 = *MEMORY[0x24BEBE1D0];
  v8 = a3;
  objc_msgSend(v6, "defaultFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ringTopPadding");
  v11 = v10;
  objc_msgSend(a1, "_ringDiameter");
  v13 = v11 + v12;
  _TypeLabel();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fiui_activityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localizedName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(v14, "sizeThatFits:", a4 + 5.5 * -2.0, 1.79769313e308);
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "setFrame:");
  objc_msgSend(v14, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ringToTypeSpacing");
  objc_msgSend(v17, "_scaledValueForValue:");
  objc_msgSend(v14, "_setFirstLineBaselineFrameOriginY:", v13 + v18);

  objc_msgSend(v14, "_lastLineBaselineFrameOriginY");
  v20 = v19;
  objc_msgSend(a1, "_typeToSecondaryLabelSpacing");
  v22 = v21;
  objc_msgSend(a1, "_secondaryLabelToSeparatorSpacing");
  objc_msgSend(v9, "_scaledValueForValue:");
  v24 = v23;
  if (FIUIOnePixel_onceToken_0 != -1)
    dispatch_once(&FIUIOnePixel_onceToken_0, &__block_literal_global_15);
  v25 = v20 + v22 + v24 + *(double *)&FIUIOnePixel_onePixel_0;

  return v25;
}

+ (double)_ringTopPadding
{
  return 5.0;
}

+ (double)_ringDiameter
{
  return 50.0;
}

+ (double)_ringToTypeSpacing
{
  return 20.0;
}

- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[FIUIWorkoutCompletionPercentageRingViewCell initWithStyle:reuseIdentifier:ringsViewRenderer:](self, "initWithStyle:reuseIdentifier:ringsViewRenderer:", a3, a4, 0);
}

- (void)setWorkoutWithoutFillingRing:(id)a3
{
  -[FIUIWorkoutCompletionPercentageRingViewCell setWorkout:fillRing:](self, "setWorkout:fillRing:", a3, 0);
}

- (void)setWorkout:(id)a3 fillRing:(BOOL)a4
{
  _BOOL4 v4;
  HKWorkout **p_workout;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v4 = a4;
  v49 = a3;
  p_workout = &self->_workout;
  objc_storeStrong((id *)&self->_workout, a3);
  v8 = -[HKWorkout _goalType](self->_workout, "_goalType");
  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setHidden:", 0);

    -[FIUIWorkoutCompletionPercentageRingViewCell gradientBackgroundImageView](self, "gradientBackgroundImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1;
  }
  else
  {
    objc_msgSend(v9, "setHidden:", 1);

    -[FIUIWorkoutCompletionPercentageRingViewCell gradientBackgroundImageView](self, "gradientBackgroundImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
  }
  objc_msgSend(v11, "setHidden:", v13);

  objc_msgSend(MEMORY[0x24BE01CA8], "metricColorsForGoalTypeIdentifier:", -[HKWorkout _goalType](*p_workout, "_goalType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ringGroupController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gradientDarkColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gradientLightColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTopColor:bottomColor:ofRingAtIndex:", v17, v18, 0);

  if (v4)
  {
    -[FIUIWorkoutCompletionPercentageRingViewCell workout](self, "workout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fiui_completionFactor");
    -[FIUIWorkoutCompletionPercentageRingViewCell setCurrentCompletionFactor:](self, "setCurrentCompletionFactor:");

    -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ringGroupController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutCompletionPercentageRingViewCell workout](self, "workout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fiui_completionFactor");
    objc_msgSend(v21, "setPercentage:ofRingAtIndex:animated:", 0, 0);

  }
  -[HKWorkout fiui_connectedGymBrandName](*p_workout, "fiui_connectedGymBrandName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextColor:", v24);

    -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v23);
  }
  else
  {
    objc_msgSend(v14, "nonGradientTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v27);

    if (objc_msgSend(v49, "_goalType"))
    {
      -[FIUIWorkoutCompletionPercentageRingViewCell workout](self, "workout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fiui_completionFactor");
      v31 = v30;

      v32 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("%@_PERCENTAGE_COMPLETE_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(v31 * 100.0) / 100.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[FIUIFormattingManager percentStringWithNumber:](FIUIFormattingManager, "percentStringWithNumber:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v33, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setText:", v36);

    }
    else
    {
      FIUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("WORKOUT_OPEN_GOAL"), &stru_24CF339D8, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setText:", v33);

    }
  }

  -[FIUIWorkoutCompletionPercentageRingViewCell workout](self, "workout");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "fiui_activityType");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setText:", v41);

  +[FIUIWorkoutActivityType activityTypeWithWorkout:](FIUIWorkoutActivityType, "activityTypeWithWorkout:", *p_workout);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIStaticWorkoutIconImage(v43, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "imageWithRenderingMode:", 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:", v45);

  objc_msgSend(v14, "nonGradientTextColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTintColor:", v47);

  -[FIUIWorkoutCompletionPercentageRingViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  CGAffineTransform *v36;
  __int128 v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double MaxY;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  CGFloat v79;
  void *v80;
  double v81;
  double v82;
  CGFloat v83;
  void *v84;
  CGFloat rect;
  CGFloat v86;
  CGFloat v87;
  _OWORD v88[3];
  CGAffineTransform v89;
  CGAffineTransform v90;
  uint64_t v91;
  double v92;
  double v93;
  double v94;
  objc_super v95;
  CGRect v96;
  CGRect v97;

  v95.receiver = self;
  v95.super_class = (Class)FIUIWorkoutCompletionPercentageRingViewCell;
  -[FIUIWorkoutCompletionPercentageRingViewCell layoutSubviews](&v95, sel_layoutSubviews);
  -[FIUIWorkoutCompletionPercentageRingViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "_ringTopPadding");
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_ringDiameter");
  v15 = v14;
  objc_msgSend((id)objc_opt_class(), "_ringDiameter");
  *(double *)&v91 = 5.5;
  v92 = v13;
  v93 = v15;
  v94 = v16;
  v86 = v7;
  v87 = v5;
  rect = v11;
  FIUIFlipFrameRightToLeftIfNeeded((CGFloat *)&v91, v5, v7, v9, v11);
  v17 = *(double *)&v91;
  v18 = v92;
  v20 = v93;
  v19 = v94;
  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v17, v18, v20, v19);

  v22 = *(double *)&v91;
  v23 = v92;
  v24 = v93;
  v25 = v94;
  -[FIUIWorkoutCompletionPercentageRingViewCell gradientBackgroundImageView](self, "gradientBackgroundImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

  -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeToFit");

  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "center");
  v30 = v29;
  v32 = v31;
  -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCenter:", v30, v32);

  if (FIUILocaleIsRightToLeft())
  {
    CGAffineTransformMakeScale(&v90, -1.0, 1.0);
    -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v89 = v90;
    v36 = &v89;
  }
  else
  {
    -[FIUIWorkoutCompletionPercentageRingViewCell iconImageView](self, "iconImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v37 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v88[0] = *MEMORY[0x24BDBD8B8];
    v88[1] = v37;
    v88[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v36 = (CGAffineTransform *)v88;
  }
  objc_msgSend(v34, "setTransform:", v36);

  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  v40 = v39;

  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", 5.5, 0.0, v9 + 5.5 * -2.0, v40);

  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "frame");
  MaxY = CGRectGetMaxY(v96);
  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "font");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_ringToTypeSpacing");
  objc_msgSend(v45, "_scaledValueForValue:");
  v47 = MaxY + v46;
  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_setFirstLineBaselineFrameOriginY:", v47);

  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  -[FIUIWorkoutCompletionPercentageRingViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = FIUIRoundFrameToViewScale(v50);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

  -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  v61 = v60;

  -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", 5.5, 0.0, v9 + 5.5 * -2.0, v61);

  -[FIUIWorkoutCompletionPercentageRingViewCell typeLabel](self, "typeLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "_lastLineBaselineFrameOriginY");
  v65 = v64;
  objc_msgSend((id)objc_opt_class(), "_typeToSecondaryLabelSpacing");
  v67 = v65 + v66;
  -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_setFirstLineBaselineFrameOriginY:", v67);

  -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "frame");
  -[FIUIWorkoutCompletionPercentageRingViewCell contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = FIUIRoundFrameToViewScale(v70);
  v73 = v72;
  v75 = v74;
  v77 = v76;
  -[FIUIWorkoutCompletionPercentageRingViewCell secondaryLabel](self, "secondaryLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v71, v73, v75, v77);

  v79 = v9 + 5.5 * -2.0;
  -[FIUIWorkoutCompletionPercentageRingViewCell separatorView](self, "separatorView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "sizeThatFits:", v79, 1.79769313e308);
  v82 = v81;

  v97.origin.y = v86;
  v97.origin.x = v87;
  v97.size.width = v9;
  v97.size.height = rect;
  v83 = CGRectGetMaxY(v97) - v82;
  -[FIUIWorkoutCompletionPercentageRingViewCell separatorView](self, "separatorView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFrame:", 5.5, v83, v79, v82);

}

- (FIUIDividerView)separatorView
{
  return self->_separatorView;
}

- (void)animateRingWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", 0);

  -[FIUIWorkoutCompletionPercentageRingViewCell ringsView](self, "ringsView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ringGroupController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutCompletionPercentageRingViewCell workout](self, "workout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fiui_completionFactor");
  objc_msgSend(v5, "setPercentage:ofRingAtIndex:animated:", 0, 0);

}

+ (double)_typeToSecondaryLabelSpacing
{
  return 18.0;
}

+ (double)_secondaryLabelToSeparatorSpacing
{
  return 9.0;
}

- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 ringsViewRenderer:(id)a5
{
  id v8;
  FIUIWorkoutCompletionPercentageRingViewCell *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  ARUIRingsView *ringsView;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  UIImageView *gradientBackgroundImageView;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  UIImageView *iconImageView;
  ARUIRingsView *v26;
  void *v27;
  uint64_t v28;
  UILabel *secondaryLabel;
  void *v30;
  uint64_t v31;
  UILabel *typeLabel;
  FIUIDividerView *v33;
  FIUIDividerView *separatorView;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v42;

  v8 = a5;
  v42.receiver = self;
  v42.super_class = (Class)FIUIWorkoutCompletionPercentageRingViewCell;
  v9 = -[FIUIWorkoutCompletionPercentageRingViewCell initWithStyle:reuseIdentifier:](&v42, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01CC8]), "initWithNumberOfRings:", 1);
    objc_msgSend((id)objc_opt_class(), "_ringDiameter");
    *(float *)&v11 = v11;
    objc_msgSend(v10, "setRingDiameter:", v11);
    HIDWORD(v12) = 1075052544;
    *(float *)&v12 = 5.0;
    objc_msgSend(v10, "setRingThickness:", v12);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE01CD8]), "initWithRingGroupController:renderer:", v10, v8);
    ringsView = v9->_ringsView;
    v9->_ringsView = (ARUIRingsView *)v13;

    -[ARUIRingsView setPreferredFramesPerSecond:](v9->_ringsView, "setPreferredFramesPerSecond:", 30);
    -[ARUIRingsView setPaused:](v9->_ringsView, "setPaused:", 1);
    -[ARUIRingsView setEmptyRingAlpha:](v9->_ringsView, "setEmptyRingAlpha:", 0.2);
    objc_msgSend((id)objc_opt_class(), "_ringDiameter");
    FIUICircularWorkoutGradientImage(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v16);
    gradientBackgroundImageView = v9->_gradientBackgroundImageView;
    v9->_gradientBackgroundImageView = (UIImageView *)v17;

    v19 = objc_alloc(MEMORY[0x24BEBD668]);
    v20 = *MEMORY[0x24BDBF090];
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v24 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], v21, v22, v23);
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = (UIImageView *)v24;

    v26 = v9->_ringsView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[ARUIRingsView setOpaque:](v9->_ringsView, "setOpaque:", 0);
    -[ARUIRingsView setMaskView:](v9->_ringsView, "setMaskView:", 0);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v20, v21, v22, v23);
    secondaryLabel = v9->_secondaryLabel;
    v9->_secondaryLabel = (UILabel *)v28;

    _LabelFont();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_secondaryLabel, "setFont:", v30);

    _TypeLabel();
    v31 = objc_claimAutoreleasedReturnValue();
    typeLabel = v9->_typeLabel;
    v9->_typeLabel = (UILabel *)v31;

    v33 = -[FIUIDividerView initWithFrame:]([FIUIDividerView alloc], "initWithFrame:", v20, v21, v22, v23);
    separatorView = v9->_separatorView;
    v9->_separatorView = v33;

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v9->_ringsView);

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v9->_gradientBackgroundImageView);

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v9->_iconImageView);

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v9->_typeLabel);

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v9->_secondaryLabel);

    -[FIUIWorkoutCompletionPercentageRingViewCell contentView](v9, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v9->_separatorView);

  }
  return v9;
}

- (void)setWorkout:(id)a3
{
  -[FIUIWorkoutCompletionPercentageRingViewCell setWorkout:fillRing:](self, "setWorkout:fillRing:", a3, 1);
}

- (double)currentCompletionFactor
{
  return self->_currentCompletionFactor;
}

- (void)setCurrentCompletionFactor:(double)a3
{
  self->_currentCompletionFactor = a3;
}

- (void)setRingsView:(id)a3
{
  objc_storeStrong((id *)&self->_ringsView, a3);
}

- (UIImageView)gradientBackgroundImageView
{
  return self->_gradientBackgroundImageView;
}

- (void)setGradientBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientBackgroundImageView, a3);
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end
