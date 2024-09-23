@implementation HKNumericAxisConfiguration

- (void)setTopVerticalLabelPadding:(double)a3
{
  self->_topVerticalLabelPadding = a3;
}

- (void)setBottomVerticalLabelPadding:(double)a3
{
  self->_bottomVerticalLabelPadding = a3;
}

- (HKNumericAxisConfiguration)init
{
  HKNumericAxisConfiguration *v2;
  HKNumericAxisConfiguration *v3;
  HKAxisLabelDimension *labelDimension;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKNumericAxisConfiguration;
  v2 = -[HKAxisConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    labelDimension = v2->_labelDimension;
    v2->_labelDimension = 0;

    v3->_topVerticalLabelPadding = 10.0;
    v3->_bottomVerticalLabelPadding = 10.0;
  }
  return v3;
}

- (double)topVerticalLabelPadding
{
  return self->_topVerticalLabelPadding;
}

- (HKAxisLabelDimension)labelDimension
{
  return self->_labelDimension;
}

- (double)bottomVerticalLabelPadding
{
  return self->_bottomVerticalLabelPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelDimension, 0);
}

- (void)applyOverridesFromNumericAxisConfiguration:(id)a3
{
  id v4;
  HKNumericAxisConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v4 = a3;
  v5 = objc_alloc_init(HKNumericAxisConfiguration);
  objc_msgSend(v4, "labelDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumericAxisConfiguration labelDimension](v5, "labelDimension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(v4, "labelDimension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNumericAxisConfiguration setLabelDimension:](self, "setLabelDimension:", v8);

  }
  objc_msgSend(v4, "topVerticalLabelPadding");
  v10 = v9;
  -[HKNumericAxisConfiguration topVerticalLabelPadding](v5, "topVerticalLabelPadding");
  if (v10 != v11)
  {
    objc_msgSend(v4, "topVerticalLabelPadding");
    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](self, "setTopVerticalLabelPadding:");
  }
  objc_msgSend(v4, "bottomVerticalLabelPadding");
  v13 = v12;
  -[HKNumericAxisConfiguration bottomVerticalLabelPadding](v5, "bottomVerticalLabelPadding");
  if (v13 != v14)
  {
    objc_msgSend(v4, "bottomVerticalLabelPadding");
    -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](self, "setBottomVerticalLabelPadding:");
  }
  v15.receiver = self;
  v15.super_class = (Class)HKNumericAxisConfiguration;
  -[HKAxisConfiguration applyOverridesFromAxisConfiguration:](&v15, sel_applyOverridesFromAxisConfiguration_, v4);

}

- (void)setLabelDimension:(id)a3
{
  objc_storeStrong((id *)&self->_labelDimension, a3);
}

@end
