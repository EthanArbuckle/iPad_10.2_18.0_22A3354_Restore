@implementation CLCircularRegion(CLSExtensions)

- (void)setClsHorizontalAccuracy:()CLSExtensions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsHorizontalAccuracy", v2, (void *)1);

}

- (double)clsHorizontalAccuracy
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_getAssociatedObject(a1, "clsHorizontalAccuracy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

@end
