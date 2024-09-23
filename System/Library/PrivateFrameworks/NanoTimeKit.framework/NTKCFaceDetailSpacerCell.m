@implementation NTKCFaceDetailSpacerCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)rowHeight
{
  return 35.0;
}

- (double)rowHeight
{
  return 35.0;
}

+ (double)actionExtraRowHeight
{
  return 13.0;
}

@end
