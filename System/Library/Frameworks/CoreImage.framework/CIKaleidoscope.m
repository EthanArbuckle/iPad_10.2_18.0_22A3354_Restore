@implementation CIKaleidoscope

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_kaleida);
}

- (CGRect)_outputExtent
{
  float v3;
  float v4;
  float v5;
  int v6;
  float v7;
  float v8;
  float v9;
  double x;
  double y;
  double width;
  double height;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  double v31;
  float v32;
  float v33;
  float v34;
  float v35;
  _BOOL4 v36;
  float v37;
  float v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  double v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  CGRect v56;
  CGRect result;

  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  v5 = cosf(v3);
  v6 = 2 * -[NSNumber intValue](self->inputCount, "intValue");
  if (v6 <= 2)
    v6 = 2;
  v7 = 6.28318531 / (float)v6;
  v8 = v4 + v7;
  v9 = sinf(v4 + v7);
  -[CIImage extent](self->inputImage, "extent");
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  v14 = (double *)MEMORY[0x1E0C9D5E0];
  if (CGRectEqualToRect(v56, *MEMORY[0x1E0C9D5E0]))
  {
    v15 = *v14;
    v16 = v14[1];
    v17 = v14[2];
    v18 = v14[3];
  }
  else
  {
    v50 = v9;
    v19 = cosf(v8);
    v20 = sinf(v4);
    v21 = v5;
    v22 = v20;
    -[CIVector X](self->inputCenter, "X");
    v24 = v23;
    -[CIVector Y](self->inputCenter, "Y");
    v26 = v25;
    v27 = -v19;
    v48 = y;
    v28 = y + height;
    v29 = v24;
    v30 = v26;
    v31 = x + width;
    v32 = x;
    v33 = v28;
    v54 = v33;
    v55 = v32;
    v34 = v31;
    v52 = v33;
    v53 = v34;
    v35 = -v22;
    v51 = v21;
    v49 = v27;
    if (ClipSegmentToHalfplane(v32, v33, v34, v33, v29, v30, v35, v21, &v55, &v54, &v53, &v52))
    {
      v36 = ClipSegmentToHalfplane(v55, v54, v53, v52, v29, v30, v50, v27, &v55, &v54, &v53, &v52);
      v37 = 0.0;
      v38 = v29;
      v39 = v48;
      if (v36)
      {
        v37 = fmaxf(sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v29) * (float)(v55 - v29))), 0.0);
        v40 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v29) * (float)(v53 - v29)));
        if (v40 > v37)
          v37 = v40;
      }
    }
    else
    {
      v37 = 0.0;
      v38 = v29;
      v39 = v48;
    }
    v54 = v33;
    v55 = v34;
    v41 = v39;
    v52 = v41;
    v53 = v34;
    if (ClipSegmentToHalfplane(v34, v33, v34, v41, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      v42 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v42 > v37)
        v37 = v42;
      v43 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v43 > v37)
        v37 = v43;
    }
    v54 = v41;
    v55 = v34;
    v52 = v41;
    v53 = v32;
    if (ClipSegmentToHalfplane(v34, v41, v32, v41, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      v44 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v44 > v37)
        v37 = v44;
      v45 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v45 > v37)
        v37 = v45;
    }
    v54 = v41;
    v55 = v32;
    v52 = v33;
    v53 = v32;
    if (ClipSegmentToHalfplane(v32, v41, v32, v33, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      v46 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v46 > v37)
        v37 = v46;
      v47 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v47 > v37)
        v37 = v47;
    }
    v15 = (float)(v38 - v37);
    v16 = (float)(v30 - v37);
    v17 = v37 + v37;
    v18 = v17;
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)outputImage
{
  double v3;
  float v4;
  double v5;
  float v6;
  float v7;
  float v8;
  __float2 v9;
  double cosval;
  double v11;
  CIVector *v12;
  CIVector *v13;
  float v14;
  float v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CIVector *v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  CIImage *inputImage;
  _QWORD v35[6];
  _QWORD v36[4];
  CGRect v37;

  v36[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[CIVector X](self->inputCenter, "X");
  v4 = v3;
  -[CIVector Y](self->inputCenter, "Y");
  v6 = v5;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v8 = v7;
  v9 = __sincosf_stret(v7);
  -[CIImage extent](self->inputImage, "extent");
  if (!CGRectIsInfinite(v37))
  {
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
    -[CIImage extent](self->inputImage, "extent");
  }
  cosval = v9.__cosval;
  v11 = (float)-v9.__sinval;
  v12 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", cosval, v9.__sinval, v11, cosval);
  v13 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", cosval, v11, v9.__sinval, cosval);
  -[NSNumber floatValue](self->inputCount, "floatValue");
  v15 = fmax(floorf(v14), 1.0);
  v16 = v15;
  *(float *)&cosval = 6.28318531 / v16;
  v17 = v16 / 6.28318531;
  -[CIVector X](self->inputCenter, "X");
  v19 = v18;
  -[CIVector Y](self->inputCenter, "Y");
  v21 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v19, v20, *(float *)&cosval, v17);
  v22 = 2 * -[NSNumber intValue](self->inputCount, "intValue");
  if (v22 <= 2)
    v23 = 2;
  else
    v23 = v22;
  -[CIKaleidoscope _outputExtent](self, "_outputExtent");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = -[CIKaleidoscope _kernel](self, "_kernel");
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __29__CIKaleidoscope_outputImage__block_invoke;
  v35[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v35[4] = __PAIR64__(LODWORD(v4), v23);
  v35[5] = __PAIR64__(LODWORD(v8), LODWORD(v6));
  inputImage = self->inputImage;
  v36[0] = v21;
  v36[1] = v12;
  v36[2] = v13;
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v35, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3, MEMORY[0x1E0C809B0], 3221225472, __29__CIKaleidoscope_outputImage__block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(LODWORD(v4), v23), __PAIR64__(LODWORD(v8), LODWORD(v6))), v25, v27, v29, v31);
}

