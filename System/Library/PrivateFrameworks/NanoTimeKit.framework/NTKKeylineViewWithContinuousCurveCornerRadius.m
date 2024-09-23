@implementation NTKKeylineViewWithContinuousCurveCornerRadius

uint64_t __NTKKeylineViewWithContinuousCurveCornerRadius_block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBorderColor:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
}

@end
