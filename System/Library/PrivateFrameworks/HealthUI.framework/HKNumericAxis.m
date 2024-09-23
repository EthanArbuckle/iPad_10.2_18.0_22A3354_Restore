@implementation HKNumericAxis

+ (id)standardNumericYAxisWithConfigurationOverrides:(id)a3
{
  id v4;
  HKNumericAxisConfiguration *v5;
  void *v6;
  HKNumericAxis *v7;

  v4 = a3;
  v5 = objc_alloc_init(HKNumericAxisConfiguration);
  objc_msgSend(a1, "preferredAxisStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration setPreferredStyle:](v5, "setPreferredStyle:", v6);

  -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v5, "setTopVerticalLabelPadding:", 4.0);
  -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v5, "setBottomVerticalLabelPadding:", 4.0);
  if (v4)
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v5, "applyOverridesFromNumericAxisConfiguration:", v4);
  v7 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v5);

  return v7;
}

- (HKNumericAxis)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  HKScalarZoomScale *v6;
  HKNumericAxis *v7;
  HKAxisLabelDimensionScalar *v8;
  HKAxisLabelDimensionScalar *v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "zoomScaleEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(HKScalarZoomScale);
    objc_msgSend(v4, "setZoomScaleEngine:", v6);

  }
  v13.receiver = self;
  v13.super_class = (Class)HKNumericAxis;
  v7 = -[HKAxis initWithConfiguration:](&v13, sel_initWithConfiguration_, v4);
  if (v7)
  {
    objc_msgSend(v4, "labelDimension");
    v8 = (HKAxisLabelDimensionScalar *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v9 = objc_alloc_init(HKAxisLabelDimensionScalar);
    objc_storeStrong((id *)&v7->_labelDimension, v9);
    if (!v8)

    objc_msgSend(v4, "topVerticalLabelPadding");
    v7->_topVerticalLabelPadding = v10;
    objc_msgSend(v4, "bottomVerticalLabelPadding");
    v7->_bottomVerticalLabelPadding = v11;
  }

  return v7;
}

+ (id)preferredAxisStyle
{
  HKSolidFillStyle *v2;
  void *v3;
  HKAxisStyle *v4;
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

  v2 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v2, "setColor:", v3);

  v4 = objc_alloc_init(HKAxisStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:hyphenationFactor:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:hyphenationFactor:", v5, v6, 2, 2, &unk_1E9CED548);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setLabelStyle:](v4, "setLabelStyle:", v7);

  -[HKAxisStyle setTickPositions:](v4, "setTickPositions:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v8, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setAxisLineStyle:](v4, "setAxisLineStyle:", v9);

  -[HKAxisStyle setFillStyle:](v4, "setFillStyle:", v2);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v10, HKUIOnePixel());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxisStyle setBorderStyleForFill:](v4, "setBorderStyleForFill:", v11);
  -[HKAxisStyle setFillInnerPadding:](v4, "setFillInnerPadding:", 4.0);
  -[HKAxisStyle setFillOuterPadding:](v4, "setFillOuterPadding:", 6.0);
  -[HKAxisStyle setLocation:](v4, "setLocation:", 1);
  -[HKAxisStyle setShowGridLines:](v4, "setShowGridLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v13, 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setGridLineStyle:](v4, "setGridLineStyle:", v14);

  return v4;
}

- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  objc_msgSend(v7, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v7, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (var1 >= 0.0)
    v14 = var0;
  else
    v14 = var0 + var1;
  if (var1 >= 0.0)
    v15 = var0 + var1;
  else
    v15 = var0;
  +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", self->_bottomVerticalLabelPadding, self->_topVerticalLabelPadding, v10, v13, v14, v15);
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)stringFromNumber:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", a3, 1);
}

