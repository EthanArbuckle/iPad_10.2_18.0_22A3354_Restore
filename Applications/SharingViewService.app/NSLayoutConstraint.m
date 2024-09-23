@implementation NSLayoutConstraint

- (double)d22Constant
{
  id AssociatedObject;
  void *v3;
  float v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "d22Constant");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setD22Constant:(double)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_setAssociatedObject(self, "d22Constant", v5, (void *)1);

  if (SFDeviceModelCodeGet(v6) == 1)
    -[NSLayoutConstraint setConstant:](self, "setConstant:", a3);
}

- (double)iPhoneSEConstant
{
  id AssociatedObject;
  void *v3;
  float v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "iPhoneSEConstant");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setIPhoneSEConstant:(double)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_setAssociatedObject(self, "iPhoneSEConstant", v5, (void *)1);

  if (SFDeviceModelCodeGet(v6) == 2)
    -[NSLayoutConstraint setConstant:](self, "setConstant:", a3);
}

@end
