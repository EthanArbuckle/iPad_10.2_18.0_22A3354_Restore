@implementation ADCameraCalibration

- (void)undistort:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 outUndistorted:(CGPoint *)a5
{
  -[ADLensDistortionModel undistortPixels:distortedPixels:withCameraCalibration:outUndistortedPixels:](self->_distortionModel, "undistortPixels:distortedPixels:withCameraCalibration:outUndistortedPixels:", a3, a4, self, a5);
}

- (void)distort:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 outDistorted:(CGPoint *)a5
{
  -[ADLensDistortionModel distortPixels:undistortedPixels:withCameraCalibration:outDistortedPixels:](self->_distortionModel, "distortPixels:undistortedPixels:withCameraCalibration:outDistortedPixels:", a3, a4, self, a5);
}

- (ADNilDistortionModel)initWithIntrinsics:(__n128)a3 cameraToPlatformTransform:(__n128)a4 pixelSize:(__n128)a5 referenceDimensions:(__n128)a6 distortionModel:(__n128)a7
{
  ADNilDistortionModel *v20;
  ADCameraCalibration *v21;
  ADCameraCalibration *v22;
  __int128 v25;
  __int128 v27;
  __int128 v29;
  __int128 v31;
  __int128 v33;
  __int128 v35;
  __int128 v37;
  objc_super v38;

  v20 = a11;
  if (v20 || (v20 = objc_alloc_init(ADNilDistortionModel)) != 0)
  {
    v38.receiver = a1;
    v38.super_class = (Class)ADCameraCalibration;
    v21 = -[ADCameraCalibration init](&v38, sel_init, *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8);
    v22 = v21;
    if (v21)
    {
      *(_OWORD *)v21->_anon_10 = v25;
      *(_OWORD *)&v21->_anon_10[16] = v27;
      *(_OWORD *)&v21->_anon_10[32] = v29;
      *(_OWORD *)v21->_anon_50 = v31;
      *(_OWORD *)&v21->_anon_50[16] = v33;
      *(_OWORD *)&v21->_anon_50[32] = v35;
      *(_OWORD *)&v21->_anon_50[48] = v37;
      v21->_pixelSize = a9;
      v21->_referenceDimensions.width = a12;
      v21->_referenceDimensions.height = a13;
      objc_storeStrong((id *)&v21->_distortionModel, v20);
    }
    a1 = v22;

    v20 = a1;
  }

  return v20;
}

- (__n128)intrinsicMatrix
{
  return a1[1];
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withR:(const float *)a5 outPoints:
{
  uint64_t v5;
  float pixelSize;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat *p_y;
  CGFloat v14;
  CGFloat v15;
  float v16;
  float v17;
  float v18;
  float v19;

  if (a3)
  {
    pixelSize = self->_pixelSize;
    v7 = *(float *)self->_anon_10;
    v8 = pixelSize * v7;
    v9 = COERCE_FLOAT(*(_OWORD *)&self->_anon_10[32]);
    v10 = COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_anon_10[32]));
    v11 = pixelSize;
    v12 = (float)(v7 / *(float *)&self->_anon_10[20]);
    p_y = &a4->y;
    do
    {
      v14 = (*(p_y - 1) - v9) * v11;
      v15 = (*p_y - v10) * v11 * v12;
      v16 = *a5++;
      v17 = v14;
      v18 = v15;
      v19 = v16 / sqrtf((float)((float)(v8 * v8) + (float)(v17 * v17)) + (float)(v18 * v18));
      *(float *)&v14 = v14 * v19;
      *(float *)&v15 = v15 * v19;
      HIDWORD(v14) = LODWORD(v15);
      *(float *)(v5 + 8) = v8 * v19;
      *(CGFloat *)v5 = v14;
      v5 += 16;
      p_y += 2;
      --a3;
    }
    while (a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distortionModel, 0);
}