- (double)labelSpacingFactorForNumberFormatter
{
  return 1.0;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[HKNumericAxis ticksAndLabelsForRangeInModelCoordinates:maximumLabelCount:endingOptions:dimension:](HKNumericAxis, "ticksAndLabelsForRangeInModelCoordinates:maximumLabelCount:endingOptions:dimension:", v5, -[HKAxis maxLabels](self, "maxLabels"), -[HKAxis axisLabelEndings](self, "axisLabelEndings"), self->_labelDimension);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[HKNumericAxis ticksAndLabelsForRangeInModelCoordinates:maximumLabelCount:endingOptions:dimension:](HKNumericAxis, "ticksAndLabelsForRangeInModelCoordinates:maximumLabelCount:endingOptions:dimension:", v4, -[HKAxis maxLabels](self, "maxLabels"), 0, self->_labelDimension);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (double)offsetForLegendView
{
  return self->_topVerticalLabelPadding;
}

+ (id)ticksAndLabelsForRangeInModelCoordinates:(id)a3 maximumLabelCount:(int64_t)a4 endingOptions:(int64_t)a5 dimension:(id)a6
{
  char v7;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  double v18;
  BOOL v19;
  unint64_t v20;
  int v21;
  _BOOL4 v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _UNKNOWN **v55;
  unint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  unint64_t v64;
  _UNKNOWN **v65;
  void *v66;
  id v68;
  uint64_t v69;
  double v70;
  void *v71;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "minValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v9, "maxValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = 0;
  if (fabs(v13) != INFINITY && fabs(v16) != INFINITY)
  {
    v17 = 0;
    v18 = fabs(v16 - v13);
    v19 = (unint64_t)(*(_QWORD *)&v18 - 1) >= 0xFFFFFFFFFFFFFLL;
    v20 = *(_QWORD *)&v18 - 0x10000000000000;
    v21 = !v19;
    v22 = v20 >> 53 < 0x3FF;
    if (COERCE__INT64(v16 - v13) >= 0)
    {
      v22 = 0;
      v21 = 0;
    }
    v23 = fabs(v16 - v13);
    if (!v23)
      v21 = 1;
    if (v23 == 0x7FF0000000000000)
      v24 = 1;
    else
      v24 = v21;
    if (v23 > 0x7FF0000000000000)
      v24 = 1;
    if (a4 >= 1 && ((v24 | v22) & 1) == 0)
    {
      objc_msgSend(v10, "niceStepSizeLargerThan:", (v16 - v13) / (double)(a4 + 1));
      v26 = v25;
      objc_msgSend(v10, "endingLabelsFactorOverride");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v26;
      if (v27)
      {
        objc_msgSend(v10, "endingLabelsFactorOverride");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        v28 = v30;

      }
      if (v26 <= 0.0)
        goto LABEL_50;
      v31 = 0.0;
      while (1)
      {
        if ((v7 & 1) != 0)
        {
          +[HKNumericAxis _roundUpByMultiple:factor:](HKNumericAxis, "_roundUpByMultiple:factor:", v13, v28);
          v33 = v34;
          v70 = v13;
        }
        else
        {
          +[HKNumericAxis _roundDownByMultiple:factor:](HKNumericAxis, "_roundDownByMultiple:factor:", v13, v28);
          v33 = v32;
          v70 = v32;
        }
        if ((v7 & 2) != 0)
        {
          +[HKNumericAxis _roundDownByMultiple:factor:](HKNumericAxis, "_roundDownByMultiple:factor:", v16, v28);
          v36 = v38;
          if (v27)
          {
            +[HKNumericAxis _adjustRangeDownWithStartValue:endValue:factor:](HKNumericAxis, "_adjustRangeDownWithStartValue:endValue:factor:", v33, v38, v26);
            v36 = v39;
          }
          v37 = v16;
        }
        else
        {
          +[HKNumericAxis _roundUpByMultiple:factor:](HKNumericAxis, "_roundUpByMultiple:factor:", v16, v28);
          v36 = v35;
          if (v27)
          {
            +[HKNumericAxis _adjustRangeUpWithStartValue:endValue:factor:](HKNumericAxis, "_adjustRangeUpWithStartValue:endValue:factor:", v33, v35, v26);
            v36 = v35;
          }
          v37 = v35;
        }
        v40 = (uint64_t)rint((v37 - v70) / v26);
        if (a4 == 2 && v40 >= 2)
        {
          v41 = v33;
          v43 = v36 - v33;
          goto LABEL_42;
        }
        v41 = v33;
        if (v40 < a4)
          break;
        objc_msgSend(v10, "niceStepSizeLargerThan:", v26, v36);
        v26 = v42;
        v43 = 0.0;
        if (v42 > 0.0)
        {
          if (!v27)
            v28 = v42;
          v31 = v31 + 1.0;
          if (v31 < 10.0)
            continue;
        }
        goto LABEL_42;
      }
      v43 = v26;
LABEL_42:
      if (v31 >= 10.0)
      {
LABEL_50:
        v17 = 0;
      }
      else
      {
        objc_msgSend(v10, "ticksPerStepSize:", v26);
        if (v44 <= 0.0)
          v44 = 1.0;
        v45 = v26 / v44;
        if (v27)
          v46 = v28;
        else
          v46 = v26 / v44;
        if ((v7 & 1) != 0)
        {
          +[HKNumericAxis _roundUpByMultiple:factor:](HKNumericAxis, "_roundUpByMultiple:factor:", v70, v46);
          v47 = v48;
        }
        else
        {
          v47 = v70;
        }
        v68 = v9;
        if ((v7 & 2) != 0)
        {
          +[HKNumericAxis _roundDownByMultiple:factor:](HKNumericAxis, "_roundDownByMultiple:factor:", v37, v46);
          v37 = v49;
        }
        objc_msgSend(v10, "formatterForLabelStepSize:", v26);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v50 = (uint64_t)rint((v37 - v47) / v45);
        if ((v50 & 0x8000000000000000) == 0)
        {
          v51 = 0;
          v52 = (uint64_t)rint(v43 / v45);
          v53 = (uint64_t)rint((v41 - v47) / v45);
          v54 = v50 + 1;
          v55 = &off_1E9C3C000;
          v56 = 0x1E0CB3000uLL;
          v69 = v52;
          do
          {
            v57 = objc_alloc_init((Class)v55[321]);
            objc_msgSend(*(id *)(v56 + 2024), "numberWithDouble:", v47 + (double)v51 * v45);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setLocation:", v58);

            if (v51 % v52 == v53)
            {
              objc_msgSend(v57, "setLabelType:", 1);
              objc_msgSend(v57, "location");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "stringForLocation:formatterForStepSize:", v59, v71);
              v60 = v17;
              v61 = v54;
              v62 = v53;
              v63 = v10;
              v64 = v56;
              v65 = v55;
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setText:", v66);

              v55 = v65;
              v56 = v64;
              v10 = v63;
              v53 = v62;
              v54 = v61;
              v17 = v60;
              v52 = v69;

            }
            else
            {
              objc_msgSend(v57, "setLabelType:", 2);
              objc_msgSend(v57, "setText:", 0);
            }
            objc_msgSend(v17, "addObject:", v57);

            ++v51;
          }
          while (v54 != v51);
        }

        v9 = v68;
      }
    }
  }

  return v17;
}

+ (double)_roundDownByMultiple:(double)a3 factor:(double)a4
{
  return floor((a4 / 100000000.0 + a3) / a4) * a4;
}

+ (double)_roundUpByMultiple:(double)a3 factor:(double)a4
{
  return ceil((a3 + a4 / -100000000.0) / a4) * a4;
}

+ (double)_adjustRangeDownWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5
{
  uint64_t v7;
  double v8;

  v7 = (uint64_t)fmod(a4 - a3, a5);
  v8 = a5 - (double)v7;
  if (v7 <= 0)
    v8 = 0.0;
  return a4 - v8;
}

+ (double)_adjustRangeUpWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5
{
  uint64_t v7;
  double v8;

  v7 = (uint64_t)fmod(a4 - a3, a5);
  v8 = a5 - (double)v7;
  if (v7 <= 0)
    v8 = -0.0;
  return v8 + a4;
}

- (HKAxisLabelDimension)labelDimension
{
  return self->_labelDimension;
}

- (double)topVerticalLabelPadding
{
  return self->_topVerticalLabelPadding;
}

- (double)bottomVerticalLabelPadding
{
  return self->_bottomVerticalLabelPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelDimension, 0);
}

@end
