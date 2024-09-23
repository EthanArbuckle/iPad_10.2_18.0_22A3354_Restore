@implementation CIGaussianBlur

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryStillImage");
  v5[2] = CFSTR("CICategoryVideo");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("6");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19CA0;
  v4[3] = &unk_1E2F19CB0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F19C90;
  v4[1] = &unk_1E2F19C90;
  v4[4] = &unk_1E2F19C90;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  return v2 < 0.16;
}

- (id)outputImage
{
  double v4;
  double v5;
  uint64_t v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  double *v23;
  int v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  double *v29;
  uint64_t v30;
  int v31;
  CIVector *v32;
  const __CFString *v33;
  CIImage *inputImage;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[392];
  __int128 v38;
  double v39[3];
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIGaussianBlur _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v5 = v4;
  if (v4 > 1.12)
    return blurImage(self->inputImage, v5, v5);
  v6 = 0;
  if (v4 <= 0.7)
    v7 = 3;
  else
    v7 = 4;
  v8 = 0.707106781 / v4;
  do
  {
    v9 = v8 * (double)(int)v6;
    v10 = v9 + v8 * 0.5;
    v11 = v9 + v8 * -0.5;
    if (v9 <= 2.0)
    {
      v14 = erf(v10);
      v13 = (v14 - erf(v11)) * 0.5;
    }
    else
    {
      v12 = erfc(v10);
      v13 = (v12 - erfc(v11)) * -0.5;
    }
    *(&v40 + v6++) = v13;
  }
  while (v6 != 4);
  if (v5 <= 0.4)
    v15 = 2;
  else
    v15 = v7;
  v38 = 0u;
  *(_OWORD *)v39 = 0u;
  if ((_DWORD)v15 == 2)
  {
    v16 = 0.333333333;
    *(double *)&v38 = (v41 * -2.0 + v40 * 2.0 + 1.0) * 0.333333333;
    v17 = v41 - v40;
    v18 = 1;
  }
  else if ((_DWORD)v15 == 3)
  {
    v16 = 0.2;
    *(double *)&v38 = (v41 * -2.0 + v40 * 4.0 + v42 * -2.0 + 1.0) * 0.2;
    *((double *)&v38 + 1) = (v42 * -2.0 - (v40 - v41 * 3.0) + 1.0) * 0.2;
    v17 = v42 * 3.0 - (v40 - v41 * -2.0);
    v18 = 2;
  }
  else
  {
    v16 = 0.142857143;
    *(double *)&v38 = (v41 * -2.0 + v40 * 6.0 + v42 * -2.0 + v43 * -2.0 + 1.0) * 0.142857143;
    *((double *)&v38 + 1) = (v42 * -2.0 - (v40 - v41 * 5.0) + v43 * -2.0 + 1.0) * 0.142857143;
    v39[0] = (v42 * 5.0 - (v40 - v41 * -2.0) + v43 * -2.0 + 1.0) * 0.142857143;
    v17 = v42 * -2.0 - (v40 - v41 * -2.0) + v43 * 5.0;
    v18 = 3;
  }
  v39[v18 - 2] = (v17 + 1.0) * v16;
  v19 = 0;
  v20 = 2 * v15;
  v21 = 2 * v15 - 1;
  if (v21 <= 1)
    v22 = 1;
  else
    v22 = v21;
  v23 = (double *)v37;
  do
  {
    if (v19 - v15 >= -1)
      v24 = v19 - v15 + 1;
    else
      v24 = v15 + ~(_DWORD)v19;
    v25 = v39[v24 - 2];
    v26 = v22;
    v27 = -(uint64_t)v15;
    v28 = 1 - v15;
    v29 = v23;
    LODWORD(v30) = v15 - 1;
    do
    {
      if (v27 >= -1)
        v31 = v28;
      else
        v31 = v30;
      *v29++ = v39[v31 - 2] * v25;
      v30 = (v30 - 1);
      ++v28;
      ++v27;
      --v26;
    }
    while (v26);
    ++v19;
    v23 = (double *)((char *)v23 + ((16 * (((unint64_t)(v20 - 2) >> 1) & 0x7FFFFFFF)) | 8));
  }
  while (v19 != v22);
  v32 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v37, (v21 * v21), v30);
  switch(v20)
  {
    case 4:
      v33 = CFSTR("CIConvolution3X3");
      break;
    case 6:
      v33 = CFSTR("CIConvolution5X5");
      break;
    case 8:
      v33 = CFSTR("CIConvolution7X7");
      break;
    default:
      return blurImage(self->inputImage, v5, v5);
  }
  inputImage = self->inputImage;
  v35[0] = CFSTR("inputWeights");
  v35[1] = CFSTR("inputBias");
  v36[0] = v32;
  v36[1] = &unk_1E2F19C90;
  return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", v33, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
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

@end
