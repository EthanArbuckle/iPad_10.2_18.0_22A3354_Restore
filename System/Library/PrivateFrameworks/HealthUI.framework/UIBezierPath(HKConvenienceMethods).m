@implementation UIBezierPath(HKConvenienceMethods)

- (void)hk_applyBlock:()HKConvenienceMethods
{
  id v4;
  id info;

  v4 = objc_retainAutorelease(a1);
  info = a3;
  CGPathApply((CGPathRef)objc_msgSend(v4, "CGPath"), info, (CGPathApplierFunction)_RunBlockForPointsInPath);

}

- (id)hk_firstPoint
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "isEmpty") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)objc_opt_new();
    CGPathApply((CGPathRef)objc_msgSend(objc_retainAutorelease(a1), "CGPath"), v3, (CGPathApplierFunction)_FindFirstPoint);
    objc_msgSend(v3, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
