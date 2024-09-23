@implementation CAMExposureSlider

+ (id)exposureValues
{
  if (exposureValues_onceToken != -1)
    dispatch_once(&exposureValues_onceToken, &__block_literal_global_54);
  return (id)exposureValues_exposureValues;
}

void __35__CAMExposureSlider_exposureValues__block_invoke()
{
  void *v0;

  v0 = (void *)exposureValues_exposureValues;
  exposureValues_exposureValues = (uint64_t)&unk_1EA3B3AA0;

}

+ (id)decimalFormatter
{
  if (decimalFormatter_onceToken_0 != -1)
    dispatch_once(&decimalFormatter_onceToken_0, &__block_literal_global_13);
  return (id)decimalFormatter_decimalFormatter;
}

void __37__CAMExposureSlider_decimalFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)decimalFormatter_decimalFormatter;
  decimalFormatter_decimalFormatter = (uint64_t)v0;

  objc_msgSend((id)decimalFormatter_decimalFormatter, "setPositiveFormat:", CFSTR("0.0"));
  objc_msgSend((id)decimalFormatter_decimalFormatter, "setNegativeFormat:", CFSTR("0.0"));
  objc_msgSend((id)decimalFormatter_decimalFormatter, "stringFromNumber:", &unk_1EA3B14B0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)decimalFormatter_decimalFormatter, "setZeroSymbol:", v2);

  objc_msgSend((id)decimalFormatter_decimalFormatter, "plusSign");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)decimalFormatter_decimalFormatter, "setPositivePrefix:", v3);

  objc_msgSend((id)decimalFormatter_decimalFormatter, "minusSign");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)decimalFormatter_decimalFormatter, "setNegativePrefix:", v4);

}

- (CAMExposureSlider)initWithFrame:(CGRect)a3
{
  CAMExposureSlider *v3;
  CAMExposureSlider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMExposureSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKDiscreteSlider setColorHighlight:](v3, "setColorHighlight:", 2);
    objc_msgSend((id)objc_opt_class(), "exposureValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setIndexCount:](v4, "setIndexCount:", objc_msgSend(v5, "count"));

    CAMLocalizedFrameworkString(CFSTR("EXPOSURE_SLIDER_TITLE"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setTitleText:](v4, "setTitleText:", v6);

    -[CEKDiscreteSlider tickMarksConfiguration](v4, "tickMarksConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainTickMarkInterval:", 3);

    -[CEKDiscreteSlider tickMarksConfiguration](v4, "tickMarksConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTickMarkSpacing:", 20.0);

    -[CEKDiscreteSlider setTickMarkCountBetweenIndexes:](v4, "setTickMarkCountBetweenIndexes:", 0);
  }
  return v4;
}

- (void)setExposureValueClosestTo:(double)a3
{
  -[CEKDiscreteSlider setSelectedIndex:](self, "setSelectedIndex:", -[CAMExposureSlider _indexOfClosestValidValueForExposureValue:](self, "_indexOfClosestValidValueForExposureValue:", a3));
}

- (double)exposureValue
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "exposureValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (double)horizontalValueLabelOffset
{
  double v3;
  double v4;
  BOOL v5;
  double result;

  -[CAMExposureSlider exposureValue](self, "exposureValue");
  v3 = -3.0;
  v5 = v4 < 0.0;
  if (v4 > 0.0)
    return v3 - CAMPixelWidthForView(self);
  result = 1.0;
  v3 = -2.0;
  if (v5)
    return v3 - CAMPixelWidthForView(self);
  return result;
}

- (id)valueText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "decimalFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMExposureSlider exposureValue](self, "exposureValue");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateValueLabel
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMExposureSlider;
  -[CEKDiscreteSlider updateValueLabel](&v6, sel_updateValueLabel);
  -[CAMExposureSlider horizontalValueLabelOffset](self, "horizontalValueLabelOffset");
  v4 = v3;
  -[CAMExposureSlider _previousHorizontalLabelOffset](self, "_previousHorizontalLabelOffset");
  if (v4 != v5)
  {
    -[CAMExposureSlider setNeedsLayout](self, "setNeedsLayout");
    -[CAMExposureSlider set_previousHorizontalLabelOffset:](self, "set_previousHorizontalLabelOffset:", v4);
  }
}

- (unint64_t)_indexOfClosestValidValueForExposureValue:(double)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend((id)objc_opt_class(), "exposureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CAMExposureSlider__indexOfClosestValidValueForExposureValue___block_invoke;
  v7[3] = &unk_1EA32F4B8;
  *(double *)&v7[6] = a3;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __63__CAMExposureSlider__indexOfClosestValidValueForExposureValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  double v9;
  uint64_t v10;

  result = objc_msgSend(a2, "doubleValue");
  v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (double)_previousHorizontalLabelOffset
{
  return self->__previousHorizontalLabelOffset;
}

- (void)set_previousHorizontalLabelOffset:(double)a3
{
  self->__previousHorizontalLabelOffset = a3;
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__decimalFormatter, 0);
}

@end
