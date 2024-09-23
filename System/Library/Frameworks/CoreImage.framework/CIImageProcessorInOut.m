@implementation CIImageProcessorInOut

- (CIImageProcessorInOut)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v14;
  void *var1;
  const void *var0;
  CIImageProcessorInOut *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MTLTexture *v29;
  objc_super v31;
  CGRect v32;

  if (a8)
  {
    height = a7.size.height;
    width = a7.size.width;
    y = a7.origin.y;
    x = a7.origin.x;
    v14 = a6;
    var1 = a4.var0.var2.var1;
    var0 = (const void *)a4.var0.var0;
    v31.receiver = self;
    v31.super_class = (Class)CIImageProcessorInOut;
    v19 = -[CIImageProcessorInOut init](&v31, sel_init);
    if (v19)
    {
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v19->_region = CGRectIntegral(v32);
      if (a3)
      {
        CFRetain(a3);
        v19->_surface = a3;
        v19->_usesSRGB = 0;
        if (v14 && IOSurfaceGetPixelFormat(a3) == 1111970369)
          v19->_usesSRGB = 1;
      }
      else
      {
        v19->_surface = 0;
        v19->_usesSRGB = 0;
      }
      v19->_context = (void *)CI::Object::ref((uint64_t)a8);
      if ((*(unsigned int (**)(void *))(*(_QWORD *)a8 + 16))(a8) == 77 && var1 == 0)
      {
        if (var0)
          v29 = (MTLTexture *)CFRetain(var0);
        else
          v29 = 0;
        v19->_mtlTexture = v29;
      }
      v19->_surfaceLocked = 0;
      v19->_digest = a5;
    }
  }
  else
  {
    v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    return 0;
  }
  return v19;
}

- (void)dealloc
{
  __IOSurface *surface;
  CI::Object *context;
  MTLTexture *mtlTexture;
  objc_super v6;

  surface = self->_surface;
  if (surface)
    CFRelease(surface);
  self->_surface = 0;
  context = (CI::Object *)self->_context;
  if (context)
    CI::Object::unref(context);
  mtlTexture = self->_mtlTexture;
  if (mtlTexture)
    CFRelease(mtlTexture);
  self->_mtlTexture = 0;

  self->_metalContext = 0;
  v6.receiver = self;
  v6.super_class = (Class)CIImageProcessorInOut;
  -[CIImageProcessorInOut dealloc](&v6, sel_dealloc);
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (BOOL)usesSRGBTransferFunction
{
  return self->_usesSRGB;
}

- (MTLDevice)device
{
  int v3;
  id *context;
  id *v6;
  MTLDevice *v7;
  unsigned __int8 v8;

  v3 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_context + 16))(self->_context, a2);
  context = (id *)self->_context;
  if (v3 == 77)
    return (MTLDevice *)CI::MetalContext::device(context);
  if ((*((unsigned int (**)(id *))*context + 2))(context) == 76)
  {
    v6 = (id *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_context + 120))(self->_context);
    v7 = (MTLDevice *)CI::MetalContext::device(v6);
    if (v6)
      CI::Object::unref((CI::Object *)v6);
  }
  else
  {
    {
      singletonMTLDevice(CI::Context const*)::device = (uint64_t)CIMetalCopyDefaultDevice();
    }
    return (MTLDevice *)singletonMTLDevice(CI::Context const*)::device;
  }
  return v7;
}

- (__CVBuffer)pixelBuffer
{
  __IOSurface *surface;
  __CVBuffer *result;
  CVPixelBufferRef pixelBufferOut;

  if (CGRectIsEmpty(self->_region))
    return 0;
  surface = self->_surface;
  if (!surface)
    return 0;
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, surface, 0, &pixelBufferOut);
  result = pixelBufferOut;
  if (pixelBufferOut)
  {
    CFAutorelease(pixelBufferOut);
    return pixelBufferOut;
  }
  return result;
}

- (unint64_t)bytesPerRow
{
  __IOSurface *surface;

  if (CGRectIsEmpty(self->_region))
    return 0;
  surface = self->_surface;
  if (!surface)
    return 0;
  else
    return IOSurfaceGetBytesPerRow(surface);
}

