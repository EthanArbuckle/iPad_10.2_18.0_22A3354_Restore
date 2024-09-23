@implementation MLCGPUDeviceOps

+ (id)deviceOps
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", 0, 0);
}

+ (id)deviceOpsWithForwardKernel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", v4, 0);

  return v5;
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", v7, v6);

  return v8;
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:", v10, v9, v8, 0, 0);

  return v11;
}

- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  return -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](self, "initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:", a3, a4, 0, 0, 0);
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:", v16, v15, v14, v13, v12);

  return v17;
}

- (MLCGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5 forwardStatistics:(id)a6 gradientStatistics:(id)a7
{
  id v13;
  id v14;
  id v15;
  MLCGPUDeviceOps *v16;
  MLCGPUDeviceOps *v17;
  id lossInitialGradientKernel;
  id combinedForwardAndGradientLossKernel;
  id gradientState;
  id movingState;
  id exportableState;
  MLCActivationDescriptor *neuronDescriptor;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MLCGPUDeviceOps;
  v16 = -[MLCDeviceOps initWithSource:secondarySource:result:batchSize:](&v27, sel_initWithSource_secondarySource_result_batchSize_, 0, 0, 0, 1);
  v17 = v16;
  if (v16)
  {
    *(_WORD *)&v16->_isMPSKernel = 1;
    v16->_metalKernelType = 0;
    objc_storeStrong(&v16->_forwardKernel, a3);
    objc_storeStrong(&v17->_gradientKernel, a4);
    objc_storeStrong(&v17->_secondaryGradientKernel, a5);
    lossInitialGradientKernel = v17->_lossInitialGradientKernel;
    v17->_lossInitialGradientKernel = 0;

    combinedForwardAndGradientLossKernel = v17->_combinedForwardAndGradientLossKernel;
    v17->_combinedForwardAndGradientLossKernel = 0;

    gradientState = v17->_gradientState;
    v17->_gradientState = 0;

    movingState = v17->_movingState;
    v17->_movingState = 0;

    exportableState = v17->_exportableState;
    v17->_exportableState = 0;

    objc_storeStrong(&v17->_forwardStatisticsKernel, a6);
    objc_storeStrong(&v17->_gradientStatisticsKernel, a7);
    neuronDescriptor = v17->_neuronDescriptor;
    v17->_neuronDescriptor = 0;

    v17->_computeWeightsAndBiasOnly = 0;
    v17->_useSourceGradientDeviceMemoryForResultGradientTensor = 0;
    v17->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = 0;
    v17->_recomputeResultTensor = 0;
    v17->_temporaryHeapIndex = 0;
  }

  return v17;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps forwardKernel](self, "forwardKernel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps gradientKernel](self, "gradientKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps secondaryGradientKernel](self, "secondaryGradientKernel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps lossInitialGradientKernel](self, "lossInitialGradientKernel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps gradientState](self, "gradientState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceOps source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceOps secondarySource](self, "secondarySource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps forwardStatisticsKernel](self, "forwardStatisticsKernel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps gradientStatisticsKernel](self, "gradientStatisticsKernel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: { forwardKernel=%@ : gradientKernel=%@ : secondaryGradientKernel= %@ : lossInitialGradientKernel=%@ : gradientState=%@ : source=%@ : secondarySource=%@ : forwardStatisticsKernel=%@ : gradientStatisticsKernel=%@ }"), v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCGPUDeviceOps forwardKernel](self, "forwardKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGPUDeviceOps gradientKernel](self, "gradientKernel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithForwardKernel:gradientKernel:", v5, v6);

  return v7;
}

