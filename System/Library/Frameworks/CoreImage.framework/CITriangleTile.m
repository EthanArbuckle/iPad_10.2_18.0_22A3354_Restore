@implementation CITriangleTile

- (id)_CITriangleTile
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_triangleTile);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  __double2 v8;
  float v9;
  float v10;
  float v11;
  __float2 v12;
  double v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  BOOL v24;
  BOOL v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  __double2 v35;
  float v36;
  float v37;
  float v38;
  float v39;
  CIVector *v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CIImage *inputImage;
  CIVector *inputCenter;
  float v49;
  float v50;
  float v51;
  double v52;
  float v53;
  float v54;
  _QWORD v55[5];
  _QWORD v56[5];

  v56[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v6 = v5;
  v7 = v4;
  v52 = v5;
  v8 = __sincos_stret(v5 + 0.523598776);
  v9 = v8.__cosval * v4;
  v10 = v8.__sinval * v4;
  v11 = v4 / 1.73205081;
  v12 = __sincosf_stret(v6);
  -[CIVector X](self->inputCenter, "X");
  v14 = v13;
  -[CIVector Y](self->inputCenter, "Y");
  v16 = v15;
  v17 = v14 + (float)(v12.__cosval * v11);
  v18 = v16 + (float)(v12.__sinval * v11);
  v19 = v18;
  v20 = (float)(v12.__cosval * v11) + v17;
  v21 = (float)(v12.__sinval * v11) + v18;
  v22 = v14 + v9;
  v54 = v10;
  v23 = v10 + v16;
  v24 = v20 < v17;
  v25 = v20 <= v17;
  v26 = v20;
  if (v25)
    v27 = v14 + (float)(v12.__cosval * v11);
  else
    v27 = v26;
  if (v24)
    v27 = v14 + (float)(v12.__cosval * v11);
  if (v24)
    v17 = v26;
  if (v21 >= v19)
  {
    if (v21 <= v19)
      v28 = v18;
    else
      v28 = v21;
  }
  else
  {
    v28 = v18;
    v18 = v21;
  }
  if (v22 > v27)
    v29 = v14 + v9;
  else
    v29 = v27;
  if (v22 >= v17)
    v30 = v29;
  else
    v30 = v27;
  if (v22 >= v17)
    v31 = v17;
  else
    v31 = v14 + v9;
  if (v23 > v28)
    v32 = v23;
  else
    v32 = v28;
  if (v23 >= v18)
    v33 = v32;
  else
    v33 = v28;
  if (v23 >= v18)
    v34 = v18;
  else
    v34 = v23;
  v35 = __sincos_stret(v52 + -0.523598776);
  v36 = v35.__cosval * v7;
  v37 = v35.__sinval * v7;
  v38 = 1.0 / (float)((float)(v36 * v54) - (float)(v37 * v9));
  v50 = -(float)(v9 * v38);
  v51 = v38 * v36;
  v53 = v9;
  v49 = -(float)(v37 * v38);
  v39 = v38 * v54;
  v40 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v31, v34, (float)(v30 - v31), (float)(v33 - v34));
  v41 = -[CITriangleTile _CITriangleTile](self, "_CITriangleTile");
  v42 = *MEMORY[0x1E0C9D5E0];
  v43 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v45 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v44 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __29__CITriangleTile_outputImage__block_invoke;
  v55[3] = &unk_1E2EC3588;
  inputImage = self->inputImage;
  inputCenter = self->inputCenter;
  v55[4] = v40;
  v56[0] = inputImage;
  v56[1] = inputCenter;
  v56[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v39, v50, v49, v51);
  v56[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v36, v53, v37, v54);
  return (id)objc_msgSend(v41, "applyWithExtent:roiCallback:arguments:", v55, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4), v42, v43, v45, v44);
}

double __29__CITriangleTile_outputImage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "X");
  v3 = v2 + -1.0;
  objc_msgSend(v1, "Y");
  objc_msgSend(v1, "Z");
  objc_msgSend(v1, "W");
  return v3;
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
  v6[3] = CFSTR("inputWidth");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1B050;
  v4[1] = &unk_1E2F1B060;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1B070;
  v4[3] = &unk_1E2F1B080;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
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

@end
