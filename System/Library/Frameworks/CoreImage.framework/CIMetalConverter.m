@implementation CIMetalConverter

- (CIMetalConverter)initWithDevice:(id)a3 kernelName:(id)a4
{
  CIMetalConverter *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CIMetalConverter;
  v6 = -[CIMetalConverter init](&v9, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v7 = (void *)objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
    v6->_convertToTexture = (MTLFunction *)objc_msgSend(v7, "newFunctionWithName:", objc_msgSend(a4, "stringByAppendingString:", CFSTR("_texture")));
    v6->_convertToBuffer = (MTLFunction *)objc_msgSend(v7, "newFunctionWithName:", objc_msgSend(a4, "stringByAppendingString:", CFSTR("_buffer")));

    if (!v6->_convertToTexture || !v6->_convertToBuffer)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIMetalConverter;
  -[CIMetalConverter dealloc](&v3, sel_dealloc);
}

- (void)encodeToCommandBuffer:(id)a3 sourceBuffer:(id)a4 sourceRowBytes:(unint64_t)a5 destinationTexture:(id)a6
{
  int v7;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[6];
  _QWORD v20[3];
  _QWORD v21[3];
  _DWORD v22[3];

  v7 = a5;
  v11 = (void *)objc_msgSend(a3, "computeCommandEncoder");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", self->_convertToTexture, 0);
  objc_msgSend(v11, "setComputePipelineState:", v13);
  v14 = objc_msgSend(a6, "width");
  v15 = objc_msgSend(a6, "height");
  v22[0] = v14;
  v22[1] = v7;
  v22[2] = 0;
  objc_msgSend(v11, "setBytes:length:atIndex:", v22, 12, 0);
  objc_msgSend(v11, "setBuffer:offset:atIndex:", a4, 0, 1);
  objc_msgSend(v12, "addObject:", a4);
  objc_msgSend(v11, "setTexture:atIndex:", a6, 0);
  objc_msgSend(v12, "addObject:", a6);
  v16 = objc_msgSend(v13, "threadExecutionWidth");
  v17 = objc_msgSend(v13, "maxTotalThreadsPerThreadgroup");
  v18 = objc_msgSend(v13, "threadExecutionWidth");
  v21[0] = (v14 + 4 * v16 - 1) / (unint64_t)(4 * v16);
  v21[1] = (v15 + v17 / v18 - 1) / (v17 / v18);
  v21[2] = 1;
  v20[0] = v16;
  v20[1] = v17 / v18;
  v20[2] = 1;
  objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", v21, v20);
  objc_msgSend(v11, "endEncoding");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__CIMetalConverter_encodeToCommandBuffer_sourceBuffer_sourceRowBytes_destinationTexture___block_invoke;
  v19[3] = &unk_1E2EC4950;
  v19[4] = v12;
  v19[5] = v13;
  objc_msgSend(a3, "addCompletedHandler:", v19);
}

void __89__CIMetalConverter_encodeToCommandBuffer_sourceBuffer_sourceRowBytes_destinationTexture___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

}

- (void)encodeToCommandBuffer:(id)a3 sourceBuffer:(id)a4 sourceRowBytes:(unint64_t)a5 destinationBuffer:(id)a6 destinationRowBytes:(unint64_t)a7 destinationSize:(id *)a8
{
  int v9;
  int v11;
  void *v15;
  void *v16;
  void *v17;
  unint64_t var1;
  unint64_t var0;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v23[6];
  _QWORD v24[3];
  _QWORD v25[3];
  _DWORD v26[3];

  v9 = a7;
  v11 = a5;
  v15 = (void *)objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", self->_convertToBuffer, 0);
  objc_msgSend(v15, "setComputePipelineState:", v17);
  var0 = a8->var0;
  var1 = a8->var1;
  v26[0] = var0;
  v26[1] = v11;
  v26[2] = v9;
  objc_msgSend(v15, "setBytes:length:atIndex:", v26, 12, 0);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", a4, 0, 1);
  objc_msgSend(v16, "addObject:", a4);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", a6, 0, 2);
  objc_msgSend(v16, "addObject:", a6);
  v20 = objc_msgSend(v17, "threadExecutionWidth");
  v21 = objc_msgSend(v17, "maxTotalThreadsPerThreadgroup");
  v22 = objc_msgSend(v17, "threadExecutionWidth");
  v25[0] = (var0 + 4 * v20 - 1) / (4 * v20);
  v25[1] = (var1 + v21 / v22 - 1) / (v21 / v22);
  v25[2] = 1;
  v24[0] = v20;
  v24[1] = v21 / v22;
  v24[2] = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v25, v24);
  objc_msgSend(v15, "endEncoding");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __124__CIMetalConverter_encodeToCommandBuffer_sourceBuffer_sourceRowBytes_destinationBuffer_destinationRowBytes_destinationSize___block_invoke;
  v23[3] = &unk_1E2EC4950;
  v23[4] = v16;
  v23[5] = v17;
  objc_msgSend(a3, "addCompletedHandler:", v23);
}

void __124__CIMetalConverter_encodeToCommandBuffer_sourceBuffer_sourceRowBytes_destinationBuffer_destinationRowBytes_destinationSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

}

@end
