@implementation MetalRANSACDispatcher

- (MetalRANSACDispatcher)initWithMaxCorrespondences:(unint64_t)a3
{
  MetalRANSACDispatcher *v4;
  MTLDevice *v5;
  MTLDevice *m_metalDevice;
  MTLDevice *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MTLLibrary *m_metalLibrary;
  uint64_t v12;
  MTLCommandQueue *m_metalCommandQueue;
  uint64_t v14;
  MTLFunction *m_metalKernelFunction;
  MTLFunction *v16;
  MTLDevice *v17;
  uint64_t v18;
  MTLComputePipelineState *m_metalPipeline;
  MTLComputePipelineState *v20;
  unint64_t v21;
  uint64_t v22;
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MetalRANSACDispatcher;
  v4 = -[MetalRANSACDispatcher init](&v25, sel_init);
  if (!v4)
    goto LABEL_10;
  v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  m_metalDevice = v4->m_metalDevice;
  v4->m_metalDevice = v5;

  v7 = v4->m_metalDevice;
  if (!v7)
  {
LABEL_11:

    v4 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", CFSTR("InertiaCamMetalLib"), CFSTR("metallib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTLDevice newLibraryWithFile:error:](v7, "newLibraryWithFile:error:", v9, 0);
  m_metalLibrary = v4->m_metalLibrary;
  v4->m_metalLibrary = (MTLLibrary *)v10;

  if (!v4->m_metalLibrary)
    goto LABEL_10;
  v12 = -[MTLDevice newCommandQueue](v4->m_metalDevice, "newCommandQueue");
  m_metalCommandQueue = v4->m_metalCommandQueue;
  v4->m_metalCommandQueue = (MTLCommandQueue *)v12;

  if (!v4->m_metalCommandQueue
    || (v14 = -[MTLLibrary newFunctionWithName:](v4->m_metalLibrary, "newFunctionWithName:", CFSTR("metal_ransac_kernel")), m_metalKernelFunction = v4->m_metalKernelFunction, v4->m_metalKernelFunction = (MTLFunction *)v14, m_metalKernelFunction, (v16 = v4->m_metalKernelFunction) == 0))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v17 = v4->m_metalDevice;
  v24 = 0;
  v18 = -[MTLDevice newComputePipelineStateWithFunction:error:](v17, "newComputePipelineStateWithFunction:error:", v16, &v24);
  v7 = (MTLDevice *)v24;
  m_metalPipeline = v4->m_metalPipeline;
  v4->m_metalPipeline = (MTLComputePipelineState *)v18;

  v20 = v4->m_metalPipeline;
  if (!v20)
    goto LABEL_11;
  v21 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v20, "maxTotalThreadsPerThreadgroup");
  v4->inlierLimit = 0.0;
  v22 = 32;
  if (v21 < 0x20)
    v22 = v21;
  v4->frameSize.width = 0.0;
  v4->frameSize.height = 0.0;
  v4->_m_numThreadsPerGroup = v22;
  v4->_m_maxCorrespondences = a3;
LABEL_12:

  return v4;
}

- (void)performRansacOnData:(unsigned int)a3 firstPointSet:(const float *)a4 secondPointSet:(const float *)a5 pointWeights:(const float *)a6 homographies:(const ransac_homography_record *)a7 numHomographies:(unsigned int)a8 homScores:(float *)a9
{
  size_t v15;
  unint64_t m_numThreadsPerGroup;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  int64x2_t v23;
  float32x2_t v24;
  float inlierLimit;
  unsigned int v26;
  unsigned int v27;

  v26 = a8;
  v27 = a3;
  inlierLimit = self->inlierLimit;
  v24 = vcvt_f32_f64((float64x2_t)self->frameSize);
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_mX, a4, 8 * a3, 0);
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_mXhat, a5, 8 * a3, 0);
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_ScoreBuffer, a6, 4 * a3, 0);
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_RansacParams, &v24, 20, 0);
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_RansacHomographies, a7, 36 * a8, 0);
  v15 = 4 * a8;
  -[MetalRANSACDispatcher assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:](self, "assureSizeAndCopyToMetalBuffer:fromData:dataSize:metalResourceOptions:", &self->_m_ModelScores, 0, v15, 0);
  m_numThreadsPerGroup = self->_m_numThreadsPerGroup;
  v17 = (m_numThreadsPerGroup + a8 - 1) / m_numThreadsPerGroup;
  -[MTLCommandQueue commandBuffer](self->m_metalCommandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setComputePipelineState:", self->m_metalPipeline);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_RansacParams, 0, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_mX, 0, 1);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_mXhat, 0, 2);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_ScoreBuffer, 0, 3);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_RansacHomographies, 0, 4);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_m_ModelScores, 0, 5);
  v22 = v17;
  v23 = vdupq_n_s64(1uLL);
  v20 = m_numThreadsPerGroup;
  v21 = v23;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v22, &v20);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilCompleted");
  memcpy(a9, (const void *)-[MTLBuffer contents](self->_m_ModelScores, "contents"), v15);

}

