@implementation CMIStyleEngineCoefficientConverter

- (CMIStyleEngineCoefficientConverter)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineCoefficientConverter *v5;
  CMIStyleEngineCoefficientConverter *v6;
  CMIStyleEngineCoefficientConverter *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIStyleEngineCoefficientConverter;
  v5 = -[CMIStyleEngineCoefficientConverter init](&v9, sel_init);
  v6 = v5;
  if (!v5 || -[CMIStyleEngineCoefficientConverter _compileShaders:](v5, "_compileShaders:", v4))
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
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *kernel;

  v4 = a3;
  -[CMIStyleEngineCoefficientConverter shaderName](self, "shaderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "computePipelineStateFor:constants:", v5, 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();

  kernel = self->_kernel;
  self->_kernel = v6;

  if (self->_kernel)
    return 0;
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v10;
  int64x2_t v11;
  unint64_t v12;
  int64x2_t v13;

  v4 = a3;
  v5 = v4;
  if (self->_inputBuffer
    && self->_outputBuffer
    && (objc_msgSend(v4, "computeCommandEncoder"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "setComputePipelineState:", self->_kernel);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_inputBuffer, 0, 0);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_outputBuffer, 0, 1);
    v12 = -[CMIStyleEngineCoefficientConverter numberOfCoefficients](self, "numberOfCoefficients");
    v13 = vdupq_n_s64(1uLL);
    v10 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_kernel, "maxTotalThreadsPerThreadgroup");
    v11 = v13;
    objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", &v12, &v10);
    objc_msgSend(v7, "endEncoding");

    v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    v8 = FigSignalErrorAt();
  }

  return v8;
}

- (MTLBuffer)inputBuffer
{
  return self->_inputBuffer;
}

- (void)setInputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inputBuffer, a3);
}

- (MTLBuffer)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuffer, a3);
}

- (NSString)shaderName
{
  return self->_shaderName;
}

- (unint64_t)numberOfCoefficients
{
  return self->_numberOfCoefficients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderName, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
  objc_storeStrong((id *)&self->_kernel, 0);
}

@end
