@implementation JFXFaceAnchor

+ (JFXFaceAnchor)faceAnchorWithARFrame:(id)a3 captureInterfaceOrientation:(int64_t)a4 withFaceRectScaleFactor:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  JFXFaceAnchor *v16;
  void *v17;
  void *v18;
  JFXFaceAnchor *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double SquareWithSize;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  simd_float3x3 v52;

  height = a5.height;
  width = a5.width;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(MEMORY[0x24BDB14C0], "isSupported"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v8, "anchors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v47;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if (objc_msgSend(v15, "isTracked"))
            {
              objc_msgSend(v15, "geometry");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "vertices");
              objc_msgSend(v15, "geometry");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "vertices");

              v19 = [JFXFaceAnchor alloc];
              objc_msgSend(v15, "transform");
              v44 = v21;
              v45 = v20;
              v42 = v23;
              v43 = v22;
              SquareWithSize = CGRectMakeSquareWithSize();
              v26 = v25;
              v28 = v27;
              v30 = v29;
              objc_msgSend(v8, "camera");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "imageResolution");
              v16 = -[JFXFaceAnchor initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:](v19, "initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:", 0, a4, 3, v45, v44, v43, v42, SquareWithSize, v26, v28, v30, *(_QWORD *)&width, *(_QWORD *)&height, v32, v33);

              objc_msgSend(v15, "transform");
              -[JFXFaceAnchor setTransform:](v16, "setTransform:");
              objc_msgSend(v8, "camera");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "transform");
              -[JFXFaceAnchor setCameraTransform:](v16, "setCameraTransform:");

              objc_msgSend(v8, "camera");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "intrinsics");
              pv_focal_length_from_intrinsics(v52);
              LODWORD(v45) = v36;

              -[JFXFaceAnchor imageResolution](v16, "imageResolution");
              -[JFXFaceAnchor setFocalLength:](v16, "setFocalLength:", *(float *)&v45 / v37);
              objc_msgSend(v15, "normalizedFaceRect");
              -[JFXFaceAnchor setNormalizedFaceRect:](v16, "setNormalizedFaceRect:");
              JFXLog_DebugFaceAnchor();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:].cold.3(v8);

              JFXLog_DebugFaceAnchor();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:].cold.2(v15);

              JFXLog_DebugFaceAnchor();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:].cold.1(v16);

              goto LABEL_21;
            }

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_21:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (JFXFaceAnchor)initWithTransform:(__n128)a3 forFaceRect:(__n128)a4 needsMirroring:(__n128)a5 withFaceRectScaleFactor:(CGFloat)a6 frameImageResolution:(CGFloat)a7 captureInterfaceOrientation:(double)a8 preferredAnchorOrientation:(double)a9
{
  JFXFaceAnchor *v27;
  JFXFaceAnchor *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  CGPoint v35;
  objc_super v41;

  v41.receiver = a1;
  v41.super_class = (Class)JFXFaceAnchor;
  v27 = -[JFXFaceAnchor init](&v41, sel_init);
  v28 = v27;
  if (v27)
  {
    *(__n128 *)v27->_anon_70 = a2;
    *(__n128 *)&v27->_anon_70[16] = a3;
    *(__n128 *)&v27->_anon_70[32] = a4;
    *(__n128 *)&v27->_anon_70[48] = a5;
    if (a11)
    {
      +[JFXFaceAnchor CFX_mirrorPoseTransformLeftRight:](JFXFaceAnchor, "CFX_mirrorPoseTransformLeftRight:");
      *(_OWORD *)v28->_anon_70 = v29;
      *(_OWORD *)&v28->_anon_70[16] = v30;
      *(_OWORD *)&v28->_anon_70[32] = v31;
      *(_OWORD *)&v28->_anon_70[48] = v32;
    }
    *(_DWORD *)&v28->_anon_70[60] = 1065353216;
    v28->_imageResolution.width = a16;
    v28->_imageResolution.height = a17;
    v28->_faceRect.origin.x = a6;
    v28->_faceRect.origin.y = a7;
    v28->_faceRect.size.width = a8 * a14;
    v28->_faceRect.size.height = a9 * a15;
    v28->_captureInterfaceOrientation = a12;
    v33 = MEMORY[0x24BDAEE00];
    v34 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    *(_OWORD *)&v28[1].super.isa = *MEMORY[0x24BDAEE00];
    *(_OWORD *)&v28[1]._preferredAnchorOrientation = v34;
    v35 = *(CGPoint *)(v33 + 48);
    v28[1]._imageResolution = *(CGSize *)(v33 + 32);
    v28[1]._faceRect.origin = v35;
    v28->_focalLength = 0.0;
    v28->_preferredAnchorOrientation = a13;
  }
  return v28;
}

