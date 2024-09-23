@implementation UIColor(MKTransitExtras)

+ (id)_mapkit_colorForTransitLine:()MKTransitExtras
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  void *v18;

  v4 = a3;
  if ((objc_msgSend(v4, "hasLineColorString") & 1) != 0)
  {
    objc_msgSend(v4, "lineColorString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    VKShieldColorsFromHexString();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    VKShieldColorsFromHexString();
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  objc_msgSend(a1, "colorWithRed:green:blue:alpha:", v7, v9, v11, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
