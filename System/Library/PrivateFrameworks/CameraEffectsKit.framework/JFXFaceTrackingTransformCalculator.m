@implementation JFXFaceTrackingTransformCalculator

- (JFXFaceTrackingTransformCalculator)initWithARMetaData:(id)a3 outputSize:(CGSize)a4 playableInterfaceOrientation:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  JFXFaceTrackingTransformCalculator *v11;
  JFXFaceTrackingTransformCalculator *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JFXFaceTrackingTransformCalculator;
  v11 = -[JFXFaceTrackingTransformCalculator init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_arMetadata, a3);
    v12->_outputSize.width = width;
    v12->_outputSize.height = height;
    objc_msgSend(v10, "faceAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "captureInterfaceOrientation");
    if (v14)
      v15 = v14;
    else
      v15 = a5;
    v12->_interfaceOrientation = v15;

  }
  return v12;
}

- (__n128)cameraTransform
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  objc_msgSend(a1, "nonScaledOrientedCameraTransform");
  v6 = v2;
  objc_msgSend(a1, "pixelsPerUnit", v3, v4);
  return (__n128)v6;
}

- (__n128)cameraProjection
{
  void *v2;
  double v3;
  double v4;
  __int128 v5;
  __int128 v7;

  objc_msgSend(a1, "arMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outputSize");
  objc_msgSend(v2, "cameraProjectionForOutputSize:interfaceOrientation:zNear:zFar:", objc_msgSend(a1, "interfaceOrientation"), v3, v4, 0.001, 10000.0);
  v7 = v5;

  return (__n128)v7;
}

- (__n128)onFaceTransform
{
  __int128 v2;
  void *v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[4];
  _OWORD v15[3];
  __int128 v16;

  +[JFXFaceTrackingUtilities pointOnFaceMesh](JFXFaceTrackingUtilities, "pointOnFaceMesh");
  v13 = v2;
  objc_msgSend(a1, "arMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorTransform");
  v8 = 0;
  v9 = v13;
  HIDWORD(v9) = 1.0;
  v14[0] = xmmword_226AB7770;
  v14[1] = xmmword_226AB7780;
  v14[2] = xmmword_226AB72E0;
  v14[3] = v9;
  memset(v15, 0, sizeof(v15));
  v16 = 0u;
  do
  {
    v15[v8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v14[v8])), v5, *(float32x2_t *)&v14[v8], 1), v6, (float32x4_t)v14[v8], 2), v7, (float32x4_t)v14[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  v11 = v16;
  v12 = v15[0];

  objc_msgSend(a1, "pixelsPerUnit", v11);
  return (__n128)v12;
}

- (uint64_t)billboardTransform
{
  void *v2;
  simd_float4x4 v4;

  objc_msgSend(x0_0, "cameraTransform");
  pv_simd_matrix_get_rotation_matrix(v4);
  objc_msgSend(x0_0, "arMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorTransform");
  objc_msgSend(x0_0, "pixelsPerUnit");

  return pv_simd_matrix_translate();
}

- (float)pixelsPerUnit
{
  float result;
  void *v4;
  void *v5;

  result = self->_pixelsPerUnit;
  if (result == 0.0)
  {
    -[JFXFaceTrackingTransformCalculator arMetadata](self, "arMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageResolution");

    -[JFXFaceTrackingTransformCalculator arMetadata](self, "arMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchorTransform");

    -[JFXFaceTrackingTransformCalculator nonScaledOrientedCameraTransform](self, "nonScaledOrientedCameraTransform");
    -[JFXFaceTrackingTransformCalculator cameraProjection](self, "cameraProjection");
    pv_projected_pixels_per_unit();
    return self->_pixelsPerUnit;
  }
  return result;
}

- (__n128)nonScaledOrientedCameraTransform
{
  void *v2;
  __int128 v3;
  __int128 v5;

  objc_msgSend(a1, "arMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraTransformForInterfaceOrientation:", objc_msgSend(a1, "interfaceOrientation"));
  v5 = v3;

  return (__n128)v5;
}

- (id)calculateFaceTrackingTransform
{
  JFXFaceTrackedEffectTransform *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v3 = [JFXFaceTrackedEffectTransform alloc];
  -[JFXFaceTrackingTransformCalculator cameraProjection](self, "cameraProjection");
  v35 = v5;
  v36 = v4;
  v33 = v7;
  v34 = v6;
  -[JFXFaceTrackingTransformCalculator cameraTransform](self, "cameraTransform");
  v31 = v9;
  v32 = v8;
  v29 = v11;
  v30 = v10;
  -[JFXFaceTrackingTransformCalculator onFaceTransform](self, "onFaceTransform");
  v27 = v13;
  v28 = v12;
  v25 = v15;
  v26 = v14;
  -[JFXFaceTrackingTransformCalculator billboardTransform](self, "billboardTransform");
  return objc_autoreleaseReturnValue(-[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v3, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v16, v17, v18, v19,
             v20,
             v21,
             v22,
             v23));
}

+ (uint64_t)interpolateFrom:(simd_float4x4)a1 to:(simd_float4x4)a2 fraction:(float)a3
{
  return pv_simd_matrix_lerp(a1, a2, a3);
}

- (JFXARMetadata)arMetadata
{
  return self->_arMetadata;
}

- (void)setArMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_arMetadata, a3);
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setPixelsPerUnit:(float)a3
{
  self->_pixelsPerUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arMetadata, 0);
}

@end
