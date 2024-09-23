@implementation CALayer(NTKDialMarkerView)

- (void)addToParentView:()NTKDialMarkerView
{
  id v4;

  objc_msgSend(a3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", a1);

}

- (uint64_t)setAlpha:()NTKDialMarkerView
{
  *(float *)&a3 = a3;
  return objc_msgSend(a1, "setOpacity:", a3);
}

- (double)alpha
{
  float v1;

  objc_msgSend(a1, "opacity");
  return v1;
}

- (uint64_t)_setAffineTransform:()NTKDialMarkerView
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "setAffineTransform:", v5);
}

@end
