@implementation MLCMatMulGPUDeviceOps

+ (id)deviceOps
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:secondaryGradientKernel:", 0, 0, 0);
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
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:secondaryGradientKernel:", v10, v9, v8);

  return v11;
}

- (MLCMatMulGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5
{
  MLCMatMulGPUDeviceOps *v5;
  MLCMatMulGPUDeviceOps *v6;
  id matmulKernel;
  id reduceSumKernel;
  void *v9;
  uint64_t v10;
  NSMutableArray *matrixDescs;
  uint64_t v12;
  NSMutableArray *forwardMatricesOrNDArrays;
  uint64_t v14;
  NSMutableArray *gradientMatricesOrNDArrays;
  uint64_t v16;
  NSArray *shapes;
  uint64_t v18;
  NSArray *transposeLeft;
  uint64_t v20;
  NSArray *transposeRight;
  uint64_t v22;
  NSArray *gradientLeftRightMatrixSelectionFlags;
  uint64_t v24;
  NSArray *broadcastingFlags;
  uint64_t v26;
  NSMutableArray *reductionShapes;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MLCMatMulGPUDeviceOps;
  v5 = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v29, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, a3, a4, a5, 0, 0);
  v6 = v5;
  if (v5)
  {
    matmulKernel = v5->_matmulKernel;
    v5->_matmulKernel = 0;

    reduceSumKernel = v6->_reduceSumKernel;
    v6->_reduceSumKernel = 0;

    v9 = (void *)MEMORY[0x1E0C9AA60];
    v10 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    matrixDescs = v6->_matrixDescs;
    v6->_matrixDescs = (NSMutableArray *)v10;

    v12 = objc_msgSend(v9, "mutableCopy");
    forwardMatricesOrNDArrays = v6->_forwardMatricesOrNDArrays;
    v6->_forwardMatricesOrNDArrays = (NSMutableArray *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    gradientMatricesOrNDArrays = v6->_gradientMatricesOrNDArrays;
    v6->_gradientMatricesOrNDArrays = (NSMutableArray *)v14;

    v16 = objc_msgSend(v9, "copy");
    shapes = v6->_shapes;
    v6->_shapes = (NSArray *)v16;

    v18 = objc_msgSend(v9, "copy");
    transposeLeft = v6->_transposeLeft;
    v6->_transposeLeft = (NSArray *)v18;

    v20 = objc_msgSend(v9, "copy");
    transposeRight = v6->_transposeRight;
    v6->_transposeRight = (NSArray *)v20;

    v22 = objc_msgSend(v9, "copy");
    gradientLeftRightMatrixSelectionFlags = v6->_gradientLeftRightMatrixSelectionFlags;
    v6->_gradientLeftRightMatrixSelectionFlags = (NSArray *)v22;

    v24 = objc_msgSend(v9, "copy");
    broadcastingFlags = v6->_broadcastingFlags;
    v6->_broadcastingFlags = (NSArray *)v24;

    v26 = objc_msgSend(v9, "mutableCopy");
    reductionShapes = v6->_reductionShapes;
    v6->_reductionShapes = (NSMutableArray *)v26;

  }
  return v6;
}

- (id)matmulKernel
{
  return self->_matmulKernel;
}

- (void)setMatmulKernel:(id)a3
{
  objc_storeStrong(&self->_matmulKernel, a3);
}

- (id)reduceSumKernel
{
  return self->_reduceSumKernel;
}

- (void)setReduceSumKernel:(id)a3
{
  objc_storeStrong(&self->_reduceSumKernel, a3);
}

- (NSMutableArray)matrixDescs
{
  return self->_matrixDescs;
}

- (void)setMatrixDescs:(id)a3
{
  objc_storeStrong((id *)&self->_matrixDescs, a3);
}

- (NSMutableArray)forwardMatricesOrNDArrays
{
  return self->_forwardMatricesOrNDArrays;
}

- (void)setForwardMatricesOrNDArrays:(id)a3
{
  objc_storeStrong((id *)&self->_forwardMatricesOrNDArrays, a3);
}

- (NSMutableArray)gradientMatricesOrNDArrays
{
  return self->_gradientMatricesOrNDArrays;
}

- (void)setGradientMatricesOrNDArrays:(id)a3
{
  objc_storeStrong((id *)&self->_gradientMatricesOrNDArrays, a3);
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (void)setShapes:(id)a3
{
  objc_storeStrong((id *)&self->_shapes, a3);
}

- (NSArray)transposeLeft
{
  return self->_transposeLeft;
}

- (void)setTransposeLeft:(id)a3
{
  objc_storeStrong((id *)&self->_transposeLeft, a3);
}

- (NSArray)transposeRight
{
  return self->_transposeRight;
}

- (void)setTransposeRight:(id)a3
{
  objc_storeStrong((id *)&self->_transposeRight, a3);
}

- (NSArray)gradientLeftRightMatrixSelectionFlags
{
  return self->_gradientLeftRightMatrixSelectionFlags;
}

- (void)setGradientLeftRightMatrixSelectionFlags:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLeftRightMatrixSelectionFlags, a3);
}

- (NSArray)broadcastingFlags
{
  return self->_broadcastingFlags;
}

- (void)setBroadcastingFlags:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastingFlags, a3);
}

- (NSMutableArray)reductionShapes
{
  return self->_reductionShapes;
}

- (void)setReductionShapes:(id)a3
{
  objc_storeStrong((id *)&self->_reductionShapes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reductionShapes, 0);
  objc_storeStrong((id *)&self->_broadcastingFlags, 0);
  objc_storeStrong((id *)&self->_gradientLeftRightMatrixSelectionFlags, 0);
  objc_storeStrong((id *)&self->_transposeRight, 0);
  objc_storeStrong((id *)&self->_transposeLeft, 0);
  objc_storeStrong((id *)&self->_shapes, 0);
  objc_storeStrong((id *)&self->_gradientMatricesOrNDArrays, 0);
  objc_storeStrong((id *)&self->_forwardMatricesOrNDArrays, 0);
  objc_storeStrong((id *)&self->_matrixDescs, 0);
  objc_storeStrong(&self->_reduceSumKernel, 0);
  objc_storeStrong(&self->_matmulKernel, 0);
}

@end
