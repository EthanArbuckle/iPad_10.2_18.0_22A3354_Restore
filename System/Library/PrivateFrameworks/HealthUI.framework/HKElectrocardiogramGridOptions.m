@implementation HKElectrocardiogramGridOptions

- (HKElectrocardiogramGridOptions)initWithUnitMultiple:(int64_t)a3 axis:(unint64_t)a4 lineColor:(id)a5 lineWidth:(double)a6
{
  id v11;
  HKElectrocardiogramGridOptions *v12;
  HKElectrocardiogramGridOptions *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramGridOptions;
  v12 = -[HKElectrocardiogramGridOptions init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_unitMultiple = a3;
    v12->_axis = a4;
    objc_storeStrong((id *)&v12->_lineColor, a5);
    v13->_lineWidth = a6;
  }

  return v13;
}

- (CGAffineTransform)scale
{
  return CGAffineTransformMakeScale(retstr, (double)-[HKElectrocardiogramGridOptions unitMultiple](self, "unitMultiple"), (double)-[HKElectrocardiogramGridOptions unitMultiple](self, "unitMultiple"));
}

- (unint64_t)unitMultiple
{
  return self->_unitMultiple;
}

- (void)setUnitMultiple:(unint64_t)a3
{
  self->_unitMultiple = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
