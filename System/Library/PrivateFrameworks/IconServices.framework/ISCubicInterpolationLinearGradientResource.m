@implementation ISCubicInterpolationLinearGradientResource

- (ISCubicInterpolationLinearGradientResource)initWithStartingColor:(id)a3 endingColor:(id)a4
{
  id v7;
  id v8;
  ISCubicInterpolationLinearGradientResource *v9;
  ISCubicInterpolationLinearGradientResource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISCubicInterpolationLinearGradientResource;
  v9 = -[ISCubicInterpolationLinearGradientResource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingColor, a3);
    objc_storeStrong((id *)&v10->_endingColor, a4);
  }

  return v10;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  const CGFloat *v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGGradientRef v27;
  CGGradient *v28;
  CGFloat v29;
  CGFloat v30;
  CGContext *v31;
  void *v32;
  _QWORD v34[2];
  CGPoint v35;
  CGPoint v36;

  height = a3.height;
  width = a3.width;
  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v9) = 1046631210;
  LODWORD(v10) = 1000812293;
  LODWORD(v11) = 1062073097;
  LODWORD(v12) = 1.0;
  v13 = (void *)objc_msgSend(v8, "initWithControlPoints::::", v9, v10, v11, v12);
  v14 = (int)(height * 5.0);
  v15 = (void *)objc_opt_new();
  MEMORY[0x1E0C80A78](v15);
  v18 = (const CGFloat *)((char *)v34 - v17);
  if ((int)v14 >= 1)
  {
    v19 = 0;
    v20 = (float)(int)v14;
    do
    {
      *(float *)&v16 = (float)(int)v19 / v20;
      objc_msgSend(v13, "_solveForInput:", v16);
      v22 = v21;
      -[ISCubicInterpolationLinearGradientResource startingColor](self, "startingColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISCubicInterpolationLinearGradientResource endingColor](self, "endingColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "blendColorWithFraction:ofColor:", v24, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 && objc_msgSend(v25, "cgColor"))
      {
        objc_msgSend(v15, "addObject:", objc_msgSend(v25, "cgColor"));
        v18[v19] = (float)((float)(int)v19 / v20);
      }

      ++v19;
    }
    while (v14 != v19);
  }
  objc_msgSend(MEMORY[0x1E0D3A7B0], "bitmapContextWithSize:scale:preset:", 0, width, height, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clear");
  v27 = CGGradientCreateWithColors((CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0D3A7A0], "deviceRGBColorSpace"), (CFArrayRef)v15, v18);
  if (v27)
  {
    v28 = v27;
    v29 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v31 = (CGContext *)objc_msgSend(v26, "cgContext");
    v36.x = 0.0;
    v35.x = v29;
    v35.y = v30;
    v36.y = height;
    CGContextDrawLinearGradient(v31, v28, v35, v36, 0);
    CGGradientRelease(v28);
  }
  objc_msgSend(v26, "image");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (IFColor)startingColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartingColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (IFColor)endingColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndingColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingColor, 0);
  objc_storeStrong((id *)&self->_startingColor, 0);
}

@end
