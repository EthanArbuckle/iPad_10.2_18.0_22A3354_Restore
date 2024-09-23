@implementation HUQuickControlRingSliderMetrics

- (HUQuickControlRingSliderMetrics)initWithSizeDescriptor:(id)a3 outerRadius:(double)a4
{
  id v7;
  HUQuickControlRingSliderMetrics *v8;
  HUQuickControlRingSliderMetrics *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlRingSliderMetrics;
  v8 = -[HUQuickControlRingSliderMetrics init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sizeDescriptor, a3);
    v9->_outerRadius = a4;
  }

  return v9;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (double)outerRadius
{
  return self->_outerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeDescriptor, 0);
}

@end
