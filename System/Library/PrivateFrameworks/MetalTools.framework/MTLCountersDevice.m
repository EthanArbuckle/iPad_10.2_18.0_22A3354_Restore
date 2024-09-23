@implementation MTLCountersDevice

- (MTLCountersDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLCountersDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLCountersDevice;
  v4 = -[MTLToolsDevice initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4);
  if (v4)
    v4->_APITimingEnabled = MTLGetEnvDefault() != 0;
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLCountersDevice;
  -[MTLToolsDevice dealloc](&v2, sel_dealloc);
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:functionType:", a3, a4);
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:inputsDescription:functionType:", a3, a4, a5);
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:functionType:", a3, a4);
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:inputsDescription:functionType:", a3, a4, a5);
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:functionType:", a3, a4);
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:inputsDescription:functionType:", a3, a4, a5);
}

- (id)newCommandQueue
{
  id result;
  id v4;
  MTLCountersCommandQueue *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    v4 = result;
    v5 = -[MTLCountersCommandQueue initWithCommandQueue:device:]([MTLCountersCommandQueue alloc], "initWithCommandQueue:device:", result, self);

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result;
  id v5;
  MTLCountersCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLCountersCommandQueue initWithCommandQueue:device:]([MTLCountersCommandQueue alloc], "initWithCommandQueue:device:", result, self);

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLCountersCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLCountersCommandQueue initWithCommandQueue:device:]([MTLCountersCommandQueue alloc], "initWithCommandQueue:device:", result, self);

    return v6;
  }
  return result;
}

- (id)newFence
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFence");
}

- (id)newHeapWithDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
}

- (id)newBufferWithDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDepthStencilStateWithDescriptor:", a3);
}

- (id)newTextureWithDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSamplerStateWithDescriptor:", a3);
}

- (id)newDefaultLibrary
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibrary");
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibraryWithBundle:error:", a3, a4);
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithFile:error:", a3, a4);
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithURL:error:", a3, a4);
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithData:error:", a3, a4);
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithSource:options:error:", a3, a4, a5);
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithSource:options:completionHandler:", a3, a4, a5);
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithDAG:functions:error:", a3, a4, a5);
}

- (id)newLibraryWithGraphs:(id)a3 functions:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithGraphs:functions:error:", a3, a4, a5);
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:error:", a3, a4);
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:completionHandler:", a3, a4);
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptorSPI:error:", a3, a4);
}

- (id)newLibraryWithGraphsSPI:(id)a3 functions:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithGraphsSPI:functions:error:", a3, a4, a5);
}

- (id)newDagStringWithGraphs:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDagStringWithGraphs:", a3);
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", a3, a4, a5);
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4, a5);
}

- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithCIFiltersForComputePipeline:imageFilterFunctionInfo:error:", a3, a4, a5);
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithURL:error:", a3, a4);
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:error:", a3, a4);
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:computeDescriptor:error:", a3, a4, a5);
}

- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryFromURL:error:", a3, a4);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:error:", a3, a4);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", a3, a4, a5, a6);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:completionHandler:", a3, a4);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:completionHandler:", a3, a4, a5);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:error:", a3, a4);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", a3, a4, a5, a6);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:completionHandler:", a3, a4);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:completionHandler:", a3, a4, a5);
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:error:", a3, a4);
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", a3, a4, a5, a6);
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:completionHandler:", a3, a4);
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:completionHandler:", a3, a4, a5);
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4, a5);
}

- (id)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  void *v8;

  v8 = 0;
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3), a4, &v8, a6);
  if (a5)
    *a5 = v8;
  return result;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[MTLCountersDevice _newRenderPipelineStateWithTileDescriptor:options:reflection:error:](self, "_newRenderPipelineStateWithTileDescriptor:options:reflection:error:", a3, 0x20000, &v5, a4);
}

- (void)_newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];

  v8 = (void *)objc_msgSend(a3, "copy");
  v9 = -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", v8);
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__MTLCountersDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v11[3] = &unk_24F7945F0;
  v11[4] = a5;
  objc_msgSend(v10, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", v9, a4, v11);

}

uint64_t __89__MTLCountersDevice__newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__MTLCountersDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLCountersDevice _newRenderPipelineStateWithTileDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithTileDescriptor:options:completionHandler:", a3, 0x20000, v4);
}

uint64_t __80__MTLCountersDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__MTLCountersDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_24F7945F0;
  v5[4] = a5;
  -[MTLCountersDevice _newRenderPipelineStateWithTileDescriptor:options:completionHandler:](self, "_newRenderPipelineStateWithTileDescriptor:options:completionHandler:", a3, a4, v5);
}

uint64_t __88__MTLCountersDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithIOSurface:", a3);
}

- (BOOL)areWritableHeapsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areWritableHeapsEnabled");
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setWritableHeapsEnabled:", a3);
}

- (BOOL)APITimingEnabled
{
  return self->_APITimingEnabled;
}

@end
