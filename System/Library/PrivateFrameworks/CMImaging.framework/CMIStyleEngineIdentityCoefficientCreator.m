@implementation CMIStyleEngineIdentityCoefficientCreator

- (CMIStyleEngineIdentityCoefficientCreator)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineIdentityCoefficientCreator *v5;
  CMIStyleEngineIdentityCoefficientCreator *v6;
  CMIStyleEngineIdentityCoefficientCreator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIStyleEngineIdentityCoefficientCreator;
  v5 = -[CMIStyleEngineIdentityCoefficientCreator init](&v9, sel_init);
  v6 = v5;
  if (!v5 || -[CMIStyleEngineIdentityCoefficientCreator _compileShaders:](v5, "_compileShaders:", v4))
  {
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineIdentityCoefficientCreator::CreateF32"), 0);
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v6 = self->_computePipelineStates[0];
  self->_computePipelineStates[0] = v5;

  if (self->_computePipelineStates[0]
    && (objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineIdentityCoefficientCreator::CreateF16"), 0), v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), v8 = self->_computePipelineStates[1], self->_computePipelineStates[1] = v7, v8, self->_computePipelineStates[1]))
  {
    v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  MTLComputePipelineState *v5;
  id WeakRetained;
  unsigned int polynomialCount;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  int v18;
  uint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  int64x2_t v23;

  v4 = a3;
  v5 = self->_computePipelineStates[self->_isF16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_outputBuffer);
  if (WeakRetained
    && (polynomialCount = self->_polynomialCount, WeakRetained, polynomialCount)
    && (objc_msgSend(v4, "blitCommandEncoder"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_loadWeakRetained((id *)&self->_outputBuffer);
    objc_msgSend(v9, "fillBuffer:range:value:", v10, 0, objc_msgSend(v10, "length"), 0);

    objc_msgSend(v9, "endEncoding");
    objc_msgSend(v4, "computeCommandEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "setComputePipelineState:", v5);
      v13 = objc_loadWeakRetained((id *)&self->_outputBuffer);
      objc_msgSend(v12, "setBuffer:offset:atIndex:", v13, 0, 0);

      objc_msgSend(v12, "setBytes:length:atIndex:", &self->_polynomialCount, 4, 1);
      v14 = objc_loadWeakRetained((id *)&self->_outputBuffer);
      v15 = objc_msgSend(v14, "length");
      if (self->_isF16)
        v16 = 1;
      else
        v16 = 2;
      v17 = 3 * (v15 / ((unint64_t)(3 * self->_polynomialCount) << v16));

      v22 = v17;
      v23 = vdupq_n_s64(1uLL);
      v20 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v5, "maxTotalThreadsPerThreadgroup");
      v21 = v23;
      objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", &v22, &v20);
      objc_msgSend(v12, "endEncoding");

      v18 = 0;
    }
    else
    {
      FigDebugAssert3();
      v18 = FigSignalErrorAt();

    }
  }
  else
  {
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
  }

  return v18;
}

- (MTLBuffer)outputBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_outputBuffer);
}

- (void)setOutputBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_outputBuffer, a3);
}

- (BOOL)isF16
{
  return self->_isF16;
}

- (void)setIsF16:(BOOL)a3
{
  self->_isF16 = a3;
}

- (unsigned)polynomialCount
{
  return self->_polynomialCount;
}

- (void)setPolynomialCount:(unsigned int)a3
{
  self->_polynomialCount = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_destroyWeak((id *)&self->_outputBuffer);
  v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
