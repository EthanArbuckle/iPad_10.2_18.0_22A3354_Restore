@implementation AXMVisionFeature_AXRuntime

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AXMVisionFeature");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setActivationPoint:(CGPoint)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", a3.x, a3.y);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &ActivationPointKey, v4, (void *)1);

}

- (CGPoint)activationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  objc_getAssociatedObject(self, &ActivationPointKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointValue");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
