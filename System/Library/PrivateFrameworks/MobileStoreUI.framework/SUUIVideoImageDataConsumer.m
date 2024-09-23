@implementation SUUIVideoImageDataConsumer

- (id)imageForColor:(id)a3 orientation:(unint64_t)a4
{
  id v6;
  SUUIColorScheme *colorScheme;
  double v8;
  double v9;
  int *v10;
  double *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  CGSize v23;
  CGRect v24;

  v6 = a3;
  if (!v6)
  {
    colorScheme = self->_colorScheme;
    v22 = 0;
    SUUIIconColorsForColorScheme(colorScheme, &v22, 0, 0);
    v6 = v22;
  }
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = &OBJC_IVAR___SUUIVideoImageDataConsumer__portraitSize;
  if (a4 == 2)
    v10 = &OBJC_IVAR___SUUIVideoImageDataConsumer__landscapeSize;
  v11 = (double *)((char *)self + *v10);
  v13 = *v11;
  v12 = v11[1];
  v14 = self->_backgroundColor != 0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;
  v23.width = v13;
  v23.height = v12;
  UIGraphicsBeginImageContextWithOptions(v23, v14, v17);

  objc_msgSend(v6, "set");
  v24.origin.x = v8;
  v24.origin.y = v9;
  v24.size.width = v13;
  v24.size.height = v12;
  UIRectFill(v24);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", v8, v9, v13, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  int *v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  BOOL v18;
  double v19;
  CGFloat v20;
  UIColor *backgroundColor;
  void *v22;
  void *v23;
  void *v24;
  CGSize v26;
  CGRect v27;

  v4 = a3;
  objc_msgSend(v4, "size");
  v7 = v5 > v6;
  v8 = 2;
  if (v5 <= v6)
    v8 = 1;
  if ((v8 & self->_allowedOrientations) == 0)
  {
    v9 = objc_alloc(MEMORY[0x24BEBD640]);
    v10 = objc_retainAutorelease(v4);
    v11 = objc_msgSend(v10, "CGImage");
    objc_msgSend(v10, "scale");
    v4 = (id)objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 2);

    objc_msgSend(v4, "size");
    v7 = self->_allowedOrientations == 2;
  }
  if (v7)
    v12 = &OBJC_IVAR___SUUIVideoImageDataConsumer__landscapeSize;
  else
    v12 = &OBJC_IVAR___SUUIVideoImageDataConsumer__portraitSize;
  v13 = *(double *)((char *)&self->super.super.super.isa + *v12);
  v15 = *MEMORY[0x24BDBF090];
  v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v16 = v6 * (v13 / v5);
  v17 = ceilf(v16);
  v18 = self->_backgroundColor != 0;
  objc_msgSend(v4, "scale");
  v20 = v19;
  v26.width = v13;
  v26.height = v17;
  UIGraphicsBeginImageContextWithOptions(v26, v18, v20);
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[UIColor set](backgroundColor, "set");
    v27.origin.x = v15;
    v27.origin.y = v14;
    v27.size.width = v13;
    v27.size.height = v17;
    UIRectFill(v27);
  }
  objc_msgSend(v4, "drawInRect:", v15, v14, v13, v17);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "set");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", v15, v14, v13, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v24;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setAllowedOrientations:(unint64_t)a3
{
  self->_allowedOrientations = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (CGSize)landscapeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_landscapeSize.width;
  height = self->_landscapeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLandscapeSize:(CGSize)a3
{
  self->_landscapeSize = a3;
}

- (CGSize)portraitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitSize.width;
  height = self->_portraitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitSize:(CGSize)a3
{
  self->_portraitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
