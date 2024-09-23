@implementation CIFaceMaskDelta

- (double)_landmarksToDist:(unsigned int)a3 minimumDistance:(float)a4 maximumDistance:(float)a5 scalingFactor:(float)a6 offset:(float)a7
{
  uint64_t v12;
  double v13;
  float64x2_t v14;
  float64_t v15;
  float32x2_t v16;
  double v17;
  float64x2_t v18;
  float64_t v19;
  float32x2_t v20;
  double v21;
  float64x2_t v22;
  float64_t v23;
  float32x2_t v24;
  double v25;
  float64x2_t v26;
  float64_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  int32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  double result;
  float64_t v36;
  float64_t v37;
  float64_t v38;
  float64_t v39;

  v12 = a3;
  -[CIVector valueAtIndex:](self->inputFacesLeftEyeX, "valueAtIndex:", a3);
  v36 = v13;
  -[CIVector valueAtIndex:](self->inputFacesLeftEyeY, "valueAtIndex:", v12);
  v14.f64[0] = v36;
  v14.f64[1] = v15;
  v16 = vcvt_f32_f64(v14);
  -[CIVector valueAtIndex:](self->inputFacesRightEyeX, "valueAtIndex:", v12);
  v37 = v17;
  -[CIVector valueAtIndex:](self->inputFacesRightEyeY, "valueAtIndex:", v12);
  v18.f64[0] = v37;
  v18.f64[1] = v19;
  v20 = vcvt_f32_f64(v18);
  -[CIVector valueAtIndex:](self->inputFacesCenterX, "valueAtIndex:", v12);
  v38 = v21;
  -[CIVector valueAtIndex:](self->inputFacesCenterY, "valueAtIndex:", v12);
  v22.f64[0] = v38;
  v22.f64[1] = v23;
  v24 = vcvt_f32_f64(v22);
  -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", v12);
  v39 = v25;
  -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", v12);
  v26.f64[0] = v39;
  v26.f64[1] = v27;
  v28 = vcvt_f32_f64(v26);
  *(float32x2_t *)&v26.f64[0] = vsub_f32(v16, v20);
  *(float32x2_t *)&v26.f64[0] = vmul_f32(*(float32x2_t *)&v26.f64[0], *(float32x2_t *)&v26.f64[0]);
  v29 = vsub_f32(v16, v24);
  v30 = vsub_f32(v20, v24);
  v31 = vsub_f32(v24, v28);
  v32 = (int32x2_t)vmul_f32(v31, v31);
  *(float32x2_t *)&v26.f64[0] = vmaxnm_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)&v26.f64[0], v32), (float32x2_t)vzip2_s32(*(int32x2_t *)&v26.f64[0], v32))), (float32x2_t)vdup_n_s32(0x3A83126Fu));
  v33 = vsub_f32(v16, v28);
  v34 = vsub_f32(v20, v28);
  result = a7
         + (fmaxf(sqrtf(vaddv_f32(vmul_f32(v29, v29))), 0.001) * -3.3737
          + *(float *)v26.f64 * -12.1925
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v30, v30))), 0.001) * -3.025
          + *((float *)v26.f64 + 1) * -11.9485
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v33, v33))), 0.001) * 1.6734
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v34, v34))), 0.001) * 1.8423
          + vmuls_lane_f32(*(float *)v26.f64, *(float32x2_t *)&v26.f64[0], 1) * 47.7061
          + 3.1214)
         * a6;
  if (result >= a5)
    result = a5;
  if (result <= a4)
    return a4;
  return result;
}

