@implementation EKUIPixelSizeInPoints

void __EKUIPixelSizeInPoints_block_invoke()
{
  double v0;
  uint64_t v1;
  const char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint32_t v5;
  double v6;
  uint64_t v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = _EKUIScaleFactor();
  if (v0 == 0.0)
  {
    v1 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(v8) = 0;
    v2 = "The main screen's scale is 0.0.  Will not calculate pixel size in points.";
    v3 = v1;
    v4 = OS_LOG_TYPE_ERROR;
    v5 = 2;
  }
  else
  {
    v6 = v0;
    *(double *)&EKUIPixelSizeInPoints_pixelSizeInPoints = 1.0 / v0;
    v7 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      return;
    v8 = 134218240;
    v9 = v6;
    v10 = 2048;
    v11 = EKUIPixelSizeInPoints_pixelSizeInPoints;
    v2 = "The main screen's scale is [%f].  The pixel size in points is [%f]";
    v3 = v7;
    v4 = OS_LOG_TYPE_DEBUG;
    v5 = 22;
  }
  _os_log_impl(&dword_1AF84D000, v3, v4, v2, (uint8_t *)&v8, v5);
}

@end
