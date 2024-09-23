@implementation FigMetalUtils

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)computeLinearTextureStride:(unint64_t)a3 format:(unint64_t)a4
{
  uint64_t v7;

  v7 = -[MTLDevice deviceLinearTextureAlignmentBytes](self->_device, "deviceLinearTextureAlignmentBytes");
  return (v7 + -[FigMetalUtils getPixelSizeInBytes:](self, "getPixelSizeInBytes:", a4) * a3 - 1) & -v7;
}

- (unint64_t)getPixelSizeInBytes:(unint64_t)a3
{
  MTLPixelFormatGetInfoForDevice();
  return 0;
}

- (FigMetalUtils)initWithDevice:(id)a3
{
  id v5;
  FigMetalUtils *v6;
  FigMetalUtils *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FigMetalUtils;
  v6 = -[FigMetalUtils init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (id)texture2DFromBuffer:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unint64_t)a6 offset:(unint64_t)a7 usage:(unint64_t)a8
{
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v14 = a3;
  v15 = -[FigMetalUtils computeLinearTextureStride:format:](self, "computeLinearTextureStride:format:", a4, a6);
  if (v15 * a5 + a7 > objc_msgSend(v14, "length"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
    v17 = 0;
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "setWidth:", a4);
      objc_msgSend(v17, "setHeight:", a5);
      objc_msgSend(v17, "setPixelFormat:", a6);
      objc_msgSend(v17, "setUsage:", a8);
      objc_msgSend(v17, "setResourceOptions:", objc_msgSend(v14, "resourceOptions"));
      v18 = (void *)objc_msgSend(v14, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", v17, a7, v15, v15 * a5);
      if (!v18)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v18 = 0;
    }
  }

  return v18;
}

@end
