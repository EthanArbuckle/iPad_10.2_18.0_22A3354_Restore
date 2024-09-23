@implementation AXSharedInertMetric

void __AXSharedInertMetric_block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXMetric _initWithName:session:]([AXBookendMetric alloc], "_initWithName:session:", CFSTR("Intert"), 0);
  v1 = (void *)AXSharedInertMetric__InertMetric;
  AXSharedInertMetric__InertMetric = (uint64_t)v0;

}

@end
