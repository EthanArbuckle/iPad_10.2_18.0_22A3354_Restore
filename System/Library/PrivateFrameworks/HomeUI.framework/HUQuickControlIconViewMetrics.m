@implementation HUQuickControlIconViewMetrics

- (HUQuickControlIconViewMetrics)initWithSizeDescriptor:(id)a3
{
  id v5;
  HUQuickControlIconViewMetrics *v6;
  HUQuickControlIconViewMetrics *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlIconViewMetrics;
  v6 = -[HUQuickControlIconViewMetrics init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sizeDescriptor, a3);

  return v7;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeDescriptor, 0);
}

@end