- (_MLCGPULayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (BOOL)isMPSKernel
{
  return self->_isMPSKernel;
}

- (void)setIsMPSKernel:(BOOL)a3
{
  self->_isMPSKernel = a3;
}

- (BOOL)isMPSGraph
{
  return self->_isMPSGraph;
}

- (void)setIsMPSGraph:(BOOL)a3
{
  self->_isMPSGraph = a3;
}

- (int)metalKernelType
{
  return self->_metalKernelType;
}

- (void)setMetalKernelType:(int)a3
{
  self->_metalKernelType = a3;
}

- (id)forwardKernel
{
  return self->_forwardKernel;
}

- (id)gradientKernel
{
  return self->_gradientKernel;
}

- (id)secondaryGradientKernel
{
  return self->_secondaryGradientKernel;
}

- (id)lossInitialGradientKernel
{
  return self->_lossInitialGradientKernel;
}

- (void)setLossInitialGradientKernel:(id)a3
{
  objc_storeStrong(&self->_lossInitialGradientKernel, a3);
}

- (id)combinedForwardAndGradientLossKernel
{
  return self->_combinedForwardAndGradientLossKernel;
}

- (void)setCombinedForwardAndGradientLossKernel:(id)a3
{
  objc_storeStrong(&self->_combinedForwardAndGradientLossKernel, a3);
}

- (id)reduceLossKernel
{
  return self->_reduceLossKernel;
}

- (void)setReduceLossKernel:(id)a3
{
  objc_storeStrong(&self->_reduceLossKernel, a3);
}

- (id)gradientState
{
  return self->_gradientState;
}

- (void)setGradientState:(id)a3
{
  objc_storeStrong(&self->_gradientState, a3);
}

- (id)forwardStatisticsKernel
{
  return self->_forwardStatisticsKernel;
}

- (void)setForwardStatisticsKernel:(id)a3
{
  objc_storeStrong(&self->_forwardStatisticsKernel, a3);
}

- (id)gradientStatisticsKernel
{
  return self->_gradientStatisticsKernel;
}

- (void)setGradientStatisticsKernel:(id)a3
{
  objc_storeStrong(&self->_gradientStatisticsKernel, a3);
}

- (NSArray)momentumVectors
{
  return self->_momentumVectors;
}

- (void)setMomentumVectors:(id)a3
{
  objc_storeStrong((id *)&self->_momentumVectors, a3);
}

- (NSArray)velocityVectors
{
  return self->_velocityVectors;
}

- (void)setVelocityVectors:(id)a3
{
  objc_storeStrong((id *)&self->_velocityVectors, a3);
}

- (NSArray)centerWeightVectors
{
  return self->_centerWeightVectors;
}

- (void)setCenterWeightVectors:(id)a3
{
  objc_storeStrong((id *)&self->_centerWeightVectors, a3);
}

- (id)exportableState
{
  return self->_exportableState;
}

- (void)setExportableState:(id)a3
{
  objc_storeStrong(&self->_exportableState, a3);
}

- (id)movingState
{
  return self->_movingState;
}

- (void)setMovingState:(id)a3
{
  objc_storeStrong(&self->_movingState, a3);
}

- (BOOL)computeWeightsAndBiasOnly
{
  return self->_computeWeightsAndBiasOnly;
}

- (void)setComputeWeightsAndBiasOnly:(BOOL)a3
{
  self->_computeWeightsAndBiasOnly = a3;
}

- (unint64_t)totalElementsPerChannel
{
  return self->_totalElementsPerChannel;
}

- (void)setTotalElementsPerChannel:(unint64_t)a3
{
  self->_totalElementsPerChannel = a3;
}

- (unint64_t)paddingLeft
{
  return self->_paddingLeft;
}

- (void)setPaddingLeft:(unint64_t)a3
{
  self->_paddingLeft = a3;
}

- (unint64_t)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(unint64_t)a3
{
  self->_paddingRight = a3;
}

- (unint64_t)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(unint64_t)a3
{
  self->_paddingTop = a3;
}

- (unint64_t)paddingBottom
{
  return self->_paddingBottom;
}

- (void)setPaddingBottom:(unint64_t)a3
{
  self->_paddingBottom = a3;
}

- (BOOL)countIncludesPadding
{
  return self->_countIncludesPadding;
}

- (void)setCountIncludesPadding:(BOOL)a3
{
  self->_countIncludesPadding = a3;
}

- (unint64_t)kernelSizeInX
{
  return self->_kernelSizeInX;
}

- (void)setKernelSizeInX:(unint64_t)a3
{
  self->_kernelSizeInX = a3;
}

- (unint64_t)kernelSizeInY
{
  return self->_kernelSizeInY;
}

- (void)setKernelSizeInY:(unint64_t)a3
{
  self->_kernelSizeInY = a3;
}

- (unint64_t)strideInX
{
  return self->_strideInX;
}

- (void)setStrideInX:(unint64_t)a3
{
  self->_strideInX = a3;
}

- (unint64_t)strideInY
{
  return self->_strideInY;
}

- (void)setStrideInY:(unint64_t)a3
{
  self->_strideInY = a3;
}

- (unint64_t)dilationRateInX
{
  return self->_dilationRateInX;
}

- (void)setDilationRateInX:(unint64_t)a3
{
  self->_dilationRateInX = a3;
}

- (unint64_t)dilationRateInY
{
  return self->_dilationRateInY;
}

- (void)setDilationRateInY:(unint64_t)a3
{
  self->_dilationRateInY = a3;
}

- (int)weightsDataType
{
  return self->_weightsDataType;
}

- (void)setWeightsDataType:(int)a3
{
  self->_weightsDataType = a3;
}

- (int)biasesDataType
{
  return self->_biasesDataType;
}

- (void)setBiasesDataType:(int)a3
{
  self->_biasesDataType = a3;
}

- (id)poolingIndicesBuffer
{
  return self->_poolingIndicesBuffer;
}

- (void)setPoolingIndicesBuffer:(id)a3
{
  objc_storeStrong(&self->_poolingIndicesBuffer, a3);
}

- (BOOL)useSourceGradientDeviceMemoryForResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForResultGradientTensor = a3;
}

