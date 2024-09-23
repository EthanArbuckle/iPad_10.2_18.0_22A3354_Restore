@implementation AMSUIDDynamicImpressionItem

- (AMSUIDDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4
{
  return (AMSUIDDynamicImpressionItem *)DynamicImpressionItem.init(frame:impressionMetrics:)((uint64_t)a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = DynamicImpressionItem.frame.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  DynamicImpressionItem.frame.setter();
}

- (AMSUIDDynamicImpressionMetrics)impressionMetrics
{
  return (AMSUIDDynamicImpressionMetrics *)DynamicImpressionItem.impressionMetrics.getter();
}

- (void)setImpressionMetrics:(id)a3
{
  id v4;
  AMSUIDDynamicImpressionItem *v5;

  v4 = a3;
  v5 = self;
  DynamicImpressionItem.impressionMetrics.setter(v4);

}

- (AMSUIDDynamicImpressionItem)init
{
  DynamicImpressionItem.init()();
}

- (void).cxx_destruct
{

}

@end