- (uint64_t)initWithIntrinsics:(double)a3 cameraToPlatformTransform:(double)a4 pixelSize:(double)a5 forReferenceDimensions:(double)a6 withDistortionModel:(double)a7
{
  *(float *)&a10 = a10;
  return objc_msgSend(a1, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", a3, a4, a5, a6, a7, a8, a9, a10);
}

- (BOOL)isEqual:(id)a3
{
  ADCameraCalibration *v4;
  ADCameraCalibration *v5;
  ADCameraCalibration *v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint32x4_t v15;
  char v16;
  double height;
  double width;
  double v20;
  double v21;
  float pixelSize;
  float v23;
  ADLensDistortionModel *distortionModel;
  void *v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;

  v4 = (ADCameraCalibration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_10;
  }
  v6 = v5;
  v27 = *(float32x4_t *)&self->_anon_10[16];
  v29 = *(float32x4_t *)self->_anon_10;
  v31 = *(float32x4_t *)&self->_anon_10[32];
  -[ADCameraCalibration intrinsicMatrix](v6, "intrinsicMatrix");
  v10 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v29, v7), (int8x16_t)vceqq_f32(v27, v8)), (int8x16_t)vceqq_f32(v31, v9));
  v10.i32[3] = v10.i32[2];
  if ((vminvq_u32(v10) & 0x80000000) == 0)
    goto LABEL_6;
  v26 = *(float32x4_t *)&self->_anon_50[16];
  v28 = *(float32x4_t *)self->_anon_50;
  v30 = *(float32x4_t *)&self->_anon_50[48];
  v32 = *(float32x4_t *)&self->_anon_50[32];
  -[ADCameraCalibration cameraToPlatformTransform](v6, "cameraToPlatformTransform");
  v15 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v28, v11), (int8x16_t)vceqq_f32(v26, v12)), vandq_s8((int8x16_t)vceqq_f32(v32, v13), (int8x16_t)vceqq_f32(v30, v14)));
  v15.i32[3] = v15.i32[2];
  if ((vminvq_u32(v15) & 0x80000000) == 0)
    goto LABEL_6;
  width = self->_referenceDimensions.width;
  height = self->_referenceDimensions.height;
  -[ADCameraCalibration referenceDimensions](v6, "referenceDimensions");
  v16 = 0;
  if (width != v21 || height != v20)
    goto LABEL_7;
  pixelSize = self->_pixelSize;
  -[ADCameraCalibration pixelSize](v6, "pixelSize");
  if (pixelSize == v23)
  {
    distortionModel = self->_distortionModel;
    -[ADCameraCalibration distortionModel](v6, "distortionModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ADLensDistortionModel isEqual:](distortionModel, "isEqual:", v25);

  }
  else
  {
LABEL_6:
    v16 = 0;
  }
LABEL_7:

LABEL_10:
  return v16;
}

