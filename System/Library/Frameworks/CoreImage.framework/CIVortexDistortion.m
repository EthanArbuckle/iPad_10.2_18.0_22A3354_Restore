@implementation CIVortexDistortion

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("6");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputCenter");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B1F0;
  v6[1] = &unk_1E2F1B1F0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1B200;
  v6[3] = &unk_1E2F1B210;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B1F0;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B220;
  v4[1] = &unk_1E2F1B230;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1B240;
  v4[3] = &unk_1E2F1B1F0;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeAngle");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (BOOL)_isIdentity
{
  double v3;
  double v5;

  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  *(float *)&v3 = v3;
  if (fabsf(*(float *)&v3) < 0.001)
    return 1;
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  *(float *)&v5 = v5;
  return fabsf(*(float *)&v5) < 0.001;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_vortexDistortion);
}

- (id)outputImage
{
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double x;
  double y;
  double width;
  double height;
  CIVector *v23;
  double v24;
  double v25;
  id v26;
  CIImage *inputImage;
  unint64_t v28;
  float v29;
  float v30;
  _QWORD v31[5];
  float v32;
  float v33;
  _QWORD v34[3];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputCenter)
    return 0;
  if (-[CIVortexDistortion _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v5 = v4;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v7 = v6;
  -[CIImage extent](self->inputImage, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CIVector X](self->inputCenter, "X");
  v17 = v16 - v5;
  -[CIVector Y](self->inputCenter, "Y");
  v37.origin.y = v18 - v5;
  v37.size.width = v5 + v5;
  v35.origin.x = v9;
  v35.origin.y = v11;
  v35.size.width = v13;
  v35.size.height = v15;
  v37.origin.x = v17;
  v37.size.height = v37.size.width;
  v36 = CGRectUnion(v35, v37);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v23 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v5, v7);
  -[CIVector X](self->inputCenter, "X");
  *(float *)&v24 = v24;
  v30 = *(float *)&v24;
  -[CIVector Y](self->inputCenter, "Y");
  *(float *)&v25 = v25;
  v28 = __PAIR64__(LODWORD(v25), LODWORD(v30));
  v29 = *(float *)&v25;
  v26 = -[CIVortexDistortion _kernel](self, "_kernel");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __33__CIVortexDistortion_outputImage__block_invoke;
  v31[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v31[4] = v28;
  v32 = v5;
  v33 = v7;
  inputImage = self->inputImage;
  v34[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v30, v29);
  v34[1] = v23;
  return (id)objc_msgSend(v26, "applyWithExtent:roiCallback:inputImage:arguments:", v31, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2), x, y, width, height);
}

double __33__CIVortexDistortion_outputImage__block_invoke(float32x2_t *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v6;
  float v7;
  float v8;
  double v9;
  double v10;
  CGFloat v12;
  double v14;
  BOOL v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v25;
  double MaxX;
  double MinY;
  double MaxY;
  float v29;
  float v30;
  double v31;
  double v32;
  float v33;
  float v34;
  unsigned int v35;
  double MinX;
  float v38;
  float v39;
  float r2;
  float r2a;
  unsigned int r2_16a;
  unsigned int r2_16b;
  float32x2_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = a1[4];
  v8 = a1[5].f32[0];
  v7 = a1[5].f32[1];
  v9 = (float)(v6.f32[0] - v8);
  v45 = v6;
  v10 = (float)(v6.f32[1] - v8);
  v12 = a4;
  v53.origin.x = v9;
  v53.origin.y = v10;
  v53.size.width = (float)(v8 + v8);
  v53.size.height = v53.size.width;
  v47 = CGRectIntersection(*(CGRect *)&a2, v53);
  if (CGRectIsEmpty(v47))
    return a2;
  v48.origin.x = a2;
  v48.origin.y = a3;
  v48.size.width = a4;
  v48.size.height = a5;
  v54.origin.x = v9;
  v54.origin.y = v10;
  v54.size.width = (float)(v8 + v8);
  v54.size.height = v54.size.width;
  v15 = CGRectContainsRect(v48, v54);
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v14 = a2;
  if (!v15)
  {
    if (v8 >= 300.0)
    {
      v20 = a2;
      v49 = CGRectIntegral(*(CGRect *)(&v18 - 1));
      x = v49.origin.x;
      y = v49.origin.y;
      width = v49.size.width;
      height = v49.size.height;
      *(_OWORD *)&v49.origin.y = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v46.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v46.size = *(CGSize *)&v49.origin.y;
      v25 = 1.0 / v8;
      v49.origin.y = y;
      MinX = CGRectGetMinX(v49);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      MaxX = CGRectGetMaxX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      MinY = CGRectGetMinY(v51);
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      MaxY = CGRectGetMaxY(v52);
      if (MinX <= MaxX)
      {
        v29 = MinY;
        r2 = v29;
        v30 = MaxY;
        v38 = v30;
        v31 = MinX;
        do
        {
          *(float *)&v32 = v31;
          r2_16a = LODWORD(v32);
          *((float *)&v32 + 1) = r2;
          vortexTracePoint(&v46, v32, v45, v25, v7);
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(LODWORD(v38), r2_16a)), v45, v25, v7);
          v31 = v31 + 1.0;
        }
        while (v31 <= MaxX);
      }
      if (MinY <= MaxY)
      {
        v33 = MinX;
        r2a = v33;
        v34 = MaxX;
        v39 = v34;
        do
        {
          *(float *)&v35 = MinY;
          r2_16b = v35;
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(v35, LODWORD(r2a))), v45, v25, v7);
          vortexTracePoint(&v46, COERCE_DOUBLE(__PAIR64__(r2_16b, LODWORD(v39))), v45, v25, v7);
          MinY = MinY + 1.0;
        }
        while (MinY <= MaxY);
      }
      return v46.origin.x;
    }
    else
    {
      v19 = a2;
      v55.origin.x = v9;
      v55.origin.y = v10;
      v55.size.width = (float)(v8 + v8);
      v55.size.height = v55.size.width;
      *(_QWORD *)&v14 = (unint64_t)CGRectUnion(*(CGRect *)(&v18 - 1), v55);
    }
  }
  return v14;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
