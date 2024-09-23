@implementation CIImageProcessorInput

- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8
{
  CIImageProcessorInput *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CIImageProcessorInput;
  result = -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:](&v9, sel_initWithSurface_texture_digest_allowSRGB_bounds_context_, a3, a4.var0.var0, a4.var0.var2.var1, a5, a6, a8, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result)
  {
    result->_roiTileIndex = 0;
    result->_roiTileCount = 1;
  }
  return result;
}

- (CIImageProcessorInput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 roiTileIndex:(unint64_t)a8 roiTileCount:(unint64_t)a9 context:(void *)a10
{
  CIImageProcessorInput *result;

  result = -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:context:](self, "initWithSurface:texture:digest:allowSRGB:bounds:context:", a3, a4.var0.var0, a4.var0.var2.var1, a5, a6, a10, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result)
  {
    result->_roiTileIndex = a8;
    result->_roiTileCount = a9;
  }
  return result;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  if (self->super._surfaceLocked)
  {
    surface = self->super._surface;
    if (surface)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->super._surfaceLocked = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImageProcessorInput;
  -[CIImageProcessorInOut dealloc](&v4, sel_dealloc);
}

- (const)baseAddress
{
  __IOSurface *surface;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (CGRectIsEmpty(self->super._region))
    return 0;
  surface = self->super._surface;
  if (!surface)
    return 0;
  if (IOSurfaceGetPlaneCount(surface) >= 2)
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorInput baseAddress].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  if (IOSurfaceGetCompressionTypeOfPlane())
  {
    v12 = ci_logger_api();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorInput baseAddress].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  if (!self->super._surfaceLocked)
  {
    IOSurfaceLock(self->super._surface, 1u, 0);
    self->super._surfaceLocked = 1;
  }
  return IOSurfaceGetBaseAddress(self->super._surface);
}

- (MTLTexture)metalTexture
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  if (IOSurfaceGetPlaneCount(self->super._surface) < 2)
  {
    CIMetalFormatForFormat(-[CIImageProcessorInOut format](self, "format"), 0);
    -[CIImageProcessorInOut device](self, "device", 0);
    MTLPixelFormatGetInfoForDevice();
    v11 = ci_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorInput metalTexture].cold.2();
  }
  else
  {
    v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorInput metalTexture].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return 0;
}

- (unint64_t)roiTileIndex
{
  return self->_roiTileIndex;
}

- (unint64_t)roiTileCount
{
  return self->_roiTileCount;
}

- (void)baseAddress
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s a compressed CIProcessorInput cannot be accessed via its base address.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)metalTexture
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s The CIProcessorInput cannot be accessed via a Metal texture because the format %{public}s is not readable.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