- (BOOL)_isValidFace:(unsigned int)a3
{
  CIVector *inputFacesCenterX;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  inputFacesCenterX = self->inputFacesCenterX;
  if (inputFacesCenterX)
  {
    if (-[CIVector count](inputFacesCenterX, "count") <= a3)
      goto LABEL_25;
    inputFacesCenterX = self->inputFacesCenterY;
    if (inputFacesCenterX)
    {
      if (-[CIVector count](inputFacesCenterX, "count") <= a3)
        goto LABEL_25;
      inputFacesCenterX = self->inputFacesChinX;
      if (inputFacesCenterX)
      {
        if (-[CIVector count](inputFacesCenterX, "count") <= a3)
          goto LABEL_25;
        inputFacesCenterX = self->inputFacesChinY;
        if (inputFacesCenterX)
        {
          if (-[CIVector count](inputFacesCenterX, "count") <= a3)
            goto LABEL_25;
          inputFacesCenterX = self->inputFacesLeftEyeX;
          if (inputFacesCenterX)
          {
            if (-[CIVector count](inputFacesCenterX, "count") <= a3)
              goto LABEL_25;
            inputFacesCenterX = self->inputFacesLeftEyeY;
            if (inputFacesCenterX)
            {
              if (-[CIVector count](inputFacesCenterX, "count") <= a3)
                goto LABEL_25;
              inputFacesCenterX = self->inputFacesRightEyeX;
              if (inputFacesCenterX)
              {
                if (-[CIVector count](inputFacesCenterX, "count") <= a3)
                  goto LABEL_25;
                inputFacesCenterX = self->inputFacesRightEyeY;
                if (inputFacesCenterX)
                {
                  if (-[CIVector count](inputFacesCenterX, "count") > a3)
                  {
                    -[CIVector valueAtIndex:](self->inputFacesCenterX, "valueAtIndex:", a3);
                    if (v6 != -1.0)
                    {
                      -[CIVector valueAtIndex:](self->inputFacesCenterY, "valueAtIndex:", a3);
                      if (v7 != -1.0)
                      {
                        -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", a3);
                        if (v8 != -1.0)
                        {
                          -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", a3);
                          if (v9 != -1.0)
                          {
                            -[CIVector valueAtIndex:](self->inputFacesLeftEyeX, "valueAtIndex:", a3);
                            if (v10 != -1.0)
                            {
                              -[CIVector valueAtIndex:](self->inputFacesLeftEyeY, "valueAtIndex:", a3);
                              if (v11 != -1.0)
                              {
                                -[CIVector valueAtIndex:](self->inputFacesRightEyeX, "valueAtIndex:", a3);
                                if (v12 != -1.0)
                                {
                                  -[CIVector valueAtIndex:](self->inputFacesRightEyeY, "valueAtIndex:", a3);
                                  LOBYTE(inputFacesCenterX) = v13 != -1.0;
                                  return (char)inputFacesCenterX;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
LABEL_25:
                  LOBYTE(inputFacesCenterX) = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return (char)inputFacesCenterX;
}

- (unsigned)findMostProminentFace
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double width;
  double height;
  CGRect r1;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[CIVector CGRectValue](self->inputFocusRect, "CGRectValue");
  r1.origin.x = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -[CIFaceMaskDelta _isValidFace:](self, "_isValidFace:", 0);
  BYTE4(r1.origin.y) = v10;
  v11 = -[CIFaceMaskDelta _isValidFace:](self, "_isValidFace:", 1);
  BYTE5(r1.origin.y) = v11;
  v12 = -[CIFaceMaskDelta _isValidFace:](self, "_isValidFace:", 2);
  BYTE6(r1.origin.y) = v12;
  v13 = -[CIFaceMaskDelta _isValidFace:](self, "_isValidFace:", 3);
  v14 = 0;
  HIBYTE(r1.origin.y) = v13;
  while (!*((_BYTE *)&r1.origin.y + v14 + 4))
  {
    if (++v14 == 4)
    {
      LODWORD(v14) = 0;
      break;
    }
  }
  if ((v11 + v10 + v12 + v13) >= 2)
  {
    v15 = 0;
    v16 = 0.0;
    do
    {
      if (*((_BYTE *)&r1.origin.y + v15 + 4))
      {
        -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", v15);
        -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", v15);
        v18 = v17;
        -[CIVector valueAtIndex:](self->inputFacesLeftEyeX, "valueAtIndex:", v15);
        v20 = v19;
        -[CIVector valueAtIndex:](self->inputFacesLeftEyeY, "valueAtIndex:", v15);
        v22 = v21;
        -[CIVector valueAtIndex:](self->inputFacesRightEyeX, "valueAtIndex:", v15);
        v24 = v23;
        -[CIVector valueAtIndex:](self->inputFacesRightEyeY, "valueAtIndex:", v15);
        if (v25 <= v22)
          v25 = v22;
        v32.size.height = v25 - v18;
        v30.origin.x = r1.origin.x;
        v30.origin.y = v5;
        v30.size.width = v7;
        v30.size.height = v9;
        v32.origin.x = v20;
        v32.origin.y = v18;
        v32.size.width = v24 - v20;
        v31 = CGRectIntersection(v30, v32);
        width = v31.size.width;
        height = v31.size.height;
        if (!CGRectIsNull(v31) && width * height > v16)
        {
          v16 = width * height;
          LODWORD(v14) = v15;
        }
      }
      ++v15;
    }
    while (v15 != 4);
  }
  return v14;
}

- (float)distanceToAdd
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;

  v3 = -[CIFaceMaskDelta findMostProminentFace](self, "findMostProminentFace");
  -[NSNumber floatValue](self->inputSubjectDistanceMinimumFocusDistance, "floatValue");
  v5 = v4;
  -[NSNumber floatValue](self->inputSubjectDistanceMaximumFocusDistance, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->inputSubjectDistanceScalingFactor, "floatValue");
  v9 = v8;
  -[NSNumber floatValue](self->inputSubjectDistanceOffset, "floatValue");
  LODWORD(v11) = v10;
  LODWORD(v12) = v5;
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  -[CIFaceMaskDelta _landmarksToDist:minimumDistance:maximumDistance:scalingFactor:offset:](self, "_landmarksToDist:minimumDistance:maximumDistance:scalingFactor:offset:", v3, v12, v13, v14, v11);
  v16 = v15;
  -[NSNumber floatValue](self->inputDistanceAdd, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputSubjectDistanceMinimumFocusDistance, "floatValue");
  v20 = fmaxf(fmaxf(v19, v16), 0.00001);
  return (float)(1.0 / v20) - (float)(1.0 / (float)(v18 + v20));
}

- (id)outputImage
{
  id result;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t i;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CIVector *v32;
  CIVector *v33;
  CIVector *inputFacesCenterX;
  double v35;
  void *v36;
  void *v37;
  CIVector *v38;
  NSNumber *inputSubtractiveMaxBlur;
  NSNumber *inputDistanceAdd;
  NSNumber *inputMaxBlur;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[8];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[14];
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  result = +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputParameterImage)
  {
    -[CIVector X](self->inputImageSize, "X");
    v5 = v4;
    -[CIVector Y](self->inputImageSize, "Y");
    v7 = v6;
    if (-[CIFaceMaskDelta outputImage]::onceToken != -1)
      dispatch_once(&-[CIFaceMaskDelta outputImage]::onceToken, &__block_literal_global_26);
    v8 = -[CIVector count](self->inputFacesChinX, "count");
    if (v8 >= -[CIVector count](self->inputFacesCenterX, "count"))
      v9 = 96;
    else
      v9 = 112;
    v10 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "count");
    v11 = -[CIVector count](self->inputFacesChinY, "count");
    if (v11 >= -[CIVector count](self->inputFacesCenterY, "count"))
      v12 = 104;
    else
      v12 = 120;
    v13 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v12), "count");
    v52 = xmmword_192494980;
    v53 = xmmword_192494980;
    if (v10 <= v13)
      v15 = v13;
    else
      v15 = v10;
    if (v15)
    {
      v16 = v13;
      for (i = 0; i != v15; ++i)
      {
        if (i < v10)
        {
          -[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", i);
          v19 = v18;
          -[CIVector valueAtIndex:](self->inputFacesCenterX, "valueAtIndex:", i);
          *(float *)&v20 = v19 - v20;
          *((_DWORD *)&v53 + i) = LODWORD(v20);
        }
        if (i < v16)
        {
          -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", i);
          v22 = v21;
          -[CIVector valueAtIndex:](self->inputFacesCenterY, "valueAtIndex:", i);
          v14 = v7 / v5;
          *(float *)&v23 = (v22 - v23) * v14;
          *((_DWORD *)&v52 + i) = LODWORD(v23);
        }
      }
      v24 = *(float *)&v53;
      v25 = *((float *)&v53 + 1);
      v26 = *((float *)&v53 + 2);
      v27 = *((float *)&v53 + 3);
      v28 = *(float *)&v52;
      v29 = *((float *)&v52 + 1);
      v30 = *((float *)&v52 + 2);
      v31 = *((float *)&v52 + 3);
    }
    else
    {
      v31 = -1.0;
      v30 = -1.0;
      v29 = -1.0;
      v28 = -1.0;
      v27 = -1.0;
      v26 = -1.0;
      v25 = -1.0;
      v24 = -1.0;
    }
    v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v24, v25, v26, v27);
    v33 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v28, v29, v30, v31);
    inputFacesCenterX = self->inputFacesCenterX;
    v51[0] = self->inputParameterImage;
    v51[1] = inputFacesCenterX;
    v51[2] = self->inputFacesCenterY;
    *(float *)&v35 = v7 / v5;
    v51[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
    v51[4] = v32;
    v51[5] = v33;
    v36 = (void *)MEMORY[0x1E0CB37E8];
    SDOFFaceMaskValue((uint64_t)CFSTR("chinThetaLimit"), self->inputTuningParameters);
    v51[6] = objc_msgSend(v36, "numberWithFloat:");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    SDOFFaceMaskValue((uint64_t)CFSTR("chinThetaMultip"), self->inputTuningParameters);
    v51[7] = objc_msgSend(v37, "numberWithFloat:");
    v38 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v5, v7);
    inputSubtractiveMaxBlur = self->inputSubtractiveMaxBlur;
    v51[8] = v38;
    v51[9] = inputSubtractiveMaxBlur;
    inputDistanceAdd = self->inputDistanceAdd;
    v51[10] = self->inputAdditiveMaxBlur;
    v51[11] = inputDistanceAdd;
    inputMaxBlur = self->inputMaxBlur;
    v51[12] = self->inputApertureScaling;
    v51[13] = inputMaxBlur;
    v42 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 14);
    -[CIImage extent](self->inputParameterImage, "extent");
    v43 = (void *)-[CIFaceMaskDelta outputImage]::ck;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __30__CIFaceMaskDelta_outputImage__block_invoke_2;
    v48[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v48[4] = v44;
    v48[5] = v45;
    v48[6] = v46;
    v48[7] = v47;
    v49[0] = CFSTR("kCIKernelOutputFormat");
    v49[1] = CFSTR("kCIImageAlphaOne");
    v50[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
    v50[1] = MEMORY[0x1E0C9AAB0];
    return (id)objc_msgSend(v43, "applyWithExtent:roiCallback:arguments:options:", v48, v42, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2), 0.0, 0.0, v5, v7);
  }
  return result;
}

id __30__CIFaceMaskDelta_outputImage__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_modifyFaceMask"));
  -[CIFaceMaskDelta outputImage]::ck = (uint64_t)result;
  return result;
}

double __30__CIFaceMaskDelta_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (CIVector)inputImageSize
{
  return self->inputImageSize;
}

- (void)setInputImageSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputParameterImage
{
  return self->inputParameterImage;
}

- (void)setInputParameterImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CIVector)inputFacesLeftEyeX
{
  return self->inputFacesLeftEyeX;
}

- (void)setInputFacesLeftEyeX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CIVector)inputFacesLeftEyeY
{
  return self->inputFacesLeftEyeY;
}

- (void)setInputFacesLeftEyeY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CIVector)inputFacesRightEyeX
{
  return self->inputFacesRightEyeX;
}

- (void)setInputFacesRightEyeX:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CIVector)inputFacesRightEyeY
{
  return self->inputFacesRightEyeY;
}

- (void)setInputFacesRightEyeY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CIVector)inputK0
{
  return self->inputK0;
}

- (void)setInputK0:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CIVector)inputK1
{
  return self->inputK1;
}

- (void)setInputK1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CIVector)inputK2
{
  return self->inputK2;
}

- (void)setInputK2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (CIVector)inputK3
{
  return self->inputK3;
}

- (void)setInputK3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)inputDistanceAdd
{
  return self->inputDistanceAdd;
}

- (void)setInputDistanceAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)inputAdditiveMaxBlur
{
  return self->inputAdditiveMaxBlur;
}

- (void)setInputAdditiveMaxBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)inputSubtractiveMaxBlur
{
  return self->inputSubtractiveMaxBlur;
}

- (void)setInputSubtractiveMaxBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)inputSubjectDistanceMinimumFocusDistance
{
  return self->inputSubjectDistanceMinimumFocusDistance;
}

- (void)setInputSubjectDistanceMinimumFocusDistance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)inputSubjectDistanceMaximumFocusDistance
{
  return self->inputSubjectDistanceMaximumFocusDistance;
}

- (void)setInputSubjectDistanceMaximumFocusDistance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)inputSubjectDistanceScalingFactor
{
  return self->inputSubjectDistanceScalingFactor;
}

- (void)setInputSubjectDistanceScalingFactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)inputSubjectDistanceOffset
{
  return self->inputSubjectDistanceOffset;
}

- (void)setInputSubjectDistanceOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

@end
