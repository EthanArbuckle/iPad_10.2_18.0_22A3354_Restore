@implementation FRCMetalBase

- (FRCMetalBase)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  id v7;
  id v8;
  FRCMetalBase *v9;
  FRCMetalBase *v10;
  MTLCommandQueue *v11;
  MTLDevice *v12;
  MTLDevice *device;
  MTLCommandQueue *commandQueue;
  void *v15;
  void *v16;
  uint64_t v17;
  MTLLibrary *mtlLibrary;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FRCMetalBase;
  v9 = -[FRCMetalBase init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_device, a3);
      v11 = (MTLCommandQueue *)v8;
    }
    else
    {
      v12 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      device = v10->_device;
      v10->_device = v12;

      v11 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v10->_device, "newCommandQueue");
    }
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = v11;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MTLDevice newLibraryWithURL:error:](v10->_device, "newLibraryWithURL:error:", v16, 0);
    mtlLibrary = v10->_mtlLibrary;
    v10->_mtlLibrary = (MTLLibrary *)v17;

  }
  return v10;
}

- (FRCMetalBase)init
{
  return -[FRCMetalBase initWithDevice:commmandQueue:](self, "initWithDevice:commmandQueue:", 0, 0);
}

- (id)createKernel:(id)a3
{
  return -[FRCMetalBase createKernel:constantValues:](self, "createKernel:constantValues:", a3, 0);
}

- (id)createKernel:(id)a3 constantValues:(id)a4
{
  id v6;
  id v7;
  MTLLibrary *mtlLibrary;
  uint64_t v9;
  void *v10;
  id v11;
  MTLDevice *device;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  mtlLibrary = self->_mtlLibrary;
  if (v7)
    v9 = -[MTLLibrary newFunctionWithName:constantValues:error:](mtlLibrary, "newFunctionWithName:constantValues:error:", v6, v7, 0);
  else
    v9 = -[MTLLibrary newFunctionWithName:](mtlLibrary, "newFunctionWithName:", v6);
  v10 = (void *)v9;
  if (!v9)
    NSLog(CFSTR(">> ERROR: Failed creating function %@"), v6);
  v16 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
  objc_msgSend(v11, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  objc_msgSend(v11, "setComputeFunction:", v10);
  device = self->_device;
  v15 = 0;
  v13 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](device, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, 0, &v16, &v15);
  if (!v13)
    NSLog(CFSTR(">> ERROR: Failed to create kernel: %@"), v6);

  return v13;
}

- (id)createRenderKernel:(id)a3 renderTargetFormat:(unint64_t)a4
{
  MTLLibrary *mtlLibrary;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  MTLDevice *device;
  void *v14;
  id v15;
  void *v16;
  id v18;

  mtlLibrary = self->_mtlLibrary;
  v7 = a3;
  v8 = (void *)-[MTLLibrary newFunctionWithName:](mtlLibrary, "newFunctionWithName:", CFSTR("texturedQuadVertex"));
  v9 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", v7);

  v10 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v10, "setVertexFunction:", v8);
  objc_msgSend(v10, "setFragmentFunction:", v9);
  objc_msgSend(v10, "colorAttachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPixelFormat:", a4);

  device = self->_device;
  v18 = 0;
  v14 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v10, &v18);
  v15 = v18;
  v16 = v15;
  if (!v14)
    NSLog(CFSTR("Failed to create pipeline state, error %@"), v15);

  return v14;
}

- (id)newVertexBuffer
{
  return (id)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &vertices, 32, 0);
}

- (id)newTextureCoordinateBufferWithWidth:(double)a3 height:(double)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[4];
  uint64_t v10;

  *(float32x2_t *)&v5 = vcvt_f32_f64(*(float64x2_t *)&a3);
  v6 = xmmword_1D428E530;
  DWORD1(v6) = DWORD1(v5);
  v7 = xmmword_1D428E530;
  LODWORD(v7) = v5;
  *((_QWORD *)&v5 + 1) = 1065353216;
  v10 = *MEMORY[0x1E0C80C00];
  v9[0] = v6;
  v9[1] = v5;
  v9[2] = xmmword_1D428E530;
  v9[3] = v7;
  return (id)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v9, 64, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
}

@end
