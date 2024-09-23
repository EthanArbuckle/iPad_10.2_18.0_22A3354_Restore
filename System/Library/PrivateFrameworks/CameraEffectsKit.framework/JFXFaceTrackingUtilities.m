@implementation JFXFaceTrackingUtilities

+ (double)pointOnFaceMesh
{
  return -2.44623217e-22;
}

+ (CGRect)faceRectInImageWithFaceAnchor:(id)a3 invertY:(BOOL)a4 interfaceOrientation:(int64_t)a5 imageResolution:(CGSize *)a6
{
  id v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v9 = a3;
  objc_msgSend(a1, "JFX_faceAnchorWithFaceAnchor:forInterfaceOrientation:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageResolution");
  a6->width = v11;
  a6->height = v12;
  objc_msgSend(a1, "JFX_projectionMatrixWithFaceAnchor:bufferSize:", v10);
  objc_msgSend(v9, "faceRect");

  objc_msgSend(v10, "transform");
  objc_msgSend(v10, "cameraTransform");
  if (pv_projected_screen_aligned_bounding_rect_around_point())
  {
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
  }
  else
  {
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (double)rollAngleFromFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "JFX_faceAnchorWithFaceAnchor:forInterfaceOrientation:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollAngle");
  v6 = v5;

  return v6;
}

+ (uint64_t)JFX_projectionMatrixWithFaceAnchor:(uint64_t)a3 bufferSize:(uint64_t)a4
{
  double v6;
  NSObject *v7;

  objc_msgSend(a5, "focalLengthForViewport:");
  pv_fov_for_focal_length_and_side(v6, a2);
  JFXLog_DebugFaceAnchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[JFXFaceTrackingUtilities JFX_projectionMatrixWithFaceAnchor:bufferSize:].cold.1();

  return pv_simd_matrix_make_perspective();
}

+ (BOOL)isFaceAnchorInRange:(id)a3
{
  float v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float v8;

  if (!a3)
    return 0;
  objc_msgSend(a3, "screenRelativePosition");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatForKey:", CFSTR("CFX_MaxCameraToFaceTrackingDistance"));
  v7 = v6;

  v8 = -0.8;
  if (v7 != 0.0)
    v8 = v7;
  return v4 > v8;
}

+ (void)adjustIntrinsics:(__n128)a3 forRenderSize:(double)a4 capturedSize:(double)a5 interfaceOrientation:(double)a6
{
  unint64_t v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BYTE v25[48];

  *(__n128 *)&v25[16] = a2;
  *(__n128 *)&v25[32] = a3;
  *(__n128 *)v25 = a1;
  v15 = a10 - 3;
  JFXLog_DebugFaceAnchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.5(a10, v16);

  if (v15 >= 0xFFFFFFFFFFFFFFFELL)
    v17 = a4;
  else
    v17 = a5;
  if (v15 >= 0xFFFFFFFFFFFFFFFELL)
    v18 = a5;
  else
    v18 = a4;
  v19 = a6 / a7 - v18 / v17;
  JFXLog_DebugFaceAnchor();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.4(v19 > 0.01, v20, a6 / a7 - v18 / v17);

  if (v19 <= 0.01)
    v21 = v18 / a6;
  else
    v21 = v17 / a7;
  JFXLog_DebugFaceAnchor();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && v21 == 1.0)
  {
    if (v23)
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.1(v22);

  }
  else
  {
    if (v23)
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.3();

    JFXLog_DebugFaceAnchor();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:].cold.2();

    pv_focal_length_from_intrinsics(*(simd_float3x3 *)v25);
    pv_principal_point_from_intrinsics(*(simd_float3x3 *)v25);
    pv_intrinsics_from_focal_length_and_principal_point();
  }
}

+ (CGSize)faceRectScaleFactorForInterfaceOrientation:(int64_t)a3 andDeviceInterfaceOrientation:(int64_t)a4
{
  int v4;
  double v5;
  double v6;
  CGSize result;

  v4 = ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(a4 - 1) < 2);
  v5 = 1.0;
  if (v4)
    v6 = 1.25;
  else
    v6 = 1.0;
  if (!v4)
    v5 = 1.25;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (id)JFX_faceAnchorWithFaceAnchor:(id)a3 forInterfaceOrientation:(int64_t)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  id v10;
  double v11;
  double v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "captureInterfaceOrientation");
  if (v6)
    a4 = v6;
  if (objc_msgSend(v5, "preferredAnchorOrientation") == a4
    || ((unint64_t)(a4 - 1) > 3 ? (v7 = 0) : (v7 = qword_226AB7328[a4 - 1]),
        (v8 = +[JFXRotationTransforms rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", 2, 4, v7)) == 0))
  {
    v10 = v5;
  }
  else
  {
    v9 = v8;
    v10 = (id)objc_msgSend(v5, "copy");
    objc_msgSend(v10, "transform");
    pv_simd_matrix_rotate();
    objc_msgSend(v10, "setTransform:");
    if ((v9 & 0xFFFFFFFD) == 1)
    {
      objc_msgSend(v10, "imageResolution");
      objc_msgSend(v10, "setImageResolution:", CGSizeRotate90(v11, v12));
    }
  }

  return v10;
}

+ (void)JFX_projectionMatrixWithFaceAnchor:bufferSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_2269A9000, v0, v1, "focalLength = (%f), fovy = (%f)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustIntrinsics:(os_log_t)log forRenderSize:capturedSize:interfaceOrientation:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - same orientation and size, bailing.", v1, 2u);
}

+ (void)adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_2269A9000, v0, v1, "adjustIntrinsics - renderSize - width: %f, height: %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_2269A9000, v0, v1, "adjustIntrinsics - capturedSize - width: %f, height: %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustIntrinsics:(double)a3 forRenderSize:capturedSize:interfaceOrientation:.cold.4(char a1, NSObject *a2, double a3)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("NO");
  if (a3 >= -0.01)
    v4 = CFSTR("NO");
  else
    v4 = CFSTR("YES");
  if ((a1 & 1) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v4 = CFSTR("NO");
  v6 = 138412802;
  v7 = v5;
  v8 = 2112;
  v9 = v4;
  if (!(a1 & 1 | (a3 < -0.01)))
    v3 = CFSTR("YES");
  v10 = 2112;
  v11 = v3;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - cropWidth: %@, cropHeight: %@, nocrop: %@", (uint8_t *)&v6, 0x20u);
}

+ (void)adjustIntrinsics:(uint64_t)a1 forRenderSize:(NSObject *)a2 capturedSize:interfaceOrientation:.cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "adjustIntrinsics - interface orientation: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
