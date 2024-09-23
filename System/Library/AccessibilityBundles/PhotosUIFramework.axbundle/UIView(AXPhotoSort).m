@implementation UIView(AXPhotoSort)

- (uint64_t)_accessibilitySimpleSort:()AXPhotoSort
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "frame");
  v5 = v4;
  objc_msgSend(a1, "frame");
  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

@end
