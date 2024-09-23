@implementation HKNumericAxisZeroOnly

- (HKNumericAxisZeroOnly)initWithZeroLabel:(id)a3 axisConfiguration:(id)a4
{
  id v6;
  id v7;
  HKNumericAxisZeroOnly *v8;
  uint64_t v9;
  NSString *zeroLabel;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setOverrideNoTopBaseline:", 1);
  v12.receiver = self;
  v12.super_class = (Class)HKNumericAxisZeroOnly;
  v8 = -[HKNumericAxis initWithConfiguration:](&v12, sel_initWithConfiguration_, v7);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    zeroLabel = v8->_zeroLabel;
    v8->_zeroLabel = (NSString *)v9;

  }
  return v8;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  HKAxisLabel *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v6, "maxValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = 0;
    if (v9 <= 0.0 && v12 >= 0.0)
    {
      -[HKNumericAxisZeroOnly zeroLabel](self, "zeroLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        -[HKNumericAxis stringFromNumber:](self, "stringFromNumber:", &unk_1E9CED058);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_alloc_init(HKAxisLabel);
      -[HKAxisLabel setText:](v15, "setText:", v14);
      -[HKAxisLabel setLocation:](v15, "setLocation:", &unk_1E9CED058);
      -[HKAxisLabel setLabelType:](v15, "setLabelType:", 1);
      v17[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)zeroLabel
{
  return self->_zeroLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroLabel, 0);
}

@end