- (int)format
{
  __IOSurface *v3;
  __IOSurface *surface;

  if (CGRectIsEmpty(self->_region))
    return 0;
  surface = self->_surface;
  if (!surface)
    return 0;
  else
    return CI::format_from_IOSurface(surface, v3);
}

- (unint64_t)digest
{
  if (CGRectIsEmpty(self->_region) || !self->_surface)
    return 0;
  else
    return self->_digest;
}

- (id)description
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  -[CIImageProcessorInOut region](self, "region");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = CI::name_for_format(-[CIImageProcessorInOut format](self, "format"));
  if (v11)
    v12 = v11;
  else
    v12 = "";
  v13 = objc_msgSend((id)objc_opt_class(), "description");
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (CGRectIsInfinite(v19))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %s region [infinite]>"), v13, self, v12, v15, v16, v17, v18);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  if (CGRectIsEmpty(v20))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %s region [empty]>"), v13, self, v12, v15, v16, v17, v18);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %s region [%g %g %g %g]>"), v13, self, v12, *(_QWORD *)&v4, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10);
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CIImageProcessorInOut_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __41__CIImageProcessorInOut_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __IOSurface *v11;
  IOSurfaceID ID;
  const char *v13;
  int v14;
  uint64_t v15;
  const char *v16;
  int v17;
  CGRect v19;
  CGRect v20;

  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  v5 = CI::name_for_format(objc_msgSend(*(id *)(a1 + 32), "format"));
  fprintf(a2, " %s", v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 48))
  {
    fwrite("(sRGB)", 6uLL, 1uLL, a2);
    v6 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(double *)(v6 + 8);
  v8 = *(double *)(v6 + 16);
  v9 = *(double *)(v6 + 24);
  v10 = *(double *)(v6 + 32);
  v19.origin.x = v7;
  v19.origin.y = v8;
  v19.size.width = v9;
  v19.size.height = v10;
  if (CGRectIsInfinite(v19))
    fwrite(" region [infinite]>", 0x13uLL, 1uLL, a2);
  v20.origin.x = v7;
  v20.origin.y = v8;
  v20.size.width = v9;
  v20.size.height = v10;
  if (CGRectIsEmpty(v20))
    fwrite(" region [empty]>", 0x10uLL, 1uLL, a2);
  else
    fprintf(a2, " region [%g %g %g %g]>", v7, v8, v9, v10);
  v11 = *(__IOSurface **)(*(_QWORD *)(a1 + 32) + 40);
  ID = IOSurfaceGetID(v11);
  fprintf(a2, "\n    IOSurface: %p(%d)", v11, ID);
  v13 = (const char *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 56) + 304))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v14 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 56) + 272))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  fprintf(a2, "\n    CIContext: (%s context %d", v13, v14);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v17 = *(unsigned __int8 *)(v15 + 236);
  v16 = (const char *)(v15 + 236);
  if (v17)
    return fprintf(a2, ":%s)", v16);
  else
    return fputc(41, a2);
}

- (id)debugQuickLookObject
{
  CIImage *v2;
  CIImage *v3;
  SEL v4;
  objc_class *v5;

  v2 = +[CIImage imageWithIOSurface:options:](CIImage, "imageWithIOSurface:options:", self->_surface, 0);
  if (v2
    && ((v3 = v2,
         v4 = NSSelectorFromString(CFSTR("initWithCIImage:")),
         (v5 = NSClassFromString(CFSTR("UIImage"))) != 0)
     || (v5 = NSClassFromString(CFSTR("NSBitmapImageRep"))) != 0)
    && v4)
  {
    return (id)objc_msgSend([v5 alloc], "performSelector:withObject:", v4, v3);
  }
  else
  {
    return 0;
  }
}

- (CGRect)region
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_region.origin.x;
  y = self->_region.origin.y;
  width = self->_region.size.width;
  height = self->_region.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)initWithSurface:(uint64_t)a3 texture:(uint64_t)a4 digest:(uint64_t)a5 allowSRGB:(uint64_t)a6 bounds:(uint64_t)a7 context:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s context is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
