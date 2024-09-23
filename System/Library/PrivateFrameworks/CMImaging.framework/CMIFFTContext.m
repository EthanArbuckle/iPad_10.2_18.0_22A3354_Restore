@implementation CMIFFTContext

- (CMIFFTContext)init
{
  id v3;
  CMIFFTContext *v4;

  v3 = MTLCreateSystemDefaultDevice();
  v4 = -[CMIFFTContext initWithDevice:](self, "initWithDevice:", v3);

  return v4;
}

- (CMIFFTContext)initWithDevice:(id)a3
{
  id v5;
  CMIFFTContext *v6;
  CMIFFTContext *v7;
  uint64_t v8;
  NSBundle *bundle;
  NSBundle *v10;
  uint64_t v11;
  MTLLibrary *library;
  FigMetalContext *v13;
  FigMetalContext *figMetalContext;
  CMIFFTContext *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMIFFTContext;
  v6 = -[CMIFFTContext init](&v17, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  objc_storeStrong((id *)&v6->_device, a3);
  if (!v7->_device)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  bundle = v7->_bundle;
  v7->_bundle = (NSBundle *)v8;

  v10 = v7->_bundle;
  if (!v10)
    goto LABEL_8;
  v11 = objc_msgSend(v5, "newDefaultLibraryWithBundle:error:", v10, 0);
  library = v7->_library;
  v7->_library = (MTLLibrary *)v11;

  if (!v7->_library)
    goto LABEL_8;
  v13 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]([FigMetalContext alloc], "initWithbundle:andOptionalCommandQueue:", v7->_bundle, 0);
  figMetalContext = v7->_figMetalContext;
  v7->_figMetalContext = v13;

  if (v7->_figMetalContext)
    v15 = v7;
  else
LABEL_8:
    v15 = 0;

  return v15;
}

- (CMIFFTContext)initWithFigMetalContext:(id)a3
{
  id v5;
  CMIFFTContext *v6;
  CMIFFTContext *v7;
  CMIFFTContext *v8;
  void *v9;
  uint64_t v10;
  MTLDevice *device;
  uint64_t v12;
  NSBundle *bundle;
  uint64_t v14;
  MTLLibrary *library;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMIFFTContext;
  v6 = -[CMIFFTContext init](&v17, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_figMetalContext, a3);
    -[FigMetalContext device](v7->_figMetalContext, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_8;
    -[FigMetalContext device](v7->_figMetalContext, "device");
    v10 = objc_claimAutoreleasedReturnValue();
    device = v7->_device;
    v7->_device = (MTLDevice *)v10;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    bundle = v7->_bundle;
    v7->_bundle = (NSBundle *)v12;

    if (v7->_bundle)
    {
      -[FigMetalContext library](v7->_figMetalContext, "library");
      v8 = (CMIFFTContext *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[FigMetalContext library](v7->_figMetalContext, "library");
        v14 = objc_claimAutoreleasedReturnValue();
        library = v7->_library;
        v7->_library = (MTLLibrary *)v14;

        v8 = v7;
      }
    }
    else
    {
LABEL_8:
      v8 = 0;
    }
  }

  return v8;
}

- (void)prewarmWithTuningParameters:(id)a3
{

}

- (MTLDevice)device
{
  return self->_device;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (FigMetalContext)figMetalContext
{
  return self->_figMetalContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_figMetalContext, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
