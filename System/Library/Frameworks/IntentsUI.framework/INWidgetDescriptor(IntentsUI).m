@implementation INWidgetDescriptor(IntentsUI)

- (double)preferredSize
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "preferredSizeClass");
  if (v1 > 4)
    return 360.0;
  else
    return dbl_1DC066700[v1];
}

@end