- (unint64_t)hash
{
  unsigned __int8 *anon_10;
  void *v4;
  double v5;
  uint64_t i;
  uint64_t j;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t k;
  uint64_t m;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;

  anon_10 = self->_anon_10;
  v4 = (void *)objc_opt_new();
  for (i = 0; i != 3; ++i)
  {
    for (j = 0; j != 3; ++j)
    {
      LODWORD(v5) = *(_DWORD *)&anon_10[16 * i + 4 * (j & 3)];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
  }
  v10 = ADCommonUtils::hashArray((ADCommonUtils *)v4, v9);

  v11 = (void *)objc_opt_new();
  for (k = 0; k != 4; ++k)
  {
    for (m = 0; m != 3; ++m)
    {
      LODWORD(v12) = *(_DWORD *)&self->_anon_50[16 * k + 4 * (m & 3)];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

    }
  }
  v17 = ADCommonUtils::hashArray((ADCommonUtils *)v11, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_referenceDimensions.width);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_referenceDimensions.height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");

  *(float *)&v22 = self->_pixelSize;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10 ^ (2 * v17) ^ (3 * v19) ^ (4 * v21) ^ (5 * objc_msgSend(v23, "hash"));

  return v24 ^ (6 * -[ADLensDistortionModel hash](self->_distortionModel, "hash"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  ADMutableCameraCalibration *v5;
  float pixelSize;
  CGFloat width;
  CGFloat height;
  void *v9;
  double v10;
  ADMutableCameraCalibration *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = [ADMutableCameraCalibration alloc];
  pixelSize = self->_pixelSize;
  width = self->_referenceDimensions.width;
  height = self->_referenceDimensions.height;
  v18 = *(_OWORD *)&self->_anon_10[32];
  v16 = *(_OWORD *)&self->_anon_10[16];
  v14 = *(_OWORD *)self->_anon_10;
  v19 = *(_OWORD *)&self->_anon_50[48];
  v17 = *(_OWORD *)&self->_anon_50[32];
  v15 = *(_OWORD *)&self->_anon_50[16];
  v13 = *(_OWORD *)self->_anon_50;
  v9 = (void *)-[ADLensDistortionModel copyWithZone:](self->_distortionModel, "copyWithZone:", a3);
  *(float *)&v10 = pixelSize;
  v11 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v5, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v9, *(double *)&v14, *(double *)&v16, *(double *)&v18, *(double *)&v13, *(double *)&v15, *(double *)&v17, *(double *)&v19, v10, *(_QWORD *)&width, *(_QWORD *)&height);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  float pixelSize;
  CGFloat width;
  CGFloat height;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = objc_alloc((Class)objc_opt_class());
  pixelSize = self->_pixelSize;
  width = self->_referenceDimensions.width;
  height = self->_referenceDimensions.height;
  v18 = *(_OWORD *)&self->_anon_10[32];
  v16 = *(_OWORD *)&self->_anon_10[16];
  v14 = *(_OWORD *)self->_anon_10;
  v19 = *(_OWORD *)&self->_anon_50[48];
  v17 = *(_OWORD *)&self->_anon_50[32];
  v15 = *(_OWORD *)&self->_anon_50[16];
  v13 = *(_OWORD *)self->_anon_50;
  v9 = (void *)-[ADLensDistortionModel copyWithZone:](self->_distortionModel, "copyWithZone:", a3);
  *(float *)&v10 = pixelSize;
  v11 = (void *)objc_msgSend(v5, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v9, *(double *)&v14, *(double *)&v16, *(double *)&v18, *(double *)&v13, *(double *)&v15, *(double *)&v17, *(double *)&v19, v10, *(_QWORD *)&width, *(_QWORD *)&height);

  return v11;
}

- (double)getTransformationTo:(int32x4_t *)a3
{
  uint64_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  _OWORD v11[3];
  __int128 v12;

  v3 = 0;
  v4 = a3[5];
  v5 = a3[6];
  v6 = vdupq_lane_s32(*(int32x2_t *)v5.i8, 1);
  v7 = (float32x4_t)vzip1q_s32(v4, v5);
  v7.i32[2] = (__int32)a3[7];
  v8 = (float32x4_t)vzip2q_s32(v4, v5);
  v8.i32[2] = a3[7].i64[1];
  v9 = (float32x4_t)vzip2q_s32(vzip1q_s32(v4, a3[7]), v6);
  v11[2] = *(_OWORD *)(a1 + 112);
  do
  {
    *(__int128 *)((char *)&v12 + v3 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(v11[v3])), v9, *(float32x2_t *)&v11[v3], 1), v8, (float32x4_t)v11[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  return *(double *)&v12;
}

- (void)transform:(unint64_t)a3 points:toCamera:outPoints:
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;

  v6 = v5;
  v7 = v3;
  v10 = v4;
  -[ADCameraCalibration getTransformationTo:](self, "getTransformationTo:");
  +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", a3, v7, v6);

}

- (void)project:(ADCameraCalibration *)self points:(SEL)a2 outUndistortedPixels:(unint64_t)a3
{
  const float *v3;
  float64x2_t *v4;

  ADReprojectionOptimizations::projectPoints(a3, v3, v4, *(float32x4_t *)self->_anon_10, *(float32x4_t *)&self->_anon_10[16], *(float32x4_t *)&self->_anon_10[32]);
}

- (void)project:(unint64_t)a3 points:outUndistortedPixels:outR:
{
  float32x2_t *v3;
  float64x2_t *v4;
  float *v5;
  int32x4_t v6;
  float32x4_t v7;
  float v8;

  for (; a3; --a3)
  {
    v6 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)self->_anon_10, COERCE_FLOAT(*(_OWORD *)v3->f32)), *(float32x4_t *)&self->_anon_10[16], *v3, 1), *(float32x4_t *)&self->_anon_10[32], *(float32x4_t *)v3->f32, 2);
    if (*(float *)&v6.i32[2] <= 0.0)
    {
      v4->f64[0] = 0.0;
      v4->f64[1] = 0.0;
      v8 = 0.0;
    }
    else
    {
      *v4 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)vdup_laneq_s32(v6, 2)));
      v7 = vmulq_f32(*(float32x4_t *)v3->f32, *(float32x4_t *)v3->f32);
      v8 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
    }
    *v5++ = v8;
    ++v4;
    v3 += 2;
  }
}

- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withZ:(const float *)a5 outPoints:
{
  float *v5;

  ADReprojectionOptimizations::backProjectUndistortedPixels(a3, (uint64_t)a4, (float32x4_t *)a5, v5, COERCE_FLOAT(*(_OWORD *)self->_anon_10), *(double *)&self->_anon_10[16], *(double *)&self->_anon_10[32]);
}

