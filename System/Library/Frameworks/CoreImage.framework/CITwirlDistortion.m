@implementation CITwirlDistortion

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_twirl);
}

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
  v11[1] = CFSTR("5");
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
  v6[0] = &unk_1E2F1B090;
  v6[1] = &unk_1E2F1B090;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1B0A0;
  v6[3] = &unk_1E2F1B0B0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B0B0;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B0C0;
  v4[1] = &unk_1E2F1B0D0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1B0E0;
  v4[3] = &unk_1E2F1B090;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeAngle");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  CIVector *v14;
  double v15;
  float64x2_t v16;
  float64_t v17;
  double v18;
  float64x2_t v19;
  float64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double x;
  double y;
  double width;
  double height;
  id v39;
  CIImage *inputImage;
  float64_t v41;
  float64_t v42;
  int32x2_t v43;
  float32x4_t v44;
  _QWORD v45[4];
  float32x4_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _QWORD v51[2];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v51[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  if (fabsf(v3) < 0.001)
    return self->inputImage;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  if (fabsf(v4) < 0.001)
    return self->inputImage;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v7 = v6;
  -[CIVector X](self->inputCenter, "X");
  v9 = v8;
  -[CIVector Y](self->inputCenter, "Y");
  v11 = v10;
  v12 = v7;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v14 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v9, v11, 1.0 / v7, v13);
  -[CIVector X](v14, "X");
  v42 = v15;
  -[CIVector Y](v14, "Y");
  v16.f64[0] = v42;
  v16.f64[1] = v17;
  v43 = (int32x2_t)vcvt_f32_f64(v16);
  -[CIVector Z](v14, "Z");
  v41 = v18;
  -[CIVector W](v14, "W");
  v19.f64[0] = v41;
  v19.f64[1] = v20;
  v44 = vcvt_hight_f32_f64(v43, v19);
  -[CIVector X](self->inputCenter, "X");
  v22 = v21 - v7;
  -[CIVector Y](self->inputCenter, "Y");
  v24 = v23 - v12;
  v25 = v12 + v12;
  -[CIImage extent](self->inputImage, "extent");
  v54.origin.x = v26;
  v54.origin.y = v27;
  v54.size.width = v28;
  v54.size.height = v29;
  v52.origin.x = v22;
  v52.origin.y = v24;
  v52.size.width = v12 + v12;
  v52.size.height = v12 + v12;
  v30 = CGRectIntersectsRect(v52, v54);
  -[CIImage extent](self->inputImage, "extent");
  x = v31;
  y = v32;
  width = v33;
  height = v34;
  if (v30)
  {
    v55.origin.x = v22;
    v55.origin.y = v24;
    v55.size.width = v25;
    v55.size.height = v25;
    v53 = CGRectUnion(*(CGRect *)&v31, v55);
    x = v53.origin.x;
    y = v53.origin.y;
    width = v53.size.width;
    height = v53.size.height;
  }
  v39 = -[CITwirlDistortion _kernel](self, "_kernel");
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __32__CITwirlDistortion_outputImage__block_invoke;
  v45[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v46 = v44;
  v47 = v22;
  v48 = v24;
  v49 = v25;
  v50 = v25;
  inputImage = self->inputImage;
  v51[0] = v14;
  return (id)objc_msgSend(v39, "applyWithExtent:roiCallback:inputImage:arguments:", v45, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1), x, y, width, height);
}

double __32__CITwirlDistortion_outputImage__block_invoke(CGPoint *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat v11;
  CGFloat v12;
  float v13;
  float v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  float v18;
  double MinX;
  CGFloat v20;
  CGFloat v21;
  double MaxX;
  double MinY;
  double MaxY;
  double v25;
  CGFloat v27;
  CGFloat v28;
  float v29;
  CGFloat rect;
  CGPoint v31;
  CGPoint v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v8 = a2;
  v31 = a1[2];
  x = a1[3].x;
  y = a1[3].y;
  v11 = a1[4].x;
  v12 = a1[4].y;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = v11;
  v42.size.height = v12;
  v34 = CGRectIntersection(*(CGRect *)&a2, v42);
  if (!CGRectIsEmpty(v34))
  {
    v35.origin.x = v8;
    v35.origin.y = a3;
    v35.size.width = a4;
    v35.size.height = a5;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = v11;
    v43.size.height = v12;
    if (!CGRectContainsRect(v35, v43))
    {
      v13 = 1.0 / *(float *)&v31.y;
      if ((float)(1.0 / *(float *)&v31.y) >= 500.0)
      {
        v14 = *((float *)&v31.y + 1);
        v32 = (CGPoint)vcvtq_f64_f32(*(float32x2_t *)&v31.x);
        v37.origin.x = v8;
        v37.origin.y = a3;
        v29 = v13;
        v37.size.width = a4;
        v37.size.height = a5;
        v38 = CGRectIntegral(v37);
        v15 = v38.origin.x;
        rect = v38.origin.y;
        width = v38.size.width;
        v28 = v38.size.width;
        height = v38.size.height;
        v38.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        v33.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        v33.size = v38.size;
        v18 = 1.0 / v29;
        v38.size.width = width;
        MinX = CGRectGetMinX(v38);
        v39.origin.x = v15;
        v20 = v15;
        v27 = v15;
        v39.origin.y = rect;
        v39.size.width = width;
        v39.size.height = height;
        v21 = height;
        MaxX = CGRectGetMaxX(v39);
        v40.origin.x = v20;
        v40.origin.y = rect;
        v40.size.width = width;
        v40.size.height = v21;
        MinY = CGRectGetMinY(v40);
        v41.origin.x = v27;
        v41.size.width = v28;
        v41.origin.y = rect;
        v41.size.height = v21;
        MaxY = CGRectGetMaxY(v41);
        if (MinX <= MaxX)
        {
          v25 = MinX;
          do
          {
            twirlTracePoint(v25, MinY, v32, v18, v14, &v33);
            twirlTracePoint(v25, MaxY, v32, v18, v14, &v33);
            v25 = v25 + 1.0;
          }
          while (v25 <= MaxX);
        }
        for (; MinY <= MaxY; MinY = MinY + 1.0)
        {
          twirlTracePoint(MinX, MinY, v32, v18, v14, &v33);
          twirlTracePoint(MaxX, MinY, v32, v18, v14, &v33);
        }
        return v33.origin.x;
      }
      else
      {
        v36.origin.x = v8;
        v36.origin.y = a3;
        v36.size.width = a4;
        v36.size.height = a5;
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = v11;
        v44.size.height = v12;
        *(_QWORD *)&v8 = (unint64_t)CGRectUnion(v36, v44);
      }
    }
  }
  return v8;
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
