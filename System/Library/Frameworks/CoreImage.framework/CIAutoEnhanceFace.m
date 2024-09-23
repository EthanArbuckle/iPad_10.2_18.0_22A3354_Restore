@implementation CIAutoEnhanceFace

- (CIAutoEnhanceFace)initWithBounds:(CGRect)a3 andImage:(id)a4 usingContext:(id)a5
{
  double x;
  double y;
  double width;
  double height;
  CIAutoEnhanceFace *v12;
  CIAutoEnhanceFace *v13;
  double v14;
  void *v15;
  uint64_t v16;
  CGColorSpace *DeviceRGB;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  long double v24;
  long double v25;
  double v26;
  double v27;
  long double v28;
  CGAffineTransform v30;
  CGAffineTransform v31;
  objc_super v32;
  _BYTE v33[1024];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  v35.origin.x = a3.origin.x + a3.size.width * 0.339999974 * 0.5;
  v35.origin.y = a3.origin.y + a3.size.height * 0.339999974 * 0.5;
  v35.size.width = a3.size.width * 0.660000026;
  v35.size.height = a3.size.height * 0.660000026;
  v36 = CGRectIntegral(v35);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v32.receiver = self;
  v32.super_class = (Class)CIAutoEnhanceFace;
  v12 = -[CIAutoEnhanceFace init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    if (width >= height)
      v14 = height;
    else
      v14 = width;
    v12->size = (int)v14;
    v12->centerX = (int)(x + width * 0.5);
    v12->centerY = (int)(y + height * 0.5);
    CGAffineTransformMakeTranslation(&v31, -x, -y);
    v15 = (void *)objc_msgSend(a4, "imageByApplyingTransform:", &v31);
    CGAffineTransformMakeScale(&v30, 16.0 / width, 16.0 / height);
    v16 = objc_msgSend(v15, "imageByApplyingTransform:", &v30);
    bzero(v33, 0x400uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v18 = 0.0;
    objc_msgSend(a5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v16, v33, 64, 264, DeviceRGB, 0.0, 0.0, 16.0, 16.0);
    CGColorSpaceRelease(DeviceRGB);
    v20 = 0;
    v21 = 0.212;
    v22 = 0.0;
    do
    {
      LOBYTE(v21) = v33[v20];
      LOBYTE(v19) = v33[v20 + 1];
      *(double *)&v23 = (double)*(unint64_t *)&v19;
      v24 = *(double *)&v23 / 255.0;
      LOBYTE(v23) = v33[v20 + 2];
      v25 = (double)v23 / 255.0;
      v26 = pow((double)*(unint64_t *)&v21 / 255.0, 0.55);
      v27 = pow(v24, 0.55);
      v28 = pow(v25, 0.55);
      v22 = v22 + v27 * -0.2755 + v26 * 0.596 + v28 * -0.321;
      v19 = v27 * -0.523 + v26 * 0.212;
      v21 = v19 + v28 * 0.311;
      v18 = v18 + v21;
      v20 += 4;
    }
    while ((_DWORD)v20 != 1024);
    v13->I = v22 * 0.00390625;
    v13->Q = v18 * 0.00390625;
  }
  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("size = %d, center = %d, %d, I = %g, Q = %g"), self->size, self->centerX, self->centerY, *(_QWORD *)&self->I, *(_QWORD *)&self->Q);
}

- (CGRect)faceRect
{
  int size;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  size = self->size;
  v3 = (double)(self->centerX - size);
  v4 = (double)(self->centerY - size);
  v5 = (double)(2 * size);
  v6 = v5;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int)size
{
  return self->size;
}

- (int)centerX
{
  return self->centerX;
}

- (int)centerY
{
  return self->centerY;
}

- (double)I
{
  return self->I;
}

- (double)Q
{
  return self->Q;
}

@end
