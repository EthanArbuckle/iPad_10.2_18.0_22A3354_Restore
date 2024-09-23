@implementation CIImageProcessorOutput

- (CIImageProcessorOutput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8 tileTask:(void *)a9
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v15;
  void *var1;
  unint64_t var0;
  void *v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  if (a3)
  {
    height = a7.size.height;
    width = a7.size.width;
    y = a7.origin.y;
    x = a7.origin.x;
    v15 = a6;
    var1 = a4.var0.var2.var1;
    var0 = a4.var0.var0;
    v20 = a9;
    if (a9)
      v20 = (void *)CI::Object::ref((uint64_t)a9);
    self->_task = v20;
    v30.receiver = self;
    v30.super_class = (Class)CIImageProcessorOutput;
    return -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:](&v30, sel_initWithSurface_texture_digest_allowSRGB_bounds_context_, a3, var0, var1, a5, v15, a8, x, y, width, height);
  }
  else
  {
    v22 = ci_logger_api();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorOutput initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    return 0;
  }
}

- (void)dealloc
{
  __IOSurface *surface;
  CI::Object *task;
  objc_super v5;

  self->_cmdBuffer = 0;
  if (self->super._surfaceLocked)
  {
    surface = self->super._surface;
    if (surface)
    {
      IOSurfaceUnlock(surface, 0, 0);
      self->super._surfaceLocked = 0;
    }
  }
  task = (CI::Object *)self->_task;
  if (task)
    CI::Object::unref(task);
  self->_task = 0;
  v5.receiver = self;
  v5.super_class = (Class)CIImageProcessorOutput;
  -[CIImageProcessorInOut dealloc](&v5, sel_dealloc);
}

- (void)baseAddress
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s a compressed CIProcessorOutput cannot be accessed via its base address.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
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
      -[CIImageProcessorOutput metalTexture].cold.2();
  }
  else
  {
    v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorOutput metalTexture].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return 0;
}

- (MTLCommandBuffer)metalCommandBuffer
{
  int v3;
  _QWORD *context;
  MTLCommandBuffer *cmdBuffer;
  int v6;
  MTLDevice *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MTLDevice *v19;

  if (self->_cmdBuffer)
    return self->_cmdBuffer;
  v3 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->super._context + 16))(self->super._context, a2);
  context = self->super._context;
  if (v3 == 77)
  {
    cmdBuffer = (MTLCommandBuffer *)context[224];
LABEL_8:
    self->_cmdBuffer = cmdBuffer;
    goto LABEL_9;
  }
  v6 = (*(uint64_t (**)(_QWORD *))(*context + 16))(context);
  v7 = -[CIImageProcessorInOut device](self, "device");
  if (v6 != 76)
  {
    if ((v9 & 1) == 0)
    {
      v19 = v7;
      {
        singletonMTLCommandQueue(objc_object  {objcproto9MTLDevice}*)::commandQueue = (uint64_t)CIMetalCommandQueueCreate((uint64_t)"com.apple.CoreImage", v19);
      }
    }
    cmdBuffer = (MTLCommandBuffer *)CIMetalCommandBufferCreate((uint64_t)"com.apple.CoreImage", (void *)singletonMTLCommandQueue(objc_object  {objcproto9MTLDevice}*)::commandQueue, 0, 0);
    goto LABEL_8;
  }
  v8 = CIMetalCommandQueueCreate((uint64_t)"com.apple.CoreImage", v7);
  self->_cmdBuffer = (MTLCommandBuffer *)CIMetalCommandBufferCreate((uint64_t)"com.apple.CoreImage", v8, 0, 0);
  CFRelease(v8);
  cmdBuffer = self->_cmdBuffer;
LABEL_9:
  if ((-[MTLCommandBuffer retainedReferences](cmdBuffer, "retainedReferences") & 1) == 0)
  {
    v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CIImageProcessorOutput metalCommandBuffer].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  return self->_cmdBuffer;
}

- (BOOL)metalCommandBufferRequested
{
  return self->_cmdBuffer != 0;
}

- (CGColorSpace)workingColorSpace
{
  void *context;

  context = self->super._context;
  if (context)
    return (CGColorSpace *)*((_QWORD *)context + 3);
  else
    return 0;
}

- (unsigned)contextID
{
  void *context;

  context = self->super._context;
  if (context)
    LODWORD(context) = (*(uint64_t (**)(void *))(*(_QWORD *)context + 272))(context);
  return context;
}

- (id)metalContext
{
  void *context;
  CIContext *metalContext;
  CI::MetalContext *v5;

  context = self->super._context;
  if (!context)
    return 0;
  metalContext = self->super._metalContext;
  if (!metalContext)
  {
    if ((*(unsigned int (**)(void *, SEL))(*(_QWORD *)context + 16))(context, a2) == 77)
    {
      v5 = (CI::MetalContext *)operator new();
      CI::MetalContext::MetalContext(v5, (const CI::MetalContext *)self->super._context);
    }
    else
    {
      if ((*(unsigned int (**)(void *))(*(_QWORD *)self->super._context + 16))(self->super._context) != 76)
      {
        metalContext = 0;
        goto LABEL_10;
      }
      v5 = (CI::MetalContext *)operator new();
      CI::MetalContext::MetalContext(v5, (const CI::Context *)self->super._context, "com.apple.CoreImage");
    }
    (*(void (**)(CI::MetalContext *, uint64_t))(*(_QWORD *)v5 + 224))(v5, 0xFFFFFFFFLL);
    metalContext = -[CIContext _initWithInternalRepresentation:]([CIContext alloc], "_initWithInternalRepresentation:", v5);
    CI::Object::unref(v5);
LABEL_10:
    self->super._metalContext = metalContext;
  }
  return metalContext;
}

- (void)setError:(id)a3
{
  CI::TileTask *task;

  if (a3)
  {
    task = (CI::TileTask *)self->_task;
    if (task)
      CI::TileTask::setCommandBufferError(task, a3);
  }
}

- (void)initWithSurface:(uint64_t)a3 texture:(uint64_t)a4 digest:(uint64_t)a5 allowSRGB:(uint64_t)a6 bounds:(uint64_t)a7 context:(uint64_t)a8 tileTask:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s surface is nil.", a5, a6, a7, a8, 2u);
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
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s The CIProcessorOutput cannot be accessed via a Metal texture because the format %{public}s is not writable.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)metalCommandBuffer
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s command buffer provided to processor does not hold strong references to resources.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