double __29__CIKaleidoscope_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v10;
  float v11;
  float v12;
  float cosval;
  float v14;
  float v15;
  __float2 v16;
  float v17;
  float v18;
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
  signed int v30;
  float v32;

  v11 = *(float *)(a1 + 36);
  v10 = *(float *)(a1 + 40);
  v12 = *(float *)(a1 + 44);
  cosval = __sincosf_stret(v12).__cosval;
  v14 = 6.28318531 / (float)*(int *)(a1 + 32);
  v32 = v12;
  v15 = v12 + v14;
  v16 = __sincosf_stret(v15);
  v17 = a2 - v11;
  v18 = a3 + a5 - v10;
  v19 = v18 * v18;
  v20 = sqrtf(v19 + (float)(v17 * v17));
  v21 = a2 + a4 - v11;
  v22 = sqrtf(v19 + (float)(v21 * v21));
  if (v22 <= v20)
    v22 = v20;
  v23 = a3 - v10;
  v24 = v23 * v23;
  v25 = sqrtf(v24 + (float)(v17 * v17));
  if (v25 > v22)
    v22 = v25;
  v26 = sqrtf(v24 + (float)(v21 * v21));
  if (v26 <= v22)
    v27 = v22;
  else
    v27 = v26;
  v28 = v11 + (float)(cosval * v27);
  if (v28 >= v11)
  {
    v29 = v11;
    if (v28 > v11)
      v29 = v11;
  }
  else
  {
    v29 = v11 + (float)(cosval * v27);
  }
  if ((float)(v11 + (float)(v16.__cosval * v27)) < v29)
    v29 = v11 + (float)(v16.__cosval * v27);
  v30 = vcvtmd_s64_f64(v32 / 1.57079633);
  if (v30 < (int)vcvtmd_s64_f64(v15 / 1.57079633))
    __asm { BR              X12 }
  return v29 + -1.0;
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryTileEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputCount");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19F50;
  v4[1] = &unk_1E2F19F50;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19F60;
  v4[3] = &unk_1E2F19F70;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
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
