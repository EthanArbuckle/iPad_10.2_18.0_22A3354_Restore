@implementation HUElasticSliderValueNormalizer

- (HUElasticSliderValueNormalizer)initWithCurrentValueRange:(id)a3 hasSecondaryValue:(BOOL)a4
{
  double var1;
  double var0;
  HUElasticSliderValueNormalizer *v7;
  HUElasticSliderValueNormalizer *v8;
  HUElasticSliderValueNormalizationOptions *v9;
  HUElasticSliderValueNormalizationOptions *options;
  objc_super v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v12.receiver = self;
  v12.super_class = (Class)HUElasticSliderValueNormalizer;
  v7 = -[HUElasticSliderValueNormalizer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_currentValueRange.minimum = var0;
    v7->_currentValueRange.maximum = var1;
    v7->_hasSecondaryValue = a4;
    v9 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
    options = v8->_options;
    v8->_options = v9;

  }
  return v8;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizeRange:(id)a3
{
  double var1;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  -[HUElasticSliderValueNormalizer normalizeValue:ofType:](self, "normalizeValue:ofType:", 1, a3.var0);
  v6 = v5;
  -[HUElasticSliderValueNormalizer normalizeValue:ofType:](self, "normalizeValue:ofType:", 2, var1);
  v8 = v7;
  v9 = v6;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (double)normalizeValue:(double)a3 ofType:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  -[HUElasticSliderValueNormalizer options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "boundingStrategy");

  if (v8 == 2)
  {
    -[HUElasticSliderValueNormalizer _rubberBandValue:ofType:](self, "_rubberBandValue:ofType:", a4, a3);
    a3 = v9;
  }
  -[HUElasticSliderValueNormalizer options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "boundingStrategy") == 1;

  -[HUElasticSliderValueNormalizer _effectiveConstraintsForValueOfType:boundRange:](self, "_effectiveConstraintsForValueOfType:boundRange:", a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "normalizedValueForValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  return v16;
}

- (double)_rubberBandValue:(double)a3 ofType:(unint64_t)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  if (!-[HUElasticSliderValueNormalizer hasSecondaryValue](self, "hasSecondaryValue"))
    goto LABEL_5;
  if (a4 == 1)
  {
    v7 = 0.0625;
    v8 = 0.02;
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    v7 = 0.02;
    v8 = 0.0625;
  }
  else
  {
LABEL_5:
    v8 = 0.0625;
    v7 = 0.0625;
  }
LABEL_7:
  -[HUElasticSliderValueNormalizer _effectiveConstraintsForValueOfType:boundRange:](self, "_effectiveConstraintsForValueOfType:boundRange:", a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(v9, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = HURubberBandedValue(a3, v12, v15, v12 - v7, v8 + v15);
  return v16;
}

- (id)_effectiveConstraintsForValueOfType:(unint64_t)a3 boundRange:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[7];

  v4 = a4;
  -[HUElasticSliderValueNormalizer _originalConstraintsForValueType:](self, "_originalConstraintsForValueType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUElasticSliderValueNormalizer currentValueRange](self, "currentValueRange");
    v9 = v8;
    v11 = v10;
    if (-[HUElasticSliderValueNormalizer hasSecondaryValue](self, "hasSecondaryValue"))
    {
      -[HUElasticSliderValueNormalizer options](self, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "applyMinimumVisualRangeSpan");

      if (v13)
      {
        v14 = v9 + (v11 - v9) * 0.5;
        v9 = v14 + 0.04;
        v11 = v14 + -0.04;
      }
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke;
    v23[3] = &__block_descriptor_56_e20___HFNumberRange_8__0l;
    v23[4] = a3;
    *(double *)&v23[5] = v9;
    *(double *)&v23[6] = v11;
    __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke((uint64_t)v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "validRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intersectRange:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
  }
  else
  {
    v15 = 0;
  }
  -[HUElasticSliderValueNormalizer options](self, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "applyStepValue"))
  {
    objc_msgSend(v7, "stepValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D315F8]), "initWithValidRange:stepValue:", v15, v20);
  return v21;
}

id __81__HUElasticSliderValueNormalizer__effectiveConstraintsForValueOfType_boundRange___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v2 == 2)
    {
      v8 = (void *)MEMORY[0x1E0D315F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = &unk_1E7041920;
      v6 = v8;
      v5 = v4;
      goto LABEL_7;
    }
    if (v2 == 1)
    {
      v3 = (void *)MEMORY[0x1E0D315F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = &unk_1E7041908;
      v6 = v3;
      v7 = v4;
LABEL_7:
      objc_msgSend(v6, "rangeWithMaxValue:minValue:", v7, v5);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D315F0], "rangeWithFloatRange:", 0.0, 1.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)_originalConstraintsForValueType:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[HUElasticSliderValueNormalizer maxValueConstraints](self, "maxValueConstraints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[HUElasticSliderValueNormalizer minValueConstraints](self, "minValueConstraints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (HFNumberValueConstraints)minValueConstraints
{
  return self->_minValueConstraints;
}

- (void)setMinValueConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_minValueConstraints, a3);
}

- (HFNumberValueConstraints)maxValueConstraints
{
  return self->_maxValueConstraints;
}

- (void)setMaxValueConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_maxValueConstraints, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)currentValueRange
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_currentValueRange.minimum;
  maximum = self->_currentValueRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setCurrentValueRange:(id)a3
{
  self->_currentValueRange = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (HUElasticSliderValueNormalizationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_maxValueConstraints, 0);
  objc_storeStrong((id *)&self->_minValueConstraints, 0);
}

@end
