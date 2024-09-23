@implementation ARImageDetectionResult

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  char v16;
  BOOL v17;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ARImageDetectionResult referenceImage](self, "referenceImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "visionTransform");
      v21 = v9;
      v22 = v8;
      v19 = v11;
      v20 = v10;
      -[ARImageDetectionResult visionTransform](self, "visionTransform");
      v16 = AREqualTransforms(v22, v21, v20, v19, v12, v13, v14, v15);

      if ((v16 & 1) != 0
        && AREqualTransforms(*((float32x4_t *)v5 + 7), *((float32x4_t *)v5 + 8), *((float32x4_t *)v5 + 9), *((float32x4_t *)v5 + 10), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._referenceImage, *(float32x4_t *)&self[1]._odtObjectIdentifer, *(float32x4_t *)self[1]._anon_30)&& vabdd_f64(*((double *)v5 + 1), self->_estimatedScaleFactor) <= 2.22044605e-16)
      {
        v17 = *((_QWORD *)v5 + 4) == self->_odtObjectIdentifer;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    v17 = 0;
    goto LABEL_10;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (double)transform
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;

  *(double *)v2.i64 = ARRenderingToVisionCoordinateTransform();
  v6 = 0;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v20 = a1[3];
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v24 + v6) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, COERCE_FLOAT(*(__int128 *)((char *)&v20 + v6))), v3, *(float32x2_t *)((char *)&v20 + v6), 1), v4, *(float32x4_t *)((char *)&v20 + v6), 2), v5, *(float32x4_t *)((char *)&v20 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  v18 = v25;
  v19 = v24;
  v16 = v27;
  v17 = v26;
  *(double *)&v10 = ARVisionToRenderingCoordinateTransform();
  v11 = 0;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v24 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(__int128 *)((char *)&v20 + v11))), v18, *(float32x2_t *)((char *)&v20 + v11), 1), v17, *(float32x4_t *)((char *)&v20 + v11), 2), v16, *(float32x4_t *)((char *)&v20 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  return *(double *)v24.i64;
}

- (double)setTransform:(__n128)a3
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  unint64_t v10;
  __n128 v11;
  unint64_t v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  double result;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v21;
  float32x4_t v23;
  float32x4_t v25;
  float32x4_t v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;

  *(double *)v6.i64 = ARVisionToRenderingCoordinateTransform();
  v10 = 0;
  v28 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v32 + v10) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v10))), v7, (float32x2_t)v28.n128_u64[v10 / 8], 1), v8, *(float32x4_t *)((char *)&v28 + v10), 2), v9, *(float32x4_t *)((char *)&v28 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  v25 = v33;
  v27 = v32;
  v21 = v35;
  v23 = v34;
  v11.n128_f64[0] = ARRenderingToVisionCoordinateTransform();
  v12 = 0;
  v28 = v11;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v32 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v12))), v25, (float32x2_t)v28.n128_u64[v12 / 8], 1), v23, *(float32x4_t *)((char *)&v28 + v12), 2), v21, *(float32x4_t *)((char *)&v28 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  result = *(double *)v32.i64;
  v17 = v33;
  v18 = v34;
  v19 = v35;
  a1[3] = v32;
  a1[4] = v17;
  a1[5] = v18;
  a1[6] = v19;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARImageDetectionResult visionTransform](self, "visionTransform");
  *(_OWORD *)(v4 + 48) = v5;
  *(_OWORD *)(v4 + 64) = v6;
  *(_OWORD *)(v4 + 80) = v7;
  *(_OWORD *)(v4 + 96) = v8;
  -[ARImageDetectionResult referenceImage](self, "referenceImage");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v9;

  -[ARImageDetectionResult worldTrackingCameraTransformAtDetection](self, "worldTrackingCameraTransformAtDetection");
  *(_OWORD *)(v4 + 112) = v11;
  *(_OWORD *)(v4 + 128) = v12;
  *(_OWORD *)(v4 + 144) = v13;
  *(_OWORD *)(v4 + 160) = v14;
  -[ARImageDetectionResult estimatedScaleFactor](self, "estimatedScaleFactor");
  *(_QWORD *)(v4 + 8) = v15;
  *(_QWORD *)(v4 + 32) = -[ARImageDetectionResult odtObjectIdentifer](self, "odtObjectIdentifer");
  return (id)v4;
}

- (__n128)visionTransform
{
  return a1[3];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (double)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

- (ARReferenceImage)referenceImage
{
  return self->_referenceImage;
}

- (void)setReferenceImage:(id)a3
{
  objc_storeStrong((id *)&self->_referenceImage, a3);
}

- (__n128)worldTrackingCameraTransformAtDetection
{
  return a1[7];
}

- (__n128)setWorldTrackingCameraTransformAtDetection:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (void)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(void *)a3
{
  self->_imageContext = a3;
}

- (unint64_t)odtObjectIdentifer
{
  return self->_odtObjectIdentifer;
}

- (void)setOdtObjectIdentifer:(unint64_t)a3
{
  self->_odtObjectIdentifer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceImage, 0);
}

@end
