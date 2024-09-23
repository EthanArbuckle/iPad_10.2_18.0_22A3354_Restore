@implementation CEKApertureSlider

- (CEKApertureSlider)initWithFrame:(CGRect)a3
{
  CEKApertureSlider *v3;
  void *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *decimalFormatter;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSNumberFormatter *v11;
  NSNumberFormatter *wholeNumberFormatter;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEKApertureSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CEKApertureStops validApertureValues](CEKApertureStops, "validApertureValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setIndexCount:](v3, "setIndexCount:", objc_msgSend(v4, "count"));
    v3->__maximumApertureIndex = objc_msgSend(v4, "count") - 1;
    v3->__minimumApertureIndex = 0;
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    decimalFormatter = v3->__decimalFormatter;
    v3->__decimalFormatter = v5;

    -[NSNumberFormatter setPositiveFormat:](v3->__decimalFormatter, "setPositiveFormat:", CFSTR("0.0"));
    -[NSNumberFormatter stringFromNumber:](v3->__decimalFormatter, "stringFromNumber:", &unk_1E70B3C00);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("4,5"));

    if (v8)
      -[NSNumberFormatter setDecimalSeparator:](v3->__decimalFormatter, "setDecimalSeparator:", CFSTR("."));
    CEKLocalizedFrameworkString(CFSTR("DEPTH_SLIDER_VALUE_FORMAT"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, CFSTR("0.0"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setPositiveFormat:](v3->__decimalFormatter, "setPositiveFormat:", v10);

    v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    wholeNumberFormatter = v3->__wholeNumberFormatter;
    v3->__wholeNumberFormatter = v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, CFSTR("0"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setPositiveFormat:](v3->__wholeNumberFormatter, "setPositiveFormat:", v13);

    CEKLocalizedFrameworkString(CFSTR("DEPTH_SLIDER_TITLE"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKDiscreteSlider setTitleText:](v3, "setTitleText:", v14);

    -[CEKApertureSlider _updateMainTickMarkOffset](v3, "_updateMainTickMarkOffset");
    -[CEKDiscreteSlider updateValueLabel](v3, "updateValueLabel");

  }
  return v3;
}

- (double)horizontalValueLabelOffset
{
  return -3.0 - CEKPixelWidthForView(self);
}

- (id)valueText
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;

  -[CEKApertureSlider apertureValue](self, "apertureValue");
  v4 = v3;
  if (v3 >= 10.0)
    -[CEKApertureSlider _wholeNumberFormatter](self, "_wholeNumberFormatter");
  else
    -[CEKApertureSlider _decimalFormatter](self, "_decimalFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CEKApertureSlider includesOffState](self, "includesOffState");
  if (v4 == 0.0 && v8)
  {
    CEKLocalizedFrameworkString(CFSTR("DEPTH_SLIDER_OFF"), 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (void)_updateMainTickMarkOffset
{
  unint64_t v3;
  unint64_t v4;
  id v5;

  v3 = -[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex");
  v4 = v3
     - +[CEKApertureStops firstFullStopIndexAfterOrIncludingIndex:](CEKApertureStops, "firstFullStopIndexAfterOrIncludingIndex:", v3);
  -[CEKDiscreteSlider tickMarksConfiguration](self, "tickMarksConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMainTickMarkOffset:", v4);

}

- (void)_updateIndexCount
{
  unint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  -[CEKApertureSlider minimumApertureValue](self, "minimumApertureValue");
  v3 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:");
  -[CEKApertureSlider maximumApertureValue](self, "maximumApertureValue");
  v4 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:")- v3;
  v5 = -[CEKApertureSlider includesOffState](self, "includesOffState");
  v6 = 1;
  if (v5)
    v6 = 2;
  -[CEKDiscreteSlider setIndexCount:](self, "setIndexCount:", v4 + v6);
}

- (void)setApertureValueClosestTo:(double)a3
{
  -[CEKDiscreteSlider setSelectedIndex:](self, "setSelectedIndex:", -[CEKApertureSlider _discreteIndexForValidApertureIndex:](self, "_discreteIndexForValidApertureIndex:", (unint64_t)CEKClamp((double)+[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:", a3), (double)-[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex"), (double)-[CEKApertureSlider _maximumApertureIndex](self, "_maximumApertureIndex"))));
}

- (void)setMinimumApertureValueClosestTo:(double)a3 maximumApertureValueClosestTo:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;

  -[CEKApertureSlider minimumApertureValue](self, "minimumApertureValue");
  v8 = v7;
  -[CEKApertureSlider maximumApertureValue](self, "maximumApertureValue");
  if (v8 != a3 || v9 != a4)
  {
    -[CEKApertureSlider apertureValue](self, "apertureValue");
    v12 = v11;
    -[CEKApertureSlider markedApertureValue](self, "markedApertureValue");
    v14 = v13;
    v15 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:", a3);
    v16 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:", a4);
    self->__minimumApertureIndex = v15;
    self->__maximumApertureIndex = v16;
    -[CEKApertureSlider _updateIndexCount](self, "_updateIndexCount");
    -[CEKApertureSlider setApertureValueClosestTo:](self, "setApertureValueClosestTo:", v12);
    -[CEKApertureSlider setMarkedApertureValueClosestTo:](self, "setMarkedApertureValueClosestTo:", v14);
    -[CEKApertureSlider _updateMainTickMarkOffset](self, "_updateMainTickMarkOffset");
    -[CEKDiscreteSlider updateValueLabel](self, "updateValueLabel");
    -[CEKApertureSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)minimumApertureValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[CEKApertureStops validApertureValues](CEKApertureStops, "validApertureValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)maximumApertureValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[CEKApertureStops validApertureValues](CEKApertureStops, "validApertureValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[CEKApertureSlider _maximumApertureIndex](self, "_maximumApertureIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)apertureValue
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (-[CEKApertureSlider includesOffState](self, "includesOffState"))
  {
    v3 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
    if (v3 >= -[CEKDiscreteSlider indexCount](self, "indexCount") - 1)
      return 0.0;
  }
  +[CEKApertureStops validApertureValues](CEKApertureStops, "validApertureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[CEKApertureSlider _validApertureIndexForDiscreteIndex:](self, "_validApertureIndexForDiscreteIndex:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)markedApertureValue
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = -[CEKDiscreteSlider indexCount](self, "indexCount");
  v4 = v3 - -[CEKApertureSlider includesOffState](self, "includesOffState");
  if (-[CEKDiscreteSlider markedIndex](self, "markedIndex") >= v4)
    return 0.0;
  +[CEKApertureStops validApertureValues](CEKApertureStops, "validApertureValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[CEKApertureSlider _validApertureIndexForDiscreteIndex:](self, "_validApertureIndexForDiscreteIndex:", -[CEKDiscreteSlider markedIndex](self, "markedIndex")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setMarkedApertureValueClosestTo:(double)a3
{
  -[CEKDiscreteSlider setMarkedIndex:](self, "setMarkedIndex:", -[CEKApertureSlider _discreteIndexForValidApertureIndex:](self, "_discreteIndexForValidApertureIndex:", +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:", a3)));
}

- (void)setIncludesOffState:(BOOL)a3
{
  if (self->_includesOffState != a3)
  {
    self->_includesOffState = a3;
    -[CEKApertureSlider _updateIndexCount](self, "_updateIndexCount");
  }
}

- (BOOL)isSliderOn
{
  unint64_t v3;

  if (!-[CEKApertureSlider includesOffState](self, "includesOffState"))
    return 1;
  v3 = -[CEKDiscreteSlider selectedIndex](self, "selectedIndex");
  return v3 < -[CEKDiscreteSlider indexCount](self, "indexCount") - 1;
}

- (void)setSliderOn:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  if (-[CEKApertureSlider includesOffState](self, "includesOffState")
    && -[CEKApertureSlider isSliderOn](self, "isSliderOn") != v3)
  {
    if (v3)
    {
      -[CEKApertureSlider markedApertureValue](self, "markedApertureValue");
      if (v5 == 0.0)
        -[CEKApertureSlider maximumApertureValue](self, "maximumApertureValue");
      -[CEKApertureSlider setApertureValueClosestTo:](self, "setApertureValueClosestTo:");
    }
    else
    {
      -[CEKDiscreteSlider setSelectedIndex:](self, "setSelectedIndex:", -[CEKDiscreteSlider indexCount](self, "indexCount") - 1);
    }
  }
}

- (unint64_t)_validApertureIndexForDiscreteIndex:(unint64_t)a3
{
  return -[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex") + a3;
}

- (unint64_t)_discreteIndexForValidApertureIndex:(unint64_t)a3
{
  return a3 - -[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex");
}

- (BOOL)includesOffState
{
  return self->_includesOffState;
}

- (unint64_t)_minimumApertureIndex
{
  return self->__minimumApertureIndex;
}

- (void)_setMinimumApertureIndex:(unint64_t)a3
{
  self->__minimumApertureIndex = a3;
}

- (unint64_t)_maximumApertureIndex
{
  return self->__maximumApertureIndex;
}

- (void)_setMaximumApertureIndex:(unint64_t)a3
{
  self->__maximumApertureIndex = a3;
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (NSNumberFormatter)_wholeNumberFormatter
{
  return self->__wholeNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wholeNumberFormatter, 0);
  objc_storeStrong((id *)&self->__decimalFormatter, 0);
}

@end
