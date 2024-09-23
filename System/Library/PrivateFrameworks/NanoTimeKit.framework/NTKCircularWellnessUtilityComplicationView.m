@implementation NTKCircularWellnessUtilityComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 2);
  else
    v4 = 0;

  return v4;
}

- (NTKCircularWellnessUtilityComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularWellnessUtilityComplicationView *v3;
  NTKCircularWellnessUtilityComplicationView *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *ringsFillFractions;
  NTKRingsAndDotsView *v10;
  uint64_t v11;
  NTKRingsAndDotsView *ringsView;
  void *v13;
  objc_super v15;
  _BYTE v16[48];
  double v17;

  v15.receiver = self;
  v15.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  v3 = -[NTKUtilityCircularComplicationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKUtilityComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v5, v16);
    v6 = v17;

    +[NTKRingsAndDotsView emptyFillFractions](NTKRingsAndDotsView, "emptyFillFractions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    ringsFillFractions = v4->_ringsFillFractions;
    v4->_ringsFillFractions = (NSMutableArray *)v8;

    v10 = [NTKRingsAndDotsView alloc];
    v11 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v10, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v6, 2.0, 1.0, 0.75);
    ringsView = v4->_ringsView;
    v4->_ringsView = (NTKRingsAndDotsView *)v11;

    -[NTKRingsAndDotsView setRingsFillFractions:](v4->_ringsView, "setRingsFillFractions:", v4->_ringsFillFractions);
    -[NTKCircularWellnessUtilityComplicationView _updateRingColors](v4, "_updateRingColors");
    -[NTKUtilityCircularComplicationView contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_ringsView);

  }
  return v4;
}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  -[NTKUtilityComplicationView applyFaceColorPalette:units:](&v5, sel_applyFaceColorPalette_units_, a3, a4);
  -[NTKCircularWellnessUtilityComplicationView _updateRingColors](self, "_updateRingColors");
}

- (void)setForegroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  -[NTKUtilityComplicationView setForegroundColor:](&v4, sel_setForegroundColor_, a3);
  -[NTKCircularWellnessUtilityComplicationView _updateRingColors](self, "_updateRingColors");
}

- (void)_updateRingColors
{
  void *v3;
  int v4;
  NTKRingsAndDotsView *ringsView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[NTKUtilityComplicationView colorScheme](self, "colorScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsOverrideFaceColor");

  ringsView = self->_ringsView;
  if (v4)
  {
    NTKMoveNonGradientTextColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    NTKExerciseNonGradientTextColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    NTKStandNonGradientTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRingsAndDotsView setRingColors:](ringsView, "setRingColors:", v9);

  }
  else
  {
    -[NTKCircularWellnessUtilityComplicationView _ringColor](self, "_ringColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKRingsAndDotsView setForegroundColor:](ringsView, "setForegroundColor:");

  }
}

- (void)_layoutContentView
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
  NTKRingsAndDotsView *ringsView;
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  -[NTKUtilityCircularComplicationView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  ringsView = self->_ringsView;
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  v13 = CGRectGetHeight(v14) * 0.5;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:", v13, CGRectGetWidth(v15) * 0.5);
}

- (void)_applyForegroundAlpha
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  -[NTKUtilityComplicationView _applyForegroundAlpha](&v3, sel__applyForegroundAlpha);
  -[NTKCircularWellnessUtilityComplicationView _updateRingColors](self, "_updateRingColors");
}

- (id)_ringColor
{
  void *v3;
  void *v4;

  -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView foregroundAlpha](self, "foregroundAlpha");
  objc_msgSend(v3, "colorWithAlphaComponent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  -[NTKUtilityComplicationView _updateForTemplateChange](&v20, sel__updateForTemplateChange);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "dotsAreHidden"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "movePercentComplete");
    if (v5 < 0.00000011920929)
      v5 = 0.00000011920929;
    objc_msgSend(v4, "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

    if ((v8 & 1) == 0)
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 0, v6);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "exercisePercentComplete");
    if (v10 < 0.00000011920929)
      v10 = 0.00000011920929;
    objc_msgSend(v9, "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = v8 ^ 1;
    }
    else
    {
      v14 = 1;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 1, v11);
    }
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "standPercentComplete");
    if (v16 < 0.00000011920929)
      v16 = 0.00000011920929;
    objc_msgSend(v15, "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

    if ((v19 & 1) != 0)
    {
      if (!v14)
        goto LABEL_19;
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 2, v17);
    }
    -[NTKRingsAndDotsView setRingsFillFractions:](self->_ringsView, "setRingsFillFractions:", self->_ringsFillFractions);
LABEL_19:

    goto LABEL_20;
  }
  -[NTKCircularWellnessUtilityComplicationView _setLayoutEmptyRings](self, "_setLayoutEmptyRings");
LABEL_20:

}

- (void)_setLayoutEmptyRings
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *ringsFillFractions;

  +[NTKRingsAndDotsView emptyFillFractions](NTKRingsAndDotsView, "emptyFillFractions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v4;

  -[NTKRingsAndDotsView setRingsFillFractions:](self->_ringsView, "setRingsFillFractions:", self->_ringsFillFractions);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
