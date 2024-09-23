@implementation UIImage(deepColor)

- (id)jfx_renderedImageWithUpOrientation
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  if (objc_msgSend(a1, "imageOrientation"))
  {
    v2 = *MEMORY[0x24BDBF090];
    v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
    objc_msgSend(a1, "size");
    objc_msgSend(a1, "jfx_deepColorSafeImageDrawnInRect:", v2, v3, v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)jfx_deepColorSafeImageDrawnInRect:()deepColor
{
  double v10;
  float v11;

  objc_msgSend(a1, "scale");
  v11 = v10;
  return jfx_drawInRect(a1, 1, a2, a3, a4, a5, v11);
}

- (id)jfx_imageWithoutDeepColor
{
  id v2;
  CGColorSpace *ColorSpace;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  id v12;

  if (a1
    && (v2 = objc_retainAutorelease(a1),
        (ColorSpace = CGImageGetColorSpace((CGImageRef)objc_msgSend(v2, "CGImage"))) != 0)
    && CGColorSpaceIsWideGamutRGB(ColorSpace))
  {
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    objc_msgSend(v2, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v2, "scale");
    v11 = v10;
    jfx_drawInRect(v2, 0, v4, v5, v7, v9, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = a1;
  }
  return v12;
}

@end
