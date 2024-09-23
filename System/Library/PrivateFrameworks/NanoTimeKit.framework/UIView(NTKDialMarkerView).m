@implementation UIView(NTKDialMarkerView)

- (uint64_t)addToParentView:()NTKDialMarkerView
{
  return objc_msgSend(a3, "addSubview:", a1);
}

- (uint64_t)_setAffineTransform:()NTKDialMarkerView
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "setTransform:", v5);
}

@end
