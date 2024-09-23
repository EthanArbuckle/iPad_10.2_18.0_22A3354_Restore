@implementation NSLayoutDimension(NSLayoutDimension_AVKitAdditions)

- (id)avkit_constraintEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintEqualToConstant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (id)avkit_constraintGreaterThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (id)avkit_constraintLessThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

@end