- (BOOL)useSourceGradientDeviceMemoryForSecondaryResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = a3;
}

- (MLCActivationDescriptor)neuronDescriptor
{
  return self->_neuronDescriptor;
}

- (void)setNeuronDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_neuronDescriptor, a3);
}

- (int)arithmeticOp
{
  return self->_arithmeticOp;
}

- (void)setArithmeticOp:(int)a3
{
  self->_arithmeticOp = a3;
}

- (NSArray)source0Shape
{
  return self->_source0Shape;
}

- (void)setSource0Shape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)source1Shape
{
  return self->_source1Shape;
}

- (void)setSource1Shape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSArray)source2Shape
{
  return self->_source2Shape;
}

- (void)setSource2Shape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int)constantArithmeticSourcesFlags
{
  return self->_constantArithmeticSourcesFlags;
}

- (void)setConstantArithmeticSourcesFlags:(int)a3
{
  self->_constantArithmeticSourcesFlags = a3;
}

- (NSMutableArray)transposeShape
{
  return self->_transposeShape;
}

- (void)setTransposeShape:(id)a3
{
  objc_storeStrong((id *)&self->_transposeShape, a3);
}

- (NSMutableArray)transposeGradientShape
{
  return self->_transposeGradientShape;
}

- (void)setTransposeGradientShape:(id)a3
{
  objc_storeStrong((id *)&self->_transposeGradientShape, a3);
}

- (NSArray)begin
{
  return self->_begin;
}

- (void)setBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSArray)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (unint64_t)softmaxAxis
{
  return self->_softmaxAxis;
}

- (void)setSoftmaxAxis:(unint64_t)a3
{
  self->_softmaxAxis = a3;
}

- (unint64_t)scatterGatherDimension
{
  return self->_scatterGatherDimension;
}

- (void)setScatterGatherDimension:(unint64_t)a3
{
  self->_scatterGatherDimension = a3;
}

- (int)scatterReduceType
{
  return self->_scatterReduceType;
}

- (void)setScatterReduceType:(int)a3
{
  self->_scatterReduceType = a3;
}

- (float)gramMatrixScale
{
  return self->_gramMatrixScale;
}

- (void)setGramMatrixScale:(float)a3
{
  self->_gramMatrixScale = a3;
}

- (BOOL)recomputeResultTensor
{
  return self->_recomputeResultTensor;
}

- (void)setRecomputeResultTensor:(BOOL)a3
{
  self->_recomputeResultTensor = a3;
}

- (unint64_t)temporaryHeapIndex
{
  return self->_temporaryHeapIndex;
}

- (void)setTemporaryHeapIndex:(unint64_t)a3
{
  self->_temporaryHeapIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_begin, 0);
  objc_storeStrong((id *)&self->_transposeGradientShape, 0);
  objc_storeStrong((id *)&self->_transposeShape, 0);
  objc_storeStrong((id *)&self->_source2Shape, 0);
  objc_storeStrong((id *)&self->_source1Shape, 0);
  objc_storeStrong((id *)&self->_source0Shape, 0);
  objc_storeStrong((id *)&self->_neuronDescriptor, 0);
  objc_storeStrong(&self->_poolingIndicesBuffer, 0);
  objc_storeStrong(&self->_movingState, 0);
  objc_storeStrong(&self->_exportableState, 0);
  objc_storeStrong((id *)&self->_centerWeightVectors, 0);
  objc_storeStrong((id *)&self->_velocityVectors, 0);
  objc_storeStrong((id *)&self->_momentumVectors, 0);
  objc_storeStrong(&self->_gradientStatisticsKernel, 0);
  objc_storeStrong(&self->_forwardStatisticsKernel, 0);
  objc_storeStrong(&self->_gradientState, 0);
  objc_storeStrong(&self->_reduceLossKernel, 0);
  objc_storeStrong(&self->_combinedForwardAndGradientLossKernel, 0);
  objc_storeStrong(&self->_lossInitialGradientKernel, 0);
  objc_storeStrong(&self->_secondaryGradientKernel, 0);
  objc_storeStrong(&self->_gradientKernel, 0);
  objc_storeStrong(&self->_forwardKernel, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