- (double)focalLengthForViewport:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  -[JFXFaceAnchor focalLength](self, "focalLength");
  if (width >= height)
    v6 = width;
  else
    v6 = height;
  return v6 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXFaceAnchor)initWithCoder:(id)a3
{
  id v4;
  JFXFaceAnchor *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)JFXFaceAnchor;
  v5 = -[JFXFaceAnchor init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJTFaceAnchorTransformKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", v5->_anon_70, 64);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJTFaceAnchorCameraTransformKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "getBytes:length:", &v5[1], 64);
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("kJTFaceAnchorFaceRectKey"));
    v5->_faceRect.origin.x = v8;
    v5->_faceRect.origin.y = v9;
    v5->_faceRect.size.width = v10;
    v5->_faceRect.size.height = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kJTFaceAnchorFocalLengthKey"));
    v5->_focalLength = v12;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("kJFXFaceAnchorNormalizedFaceRectKey"));
    v5->_normalizedFaceRect.origin.x = v13;
    v5->_normalizedFaceRect.origin.y = v14;
    v5->_normalizedFaceRect.size.width = v15;
    v5->_normalizedFaceRect.size.height = v16;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("kJFXFaceAnchorImageResolutionKey"));
    v5->_imageResolution.width = v17;
    v5->_imageResolution.height = v18;
    v5->_captureInterfaceOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJFXFaceAnchorCaptureInterfaceOrientationKey"));
    v5->_preferredAnchorOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJFXFaceAnchorPreferredAnchorOrientationKey"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unsigned __int8 *anon_70;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE50];
  anon_70 = self->_anon_70;
  v8 = a3;
  objc_msgSend(v4, "dataWithBytes:length:", anon_70, 64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("kJTFaceAnchorTransformKey"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self[1], 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kJTFaceAnchorCameraTransformKey"));

  objc_msgSend(v8, "encodeCGRect:forKey:", CFSTR("kJTFaceAnchorFaceRectKey"), self->_faceRect.origin.x, self->_faceRect.origin.y, self->_faceRect.size.width, self->_faceRect.size.height);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("kJTFaceAnchorFocalLengthKey"), self->_focalLength);
  objc_msgSend(v8, "encodeCGRect:forKey:", CFSTR("kJFXFaceAnchorNormalizedFaceRectKey"), self->_normalizedFaceRect.origin.x, self->_normalizedFaceRect.origin.y, self->_normalizedFaceRect.size.width, self->_normalizedFaceRect.size.height);
  objc_msgSend(v8, "encodeCGSize:forKey:", CFSTR("kJFXFaceAnchorImageResolutionKey"), self->_imageResolution.width, self->_imageResolution.height);
  objc_msgSend(v8, "encodeInteger:forKey:", self->_captureInterfaceOrientation, CFSTR("kJFXFaceAnchorCaptureInterfaceOrientationKey"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_preferredAnchorOrientation, CFSTR("kJFXFaceAnchorPreferredAnchorOrientationKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGSize size;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  CGPoint origin;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  size = self->_faceRect.size;
  *((_OWORD *)result + 3) = self->_faceRect.origin;
  *((CGSize *)result + 4) = size;
  v7 = *(_OWORD *)&self->_anon_70[32];
  v6 = *(_OWORD *)&self->_anon_70[48];
  v8 = *(_OWORD *)&self->_anon_70[16];
  *((_OWORD *)result + 7) = *(_OWORD *)self->_anon_70;
  *((_OWORD *)result + 8) = v8;
  *((_OWORD *)result + 9) = v7;
  *((_OWORD *)result + 10) = v6;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_focalLength;
  v9 = self->_normalizedFaceRect.size;
  *((_OWORD *)result + 5) = self->_normalizedFaceRect.origin;
  *((CGSize *)result + 6) = v9;
  *((_OWORD *)result + 2) = self->_imageResolution;
  *((_QWORD *)result + 3) = self->_captureInterfaceOrientation;
  *((_QWORD *)result + 2) = self->_preferredAnchorOrientation;
  v10 = *(_OWORD *)&self[1].super.isa;
  v11 = *(_OWORD *)&self[1]._preferredAnchorOrientation;
  origin = self[1]._faceRect.origin;
  *((_OWORD *)result + 13) = self[1]._imageResolution;
  *((CGPoint *)result + 14) = origin;
  *((_OWORD *)result + 11) = v10;
  *((_OWORD *)result + 12) = v11;
  return result;
}

- (__n128)screenRelativePosition
{
  float32x4_t v2;
  int32x4_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  NSObject *v11;
  NSObject *v12;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;

  objc_msgSend(a1, "transform");
  v15 = v2;
  objc_msgSend(a1, "cameraTransform");
  v5 = vzip1q_s32(v3, v4);
  v6 = vzip2q_s32(v3, v4);
  v9 = vzip1q_s32(v7, v8);
  v10 = vzip2q_s32(v7, v8);
  v14 = (float32x4_t)vzip2q_s32(v6, v10);
  v16 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v9), v15.f32[0]), (float32x4_t)vzip2q_s32(v5, v9), *(float32x2_t *)v15.f32, 1), (float32x4_t)vzip1q_s32(v6, v10), v15, 2);
  JFXLog_DebugFaceAnchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[JFXFaceAnchor screenRelativePosition].cold.2();
  v17 = vmlaq_laneq_f32(v16, v14, v15, 3);

  JFXLog_DebugFaceAnchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[JFXFaceAnchor screenRelativePosition].cold.1();

  return (__n128)v17;
}