- (ADCameraCalibration)initWithDictionary:(id)a3
{
  id v4;
  ADCameraCalibration *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 *anon_50;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  float v27;
  NSString *v28;
  uint64_t v29;
  ADLensDistortionModel *distortionModel;
  uint64_t v31;
  ADLensDistortionModel *v32;
  ADCameraCalibration *v33;
  uint8_t buf[16];
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ADCameraCalibration;
  v5 = -[ADCameraCalibration init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intrinsicMatrix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count") == 9)
    {
      for (i = 0; i != 3; ++i)
      {
        v9 = 0;
        v10 = i;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (!v11)
            goto LABEL_24;
          objc_msgSend(v11, "floatValue");
          *(_DWORD *)&v5->_anon_10[16 * i + 4 * v9] = v13;

          ++v9;
          v10 += 3;
        }
        while (v9 != 3);
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceDimensions"));
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && CGSizeMakeWithDictionaryRepresentation(v14, &v5->_referenceDimensions))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cameraToPlatformTransform"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extrinsicMatrix")),
              (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          if (objc_msgSend(v16, "count") == 12)
          {
            v17 = 0;
            anon_50 = v5->_anon_50;
            while (2)
            {
              v19 = 0;
              v20 = (char *)&anon_50[16 * v17];
              v21 = v17;
              do
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (!v22)
                  goto LABEL_29;
                objc_msgSend(v22, "floatValue");
                *(_DWORD *)&v20[4 * v19] = v24;

                ++v19;
                v21 += 4;
              }
              while (v19 != 3);
              ++v17;
              anon_50 = v5->_anon_50;
              if (v17 != 4)
                continue;
              break;
            }
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pixelSize"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (!v25)
            {
              v33 = 0;
              goto LABEL_37;
            }
            objc_msgSend(v25, "floatValue");
            v5->_pixelSize = v27;
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distortionType"));
            v28 = (NSString *)objc_claimAutoreleasedReturnValue();
            allocateDistortionModelWithName(v28);
            v29 = objc_claimAutoreleasedReturnValue();
            distortionModel = v5->_distortionModel;
            v5->_distortionModel = (ADLensDistortionModel *)v29;

            if (v5->_distortionModel && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v31 = -[ADLensDistortionModel initWithDictionary:](v5->_distortionModel, "initWithDictionary:", v4);
              v32 = v5->_distortionModel;
              v5->_distortionModel = (ADLensDistortionModel *)v31;

              if (v5->_distortionModel)
              {
                v33 = v5;
LABEL_35:

LABEL_37:
                goto LABEL_30;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unknown distortion model or distortion model does not support loading from dictionary", buf, 2u);
            }
            v33 = 0;
            goto LABEL_35;
          }
        }
LABEL_29:
        v33 = 0;
LABEL_30:

      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
LABEL_24:
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)dictionaryRepresentation
{
  return -[ADCameraCalibration createDictionaryRepresentationWithHumanReadable:](self, "createDictionaryRepresentationWithHumanReadable:", 0);
}

