@implementation CIStraightenFilter

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryGeometryAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("5");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.7");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  double v3;
  double v4;
  __double2 v5;
  double v6;
  CIImage *inputImage;
  CGFloat x;
  double width;
  CGFloat height;
  double v12;
  double v13;
  double MidY;
  CIImage *v15;
  double v16;
  double v17;
  double v18;
  CIImage *v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double y;
  double MidX;
  double v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  v4 = v3;
  v5 = __sincos_stret(v3);
  v6 = fabs(v5.__sinval);
  inputImage = self->inputImage;
  if (v6 < 0.001 && v5.__cosval > 0.0)
    return inputImage;
  -[CIImage extent](inputImage, "extent");
  v33 = CGRectStandardize(v32);
  x = v33.origin.x;
  width = v33.size.width;
  height = v33.size.height;
  y = v33.origin.y;
  MidX = CGRectGetMidX(v33);
  v26 = x;
  v34.origin.x = x;
  v12 = height;
  v13 = width;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = v12;
  MidY = CGRectGetMidY(v34);
  if (v6 >= 0.001 || v5.__cosval >= 0.0)
  {
    v16 = fmax(width, v12);
    v17 = fmin(width, v12);
    if (fabs(v5.__cosval) >= 0.001)
    {
      v25 = hypot(v16, v17);
      v21 = atan2(v16, v17);
      v22 = -v4;
      v23 = fabs(cos(v21 - v4));
      v24 = v25 * fmax(v23, fabs(cos(v22 - v21))) / v17;
      v19 = self->inputImage;
      v29[0] = v5.__cosval * v24;
      v29[1] = v5.__sinval * v24;
      v29[2] = -(v5.__sinval * v24);
      v29[3] = v5.__cosval * v24;
      v29[4] = MidX - v5.__cosval * v24 * MidX + v5.__sinval * v24 * MidY;
      v29[5] = MidY - v5.__sinval * v24 * MidX - v5.__cosval * v24 * MidY;
      v20 = v29;
    }
    else
    {
      v18 = -v16;
      if (v5.__sinval > 0.0)
        v18 = v16;
      v19 = self->inputImage;
      v30[0] = 0;
      *(double *)&v30[1] = v18 / v17;
      *(double *)&v30[2] = -(v18 / v17);
      v30[3] = 0;
      *(double *)&v30[4] = MidX + v18 / v17 * MidY;
      *(double *)&v30[5] = MidY - v18 / v17 * MidX;
      v20 = (double *)v30;
    }
    return -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](v19, "imageByApplyingTransform:", v20), "imageByCroppingToRect:", v26, y, v13, v12);
  }
  else
  {
    v15 = self->inputImage;
    v31[0] = 0xBFF0000000000000;
    v31[1] = 0;
    v31[2] = 0;
    v31[3] = 0xBFF0000000000000;
    *(double *)&v31[4] = MidX + MidX;
    *(double *)&v31[5] = MidY + MidY;
    return -[CIImage imageByApplyingTransform:](v15, "imageByApplyingTransform:", v31);
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
