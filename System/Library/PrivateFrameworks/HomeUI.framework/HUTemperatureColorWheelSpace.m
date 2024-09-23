@implementation HUTemperatureColorWheelSpace

+ ($F24F406B2B787EFB06265DBA3D28CBD5)defaultTemperatureRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 2400.0;
  v3 = 10000.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)largestAllowableTemperatureRange
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 1000.0;
  v3 = 40000.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (HUTemperatureColorWheelSpace)initWithSupportedRange:(id)a3
{
  double var1;
  double var0;
  HUTemperatureColorWheelSpace *result;
  double v6;
  objc_super v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureColorWheelSpace;
  result = -[HUTemperatureColorWheelSpace init](&v7, sel_init);
  if (result)
  {
    v6 = 1000.0;
    if (var0 >= 1000.0)
      v6 = var0;
    result->_supportedRange.minimum = v6;
    result->_supportedRange.maximum = fmin(var1, 40000.0);
  }
  return result;
}

- (HUTemperatureColorWheelSpace)init
{
  objc_msgSend((id)objc_opt_class(), "defaultTemperatureRange");
  return -[HUTemperatureColorWheelSpace initWithSupportedRange:](self, "initWithSupportedRange:");
}

- (unint64_t)type
{
  return 1;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)colorForCoordinate:(id)a3
{
  double var0;
  double i;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  var0 = a3.var0;
  if (a3.var0 < 0.0 || a3.var0 > 1.0)
    NSLog(CFSTR("Input coordinate angle %f is out of bounds!"), a2, *(_QWORD *)&a3.var0);
  for (i = var0 + -0.25; i < 0.0; i = i + 1.0)
    ;
  v7 = i + i;
  if (v7 > 1.0)
    v7 = 2.0 - v7;
  if (v7 >= 0.525)
  {
    v9 = (v7 + -0.525) / 0.475;
    v10 = v9 * (v9 * v9)
        + v9 * ((1.0 - v9) * ((1.0 - v9) * 3.0)) * 0.25
        + (1.0 - v9) * ((1.0 - v9) * (1.0 - v9)) * 0.0
        + v9 * (v9 * ((1.0 - v9) * 3.0)) * 0.95;
    -[HUTemperatureColorWheelSpace supportedRange](self, "supportedRange");
    v8 = (v11 + -6600.0) * v10 + 6600.0;
  }
  else if (v7 <= 0.475)
  {
    v12 = v7 / 0.475;
    v13 = v12 * (v12 * v12)
        + v12 * ((1.0 - v12) * ((1.0 - v12) * 3.0)) * 0.05
        + (1.0 - v12) * ((1.0 - v12) * (1.0 - v12)) * 0.0
        + v12 * (v12 * ((1.0 - v12) * 3.0)) * 0.75;
    -[HUTemperatureColorWheelSpace supportedRange](self, "supportedRange");
    v15 = v14;
    -[HUTemperatureColorWheelSpace supportedRange](self, "supportedRange");
    v8 = v15 + (6600.0 - v16) * v13;
  }
  else
  {
    v8 = 6600.0;
  }
  HFGetColorForLightTemperature();
  v18 = *((double *)&HUWheelColorInvalid + 1);
  v17 = *(double *)&HUWheelColorInvalid;
  v19 = 1.79769313e308;
  v20 = v8;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForColor:(id)a3 isValid:(BOOL *)a4
{
  double v4;
  double var3;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  _QWORD v17[6];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (a3.var3 == 1.79769313e308)
  {
    if (a4)
      *a4 = 0;
    v4 = 1.79769313e308;
    goto LABEL_18;
  }
  var3 = a3.var3;
  -[HUTemperatureColorWheelSpace supportedRange](self, "supportedRange", a4);
  v8 = fmax(var3, v7);
  -[HUTemperatureColorWheelSpace supportedRange](self, "supportedRange");
  v10 = fmin(v8, v9);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke;
  v17[3] = &unk_1E6F5EBD8;
  *(double *)&v17[5] = v10;
  v17[4] = self;
  __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke((uint64_t)v17);
  v12 = v11 * 0.5 + 0.25;
  if (-[HUTemperatureColorWheelSpace mirroringBiasAxis](self, "mirroringBiasAxis") == 1)
    v4 = 0.5 - v12;
  else
    v4 = v12;
  v13 = 1.0;
  if (v4 <= 1.0)
  {
    if (v4 >= 0.0)
      goto LABEL_12;
  }
  else
  {
    v13 = -1.0;
  }
  v4 = v4 + v13;
LABEL_12:
  if (v4 < 0.0 || v4 > 1.0)
    NSLog(CFSTR("Invalid angle for temperature %f"), *(_QWORD *)&v10);
LABEL_18:
  v15 = 1.79769313e308;
  v16 = v4;
  result.var1 = v15;
  result.var0 = v16;
  return result;
}

void __59__HUTemperatureColorWheelSpace_coordinateForColor_isValid___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(double *)(a1 + 40);
  if (v1 <= 6600.0)
  {
    if (v1 < 6600.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "supportedRange", 0.5);
      v5 = (v1 - v4) / (6600.0 - v4);
      if (qword_1ED580C68 != -1)
        dispatch_once(&qword_1ED580C68, &__block_literal_global_76_2);
      HUApproximatelyInverseCubicBezierWithSamples(v5, (uint64_t)&HULowTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1ED580D10, 20);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "supportedRange");
    v3 = (v1 + -6600.0) / (v2 + -6600.0);
    if (_MergedGlobals_639 != -1)
      dispatch_once(&_MergedGlobals_639, &__block_literal_global_267);
    HUApproximatelyInverseCubicBezierWithSamples(v3, (uint64_t)&HUHighTemperatureSmoothingBezierCurvePoints, (uint64_t)&unk_1ED580C70, 20);
  }
}

- (unint64_t)mirroringBiasAxis
{
  return self->_mirroringBiasAxis;
}

- (void)setMirroringBiasAxis:(unint64_t)a3
{
  self->_mirroringBiasAxis = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)supportedRange
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_supportedRange.minimum;
  maximum = self->_supportedRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

@end