- (id)createDictionaryRepresentationWithHumanReadable:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  CFDictionaryRef DictionaryRepresentation;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint8_t buf[8];
  _QWORD v58[12];
  _QWORD v59[11];

  v48 = a3;
  v59[9] = *MEMORY[0x24BDAC8D0];
  v56 = (id)objc_opt_new();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", &unk_2507B95B0, CFSTR("Version"));
  LODWORD(v4) = *(_DWORD *)self->_anon_10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v54;
  LODWORD(v5) = *(_DWORD *)&self->_anon_10[16];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v52;
  LODWORD(v6) = *(_DWORD *)&self->_anon_10[32];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v7;
  LODWORD(v8) = *(_DWORD *)&self->_anon_10[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v9;
  LODWORD(v10) = *(_DWORD *)&self->_anon_10[20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v11;
  LODWORD(v12) = *(_DWORD *)&self->_anon_10[36];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v13;
  LODWORD(v14) = *(_DWORD *)&self->_anon_10[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v15;
  LODWORD(v16) = *(_DWORD *)&self->_anon_10[24];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v17;
  LODWORD(v18) = *(_DWORD *)&self->_anon_10[40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[8] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v20, CFSTR("intrinsicMatrix"));

  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_referenceDimensions);
  objc_msgSend(v56, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("referenceDimensions"));

  LODWORD(v22) = *(_DWORD *)self->_anon_50;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v55;
  LODWORD(v23) = *(_DWORD *)&self->_anon_50[16];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v53;
  LODWORD(v24) = *(_DWORD *)&self->_anon_50[32];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v51;
  LODWORD(v25) = *(_DWORD *)&self->_anon_50[48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v50;
  LODWORD(v26) = *(_DWORD *)&self->_anon_50[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v49;
  LODWORD(v27) = *(_DWORD *)&self->_anon_50[20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v28;
  LODWORD(v29) = *(_DWORD *)&self->_anon_50[36];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v30;
  LODWORD(v31) = *(_DWORD *)&self->_anon_50[52];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v32;
  LODWORD(v33) = *(_DWORD *)&self->_anon_50[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v34;
  LODWORD(v35) = *(_DWORD *)&self->_anon_50[24];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v36;
  LODWORD(v37) = *(_DWORD *)&self->_anon_50[40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v38;
  LODWORD(v39) = *(_DWORD *)&self->_anon_50[56];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v41, CFSTR("cameraToPlatformTransform"));

  *(float *)&v42 = self->_pixelSize;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v43, CFSTR("pixelSize"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v45, CFSTR("distortionType"));

    -[ADLensDistortionModel dictionaryRepresentation:](self->_distortionModel, "dictionaryRepresentation:", v48);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addEntriesFromDictionary:", v46);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "distortion model cannot be converted to dictionary. calibration will be missing distortion and won't be able to load from dictionary.", buf, 2u);
    }
    objc_msgSend(v56, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("distortionType"));
  }
  return v56;
}

- (ADCameraCalibration)initWithFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  ADCameraCalibration *v13;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSuffix:", CFSTR(".json"));

    if (v7)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 1, &v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      v10 = v9;
      if (v8)
      {
        v16 = v9;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 4, &v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v16;

        v10 = v12;
        if (v12)
        {
LABEL_5:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v19 = v15;
            _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed create camera calibration with error:%@", buf, 0xCu);

          }
          v13 = 0;
          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
        if (v9)
          goto LABEL_5;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self = -[ADCameraCalibration initWithDictionary:](self, "initWithDictionary:", v11);
    v13 = self;
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  char v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ADCameraCalibration createDictionaryRepresentationWithHumanReadable:](self, "createDictionaryRepresentationWithHumanReadable:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSuffix:", CFSTR(".json"));

  if (v9)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 1, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed create camera calibration with error:%@", buf, 0xCu);

      }
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend(v10, "writeToFile:atomically:", v6, v4);
    }

  }
  else
  {
    v12 = objc_msgSend(v7, "writeToFile:atomically:", v6, v4);
  }

  return v12;
}

- (CGSize)referenceDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceDimensions.width;
  height = self->_referenceDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (__n128)cameraToPlatformTransform
{
  return a1[5];
}

- (ADLensDistortionModel)distortionModel
{
  return self->_distortionModel;
}

+ (void)createIntrinsicsMatrixWithEflX:eflY:principalPointX:principalPointY:
{
  __asm { FMOV            V4.4S, #1.0 }
}

+ (uint64_t)createIntrinsicsMatrixWithEFL:(double)a3 principalPointX:(double)a4 principalPointY:(double)a5
{
  LODWORD(a6) = LODWORD(a5);
  LODWORD(a5) = LODWORD(a4);
  LODWORD(a4) = LODWORD(a3);
  return objc_msgSend(a1, "createIntrinsicsMatrixWithEflX:eflY:principalPointX:principalPointY:", a3, a4, a5, a6);
}

+ (void)transform:(unint64_t)a3 points:with:outPoints:
{
  uint64_t v3;
  float32x4_t *v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float *v9;
  int32x4_t v10;
  float32x4_t v11;

  if (a3)
  {
    v9 = (float *)(v3 + 8);
    v10 = vdupq_n_s32(0x7FC00000u);
    do
    {
      v11 = (float32x4_t)v10;
      if (*v9 != 0.0)
        v11 = vaddq_f32(v8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_OWORD *)(v9 - 2))), v6, *(float32x2_t *)(v9 - 2), 1), v7, *(float32x4_t *)(v9 - 2), 2));
      *v4++ = v11;
      v9 += 4;
      --a3;
    }
    while (a3);
  }
}

+ (id)cameraCalibrationFromFile:(id)a3
{
  id v3;
  ADCameraCalibration *v4;

  v3 = a3;
  v4 = -[ADCameraCalibration initWithFile:]([ADCameraCalibration alloc], "initWithFile:", v3);

  return v4;
}

@end