- (double)rollAngle
{
  -[JFXFaceAnchor transform](self, "transform", 0);
  pv_simd_matrix_get_euler_angles();
  return 0.0;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[JFXFaceAnchor screenRelativePosition](self, "screenRelativePosition");
  NSStringFromSIMDFloat3();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXFaceAnchor faceRect](self, "faceRect");
  NSStringFromSIMDFloat4();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXFaceAnchor focalLength](self, "focalLength");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("position = %@ faceRect = %@ focalLength = %.3f preferred orientation: %s capture orientation: %s"), v4, v5, v6, PVInterfaceOrientationNames[-[JFXFaceAnchor preferredAnchorOrientation](self, "preferredAnchorOrientation")], PVInterfaceOrientationNames[-[JFXFaceAnchor captureInterfaceOrientation](self, "captureInterfaceOrientation")]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)CFX_mirrorPoseTransformLeftRight:(int8x16_t)a1
{
  a1.i32[1] = vnegq_f32((float32x4_t)vextq_s8(a1, a1, 4uLL)).u32[0];
  return *(double *)a1.i64;
}

- (__n128)transform
{
  return a1[7];
}

- (__n128)setTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (CGRect)faceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceRect.origin.x;
  y = self->_faceRect.origin.y;
  width = self->_faceRect.size.width;
  height = self->_faceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

- (CGRect)normalizedFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFaceRect.origin.x;
  y = self->_normalizedFaceRect.origin.y;
  width = self->_normalizedFaceRect.size.width;
  height = self->_normalizedFaceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedFaceRect:(CGRect)a3
{
  self->_normalizedFaceRect = a3;
}

- (double)focalLength
{
  return self->_focalLength;
}

- (void)setFocalLength:(double)a3
{
  self->_focalLength = a3;
}

- (__n128)cameraTransform
{
  return a1[11];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  result[14] = a5;
  return result;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (int64_t)preferredAnchorOrientation
{
  return self->_preferredAnchorOrientation;
}

- (void)setPreferredAnchorOrientation:(int64_t)a3
{
  self->_preferredAnchorOrientation = a3;
}

- (int64_t)captureInterfaceOrientation
{
  return self->_captureInterfaceOrientation;
}

- (void)setCaptureInterfaceOrientation:(int64_t)a3
{
  self->_captureInterfaceOrientation = a3;
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "from ARFrame %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v2, v3, "ARFaceAnchor: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "camera");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_2269A9000, v3, v4, "ARCamera: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4_1();
}

- (void)screenRelativePosition
{
  __n128 v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_7(v0);
  OUTLINED_FUNCTION_3_2(&dword_2269A9000, v1, v2, "transform.columns[3]: (%f,%f,%f,%f)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_1();
}

@end
