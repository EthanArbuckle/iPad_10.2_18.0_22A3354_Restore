@implementation CMIStyleEngineSolveLinearSystem

- (CMIStyleEngineSolveLinearSystem)initWithMetalContext:(id)a3 systemCount:(unsigned int)a4 lhsSize:(unsigned int)a5 rhsSize:(unsigned int)a6
{
  id v10;
  CMIStyleEngineSolveLinearSystem *v11;
  uint64_t v12;
  MTLDevice *device;
  CMIStyleEngineSolveLinearSystem *v14;
  objc_super v16;

  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMIStyleEngineSolveLinearSystem;
  v11 = -[CMIStyleEngineSolveLinearSystem init](&v16, sel_init);
  if (!v11)
    goto LABEL_9;
  objc_msgSend(v10, "device");
  v12 = objc_claimAutoreleasedReturnValue();
  device = v11->_device;
  v11->_device = (MTLDevice *)v12;

  if (!v11->_device)
    goto LABEL_9;
  if (a4
    && (v11->_systemCount = a4, a5)
    && (v11->_lhsSize = a5, a6)
    && (v11->_rhsSize = a6, !-[CMIStyleEngineSolveLinearSystem _compileShaders:](v11, "_compileShaders:", v10)))
  {
    v14 = v11;
  }
  else
  {
LABEL_9:
    FigDebugAssert3();
    v14 = 0;
  }

  return v14;
}

- (int)_compileShaders:(id)a3
{
  MTLComputePipelineState *v4;
  MTLComputePipelineState *checkStatusComputePipelineState;

  objc_msgSend(a3, "computePipelineStateFor:constants:", CFSTR("StyleEngineSolveLinearSystem::CheckSolveStatus"), 0);
  v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  checkStatusComputePipelineState = self->_checkStatusComputePipelineState;
  self->_checkStatusComputePipelineState = v4;

  if (self->_checkStatusComputePipelineState)
    return 0;
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)solveLinearSystem:(id)a3
{
  return 11;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  int v18;
  uint64_t v20;
  int64x2_t v21;
  uint64_t v22;
  int64x2_t v23;

  v4 = a3;
  -[CMIStyleEngineSolveLinearSystem outputCoefficients](self, "outputCoefficients");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5, v7 = objc_loadWeakRetained((id *)&self->_outputStatus), v7, v6, v7)
    && (objc_msgSend(v4, "blitCommandEncoder"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_loadWeakRetained((id *)&self->_outputStatus);
    objc_msgSend(v9, "fillBuffer:range:value:", v10, 0, objc_msgSend(v10, "length"), 0);

    -[CMIStyleEngineSolveLinearSystem inputStatusBuffer](self, "inputStatusBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIStyleEngineSolveLinearSystem inputStatusBuffer](self, "inputStatusBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fillBuffer:range:value:", v11, 0, objc_msgSend(v12, "length"), 0);

    objc_msgSend(v9, "endEncoding");
    v13 = -[CMIStyleEngineSolveLinearSystem solveLinearSystem:](self, "solveLinearSystem:", v4);
    if (v13)
    {
      v18 = v13;
      FigDebugAssert3();
    }
    else
    {
      objc_msgSend(v4, "computeCommandEncoder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "setComputePipelineState:", self->_checkStatusComputePipelineState);
        WeakRetained = objc_loadWeakRetained((id *)&self->_outputStatus);
        objc_msgSend(v15, "setBuffer:offset:atIndex:", WeakRetained, 0, 1);

        -[CMIStyleEngineSolveLinearSystem inputStatusBuffer](self, "inputStatusBuffer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBuffer:offset:atIndex:", v17, 0, 0);

        v22 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");
        v23 = vdupq_n_s64(1uLL);
        v20 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_checkStatusComputePipelineState, "maxTotalThreadsPerThreadgroup");
        v21 = v23;
        objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", &v22, &v20);
        objc_msgSend(v15, "endEncoding");
        v18 = 0;
      }
      else
      {
        FigDebugAssert3();
        v18 = FigSignalErrorAt();
      }

    }
  }
  else
  {
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
  }

  return v18;
}

+ (id)createWithMetalContext:(id)a3 systemCount:(unsigned int)a4 lhsSize:(unsigned int)a5 rhsSize:(unsigned int)a6 solverType:(unint64_t)a7
{
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v12 = a3;
  if (a7 <= 2)
    v7 = (void *)objc_msgSend(objc_alloc(*off_1E94EAF98[a7]), "initWithMetalContext:systemCount:lhsSize:rhsSize:", v12, v11, v10, v9);

  return v7;
}

- (MTLBuffer)inputLHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
}

- (void)setInputLHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputLHSBuffer, a3);
}

- (MTLBuffer)inputRHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
}

- (void)setInputRHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputRHSBuffer, a3);
}

- (MTLBuffer)inputStatusBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
}

- (void)setInputStatusBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputStatusBuffer, a3);
}

- (MTLBuffer)outputStatus
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_outputStatus);
}

- (void)setOutputStatus:(id)a3
{
  objc_storeWeak((id *)&self->_outputStatus, a3);
}

- (MTLBuffer)outputCoefficients
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_outputCoefficients);
}

- (void)setOutputCoefficients:(id)a3
{
  objc_storeWeak((id *)&self->_outputCoefficients, a3);
}

- (unsigned)systemCount
{
  return self->_systemCount;
}

- (unsigned)lhsSize
{
  return self->_lhsSize;
}

- (unsigned)rhsSize
{
  return self->_rhsSize;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_outputCoefficients);
  objc_destroyWeak((id *)&self->_outputStatus);
  objc_destroyWeak((id *)&self->_inputStatusBuffer);
  objc_destroyWeak((id *)&self->_inputRHSBuffer);
  objc_destroyWeak((id *)&self->_inputLHSBuffer);
  objc_storeStrong((id *)&self->_checkStatusComputePipelineState, 0);
}

@end