- (void)assureSizeAndCopyToMetalBuffer:(id *)a3 fromData:(const void *)a4 dataSize:(unint64_t)a5 metalResourceOptions:(unint64_t)a6
{
  id v11;
  MTLDevice *m_metalDevice;
  void *v13;
  id v14;

  if (!*a3)
    goto LABEL_7;
  if (objc_msgSend(*a3, "length") < a5)
  {
    v11 = *a3;
    *a3 = 0;

  }
  if (*a3)
  {
    if (a4)
      memcpy((void *)objc_msgSend(objc_retainAutorelease(*a3), "contents"), a4, a5);
  }
  else
  {
LABEL_7:
    m_metalDevice = self->m_metalDevice;
    if (a4)
      v13 = (void *)-[MTLDevice newBufferWithBytes:length:options:](m_metalDevice, "newBufferWithBytes:length:options:", a4, a5, a6);
    else
      v13 = (void *)-[MTLDevice newBufferWithLength:options:](m_metalDevice, "newBufferWithLength:options:", a5, a6);
    v14 = *a3;
    *a3 = v13;

  }
}

- (MTLCommandQueue)m_metalCommandQueue
{
  return self->m_metalCommandQueue;
}

- (void)setM_metalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->m_metalCommandQueue, a3);
}

- (MTLDevice)m_metalDevice
{
  return self->m_metalDevice;
}

- (void)setM_metalDevice:(id)a3
{
  objc_storeStrong((id *)&self->m_metalDevice, a3);
}

- (MTLFunction)m_metalKernelFunction
{
  return self->m_metalKernelFunction;
}

- (void)setM_metalKernelFunction:(id)a3
{
  objc_storeStrong((id *)&self->m_metalKernelFunction, a3);
}

- (MTLLibrary)m_metalLibrary
{
  return self->m_metalLibrary;
}

- (void)setM_metalLibrary:(id)a3
{
  objc_storeStrong((id *)&self->m_metalLibrary, a3);
}

- (MTLComputePipelineState)m_metalPipeline
{
  return self->m_metalPipeline;
}

- (void)setM_metalPipeline:(id)a3
{
  objc_storeStrong((id *)&self->m_metalPipeline, a3);
}

- (float)inlierLimit
{
  return self->inlierLimit;
}

- (void)setInlierLimit:(float)a3
{
  self->inlierLimit = a3;
}

- (CGSize)frameSize
{
  double width;
  double height;
  CGSize result;

  width = self->frameSize.width;
  height = self->frameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  self->frameSize = a3;
}

- (unint64_t)m_numThreadsPerGroup
{
  return self->_m_numThreadsPerGroup;
}

- (void)setM_numThreadsPerGroup:(unint64_t)a3
{
  self->_m_numThreadsPerGroup = a3;
}

- (unint64_t)m_maxCorrespondences
{
  return self->_m_maxCorrespondences;
}

- (void)setM_maxCorrespondences:(unint64_t)a3
{
  self->_m_maxCorrespondences = a3;
}

- (MTLBuffer)m_mX
{
  return self->_m_mX;
}

- (void)setM_mX:(id)a3
{
  objc_storeStrong((id *)&self->_m_mX, a3);
}

- (MTLBuffer)m_mXhat
{
  return self->_m_mXhat;
}

- (void)setM_mXhat:(id)a3
{
  objc_storeStrong((id *)&self->_m_mXhat, a3);
}

- (MTLBuffer)m_ScoreBuffer
{
  return self->_m_ScoreBuffer;
}

- (void)setM_ScoreBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_m_ScoreBuffer, a3);
}

- (MTLBuffer)m_RansacParams
{
  return self->_m_RansacParams;
}

- (void)setM_RansacParams:(id)a3
{
  objc_storeStrong((id *)&self->_m_RansacParams, a3);
}

- (MTLBuffer)m_RansacHomographies
{
  return self->_m_RansacHomographies;
}

- (void)setM_RansacHomographies:(id)a3
{
  objc_storeStrong((id *)&self->_m_RansacHomographies, a3);
}

- (MTLBuffer)m_ModelScores
{
  return self->_m_ModelScores;
}

- (void)setM_ModelScores:(id)a3
{
  objc_storeStrong((id *)&self->_m_ModelScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_m_ModelScores, 0);
  objc_storeStrong((id *)&self->_m_RansacHomographies, 0);
  objc_storeStrong((id *)&self->_m_RansacParams, 0);
  objc_storeStrong((id *)&self->_m_ScoreBuffer, 0);
  objc_storeStrong((id *)&self->_m_mXhat, 0);
  objc_storeStrong((id *)&self->_m_mX, 0);
  objc_storeStrong((id *)&self->m_metalPipeline, 0);
  objc_storeStrong((id *)&self->m_metalLibrary, 0);
  objc_storeStrong((id *)&self->m_metalKernelFunction, 0);
  objc_storeStrong((id *)&self->m_metalDevice, 0);
  objc_storeStrong((id *)&self->m_metalCommandQueue, 0);
}

@end
