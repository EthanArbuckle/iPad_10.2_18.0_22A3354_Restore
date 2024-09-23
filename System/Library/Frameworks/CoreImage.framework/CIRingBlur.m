@implementation CIRingBlur

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryBlur");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v7[4] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v9[1] = CFSTR("11");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.13");
  v8[3] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeDistance");
  v6[1] = &unk_1E2F193D0;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F193D0;
  v6[3] = &unk_1E2F193E0;
  v5[4] = CFSTR("CIAttributeDefault");
  v6[4] = &unk_1E2F19460;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputPointCount");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeCount");
  v4[1] = &unk_1E2F19460;
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19470;
  v4[3] = &unk_1E2F19480;
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputImage
{
  float v4;
  float v5;
  double v6;
  float v7;
  unsigned int v8;
  CIImage *inputImage;
  float v10;
  float v11;
  CIKernel *v12;
  double x;
  double y;
  double width;
  double height;
  uint64_t v17;
  _QWORD *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  _QWORD v46[4];
  float v47;
  _QWORD v48[4];
  float v49;
  _QWORD v50[4];
  float v51;
  _QWORD v52[4];
  float v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[2];
  _QWORD v57[3];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v57[2] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v58))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v5 = v4;
  if (v4 <= 0.5)
    return self->inputImage;
  v6 = v4;
  -[NSNumber floatValue](self->inputPointCount, "floatValue");
  v8 = (int)v7;
  inputImage = self->inputImage;
  if ((int)v7 > 8)
  {
    if (v8 > 0x10)
    {
      if (v8 > 0x18)
      {
        v29 = v6 * 0.995184727;
        v45 = v29;
        v30 = v6 * 0.0980171403;
        v40 = v30;
        v31 = v6 * 0.956940336;
        v37 = v31;
        v32 = v6 * 0.290284677;
        v33 = v6 * 0.881921264;
        v42 = v33;
        v34 = v6 * 0.471396737;
        v38 = v34;
        v35 = v6 * 0.773010453;
        v36 = v6 * 0.634393284;
        v12 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ringAvg32);
        -[CIImage extent](inputImage, "extent");
        v66 = CGRectInset(v65, (float)-v5, (float)-v5);
        x = v66.origin.x;
        y = v66.origin.y;
        width = v66.size.width;
        height = v66.size.height;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __25__CIRingBlur_outputImage__block_invoke_4;
        v46[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v47 = v5;
        v54[0] = inputImage;
        v54[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v45, v40, v37, v32);
        v54[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v42, v38, v35, v36);
        v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
        v18 = v46;
      }
      else
      {
        v23 = v6 * 0.991444861;
        v44 = v23;
        v24 = v6 * 0.130526192;
        v39 = v24;
        v25 = v6 * 0.923879533;
        v26 = v6 * 0.382683432;
        v27 = v6 * 0.79335334;
        v41 = v27;
        v28 = v6 * 0.608761429;
        v12 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ringAvg24);
        -[CIImage extent](inputImage, "extent");
        v64 = CGRectInset(v63, (float)-v5, (float)-v5);
        x = v64.origin.x;
        y = v64.origin.y;
        width = v64.size.width;
        height = v64.size.height;
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __25__CIRingBlur_outputImage__block_invoke_3;
        v48[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v49 = v5;
        v55[0] = inputImage;
        v55[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v44, v39, v25, v26);
        v55[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v41, v28);
        v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
        v18 = v48;
      }
    }
    else
    {
      v19 = v6 * 0.98078528;
      v43 = v19;
      v20 = v6 * 0.195090322;
      v21 = v6 * 0.831469612;
      v22 = v6 * 0.555570233;
      v12 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ringAvg16);
      -[CIImage extent](inputImage, "extent");
      v62 = CGRectInset(v61, (float)-v5, (float)-v5);
      x = v62.origin.x;
      y = v62.origin.y;
      width = v62.size.width;
      height = v62.size.height;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __25__CIRingBlur_outputImage__block_invoke_2;
      v50[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v51 = v5;
      v56[0] = inputImage;
      v56[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43, v20, v21, v22);
      v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
      v18 = v50;
    }
  }
  else
  {
    v10 = v6 * 0.923879533;
    v11 = v6 * 0.382683432;
    v12 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ringAvg8);
    -[CIImage extent](inputImage, "extent");
    v60 = CGRectInset(v59, (float)-v5, (float)-v5);
    x = v60.origin.x;
    y = v60.origin.y;
    width = v60.size.width;
    height = v60.size.height;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __25__CIRingBlur_outputImage__block_invoke;
    v52[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v53 = v5;
    v57[0] = inputImage;
    v57[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v10, v11);
    v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v18 = v52;
  }
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v12, "applyWithExtent:roiCallback:arguments:", v18, v17, x, y, width, height);
}

double __25__CIRingBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputPointCount
{
  return self->inputPointCount;
}

- (void)setInputPointCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
