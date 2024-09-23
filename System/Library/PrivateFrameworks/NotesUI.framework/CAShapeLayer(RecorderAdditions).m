@implementation CAShapeLayer(RecorderAdditions)

- (uint64_t)ic_setPath:()RecorderAdditions animated:
{
  uint64_t result;

  result = CGPathEqualToPath((CGPathRef)objc_msgSend(a1, "path"), a3);
  if ((result & 1) == 0)
  {
    if (a4)
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", CFSTR("path"), a3, *MEMORY[0x1E0CD3050]);
    else
      return objc_msgSend(a1, "setPath:", a3);
  }
  return result;
}

- (uint64_t)ic_setPath:()RecorderAdditions fromPath:animated:
{
  uint64_t result;

  result = CGPathEqualToPath((CGPathRef)objc_msgSend(a1, "path"), a3);
  if ((result & 1) == 0)
  {
    if (a5)
      return objc_msgSend(a1, "ic_animateProperty:toValue:fromValue:timing:", CFSTR("path"), a3, a4, *MEMORY[0x1E0CD3050]);
    else
      return objc_msgSend(a1, "setPath:", a3);
  }
  return result;
}

- (uint64_t)ic_setFillColor:()RecorderAdditions animated:
{
  uint64_t result;

  result = CGColorEqualToColor((CGColorRef)objc_msgSend(a1, "fillColor"), a3);
  if ((result & 1) == 0)
  {
    if (a4)
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", CFSTR("fillColor"), a3, *MEMORY[0x1E0CD3058]);
    else
      return objc_msgSend(a1, "setFillColor:", a3);
  }
  return result;
}

- (uint64_t)ic_setStrokeColor:()RecorderAdditions animated:
{
  uint64_t result;

  result = CGColorEqualToColor((CGColorRef)objc_msgSend(a1, "strokeColor"), a3);
  if ((result & 1) == 0)
  {
    if (a4)
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", CFSTR("strokeColor"), a3, *MEMORY[0x1E0CD3058]);
    else
      return objc_msgSend(a1, "setStrokeColor:", a3);
  }
  return result;
}

- (void)ic_setOpacity:()RecorderAdditions animated:
{
  double v7;
  id v8;

  objc_msgSend(a1, "opacity");
  if (*(float *)&v7 != a2)
  {
    *(float *)&v7 = a2;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ic_animateProperty:toValue:timing:", CFSTR("opacity"), v8, *MEMORY[0x1E0CD3058]);

    }
    else
    {
      objc_msgSend(a1, "setOpacity:", v7);
    }
  }
}

@end
