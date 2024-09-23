@implementation CAFFloatRange

- (float)minimumValue
{
  void *v2;
  float v3;
  float v4;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)maximumValue
{
  void *v2;
  float v3;
  float v4;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)stepValue
{
  void *v2;
  float v3;
  float v4;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)rangeDescription
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CAFFloatRange minimumValue](self, "minimumValue");
  v5 = v4;
  -[CAFFloatRange maximumValue](self, "maximumValue");
  v7 = v6;
  -[CAFFloatRange stepValue](self, "stepValue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[%g..%g]x%g"), *(_QWORD *)&v5, *(_QWORD *)&v7, v8);
}

- (BOOL)valueIsInRange:(float)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (float)valueRoundedToNearestStepValue:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;

  -[CAFFloatRange stepValue](self, "stepValue");
  if (v5 >= 0.0)
  {
    -[CAFFloatRange stepValue](self, "stepValue");
    if (v6 <= 0.00000011921)
      return a3;
  }
  -[CAFFloatRange minimumValue](self, "minimumValue");
  v8 = a3 - v7;
  -[CAFFloatRange stepValue](self, "stepValue");
  v10 = (unint64_t)(float)(v8 / v9);
  -[CAFFloatRange minimumValue](self, "minimumValue");
  v12 = v11;
  -[CAFFloatRange stepValue](self, "stepValue");
  return v12 + (float)((float)v10 * v13);
}

+ (id)minimum
{
  return &unk_25095C8A0;
}

+ (id)maximum
{
  return &unk_25095C8B0;
}

+ (id)step
{
  return &unk_250958878;
}

@end
