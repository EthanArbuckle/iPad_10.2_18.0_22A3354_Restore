@implementation MPSGraph

- (id)decompositionLUWithTensor:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MPSGraphMatrixDecompositionOp *v8;
  void *v9;
  MPSGraphMatrixDecompositionOp *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [MPSGraphMatrixDecompositionOp alloc];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)decompositionWithTensor:(id)a3 descriptor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphMatrixDecompositionOp *v11;
  void *v12;
  MPSGraphMatrixDecompositionOp *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "decompositionType"))
    __assert_rtn("-[MPSGraph(MPSGraphMatrixDecompositionOps) decompositionWithTensor:descriptor:name:]", "MPSGraphMatrixDecompositionOps.mm", 82, "(desc.decompositionType == MPSGraphMatrixDecompositionLU) && \"unsupported decomposition type\");
  v11 = [MPSGraphMatrixDecompositionOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 layout:(unint64_t)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 alignCorners:(BOOL)a8 paddingMode:(int64_t)a9 samplingMode:(unint64_t)a10 nearestRoundingMode:(unint64_t)a11 constantValue:(double)a12 name:(id)a13
{
  _BOOL8 v15;
  id v19;
  int64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  MPSGraphSampleGridOp *v24;
  void *v25;
  MPSGraphSampleGridOp *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];

  v31 = a7;
  v15 = a6;
  v35[3] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v33 = a4;
  v34 = a13;
  if (a9 == 4)
    v20 = 0;
  else
    v20 = a9;
  v32 = v19;
  v21 = objc_msgSend(v19, "dataType");
  v22 = 0.0;
  if (a9 != 4)
    v22 = a12;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E99AF0, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [MPSGraphSampleGridOp alloc];
  v35[0] = v19;
  v35[1] = v33;
  v35[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = a8;
  v26 = -[MPSGraphSampleGridOp initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:name:](v24, "initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:name:", self, v25, MEMORY[0x1E0C9AA60], a5, v15, v31, v30, v20, a10, a11, v34);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode samplingMode:(MPSGraphResizeMode)samplingMode constantValue:(double)constantValue name:(NSString *)name
{
  -[MPSGraph sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:constantValue:name:](self, "sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:constantValue:name:", source, coordinates, layout, normalizeCoordinates, relativeCoordinates, alignCorners, constantValue, paddingMode, samplingMode, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode constantValue:(double)constantValue name:(NSString *)name
{
  -[MPSGraph sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:constantValue:name:](self, "sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:nearestRoundingMode:constantValue:name:", source, coordinates, layout, normalizeCoordinates, relativeCoordinates, alignCorners, constantValue, paddingMode, 0, nearestRoundingMode, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 normalizeCoordinates:(BOOL)a5 relativeCoordinates:(BOOL)a6 paddingMode:(int64_t)a7 samplingMode:(unint64_t)a8 constantValue:(double)a9 name:(id)a10
{
  -[MPSGraph sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:constantValue:name:](self, "sampleGridWithSourceTensor:coordinateTensor:layout:normalizeCoordinates:relativeCoordinates:alignCorners:paddingMode:samplingMode:constantValue:name:", a3, a4, 1, a5, a6, 0, a9, a7, a8, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShapeTensor:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphSampleGridDataGradientOp *v19;
  void *v20;
  MPSGraphSampleGridDataGradientOp *v21;
  void *v22;
  void *v23;
  void *v25;
  _BOOL4 v26;
  _QWORD v27[4];

  v26 = a7;
  v11 = a6;
  v27[3] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a10;
  if (a8 == 4)
    a8 = 0;
  v25 = v15;
  v19 = [MPSGraphSampleGridDataGradientOp alloc];
  v27[0] = v15;
  v27[1] = v16;
  v27[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphSampleGridDataGradientOp initWithGraph:inputTensors:controlDependencies:normalizeCoordinates:relativeCoordinates:paddingMode:samplingMode:name:](v19, "initWithGraph:inputTensors:controlDependencies:normalizeCoordinates:relativeCoordinates:paddingMode:samplingMode:name:", self, v20, MEMORY[0x1E0C9AA60], v11, v26, a8, a9, v18);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShape:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v24;
  id v25;
  __int128 v26;
  uint64_t v27;

  v24 = a7;
  v11 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a10;
  v18 = 0;
  if (a8 == 4)
    a8 = 0;
  v26 = xmmword_1812876C0;
  while (v18 < objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v26 + v18) = objc_msgSend(v19, "intValue");

    ++v18;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26, 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v20, &unk_1E0E99B08, 536870944);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph sampleGridDataGradientWithIncomingGradientTensor:coordinateTensor:outputShapeTensor:normalizeCoordinates:relativeCoordinates:paddingMode:samplingMode:name:](self, "sampleGridDataGradientWithIncomingGradientTensor:coordinateTensor:outputShapeTensor:normalizeCoordinates:relativeCoordinates:paddingMode:samplingMode:name:", v25, v15, v21, v11, v24, a8, a9, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (MPSGraphTensor)imToColWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphImToColOpDescriptor *v9;
  NSString *v10;
  MPSGraphImToColOp *v11;
  void *v12;
  MPSGraphImToColOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphImToColOp alloc];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphImToColOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)colToImWithSourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSShape *v11;
  MPSGraphImToColOpDescriptor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPSGraphColToImOp *v20;
  void *v21;
  MPSGraphColToImOp *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _DWORD v27[6];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = outputShape;
  v12 = descriptor;
  v13 = name;
  -[MPSShape objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = objc_msgSend(v14, "intValue");

  -[MPSShape objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = objc_msgSend(v15, "intValue");

  -[MPSShape objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = objc_msgSend(v16, "intValue");

  -[MPSShape objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = objc_msgSend(v17, "intValue");

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, 16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v18, &unk_1E0E99B20, 536870944);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [MPSGraphColToImOp alloc];
  v26[0] = v10;
  v26[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPSGraphColToImOp initWithGraph:inputTensors:controlDependencies:descriptor:outputShape:name:](v20, "initWithGraph:inputTensors:controlDependencies:descriptor:outputShape:name:", self, v21, MEMORY[0x1E0C9AA60], v12, v11, v13);

  -[MPSGraphOperation outputTensors](v22, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v24;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  MPSGraphCumulativeSumOp *v15;
  void *v16;
  MPSGraphCumulativeSumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphCumulativeSumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  MPSGraphCumulativeSumOp *v15;
  void *v16;
  MPSGraphCumulativeSumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = axisTensor;
  v14 = name;
  v15 = [MPSGraphCumulativeSumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v14);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  MPSGraphCumulativeProductOp *v15;
  void *v16;
  MPSGraphCumulativeProductOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphCumulativeProductOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  MPSGraphCumulativeProductOp *v15;
  void *v16;
  MPSGraphCumulativeProductOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = axisTensor;
  v14 = name;
  v15 = [MPSGraphCumulativeProductOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v14);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  MPSGraphCumulativeMaximumOp *v15;
  void *v16;
  MPSGraphCumulativeMaximumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphCumulativeMaximumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  MPSGraphCumulativeMaximumOp *v15;
  void *v16;
  MPSGraphCumulativeMaximumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = axisTensor;
  v14 = name;
  v15 = [MPSGraphCumulativeMaximumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v14);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  MPSGraphCumulativeMinimumOp *v15;
  void *v16;
  MPSGraphCumulativeMinimumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphCumulativeMinimumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  _BOOL8 v8;
  _BOOL8 v9;
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  MPSGraphCumulativeMinimumOp *v15;
  void *v16;
  MPSGraphCumulativeMinimumOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v8 = reverse;
  v9 = exclusive;
  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = axisTensor;
  v14 = name;
  v15 = [MPSGraphCumulativeMinimumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCumulativeBaseOp initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:](v15, "initWithGraph:inputTensors:controlDependencies:exclusive:reverse:name:", self, v16, MEMORY[0x1E0C9AA60], v9, v8, v14);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph cumulativeSumWithTensor:axis:exclusive:reverse:name:](self, "cumulativeSumWithTensor:axis:exclusive:reverse:name:", tensor, axis, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph cumulativeSumWithTensor:axisTensor:exclusive:reverse:name:](self, "cumulativeSumWithTensor:axisTensor:exclusive:reverse:name:", tensor, axisTensor, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph cumulativeProductWithTensor:axis:exclusive:reverse:name:](self, "cumulativeProductWithTensor:axis:exclusive:reverse:name:", tensor, axis, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph cumulativeProductWithTensor:axisTensor:exclusive:reverse:name:](self, "cumulativeProductWithTensor:axisTensor:exclusive:reverse:name:", tensor, axisTensor, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph cumulativeMaximumWithTensor:axis:exclusive:reverse:name:](self, "cumulativeMaximumWithTensor:axis:exclusive:reverse:name:", tensor, axis, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph cumulativeMaximumWithTensor:axisTensor:exclusive:reverse:name:](self, "cumulativeMaximumWithTensor:axisTensor:exclusive:reverse:name:", tensor, axisTensor, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph cumulativeMinimumWithTensor:axis:exclusive:reverse:name:](self, "cumulativeMinimumWithTensor:axis:exclusive:reverse:name:", tensor, axis, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph cumulativeMinimumWithTensor:axisTensor:exclusive:reverse:name:](self, "cumulativeMinimumWithTensor:axisTensor:exclusive:reverse:name:", tensor, axisTensor, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)cumulativeMaximumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (id)cumulativeMinimumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (MPSGraphTensor)inverseOfTensor:(MPSGraphTensor *)inputTensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphMatrixInverseOp *v8;
  void *v9;
  MPSGraphMatrixInverseOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = inputTensor;
  v7 = name;
  v8 = [MPSGraphMatrixInverseOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name
{
  oneHotBase(self, indicesTensor, depth, onValue, offValue, axis, *(uint64_t *)&dataType, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name
{
  oneHotBase(self, indicesTensor, depth, onValue, offValue, 0xFFFFFFFFFFFFFFFFLL, *(uint64_t *)&dataType, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType name:(NSString *)name
{
  MPSGraphTensor *v12;
  NSString *v13;
  uint64_t v14;
  void *v15;

  v12 = indicesTensor;
  v13 = name;
  if (dataType == MPSDataTypeBFloat16 || dataType == MPSDataTypeFloat32 || dataType == MPSDataTypeFloat16)
    v14 = 268435488;
  else
    v14 = 536870944;
  oneHotBase(self, v12, depth, 1.0, 0.0, axis, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis name:(NSString *)name
{
  oneHotBase(self, indicesTensor, depth, 1.0, 0.0, axis, 268435488, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v7;
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;

  v7 = *(_QWORD *)&dataType;
  v10 = indicesTensor;
  v11 = name;
  if ((_DWORD)v7 == -1879048176 || (_DWORD)v7 == 268435488 || (_DWORD)v7 == 268435472)
  {
    oneHotBase(self, v10, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 268435488, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  oneHotBase(self, v10, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 536870944, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("/cast"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("/oneHot/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v13, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth name:(NSString *)name
{
  oneHotBase(self, indicesTensor, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 268435488, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)mathOpsWithTensors:(id)a3 mathOpType:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  MPSGraphArithmeticOp *v10;
  MPSGraphArithmeticOp *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = [MPSGraphArithmeticOp alloc];
  v11 = -[MPSGraphArithmeticOp initWithGraph:inputTensors:controlDependencies:mathOpType:name:](v10, "initWithGraph:inputTensors:controlDependencies:mathOpType:name:", self, v8, MEMORY[0x1E0C9AA60], a4, v9);
  -[MPSGraphOperation outputTensors](v11, "outputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)fixSignednessOfInputsTensors:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int Width;
  _QWORD *v19;
  int v21;
  const char *v22;
  const char *v23;
  const char *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t MLIRElementType;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (!v5)
  {

    goto LABEL_28;
  }
  v6 = 0;
  v7 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v4);
      v9 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
      MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)self->_builder, (mlir::MLIRContext *)objc_msgSend(v9, "dataType"));
      if (!*(_QWORD *)MLIRElementType)
        __assert_rtn("getAbstractType", "TypeSupport.h", 160, "abstractType && \"Malformed type storage object.\");
      if (*(_UNKNOWN **)(*(_QWORD *)MLIRElementType + 136) != &mlir::detail::TypeIDResolver<mlir::IntegerType,void>::id)
      {

        v26 = v4;
        goto LABEL_29;
      }
      v6 = v6 || !mlir::Type::isUnsignedInteger((mlir::Type *)&MLIRElementType);

    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  }
  while (v5);

  if (!v6)
  {
LABEL_28:
    v26 = v4;
    goto LABEL_29;
  }
  v26 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = v4;
  v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (!v10)
    goto LABEL_25;
  v11 = *(_QWORD *)v28;
  do
  {
    for (j = 0; j != v10; ++j)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v25);
      v13 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * j);
      v14 = getMLIRElementType(*(mlir::MLIRContext **)self->_builder, (mlir::MLIRContext *)objc_msgSend(v13, "dataType"));
      if (!*(_QWORD *)v14)
      {
        v21 = 160;
        v22 = "abstractType && \"Malformed type storage object.\";
        v23 = "TypeSupport.h";
        v24 = "getAbstractType";
        goto LABEL_33;
      }
      if (*(_UNKNOWN **)(*(_QWORD *)v14 + 136) != &mlir::detail::TypeIDResolver<mlir::IntegerType,void>::id)
      {
        v21 = 566;
        v24 = "cast";
        v23 = "Casting.h";
        v22 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
LABEL_33:
        __assert_rtn(v24, v23, v21, v22);
      }
      MLIRElementType = v14;
      v15 = v13;
      v16 = v15;
      if (mlir::Type::isUnsignedInteger((mlir::Type *)&MLIRElementType))
      {
        v17 = *(_QWORD *)self->_builder;
        Width = mlir::IntegerType::getWidth((mlir::IntegerType *)&MLIRElementType);
        v19 = (_QWORD *)mlir::IntegerType::get(v17, Width, 1u);
        -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v15, getMPSDataType(v19), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "addObject:", v16);

    }
    v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  }
  while (v10);
LABEL_25:

LABEL_29:
  return v26;
}

- (id)castBooleansOfInputsTensors:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  void *v18;
  uint64_t v19;
  MPSGraph *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v21 = self;
  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v4)
  {

    goto LABEL_25;
  }
  v5 = 0;
  LOBYTE(v6) = 0;
  v7 = *(_QWORD *)v28;
  v8 = 268435488;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v3);
      v10 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "dataType");
      v12 = v11;
      if (!v6)
      {
        v6 = objc_msgSend(v10, "dataType") == -2147483640;
        if ((v12 & 0x10000000) == 0)
          goto LABEL_11;
LABEL_10:
        v8 = objc_msgSend(v10, "dataType", v21);
        goto LABEL_11;
      }
      v6 = 1;
      if ((v11 & 0x10000000) != 0)
        goto LABEL_10;
LABEL_11:

      v5 |= (v12 & 0x10000000u) >> 28;
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v4);

  if ((v6 & v5 & 1) == 0)
  {
LABEL_25:
    v13 = v3;
    goto LABEL_26;
  }
  v13 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * j);
        v18 = v17;
        if (objc_msgSend(v17, "dataType") == -2147483640)
        {
          -[MPSGraph castTensor:toType:name:](v21, "castTensor:toType:name:", v17, v8, 0);
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
        }
        objc_msgSend(v13, "addObject:", v18, v21);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

LABEL_26:
  return v13;
}

- (MPSGraphTensor)identityWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 2, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 7, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)reverseSquareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 9, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (id)reciprocalSquareRootWithTensor:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 9, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MPSGraphTensor)reciprocalWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 10, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)absoluteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 11, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)absoluteSquareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 12, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)negativeWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 13, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)signWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 14, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)signbitWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 15, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)ceilWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 16, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)floorWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 17, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)roundWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 18, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)rintWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 19, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)sinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 20, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)cosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 21, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)tanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 22, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)sinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 23, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)coshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 24, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)tanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 25, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)asinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 26, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)acosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 27, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)atanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 28, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)asinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 29, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)acoshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 30, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)atanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 31, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)notWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 32, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isInfiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 33, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isFiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 34, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isNaNWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 35, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)erfWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 36, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)truncateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 71, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)bitwiseNOTWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 37, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)bitwisePopulationCountWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 38, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)conjugateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 39, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)additionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 42, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)subtractionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 43, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)multiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 44, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)divisionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 45, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)moduloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 46, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)powerWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 47, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)minimumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 48, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)maximumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 49, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)equalWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 50, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)notEqualWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 51, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)lessThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 52, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)lessThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 53, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)greaterThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 54, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)greaterThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 55, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 56, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 57, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalNANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 58, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 59, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 60, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalXNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 61, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)atan2WithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 62, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 63, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 64, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 65, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseLeftShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 66, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseRightShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph castBooleansOfInputsTensors:](self, "castBooleansOfInputsTensors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v13, 67, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)minimumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v7;
  MPSGraphTensor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = primaryTensor;
  v8 = secondaryTensor;
  -[MPSGraph isNaNWithTensor:name:](self, "isNaNWithTensor:name:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph isNaNWithTensor:name:](self, "isNaNWithTensor:name:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph logicalORWithPrimaryTensor:secondaryTensor:name:](self, "logicalORWithPrimaryTensor:secondaryTensor:name:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph minimumWithPrimaryTensor:secondaryTensor:name:](self, "minimumWithPrimaryTensor:secondaryTensor:name:", v7, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", objc_msgSend(v12, "dataType"), NAN);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:](self, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v11, v13, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)maximumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v7;
  MPSGraphTensor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = primaryTensor;
  v8 = secondaryTensor;
  -[MPSGraph isNaNWithTensor:name:](self, "isNaNWithTensor:name:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph isNaNWithTensor:name:](self, "isNaNWithTensor:name:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph logicalORWithPrimaryTensor:secondaryTensor:name:](self, "logicalORWithPrimaryTensor:secondaryTensor:name:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph maximumWithPrimaryTensor:secondaryTensor:name:](self, "maximumWithPrimaryTensor:secondaryTensor:name:", v7, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", objc_msgSend(v12, "dataType"), NAN);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:](self, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v11, v13, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)selectWithPredicateTensor:(MPSGraphTensor *)predicateTensor truePredicateTensor:(MPSGraphTensor *)truePredicateTensor falsePredicateTensor:(MPSGraphTensor *)falseSelectTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = predicateTensor;
  v11 = truePredicateTensor;
  v12 = falseSelectTensor;
  v13 = name;
  v22[0] = v11;
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectAtIndexedSubscript:", 0, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v18, 69, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)clampWithTensor:(MPSGraphTensor *)tensor minValueTensor:(MPSGraphTensor *)minValueTensor maxValueTensor:(MPSGraphTensor *)maxValueTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = minValueTensor;
  v12 = maxValueTensor;
  v13 = name;
  v18[0] = v10;
  v18[1] = v11;
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixSignednessOfInputsTensors:](self, "fixSignednessOfInputsTensors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v15, 70, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)divisionNoNaNWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9AE10, 268435488, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/division"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("divisionNoNaN/division"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/select"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("divisionNoNaN/select"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:](self, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v9, v13, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)floorModuloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/division"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("floorMod/division"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/floor"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("floorMod/floor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph floorWithTensor:name:](self, "floorWithTensor:name:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/multiply"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("floorMod/multiply"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v14, v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/subtract"), v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("floorMod/subtract"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)realPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 40, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)imaginaryPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v8, 41, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)complexTensorWithRealTensor:(MPSGraphTensor *)realTensor imaginaryTensor:(MPSGraphTensor *)imaginaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = realTensor;
  v9 = imaginaryTensor;
  v10 = name;
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph mathOpsWithTensors:mathOpType:name:](self, "mathOpsWithTensors:mathOpType:name:", v11, 68, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  MPSGraphSingleGateRNNDescriptor *v18;
  MPSGraphTensor *v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MPSGraphSingleGateRNNOp *v39;
  MPSGraphSingleGateRNNOp *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  MPSGraphSingleGateRNNOp *v59;
  void *v61;
  void *v62;
  MPSGraphSingleGateRNNOp *v63;
  void *v64;
  void *v65;
  MPSGraphSingleGateRNNOp *v66;
  void *v67;
  void *v68;
  MPSGraphSingleGateRNNOp *v69;
  MPSGraphTensor *v70;
  MPSGraphTensor *v71;
  MPSGraphTensor *v72;
  MPSGraphTensor *v73;
  MPSGraphTensor *v74;
  MPSGraphTensor *v75;
  NSString *v76;
  void *v77;
  _QWORD v78[2];
  void *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[4];

  v82[2] = *MEMORY[0x1E0C80C00];
  v16 = source;
  v75 = recurrentWeight;
  v17 = inputWeight;
  v74 = bias;
  v72 = initState;
  v73 = mask;
  v18 = descriptor;
  v76 = name;
  v19 = v16;
  v70 = v19;
  v71 = v17;
  if (v17)
  {
    -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v17, 0, 1, CFSTR("W^T"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ W^T"), v76);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v19, v20, v21);
    v19 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[MPSGraphSingleGateRNNDescriptor bidirectional](v18, "bidirectional"))
  {
    if (v74)
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphTensor name](v19, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("%@ + b"), v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v19, v74, v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v19 = (MPSGraphTensor *)v56;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (_BYTE *)-[MPSGraphSingleGateRNNDescriptor copy](v18, "copy");

    if (objc_msgSend(v22, "reverse"))
    {
      -[MPSGraphTensor name](v19, "name");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v19, &unk_1E0E9AE70, v57);
      v58 = objc_claimAutoreleasedReturnValue();

      v19 = (MPSGraphTensor *)v58;
    }
    objc_msgSend(v22, "setReverse:", 0);
    objc_msgSend(v31, "addObject:", v19);
    objc_msgSend(v31, "addObject:", v75);
    if (v72)
    {
      objc_msgSend(v31, "addObject:", v72);
      v22[9] = 1;
    }
    if (v73)
    {
      objc_msgSend(v31, "addObject:", v73);
      v22[8] = 1;
    }
    v59 = [MPSGraphSingleGateRNNOp alloc];
    v69 = -[MPSGraphSingleGateRNNOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v59, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v31, MEMORY[0x1E0C9AA60], v22, v76);
    if (!objc_msgSend(v22, "training"))
    {
      -[MPSGraphOperation outputTensors](v69, "outputTensors");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v67;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

      goto LABEL_31;
    }
    -[MPSGraphOperation outputTensors](v69, "outputTensors");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v67;
    -[MPSGraphOperation outputTensors](v69, "outputTensors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  v22 = (_BYTE *)-[MPSGraphSingleGateRNNDescriptor copy](v18, "copy");

  objc_msgSend(v22, "setBidirectional:", 0);
  -[MPSGraphTensor shape](v75, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[MPSGraphTensor shape](v75, "shape");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    if ((v26 & 0x8000000000000000) == 0)
    {
      if (v74)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphTensor name](v19, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ + b"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v19, v74, v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v19 = (MPSGraphTensor *)v30;
      }
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v19, -1, 0, v26, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v19, -1, v26, v26, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v75, 0, 0, 1, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v75, 0, 1, 1, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v32, &unk_1E0E9AE28, 0);
      v69 = (MPSGraphSingleGateRNNOp *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v31);
      objc_msgSend(v33, "addObject:", v68);
      objc_msgSend(v34, "addObject:", v69);
      objc_msgSend(v34, "addObject:", v67);
      if (v72)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v72, -1, 0, v26, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v72, -1, v26, v26, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v35);
        objc_msgSend(v34, "addObject:", v36);
        v22[9] = 1;

      }
      if (v73)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v73, -1, 0, v26, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v73, -1, v26, v26, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v37);
        objc_msgSend(v34, "addObject:", v38);
        v22[8] = 1;

      }
      v39 = [MPSGraphSingleGateRNNOp alloc];
      v66 = -[MPSGraphSingleGateRNNOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v39, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v33, MEMORY[0x1E0C9AA60], v22, v76);
      v40 = [MPSGraphSingleGateRNNOp alloc];
      v63 = -[MPSGraphSingleGateRNNOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v40, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v34, MEMORY[0x1E0C9AA60], v22, v76);
      -[MPSGraphOperation outputTensors](v63, "outputTensors");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v42, &unk_1E0E9AE40, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphOperation outputTensors](v66, "outputTensors");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v44;
      v82[1] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v45, -1, v76);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "training"))
      {
        -[MPSGraphOperation outputTensors](v63, "outputTensors");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v47, &unk_1E0E9AE58, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPSGraphOperation outputTensors](v66, "outputTensors");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v81[0] = v48;
        v81[1] = v62;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - training state"), v76);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v49, -1, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v80[0] = v64;
        v80[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v79 = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_29;
    }
  }
  v52 = 0;
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_31:

  return (NSArray *)v52;
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph singleGateRNNWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:descriptor:name:", source, recurrentWeight, inputWeight, bias, initState, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph singleGateRNNWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:descriptor:name:", source, recurrentWeight, 0, 0, initState, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphSingleGateRNNDescriptor *v19;
  _BYTE *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  MPSGraphTensor *v33;
  void *v34;
  uint64_t v35;
  MPSGraphTensor *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  MPSGraphTensor *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  MPSGraphSingleGateRNNDescriptor *v85;
  void *v86;
  void *v87;
  MPSGraphSingleGateRNNGradientOp *v88;
  void *v89;
  MPSGraphTensor *v90;
  void *v91;
  void *v92;
  MPSGraphTensor *v93;
  MPSGraphTensor *v94;
  MPSGraphTensor *v95;
  MPSGraphTensor *v96;
  void *v97;
  MPSGraphTensor *v98;
  MPSGraphTensor *v99;
  MPSGraphTensor *v100;
  NSString *v101;
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[4];

  v106[2] = *MEMORY[0x1E0C80C00];
  v93 = source;
  v98 = recurrentWeight;
  v100 = sourceGradient;
  v90 = zState;
  v96 = stateGradient;
  v95 = inputWeight;
  v99 = initState;
  v94 = mask;
  v19 = descriptor;
  v101 = name;
  v85 = v19;
  v20 = (_BYTE *)-[MPSGraphSingleGateRNNDescriptor copy](v19, "copy");
  if (!objc_msgSend(v20, "bidirectional"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v100, 0, -1, 1, CFSTR("lastSlice"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v37, v96, CFSTR("total derivative last state"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph cropTensor:dimension:amount_before:amount_after:name:](self, "cropTensor:dimension:amount_before:amount_after:name:", v100, 0, 0, 1, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v39;
      v102[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v40, 0, 0);
      v41 = objc_claimAutoreleasedReturnValue();

      v42 = (MPSGraphTensor *)v41;
    }
    else
    {
      v42 = v100;
    }
    v100 = v42;
    objc_msgSend(v97, "addObject:");
    objc_msgSend(v97, "addObject:", v98);
    objc_msgSend(v97, "addObject:", v90);
    if (v99)
    {
      objc_msgSend(v97, "addObject:", v99);
      v20[9] = 1;
    }
    if (v94)
    {
      objc_msgSend(v97, "addObject:", v94);
      v20[8] = 1;
    }
    v88 = -[MPSGraphSingleGateRNNGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:name:]([MPSGraphSingleGateRNNGradientOp alloc], "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v97, 0, v20, v101);
    -[MPSGraphOperation outputTensors](v88, "outputTensors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "reverse"))
    {
      objc_msgSend(v45, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v45, &unk_1E0E9AED0, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v47;
    }
    -[MPSGraphOperation outputTensors](v88, "outputTensors");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v45;
    if (v99)
    {
      -[MPSGraphOperation outputTensors](v88, "outputTensors");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", 2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0x1E0CB3000uLL;
      if (v95)
        goto LABEL_23;
    }
    else
    {
      v89 = 0;
      v50 = 0x1E0CB3000;
      if (v95)
      {
LABEL_23:
        objc_msgSend(*(id *)(v50 + 2368), "stringWithFormat:", CFSTR("%@ dx"), v101);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v25, v95, v51);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v25, -1, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v93, -1, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v52, 0, 1, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v50 + 2368), "stringWithFormat:", CFSTR("%@ dW"), v101);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v54, v53, v55);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (bias)
        {
LABEL_24:
          objc_msgSend(*(id *)(v50 + 2368), "stringWithFormat:", CFSTR("%@ db"), v101);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v25, &unk_1E0E9AEE8, v56);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
          objc_msgSend(v43, "addObject:", v92);
          objc_msgSend(v43, "addObject:", v86);
          if (v34)
            objc_msgSend(v43, "addObject:", v34);
          if (v87)
            objc_msgSend(v43, "addObject:", v87);
          if (v89)
            objc_msgSend(v43, "addObject:");
          else
            v89 = 0;
          goto LABEL_52;
        }
LABEL_27:
        v87 = 0;
        goto LABEL_28;
      }
    }
    v34 = 0;
    v92 = v25;
    if (bias)
      goto LABEL_24;
    goto LABEL_27;
  }
  objc_msgSend(v20, "setBidirectional:", 0);
  -[MPSGraphTensor shape](v98, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[MPSGraphTensor shape](v98, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if ((v24 & 0x8000000000000000) == 0)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v98, 0, 0, 1, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v98, 0, 1, 1, 0);
      v88 = (MPSGraphSingleGateRNNGradientOp *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v100, -1, 0, v24, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v100, -1, v24, v24, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v96, -1, v24, v24, 0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v26, 0, -1, 1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v27, v91, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph cropTensor:dimension:amount_before:amount_after:name:](self, "cropTensor:dimension:amount_before:amount_after:name:", v26, 0, 0, 1, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = v29;
        v106[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v30, 0, 0);
        v31 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v31;
      }
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v26, &unk_1E0E9AE88, 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v90, -1, 0, v24, 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v90, -1, v24, v24, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v32, &unk_1E0E9AEA0, 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v94)
      {
        v33 = v99;
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v94, -1, 0, v24, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v94, -1, v24, v24, 0);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v99)
          goto LABEL_8;
      }
      else
      {
        v87 = 0;
        v34 = 0;
        v33 = v99;
        if (v99)
        {
LABEL_8:
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v33, -1, 0, v24, 0);
          v35 = objc_claimAutoreleasedReturnValue();
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v33, -1, v24, v24, 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)v35;
          v36 = v96;
          if (v96)
          {
LABEL_9:
            -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v36, -1, 0, v24, 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
LABEL_37:
          v80 = 0;
LABEL_38:
          objc_msgSend(v20, "setReverse:", 0);
          -[MPSGraph singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:", v93, v97, v25, v89, v80, 0, 0, v79, v34, v20, v101);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setReverse:", 1);
          -[MPSGraph singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:", v93, v88, v86, v92, 0, 0, 0, v78, v87, v20, v101);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v57;
          objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v105[1] = v58;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v59, -1, CFSTR("dz"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v84, "objectAtIndexedSubscript:", 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v104[0] = v60;
          objc_msgSend(v83, "objectAtIndexedSubscript:", 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v104[1] = v61;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v62, 0, CFSTR("dR"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = v76;
          if (v99)
          {
            objc_msgSend(v84, "objectAtIndexedSubscript:", 2);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v103[0] = v64;
            objc_msgSend(v83, "objectAtIndexedSubscript:", 2);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v103[1] = v65;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v66, -1, CFSTR("dh"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
              goto LABEL_40;
          }
          else
          {
            v81 = 0;
            if (v95)
            {
LABEL_40:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dx"), v101);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v63, v95, v67);
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v63, -1, 0);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v93, -1, 0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v68, 0, 1, 0);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dW"), v101);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v70, v69, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              if (bias)
              {
LABEL_41:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ db"), v101);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v63, &unk_1E0E9AEB8, v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_45:
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
                objc_msgSend(v43, "addObject:", v82);
                objc_msgSend(v43, "addObject:", v77);
                if (v72)
                  objc_msgSend(v43, "addObject:", v72);
                if (v74)
                  objc_msgSend(v43, "addObject:", v74);
                if (v81)
                  objc_msgSend(v43, "addObject:", v81);

LABEL_52:
                goto LABEL_53;
              }
LABEL_44:
              v74 = 0;
              goto LABEL_45;
            }
          }
          v72 = 0;
          v82 = v63;
          if (bias)
            goto LABEL_41;
          goto LABEL_44;
        }
      }
      v78 = 0;
      v79 = 0;
      v36 = v96;
      if (v96)
        goto LABEL_9;
      goto LABEL_37;
    }
  }
  v43 = 0;
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_53:

  return (NSArray *)v43;
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:", source, recurrentWeight, sourceGradient, zState, 0, inputWeight, bias, initState, mask, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:", source, recurrentWeight, sourceGradient, zState, 0, inputWeight, bias, initState, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:](self, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:stateGradient:inputWeight:bias:initState:mask:descriptor:name:", source, recurrentWeight, sourceGradient, zState, 0, 0, 0, initState, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v18;
  MPSGraphTensor *v19;
  MPSGraph *v20;
  MPSGraphLSTMDescriptor *v21;
  MPSGraphTensor *v22;
  void *v23;
  void *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MPSGraphLSTMOp *v44;
  MPSGraphLSTMOp *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  MPSGraphLSTMOp *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v75;
  void *v76;
  void *v77;
  MPSGraphLSTMOp *v78;
  MPSGraphLSTMOp *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  MPSGraphLSTMOp *v84;
  MPSGraphTensor *v85;
  MPSGraphTensor *v86;
  MPSGraphTensor *v87;
  MPSGraphTensor *v88;
  MPSGraphTensor *v89;
  MPSGraphTensor *v90;
  MPSGraphTensor *v91;
  MPSGraphTensor *v92;
  NSString *v93;
  void *v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[3];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[4];

  v100[2] = *MEMORY[0x1E0C80C00];
  v18 = source;
  v92 = recurrentWeight;
  v19 = inputWeight;
  v91 = bias;
  v89 = initState;
  v87 = initCell;
  v20 = self;
  v88 = mask;
  v90 = peephole;
  v21 = descriptor;
  v93 = name;
  v22 = v18;
  v85 = v22;
  v86 = v19;
  if (v19)
  {
    -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v19, 0, 1, CFSTR("W^T"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ W^T"), v93);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v22, v23, v24);
    v22 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[MPSGraphLSTMDescriptor bidirectional](v21, "bidirectional"))
  {
    if (v91)
    {
      v58 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphTensor name](v22, "name");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("%@ + b"), v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v22, v91, v60);
      v61 = objc_claimAutoreleasedReturnValue();

      v22 = (MPSGraphTensor *)v61;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (_BYTE *)-[MPSGraphLSTMDescriptor copy](v21, "copy");

    if (objc_msgSend(v25, "reverse"))
    {
      -[MPSGraphTensor name](v22, "name");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v22, &unk_1E0E9AF60, v62);
      v63 = objc_claimAutoreleasedReturnValue();

      v22 = (MPSGraphTensor *)v63;
    }
    objc_msgSend(v25, "setReverse:", 0);
    objc_msgSend(v34, "addObject:", v22);
    objc_msgSend(v34, "addObject:", v92);
    if (v89)
    {
      objc_msgSend(v34, "addObject:", v89);
      v25[9] = 1;
    }
    if (v87)
    {
      objc_msgSend(v34, "addObject:", v87);
      v25[10] = 1;
    }
    if (v88)
    {
      objc_msgSend(v34, "addObject:", v88);
      v25[8] = 1;
    }
    if (v90)
    {
      objc_msgSend(v34, "addObject:", v90);
      v25[11] = 1;
    }
    v64 = [MPSGraphLSTMOp alloc];
    v84 = -[MPSGraphLSTMOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v64, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v34, MEMORY[0x1E0C9AA60], v25, v93);
    if ((objc_msgSend(v25, "produceCell") & 1) != 0 || objc_msgSend(v25, "training"))
    {
      -[MPSGraphOperation outputTensors](v84, "outputTensors");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

      goto LABEL_47;
    }
    -[MPSGraphOperation outputTensors](v84, "outputTensors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:

    goto LABEL_46;
  }
  v25 = (_BYTE *)-[MPSGraphLSTMDescriptor copy](v21, "copy");

  objc_msgSend(v25, "setBidirectional:", 0);
  -[MPSGraphTensor shape](v92, "shape");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[MPSGraphTensor shape](v92, "shape");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "integerValue");

    if ((v29 & 0x8000000000000000) == 0)
    {
      if (v91)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphTensor name](v22, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ + b"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](v20, "additionWithPrimaryTensor:secondaryTensor:name:", v22, v91, v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v22 = (MPSGraphTensor *)v33;
      }
      -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v22, -1, 0, 4 * v29, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v22, -1, 4 * v29, 4 * v29, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v92, 0, 0, 1, 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v92, 0, 1, 1, 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](v20, "reverseTensor:axes:name:", v35, &unk_1E0E9AF00, 0);
      v84 = (MPSGraphLSTMOp *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addObject:", v34);
      objc_msgSend(v82, "addObject:", v80);
      objc_msgSend(v83, "addObject:", v84);
      objc_msgSend(v83, "addObject:", v81);
      if (v89)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v89, -1, 0, v29, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v89, -1, v29, v29, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v36);
        objc_msgSend(v83, "addObject:", v37);
        v25[9] = 1;

      }
      if (v87)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v87, -1, 0, v29, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v87, -1, v29, v29, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v38);
        objc_msgSend(v83, "addObject:", v39);
        v25[10] = 1;

      }
      if (v88)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v88, -1, 0, v29, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v88, -1, v29, v29, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v40);
        objc_msgSend(v83, "addObject:", v41);
        v25[8] = 1;

      }
      if (v90)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v90, 0, 0, 1, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](v20, "sliceTensor:dimension:start:length:name:", v90, 0, 1, 1, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v42);
        objc_msgSend(v83, "addObject:", v43);
        v25[11] = 1;

      }
      v44 = [MPSGraphLSTMOp alloc];
      v79 = -[MPSGraphLSTMOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v44, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", v20, v82, MEMORY[0x1E0C9AA60], v25, v93);
      v45 = [MPSGraphLSTMOp alloc];
      v78 = -[MPSGraphLSTMOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v45, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", v20, v83, MEMORY[0x1E0C9AA60], v25, v93);
      -[MPSGraphOperation outputTensors](v78, "outputTensors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](v20, "reverseTensor:axes:name:", v47, &unk_1E0E9AF18, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphOperation outputTensors](v79, "outputTensors");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v49;
      v100[1] = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](v20, "concatTensors:dimension:name:", v50, -1, v93);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v25, "produceCell") & 1) != 0 || objc_msgSend(v25, "training"))
      {
        -[MPSGraphOperation outputTensors](v78, "outputTensors");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reverseTensor:axes:name:](v20, "reverseTensor:axes:name:", v52, &unk_1E0E9AF30, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPSGraphOperation outputTensors](v79, "outputTensors");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v99[0] = v55;
        v99[1] = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](v20, "concatTensors:dimension:name:", v56, -1, v93);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v57 = 0;
      }
      if (objc_msgSend(v25, "training"))
      {
        -[MPSGraphOperation outputTensors](v78, "outputTensors");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndexedSubscript:", 2);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reverseTensor:axes:name:](v20, "reverseTensor:axes:name:", v67, &unk_1E0E9AF48, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPSGraphOperation outputTensors](v79, "outputTensors");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v69;
        v98[1] = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - training state"), v93);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](v20, "concatTensors:dimension:name:", v70, -1, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        v97[0] = v76;
        v97[1] = v57;
        v97[2] = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (objc_msgSend(v25, "produceCell"))
        {
          v96[0] = v76;
          v96[1] = v57;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
          v73 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v95 = v76;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
          v73 = objc_claimAutoreleasedReturnValue();
        }
        v65 = (void *)v73;
      }

      goto LABEL_45;
    }
  }
  v65 = 0;
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_47:

  return (NSArray *)v65;
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph LSTMWithSourceTensor:recurrentWeight:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMWithSourceTensor:recurrentWeight:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", source, recurrentWeight, inputWeight, bias, initState, initCell, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph LSTMWithSourceTensor:recurrentWeight:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMWithSourceTensor:recurrentWeight:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", source, recurrentWeight, 0, 0, initState, initCell, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd stateGradient:(MPSGraphTensor *)stateGradient cellGradient:(MPSGraphTensor *)cellGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v22;
  MPSGraphLSTMDescriptor *v23;
  _BYTE *v24;
  MPSGraphTensor *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  MPSGraphTensor *v37;
  uint64_t v38;
  MPSGraphTensor *v39;
  uint64_t v40;
  MPSGraphTensor *v41;
  uint64_t v42;
  MPSGraphTensor *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  MPSGraphTensor *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  MPSGraphLSTMDescriptor *v113;
  void *v114;
  void *v115;
  void *v116;
  MPSGraphTensor *v117;
  MPSGraphTensor *v118;
  MPSGraphTensor *v119;
  void *v120;
  MPSGraphTensor *v121;
  MPSGraphTensor *v122;
  MPSGraphTensor *v123;
  void *v124;
  MPSGraphLSTMGradientOp *v125;
  MPSGraphTensor *v126;
  void *v127;
  MPSGraphTensor *v128;
  MPSGraphTensor *v129;
  void *v130;
  MPSGraphTensor *v132;
  MPSGraphTensor *v133;
  MPSGraphTensor *v134;
  MPSGraphTensor *v135;
  void *v136;
  NSString *v137;
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[4];

  v142[2] = *MEMORY[0x1E0C80C00];
  v121 = source;
  v134 = recurrentWeight;
  v135 = sourceGradient;
  v119 = zState;
  v118 = cellOutputFwd;
  v123 = stateGradient;
  v128 = cellGradient;
  v126 = inputWeight;
  v117 = bias;
  v133 = initState;
  v132 = initCell;
  v122 = mask;
  v22 = peephole;
  v23 = descriptor;
  v137 = name;
  v113 = v23;
  v129 = v22;
  v24 = (_BYTE *)-[MPSGraphLSTMDescriptor copy](v23, "copy");
  v25 = v134;
  if (!objc_msgSend(v24, "bidirectional"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v123)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v135, 0, -1, 1, CFSTR("lastSlice"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v50, v123, CFSTR("total derivative last state"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph cropTensor:dimension:amount_before:amount_after:name:](self, "cropTensor:dimension:amount_before:amount_after:name:", v135, 0, 0, 1, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v138[0] = v52;
      v138[1] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v53, 0, 0);
      v54 = objc_claimAutoreleasedReturnValue();

      v55 = (MPSGraphTensor *)v54;
      v25 = v134;
    }
    else
    {
      v55 = v135;
    }
    v135 = v55;
    objc_msgSend(v136, "addObject:");
    objc_msgSend(v136, "addObject:", v25);
    objc_msgSend(v136, "addObject:", v119);
    objc_msgSend(v136, "addObject:", v118);
    if (v133)
    {
      objc_msgSend(v136, "addObject:", v133);
      v24[9] = 1;
    }
    if (v132)
    {
      objc_msgSend(v136, "addObject:", v132);
      v24[10] = 1;
    }
    if (v122)
    {
      objc_msgSend(v136, "addObject:", v122);
      v24[8] = 1;
    }
    if (v22)
    {
      objc_msgSend(v136, "addObject:", v22);
      v24[11] = 1;
    }
    if (v128)
    {
      objc_msgSend(v136, "addObject:", v128);
      v24[12] = 1;
    }
    v125 = -[MPSGraphLSTMGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:name:]([MPSGraphLSTMGradientOp alloc], "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v136, 0, v24, v137);
    -[MPSGraphOperation outputTensors](v125, "outputTensors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "reverse"))
    {
      objc_msgSend(v58, "name");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v58, &unk_1E0E9AFF0, v59);
      v60 = objc_claimAutoreleasedReturnValue();

      v58 = (void *)v60;
    }
    -[MPSGraphOperation outputTensors](v125, "outputTensors");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v58;
    if (v22)
    {
      -[MPSGraphOperation outputTensors](v125, "outputTensors");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", 2);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 3;
      if (v133)
        goto LABEL_32;
    }
    else
    {
      v120 = 0;
      v63 = 2;
      if (v133)
      {
LABEL_32:
        -[MPSGraphOperation outputTensors](v125, "outputTensors");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndexedSubscript:", v63);
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        ++v63;
        if (v132)
          goto LABEL_33;
        goto LABEL_38;
      }
    }
    v124 = 0;
    if (v132)
    {
LABEL_33:
      -[MPSGraphOperation outputTensors](v125, "outputTensors");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectAtIndexedSubscript:", v63);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = 0x1E0CB3000uLL;
      if (v126)
        goto LABEL_34;
      goto LABEL_39;
    }
LABEL_38:
    v127 = 0;
    v66 = 0x1E0CB3000;
    if (v126)
    {
LABEL_34:
      objc_msgSend(*(id *)(v66 + 2368), "stringWithFormat:", CFSTR("%@ dx"), v137);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v30, v126, v67);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v30, -1, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v121, -1, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v68, 0, 1, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v66 + 2368), "stringWithFormat:", CFSTR("%@ dW"), v137);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v70, v69, v71);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (v117)
      {
LABEL_35:
        objc_msgSend(*(id *)(v66 + 2368), "stringWithFormat:", CFSTR("%@ db"), v137);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v30, &unk_1E0E9B008, v72);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
        objc_msgSend(v56, "addObject:", v116);
        objc_msgSend(v56, "addObject:", v114);
        if (v130)
          objc_msgSend(v56, "addObject:", v130);
        if (v115)
          objc_msgSend(v56, "addObject:", v115);
        if (v120)
          objc_msgSend(v56, "addObject:", v120);
        if (v124)
          objc_msgSend(v56, "addObject:", v124);
        if (v127)
          objc_msgSend(v56, "addObject:");
        else
          v127 = 0;
        goto LABEL_73;
      }
LABEL_40:
      v115 = 0;
      goto LABEL_41;
    }
LABEL_39:
    v130 = 0;
    v116 = v30;
    if (v117)
      goto LABEL_35;
    goto LABEL_40;
  }
  objc_msgSend(v24, "setBidirectional:", 0);
  -[MPSGraphTensor shape](v134, "shape");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[MPSGraphTensor shape](v134, "shape");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "integerValue");

    if ((v29 & 0x8000000000000000) == 0)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v134, 0, 0, 1, 0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v134, 0, 1, 1, 0);
      v125 = (MPSGraphLSTMGradientOp *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v135, -1, 0, v29, 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v135, -1, v29, v29, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v31, &unk_1E0E9AF78, 0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v119, -1, 0, 4 * v29, 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v119, -1, 4 * v29, 4 * v29, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v32, &unk_1E0E9AF90, 0);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v118, -1, 0, v29, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v116 = (void *)v33;
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v118, -1, v29, v29, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v34, &unk_1E0E9AFA8, 0);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (v122)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v122, -1, 0, v29, 0);
        v35 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v122, -1, v29, v29, 0);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = (void *)v35;
        if (v22)
          goto LABEL_6;
      }
      else
      {
        v120 = 0;
        v115 = 0;
        if (v22)
        {
LABEL_6:
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v22, 0, 0, 1, 0);
          v36 = objc_claimAutoreleasedReturnValue();
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v22, 0, 1, 1, 0);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = (void *)v36;
          v37 = v133;
          if (v133)
            goto LABEL_7;
          goto LABEL_55;
        }
      }
      v99 = 0;
      v102 = 0;
      v37 = v133;
      if (v133)
      {
LABEL_7:
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v37, -1, 0, v29, 0);
        v38 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v37, -1, v29, v29, 0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = (void *)v38;
        v39 = v132;
        if (v132)
          goto LABEL_8;
        goto LABEL_56;
      }
LABEL_55:
      v100 = 0;
      v104 = 0;
      v39 = v132;
      if (v132)
      {
LABEL_8:
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v39, -1, 0, v29, 0);
        v40 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v39, -1, v29, v29, 0);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = (void *)v40;
        v41 = v123;
        if (v123)
          goto LABEL_9;
        goto LABEL_57;
      }
LABEL_56:
      v106 = 0;
      v101 = 0;
      v41 = v123;
      if (v123)
      {
LABEL_9:
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v41, -1, 0, v29, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v41, -1, v29, v29, 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)v42;
        v43 = v128;
        if (v128)
        {
LABEL_10:
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v43, -1, 0, v29, 0);
          v44 = objc_claimAutoreleasedReturnValue();
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v128, -1, v29, v29, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraphTensor shape](v128, "shape");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46
            && (-[MPSGraphTensor shape](v128, "shape"),
                v47 = (void *)objc_claimAutoreleasedReturnValue(),
                v48 = objc_msgSend(v47, "count"),
                v47,
                v46,
                v48 >= 3))
          {
            -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v45, &unk_1E0E9AFC0, 0);
            v49 = objc_claimAutoreleasedReturnValue();

            v105 = (void *)v44;
            v110 = (void *)v49;
          }
          else
          {
            v105 = (void *)v44;
            v110 = v45;
          }
LABEL_59:
          objc_msgSend(v24, "setReverse:", 0);
          -[MPSGraph LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", v121, v136, v30, v124, v33, v107, v105, 0, 0, v104, v106, v115, v102, v24, v137);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setReverse:", 1);
          -[MPSGraph LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", v121, v125, v114, v127, v130, v103, v110, 0, 0, v100, v101, v120, v99, v24, v137);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "objectAtIndexedSubscript:", 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v142[0] = v73;
          objc_msgSend(v111, "objectAtIndexedSubscript:", 0);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v142[1] = v74;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v75, -1, CFSTR("dz"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v112, "objectAtIndexedSubscript:", 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v141[0] = v76;
          objc_msgSend(v111, "objectAtIndexedSubscript:", 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v141[1] = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v78, 0, CFSTR("dR"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          v79 = v97;
          if (v133)
          {
            objc_msgSend(v112, "objectAtIndexedSubscript:", 2);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v140[0] = v80;
            objc_msgSend(v111, "objectAtIndexedSubscript:", 2);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v140[1] = v81;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 2);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v82, -1, CFSTR("dh"));
            v108 = (void *)objc_claimAutoreleasedReturnValue();

            v83 = 3;
            if (v132)
              goto LABEL_61;
          }
          else
          {
            v108 = 0;
            v83 = 2;
            if (v132)
            {
LABEL_61:
              objc_msgSend(v112, "objectAtIndexedSubscript:", v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v139[0] = v84;
              objc_msgSend(v111, "objectAtIndexedSubscript:", v83);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v139[1] = v85;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 2);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v86, -1, CFSTR("dc"));
              v109 = (void *)objc_claimAutoreleasedReturnValue();

              if (v126)
                goto LABEL_62;
              goto LABEL_77;
            }
          }
          v109 = 0;
          if (v126)
          {
LABEL_62:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dx"), v137);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v79, v126, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v79, -1, 0);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v121, -1, 0);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v89, 0, 1, 0);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dW"), v137);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v91, v90, v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            if (v117)
              goto LABEL_63;
            goto LABEL_78;
          }
LABEL_77:
          v93 = 0;
          v88 = v79;
          if (v117)
          {
LABEL_63:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ db"), v137);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v79, &unk_1E0E9AFD8, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v129)
            {
LABEL_64:
              v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
              objc_msgSend(v56, "addObject:", v88);
              objc_msgSend(v56, "addObject:", v98);
              if (v93)
                objc_msgSend(v56, "addObject:", v93);
              if (v95)
                objc_msgSend(v56, "addObject:", v95);
              if (v108)
                objc_msgSend(v56, "addObject:", v108);
              if (v109)
                objc_msgSend(v56, "addObject:", v109);

LABEL_73:
              goto LABEL_74;
            }
LABEL_79:
            __assert_rtn("-[MPSGraph(MPSGraphRNNOps) LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:]", "MPSGraphRNNOps.mm", 1685, "!peephole");
          }
LABEL_78:
          v95 = 0;
          if (!v129)
            goto LABEL_64;
          goto LABEL_79;
        }
LABEL_58:
        v105 = 0;
        v110 = 0;
        goto LABEL_59;
      }
LABEL_57:
      v107 = 0;
      v103 = 0;
      v43 = v128;
      if (v128)
        goto LABEL_10;
      goto LABEL_58;
    }
  }
  v56 = 0;
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_74:

  return (NSArray *)v56;
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", source, recurrentWeight, sourceGradient, zState, cellOutputFwd, 0, 0, inputWeight, bias, initState, initCell, mask, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", source, recurrentWeight, sourceGradient, zState, cellOutputFwd, 0, 0, inputWeight, bias, initState, initCell, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:](self, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", source, recurrentWeight, sourceGradient, zState, cellOutputFwd, 0, 0, 0, 0, 0, 0, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v17;
  MPSGraphTensor *v18;
  MPSGraphGRUDescriptor *v19;
  NSString *v20;
  MPSGraphTensor *v21;
  void *v22;
  void *v23;
  void *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MPSGraphGRUOp *v42;
  MPSGraphGRUOp *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  MPSGraphGRUOp *v64;
  MPSGraphGRUOp *v65;
  void *v67;
  MPSGraphGRUOp *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  MPSGraphGRUOp *v75;
  void *v76;
  void *v77;
  MPSGraphTensor *v78;
  MPSGraphTensor *v79;
  MPSGraphTensor *v80;
  MPSGraphTensor *v81;
  MPSGraphTensor *v82;
  MPSGraphTensor *v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v17 = source;
  v83 = recurrentWeight;
  v18 = inputWeight;
  v82 = bias;
  v80 = initState;
  v79 = mask;
  v81 = secondaryBias;
  v19 = descriptor;
  v20 = name;
  v21 = v17;
  v22 = v21;
  v78 = v18;
  if (v18)
  {
    -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v18, 0, 1, CFSTR("W^T"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ W^T"), v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v21, v23, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[MPSGraphGRUDescriptor bidirectional](v19, "bidirectional"))
  {
    v25 = (_BYTE *)-[MPSGraphGRUDescriptor copy](v19, "copy");

    objc_msgSend(v25, "setBidirectional:", 0);
    -[MPSGraphTensor shape](v83, "shape");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_27;
    -[MPSGraphTensor shape](v83, "shape");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "integerValue");

    if (v29 < 0)
    {
LABEL_27:
      v56 = 0;
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
    }
    else
    {
      if (v82)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v22, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ + b"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v22, v82, v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v33;
      }
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v22, -1, 0, 3 * v29, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v22, -1, 3 * v29, 3 * v29, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)v34;
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v83, 0, 0, 1, 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v83, 0, 1, 1, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v35, &unk_1E0E9B020, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObject:", v34);
      objc_msgSend(v77, "addObject:", v73);
      objc_msgSend(v76, "addObject:", v72);
      objc_msgSend(v76, "addObject:", v74);
      if (v80)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v80, -1, 0, v29, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v80, -1, v29, v29, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v36);
        objc_msgSend(v76, "addObject:", v37);
        v25[9] = 1;

      }
      if (v79)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v79, -1, 0, v29, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v79, -1, v29, v29, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v38);
        objc_msgSend(v76, "addObject:", v39);
        v25[8] = 1;

      }
      if (v81)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v81, -1, 0, v29, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v81, -1, v29, v29, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v40);
        objc_msgSend(v76, "addObject:", v41);
        v25[10] = 1;

      }
      v42 = [MPSGraphGRUOp alloc];
      v75 = -[MPSGraphGRUOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v42, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v77, MEMORY[0x1E0C9AA60], v25, v20);
      v43 = [MPSGraphGRUOp alloc];
      v68 = -[MPSGraphGRUOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v43, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v76, MEMORY[0x1E0C9AA60], v25, v20);
      -[MPSGraphOperation outputTensors](v68, "outputTensors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v45, &unk_1E0E9B038, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphOperation outputTensors](v75, "outputTensors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v47;
      v87[1] = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v48, -1, v20);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "training"))
      {
        -[MPSGraphOperation outputTensors](v68, "outputTensors");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v50, &unk_1E0E9B050, 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPSGraphOperation outputTensors](v75, "outputTensors");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = v52;
        v86[1] = v67;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - training state"), v20);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v53, -1, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v85[0] = v69;
        v85[1] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v84 = v69;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    if (v82)
    {
      v57 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v22, "name");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringWithFormat:", CFSTR("%@ + b"), v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v22, v82, v59);
      v60 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v60;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (_BYTE *)-[MPSGraphGRUDescriptor copy](v19, "copy");

    if (objc_msgSend(v25, "reverse"))
    {
      objc_msgSend(v22, "name");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v22, &unk_1E0E9B068, v62);
      v63 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v63;
    }
    objc_msgSend(v25, "setReverse:", 0);
    objc_msgSend(v61, "addObject:", v22);
    objc_msgSend(v61, "addObject:", v83);
    if (v80)
    {
      objc_msgSend(v61, "addObject:", v80);
      v25[9] = 1;
    }
    if (v79)
    {
      objc_msgSend(v61, "addObject:", v79);
      v25[8] = 1;
    }
    if (v81)
    {
      objc_msgSend(v61, "addObject:", v81);
      v25[10] = 1;
    }
    v64 = [MPSGraphGRUOp alloc];
    v65 = -[MPSGraphGRUOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v64, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v61, MEMORY[0x1E0C9AA60], v25, v20);
    -[MPSGraphOperation outputTensors](v65, "outputTensors");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v56;
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph GRUWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", source, recurrentWeight, inputWeight, bias, initState, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph GRUWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", source, recurrentWeight, inputWeight, bias, 0, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphGRUDescriptor *v20;
  _BYTE *v21;
  MPSGraphTensor *v22;
  MPSGraphTensor *v23;
  MPSGraphTensor *v24;
  MPSGraphTensor *v25;
  MPSGraph *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  MPSGraphTensor *v40;
  uint64_t v41;
  uint64_t v42;
  MPSGraphTensor *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  MPSGraphTensor *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  MPSGraph *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  MPSGraphGRUDescriptor *v105;
  void *v106;
  void *v107;
  void *v108;
  MPSGraphTensor *v109;
  void *v110;
  MPSGraphGRUGradientOp *v111;
  MPSGraphTensor *v112;
  void *v113;
  MPSGraphTensor *v114;
  MPSGraphTensor *v115;
  MPSGraphTensor *v116;
  void *v117;
  void *v118;
  MPSGraphTensor *v119;
  MPSGraphTensor *v120;
  MPSGraphTensor *v121;
  MPSGraphTensor *v122;
  NSString *v123;
  MPSGraphTensor *v124;
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[4];

  v130[2] = *MEMORY[0x1E0C80C00];
  v112 = source;
  v121 = recurrentWeight;
  v119 = sourceGradient;
  v122 = zState;
  v109 = outputFwd;
  v116 = stateGradient;
  v115 = inputWeight;
  v124 = initState;
  v114 = mask;
  v120 = secondaryBias;
  v20 = descriptor;
  v123 = name;
  v105 = v20;
  v21 = (_BYTE *)-[MPSGraphGRUDescriptor copy](v20, "copy");
  v22 = v121;
  v23 = v122;
  v24 = v119;
  v25 = v124;
  v26 = self;
  if (!objc_msgSend(v21, "bidirectional"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v119, 0, -1, 1, CFSTR("lastSlice"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v45, v116, CFSTR("total derivative last state"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph cropTensor:dimension:amount_before:amount_after:name:](self, "cropTensor:dimension:amount_before:amount_after:name:", v119, 0, 0, 1, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v47;
      v126[1] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v48, 0, 0);
      v49 = objc_claimAutoreleasedReturnValue();

      v24 = (MPSGraphTensor *)v49;
      v22 = v121;
      v23 = v122;
      v25 = v124;
      v26 = self;
    }
    v119 = v24;
    objc_msgSend(v118, "addObject:", v24);
    objc_msgSend(v118, "addObject:", v22);
    objc_msgSend(v118, "addObject:", v23);
    objc_msgSend(v118, "addObject:", v109);
    if (v25)
    {
      objc_msgSend(v118, "addObject:", v25);
      v21[9] = 1;
    }
    if (v114)
    {
      objc_msgSend(v118, "addObject:", v114);
      v21[8] = 1;
    }
    if (v120)
    {
      objc_msgSend(v118, "addObject:", v120);
      v21[10] = 1;
    }
    v111 = -[MPSGraphGRUGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:name:]([MPSGraphGRUGradientOp alloc], "initWithGraph:inputTensors:controlDependencies:descriptor:name:", v26, v118, 0, v21, v123);
    -[MPSGraphOperation outputTensors](v111, "outputTensors");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v124;
    if (objc_msgSend(v21, "reverse"))
    {
      objc_msgSend(v51, "name");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v51, &unk_1E0E9B0E0, v53);
      v54 = objc_claimAutoreleasedReturnValue();

      v51 = (void *)v54;
      v52 = v124;
    }
    -[MPSGraphOperation outputTensors](v111, "outputTensors");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v51;
    if (v52)
    {
      -[MPSGraphOperation outputTensors](v111, "outputTensors");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 2);
      v110 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = 3;
      v58 = self;
      if (v120)
        goto LABEL_23;
    }
    else
    {
      v110 = 0;
      v57 = 2;
      v58 = self;
      if (v120)
      {
LABEL_23:
        -[MPSGraphOperation outputTensors](v111, "outputTensors");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", v57);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = self;
        v60 = 0x1E0CB3000uLL;
        if (v115)
          goto LABEL_24;
        goto LABEL_30;
      }
    }
    v113 = 0;
    v60 = 0x1E0CB3000;
    if (v115)
    {
LABEL_24:
      objc_msgSend(*(id *)(v60 + 2368), "stringWithFormat:", CFSTR("%@ dx"), v123);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](v58, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v31, v115, v61);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v31, -1, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v112, -1, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v62, 0, 1, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v60 + 2368), "stringWithFormat:", CFSTR("%@ dW"), v123);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v64, v63, v65);
      v117 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = self;
      if (bias)
      {
LABEL_25:
        objc_msgSend(*(id *)(v60 + 2368), "stringWithFormat:", CFSTR("%@ db"), v123);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reductionSumWithTensor:axes:name:](v58, "reductionSumWithTensor:axes:name:", v31, &unk_1E0E9B0F8, v66);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
        objc_msgSend(v67, "addObject:", v108);
        objc_msgSend(v67, "addObject:", v106);
        if (v117)
          objc_msgSend(v67, "addObject:", v117);
        if (v107)
          objc_msgSend(v67, "addObject:", v107);
        if (v110)
          objc_msgSend(v67, "addObject:", v110);
        if (!v113)
        {

LABEL_64:
          goto LABEL_65;
        }
        objc_msgSend(v67, "addObject:");
LABEL_63:

        goto LABEL_64;
      }
LABEL_31:
      v107 = 0;
      goto LABEL_32;
    }
LABEL_30:
    v117 = 0;
    v108 = v31;
    if (bias)
      goto LABEL_25;
    goto LABEL_31;
  }
  objc_msgSend(v21, "setBidirectional:", 0);
  -[MPSGraphTensor shape](v121, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[MPSGraphTensor shape](v121, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");

    if ((v30 & 0x8000000000000000) == 0)
    {
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v121, 0, 0, 1, 0);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v121, 0, 1, 1, 0);
      v111 = (MPSGraphGRUGradientOp *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v119, -1, 0, v30, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v119, -1, v30, v30, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v32, &unk_1E0E9B080, 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v21, "resetAfter");
      v34 = 3;
      if (v33)
        v34 = 4;
      v35 = v34 * v30;
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v122, -1, 0, v34 * v30, 0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v122, -1, v35, v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v36, &unk_1E0E9B098, 0);
      v37 = objc_claimAutoreleasedReturnValue();

      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v109, -1, 0, v30, 0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = (void *)v37;
      -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v109, -1, v30, v30, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph reverseTensor:axes:name:](self, "reverseTensor:axes:name:", v38, &unk_1E0E9B0B0, 0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v114)
      {
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v114, -1, 0, v30, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v114, -1, v30, v30, 0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = (void *)v39;
        v40 = v120;
        if (v120)
          goto LABEL_8;
      }
      else
      {
        v95 = 0;
        v113 = 0;
        v40 = v120;
        if (v120)
        {
LABEL_8:
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v40, -1, 0, v30, 0);
          v41 = objc_claimAutoreleasedReturnValue();
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v40, -1, v30, v30, 0);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = (void *)v41;
          if (v124)
            goto LABEL_9;
          goto LABEL_43;
        }
      }
      v96 = 0;
      v41 = 0;
      v92 = 0;
      if (v124)
      {
LABEL_9:
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v124, -1, 0, v30, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v124, -1, v30, v30, 0);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = (void *)v42;
        v43 = v116;
        if (v116)
        {
LABEL_10:
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v43, -1, 0, v30, 0);
          v44 = objc_claimAutoreleasedReturnValue();
          -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v116, -1, v30, v30, 0);
          v99 = (void *)v44;
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
LABEL_44:
        v99 = 0;
        v101 = 0;
LABEL_45:
        objc_msgSend(v21, "setReverse:", 0);
        -[MPSGraph GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", v112, v118, v31, v110, v117, v99, 0, 0, v98, v113, v41, v21, v123);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setReverse:", 1);
        -[MPSGraph GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", v112, v111, v106, v37, v107, v101, 0, 0, v97, v95, v96, v21, v123);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v130[0] = v68;
        objc_msgSend(v103, "objectAtIndexedSubscript:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v130[1] = v69;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v70, -1, CFSTR("dz"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v104, "objectAtIndexedSubscript:", 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v129[0] = v71;
        objc_msgSend(v103, "objectAtIndexedSubscript:", 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v129[1] = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v73, 0, CFSTR("dR"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = v93;
        if (v124)
        {
          objc_msgSend(v104, "objectAtIndexedSubscript:", 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v128[0] = v75;
          objc_msgSend(v103, "objectAtIndexedSubscript:", 2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v128[1] = v76;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v77, -1, CFSTR("dh"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = 3;
          if (v120)
            goto LABEL_47;
        }
        else
        {
          v100 = 0;
          v78 = 2;
          if (v120)
          {
LABEL_47:
            objc_msgSend(v104, "objectAtIndexedSubscript:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v127[0] = v79;
            objc_msgSend(v103, "objectAtIndexedSubscript:", v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v127[1] = v80;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v81, -1, CFSTR("db2"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v115)
              goto LABEL_48;
            goto LABEL_52;
          }
        }
        v82 = 0;
        if (v115)
        {
LABEL_48:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dx"), v123);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v74, v115, v83);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v74, -1, 0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph flatten2DTensor:axis:name:](self, "flatten2DTensor:axis:name:", v112, -1, 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v84, 0, 1, 0);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ dW"), v123);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v86, v85, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (bias)
          {
LABEL_49:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ db"), v123);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v74, &unk_1E0E9B0C8, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_54:
            v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
            objc_msgSend(v67, "addObject:", v102);
            objc_msgSend(v67, "addObject:", v94);
            if (v88)
              objc_msgSend(v67, "addObject:", v88);
            if (v90)
              objc_msgSend(v67, "addObject:", v90);
            if (v100)
              objc_msgSend(v67, "addObject:", v100);
            if (v82)
              objc_msgSend(v67, "addObject:", v82);

            goto LABEL_63;
          }
LABEL_53:
          v90 = 0;
          goto LABEL_54;
        }
LABEL_52:
        v88 = 0;
        v102 = v74;
        if (bias)
          goto LABEL_49;
        goto LABEL_53;
      }
LABEL_43:
      v97 = 0;
      v98 = 0;
      v43 = v116;
      if (v116)
        goto LABEL_10;
      goto LABEL_44;
    }
  }
  v67 = 0;
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_65:

  return (NSArray *)v67;
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", source, recurrentWeight, sourceGradient, zState, outputFwd, 0, inputWeight, bias, initState, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:](self, "GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", source, recurrentWeight, sourceGradient, zState, outputFwd, 0, inputWeight, bias, 0, 0, 0, descriptor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)controlDependencyWithOperations:(NSArray *)operations dependentBlock:(MPSGraphControlFlowDependencyBlock)dependentBlock name:(NSString *)name
{
  NSArray *v7;
  void (**v8)(_QWORD);
  _opaque_pthread_mutex_t *p_graphMutex;
  NSSet **p_currentControlDependencies;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;

  v7 = operations;
  v8 = dependentBlock;
  p_graphMutex = &self->_graphMutex;
  pthread_mutex_lock(&self->_graphMutex);
  p_currentControlDependencies = &self->_currentControlDependencies;
  v11 = (void *)-[NSSet copy](self->_currentControlDependencies, "copy");
  -[NSSet setByAddingObjectsFromArray:](*p_currentControlDependencies, "setByAddingObjectsFromArray:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *p_currentControlDependencies;
  *p_currentControlDependencies = (NSSet *)v12;

  v8[2](v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)p_currentControlDependencies, v11);
  pthread_mutex_unlock(p_graphMutex);

  return (NSArray *)v14;
}

- (NSArray)ifWithPredicateTensor:(MPSGraphTensor *)predicateTensor thenBlock:(MPSGraphIfThenElseBlock)thenBlock elseBlock:(MPSGraphIfThenElseBlock)elseBlock name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphIfThenElseBlock v11;
  MPSGraphIfThenElseBlock v12;
  NSString *v13;
  void *v14;
  void *v15;
  MPSGraphIfElseOp *v16;
  void *v17;
  MPSGraphIfElseOp *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = predicateTensor;
  v11 = thenBlock;
  v12 = elseBlock;
  v13 = name;
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v10, 2147483656, CFSTR("if_cast"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v14, MEMORY[0x1E0C9AA60], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [MPSGraphIfElseOp alloc];
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphIfElseOp initWithGraph:inputTensors:controlDependencies:trueBlock:falseBlock:name:](v16, "initWithGraph:inputTensors:controlDependencies:trueBlock:falseBlock:name:", self, v17, MEMORY[0x1E0C9AA60], v11, v12, v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSArray)whileWithInitialInputs:(NSArray *)initialInputs before:(MPSGraphWhileBeforeBlock)before after:(MPSGraphWhileAfterBlock)after name:(NSString *)name
{
  NSArray *v10;
  MPSGraphWhileBeforeBlock v11;
  MPSGraphWhileAfterBlock v12;
  NSString *v13;
  MPSGraphWhileOp *v14;
  MPSGraphWhileOp *v15;
  void *v16;

  v10 = initialInputs;
  v11 = before;
  v12 = after;
  v13 = name;
  v14 = [MPSGraphWhileOp alloc];
  v15 = -[MPSGraphWhileOp initWithGraph:inputTensors:controlDependencies:beforeBlock:afterBlock:name:](v14, "initWithGraph:inputTensors:controlDependencies:beforeBlock:afterBlock:name:", self, v10, MEMORY[0x1E0C9AA60], v11, v12, v13);
  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (NSArray)forLoopWithNumberOfIterations:(MPSGraphTensor *)numberOfIterations initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSArray *v11;
  MPSGraphForLoopBodyBlock v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = numberOfIterations;
  v11 = initialBodyArguments;
  v12 = body;
  v13 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", MEMORY[0x1E0C9AA60], 536870944, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", MEMORY[0x1E0C9AA60], 536870944, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph forLoopWithLowerBound:upperBound:step:initialBodyArguments:body:name:](self, "forLoopWithLowerBound:upperBound:step:initialBodyArguments:body:name:", v14, v10, v15, v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (NSArray)forLoopWithLowerBound:(MPSGraphTensor *)lowerBound upperBound:(MPSGraphTensor *)upperBound step:(MPSGraphTensor *)step initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name
{
  MPSGraphTensor *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MPSGraphForLoopOp *v25;
  MPSGraphForLoopOp *v26;
  void *v27;
  MPSGraphTensor *v29;
  MPSGraphForLoopBodyBlock v30;
  NSString *v31;
  MPSGraphTensor *v32;
  MPSGraphTensor *v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v14 = lowerBound;
  v33 = upperBound;
  v32 = step;
  v15 = initialBodyArguments;
  v30 = body;
  v31 = name;
  v29 = v14;
  -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v14, MEMORY[0x1E0C9AA60], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v16, 2147483680, CFSTR("for_cast"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v33, MEMORY[0x1E0C9AA60], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v18, 2147483680, CFSTR("for_cast"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v32, MEMORY[0x1E0C9AA60], 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v20, 2147483680, CFSTR("for_cast"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C99DE8];
  v34[0] = v17;
  v34[1] = v19;
  v34[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addObjectsFromArray:", v15);
  v25 = [MPSGraphForLoopOp alloc];
  v26 = -[MPSGraphForLoopOp initWithGraph:inputTensors:controlDependencies:bodyBlock:iterArgs:name:](v25, "initWithGraph:inputTensors:controlDependencies:bodyBlock:iterArgs:name:", self, v24, MEMORY[0x1E0C9AA60], v30, v15, v31);
  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v27;
}

- (MPSGraphTensor)depthwiseConvolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v9;
  MPSGraphDepthwiseConvolution2DOpDescriptor *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  MPSGraphTensor *v38;
  MPSGraphTensor *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  MPSGraphDepthwiseConvolution2DOp *v81;
  void *v82;
  MPSGraphDepthwiseConvolution2DOp *v83;
  MPSGraphDepthwiseConvolution3DOp *v84;
  void *v85;
  uint64_t v87;
  MPSGraphDepthwiseConvolution3DOp *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  MPSGraphDepthwiseConvolution2DOpDescriptor *v99;
  NSString *v100;
  MPSGraphTensor *v101;
  MPSGraphTensor *v102;
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[4];
  _QWORD v108[6];
  _QWORD v109[3];
  _QWORD v110[5];

  v110[3] = *MEMORY[0x1E0C80C00];
  v9 = source;
  v102 = weights;
  v10 = descriptor;
  v100 = name;
  v101 = v9;
  v99 = v10;
  -[MPSGraphTensor shape](v9, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 4)
  {
    -[MPSGraphTensor shape](v9, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "count");

  }
  -[MPSGraphTensor shape](v9, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v9, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v102, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") != 4)
  {
    -[MPSGraphTensor shape](v102, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "count");

  }
  -[MPSGraphTensor shape](v102, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v102, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v21 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInX](v10, "strideInX");
  v22 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInY](v10, "strideInY");
  v23 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInX](v10, "dilationRateInX");
  v24 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInY](v10, "dilationRateInY");
  v25 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingLeft](v10, "paddingLeft");
  v26 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingRight](v10, "paddingRight");
  v27 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingTop](v10, "paddingTop");
  v28 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingBottom](v10, "paddingBottom");
  v92 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingStyle](v10, "paddingStyle");
  v29 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dataLayout](v10, "dataLayout");
  v93 = -[MPSGraphDepthwiseConvolution2DOpDescriptor weightsLayout](v10, "weightsLayout");
  v110[0] = &unk_1E0E98830;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 3);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v109[0] = &unk_1E0E98830;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 3);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v108[0] = &unk_1E0E98848;
  v108[1] = &unk_1E0E98848;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v108[4] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v108[5] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 6);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v102;
  v39 = v38;
  if (v29 <= 6 && ((1 << v29) & 0x51) != 0)
  {
    -[MPSGraphTensor shape](v38, "shape");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40 || objc_msgSend(v40, "count") != 4)
      goto LABEL_44;
    if (v93 == 3)
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)v42;
      v45 = objc_msgSend(v44, "integerValue");

      objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "integerValue");

      v48 = (void *)v43;
      if ((v45 & 0x8000000000000000) == 0 && (v47 & 0x8000000000000000) == 0)
      {
        v107[0] = &unk_1E0E98830;
        v107[1] = v94;
        v107[2] = v43;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v47 * v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v107[3] = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 4);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphTensor name](v39, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v39, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph transposeTensor:permute:name:](self, "transposeTensor:permute:name:", v52, &unk_1E0E9B158, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -3;
        v48 = (void *)v43;
LABEL_50:

        goto LABEL_51;
      }
      goto LABEL_43;
    }
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "integerValue");

    objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "integerValue");

    objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v69;
    v94 = (void *)v68;
    if (v67 < 0)
    {
      v48 = (void *)v69;
    }
    else
    {
      v48 = (void *)v69;
      if ((v65 & 0x8000000000000000) == 0)
      {
        if (v65 < 2)
        {
          v55 = -3;
          v54 = v39;
LABEL_51:

          +[MPSGraphDepthwiseConvolution3DOpDescriptor descriptorWithStrides:dilationRates:paddingValues:paddingStyle:](MPSGraphDepthwiseConvolution3DOpDescriptor, "descriptorWithStrides:dilationRates:paddingValues:paddingStyle:", v97, v96, v95, v92);
          v83 = (MPSGraphDepthwiseConvolution2DOp *)objc_claimAutoreleasedReturnValue();
          -[MPSGraphDepthwiseConvolution2DOp setChannelDimensionIndex:](v83, "setChannelDimensionIndex:", v55);
          v88 = [MPSGraphDepthwiseConvolution3DOp alloc];
          v104[0] = v101;
          v104[1] = v54;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = -[MPSGraphDepthwiseConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v88, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v89, MEMORY[0x1E0C9AA60], v83, v100);

          -[MPSGraphOperation outputTensors](v84, "outputTensors");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_46;
        }
        -[MPSGraphTensor name](v39, "name");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph transposeTensor:permute:name:](self, "transposeTensor:permute:name:", v39, &unk_1E0E9B170, v71);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v106[0] = &unk_1E0E98830;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v67 * v65);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v106[1] = v53;
        v106[2] = v94;
        v48 = v70;
        v106[3] = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 4);
        v72 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "name");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)v72;
        -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v63, v72, v73);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -3;
        goto LABEL_49;
      }
    }
LABEL_43:

    goto LABEL_44;
  }
  if ((v29 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    goto LABEL_45;
  }
  -[MPSGraphTensor shape](v38, "shape");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v56;
  if (v56 && objc_msgSend(v56, "count") == 4)
  {
    if (v93 == 3)
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
      v58 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v59, "integerValue");

      objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "integerValue");

      if (v91 < 0 || (v62 = (void *)v57, v48 = (void *)v58, v63 = v39, v61 < 0))
      {
        v48 = (void *)v58;
        v94 = (void *)v57;
        goto LABEL_43;
      }
    }
    else
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v75, "integerValue");

      objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v76, "integerValue");

      objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
      v77 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = (void *)v78;
      if (v91 < 0 || v61 < 0)
      {
        v48 = (void *)v78;
        v94 = (void *)v77;
        goto LABEL_43;
      }
      if (v93 == 2)
      {
        -[MPSGraphTensor name](v39, "name");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph transposeTensor:permute:name:](self, "transposeTensor:permute:name:", v39, &unk_1E0E9B188, v80);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = (void *)v77;
        v48 = v79;
      }
      else
      {
        v62 = (void *)v77;
        v48 = (void *)v78;
        v63 = v39;
      }
    }
    v105[0] = &unk_1E0E98830;
    v105[1] = v62;
    v105[2] = v48;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v61 * v91);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v105[3] = v53;
    v94 = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 4);
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "name");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)v87;
    -[MPSGraph reshapeTensor:withShape:name:](self, "reshapeTensor:withShape:name:", v63, v87, v73);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -1;
LABEL_49:

    v52 = v74;
    goto LABEL_50;
  }
LABEL_44:

LABEL_45:
  v81 = [MPSGraphDepthwiseConvolution2DOp alloc];
  v103[0] = v101;
  v103[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[MPSGraphDepthwiseConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v81, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v82, MEMORY[0x1E0C9AA60], v10, v100);

  -[MPSGraphOperation outputTensors](v83, "outputTensors");
  v84 = (MPSGraphDepthwiseConvolution3DOp *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphDepthwiseConvolution3DOp objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v39;
LABEL_46:

  return (MPSGraphTensor *)v85;
}

- (id)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MPSGraphDepthwiseConvolution2DDataGradientOp *v27;
  void *v28;
  MPSGraphDepthwiseConvolution2DDataGradientOp *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 4)
  {
    objc_msgSend(v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  objc_msgSend(v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 4)
  {

  }
  else
  {
    objc_msgSend(v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 4)
  {
    objc_msgSend(v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  objc_msgSend(v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 4)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v27 = [MPSGraphDepthwiseConvolution2DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MPSGraphDepthwiseConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v27, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v28, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v29, "outputTensors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (MPSGraphTensor)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphDepthwiseConvolution2DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = weights;
  v14 = outputShape;
  v15 = descriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 4 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  v23 = xmmword_1812876C0;
  while (v17 < -[MPSShape count](v14, "count", v23))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B1A0, 536870944);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph depthwiseConvolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:](self, "depthwiseConvolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (id)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPSGraphDepthwiseConvolution2DWeightsGradientOp *v32;
  void *v33;
  MPSGraphDepthwiseConvolution2DWeightsGradientOp *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 4)
  {
    objc_msgSend(v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  objc_msgSend(v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 4)
  {

  }
  else
  {
    objc_msgSend(v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 4)
  {
    objc_msgSend(v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  objc_msgSend(v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 4)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v14, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count") != 1)
  {
    objc_msgSend(v13, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

  }
  objc_msgSend(v14, "shape");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count") == 1)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v32 = [MPSGraphDepthwiseConvolution2DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MPSGraphDepthwiseConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v32, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v33, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v34, "outputTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (MPSGraphTensor)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphDepthwiseConvolution2DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = source;
  v14 = outputShape;
  v15 = descriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 4 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  v23 = xmmword_1812876C0;
  while (v17 < -[MPSShape count](v14, "count", v23))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B1B8, 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:](self, "depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)depthwiseConvolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphDepthwiseConvolution3DOpDescriptor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MPSGraphDepthwiseConvolution3DOp *v24;
  void *v25;
  MPSGraphDepthwiseConvolution3DOp *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = weights;
  v12 = descriptor;
  v13 = name;
  -[MPSGraphTensor shape](v10, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") <= 3)
  {
    -[MPSGraphTensor shape](v10, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count");

  }
  -[MPSGraphTensor shape](v10, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") >= 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v10, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v11, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") != 4)
  {
    -[MPSGraphTensor shape](v11, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "count");

  }
  -[MPSGraphTensor shape](v11, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v11, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v24 = [MPSGraphDepthwiseConvolution3DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MPSGraphDepthwiseConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v24, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v25, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v28;
}

- (id)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  MPSGraphDepthwiseConvolution3DDataGradientOp *v29;
  MPSGraphDepthwiseConvolution3DDataGradientOp *v30;
  void *v31;
  void *v32;
  _QWORD v34[2];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v17, "count") <= 3)
  {
    objc_msgSend(v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  objc_msgSend(v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "count") >= 4)
  {

  }
  else
  {
    objc_msgSend(v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 4)
  {
    objc_msgSend(v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  objc_msgSend(v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 4)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  if (v14)
  {
    v35[0] = v12;
    v35[1] = v13;
    v35[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34[0] = v12;
    v34[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v27;
  v29 = [MPSGraphDepthwiseConvolution3DDataGradientOp alloc];
  v30 = -[MPSGraphDepthwiseConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v29, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v28, MEMORY[0x1E0C9AA60], v15, v16);
  -[MPSGraphOperation outputTensors](v30, "outputTensors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (MPSGraphTensor)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSShape *v13;
  MPSGraphDepthwiseConvolution3DOpDescriptor *v14;
  NSString *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t i;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphTensor *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v28 = incomingGradient;
  v12 = weights;
  v13 = outputShape;
  v14 = descriptor;
  v15 = name;
  if (!v13)
  {
    v25 = 0;
    goto LABEL_14;
  }
  -[MPSShape count](v13, "count");
  if ((unint64_t)-[MPSShape count](v13, "count") <= 3 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v31 = v33;
  v32 = 0x500000000;
  v16 = -[MPSShape count](v13, "count", v28);
  v17 = v16;
  v18 = 0;
  if (v16)
  {
    if (v16 >= v32)
    {
      if (v16 > HIDWORD(v32))
      {
        llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v31, v33, v16, 4);
        v18 = v32;
      }
      if (v17 != v18)
        bzero((char *)v31 + 4 * v18, 4 * (v17 - v18));
      if (v17 <= HIDWORD(v32))
        goto LABEL_6;
    }
    else if (v16 <= HIDWORD(v32))
    {
LABEL_6:
      LODWORD(v32) = v17;
      goto LABEL_7;
    }
    __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
  }
LABEL_7:
  for (i = 0; i < -[MPSShape count](v13, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");
    if (i >= v32)
      __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
    *((_DWORD *)v31 + i) = v21;

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31, 4 * v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v22, v24, 536870944);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 != v33)
    free(v31);
LABEL_14:
  -[MPSGraph depthwiseConvolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:](self, "depthwiseConvolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:", v28, v12, v25, v14, v15, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v26;
}

- (id)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPSGraphDepthwiseConvolution3DWeightsGradientOp *v32;
  void *v33;
  MPSGraphDepthwiseConvolution3DWeightsGradientOp *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v17, "count") <= 3)
  {
    objc_msgSend(v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  objc_msgSend(v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "count") >= 4)
  {

  }
  else
  {
    objc_msgSend(v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v22, "count") <= 3)
  {
    objc_msgSend(v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  objc_msgSend(v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v24, "count") >= 4)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  objc_msgSend(v14, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count") != 1)
  {
    objc_msgSend(v13, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

  }
  objc_msgSend(v14, "shape");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count") == 1)
  {

  }
  else
  {
    objc_msgSend(v13, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v32 = [MPSGraphDepthwiseConvolution3DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MPSGraphDepthwiseConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v32, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v33, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v34, "outputTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (MPSGraphTensor)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSShape *v13;
  MPSGraphDepthwiseConvolution3DOpDescriptor *v14;
  NSString *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t i;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphTensor *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v28 = incomingGradient;
  v12 = source;
  v13 = outputShape;
  v14 = descriptor;
  v15 = name;
  -[MPSShape count](v13, "count");
  if ((unint64_t)-[MPSShape count](v13, "count") <= 3 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v31 = v33;
  v32 = 0x500000000;
  v16 = -[MPSShape count](v13, "count", v28);
  v17 = v16;
  v18 = 0;
  if (v16)
  {
    if (v16 >= v32)
    {
      if (v16 > HIDWORD(v32))
      {
        llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v31, v33, v16, 4);
        v18 = v32;
      }
      if (v17 != v18)
        bzero((char *)v31 + 4 * v18, 4 * (v17 - v18));
      if (v17 <= HIDWORD(v32))
        goto LABEL_5;
    }
    else if (v16 <= HIDWORD(v32))
    {
LABEL_5:
      LODWORD(v32) = v17;
      goto LABEL_6;
    }
    __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
  }
LABEL_6:
  for (i = 0; i < -[MPSShape count](v13, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");
    if (i >= v32)
      __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
    *((_DWORD *)v31 + i) = v21;

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31, 4 * v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v22, v24, 536870944);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:](self, "depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v29, v12, v25, v14, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 != v33)
    free(v31);

  return (MPSGraphTensor *)v26;
}

- (id)fixTypeOfReductionInput:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "dataType") == -2147483640)
  {
    -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v4, 536870944, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  return v4;
}

- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  MPSGraphTensor *v20;
  void *__p;
  _BYTE *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v11 = __p;
    v12 = v22;
    v13 = v22 - (_BYTE *)__p;
    if (v22 == __p)
    {
      v20 = v8;
      v17 = v12;
      if (!v12)
      {
LABEL_5:
        v18 = v8;
        if (v12 == v11)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v22 - (_BYTE *)__p);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 >> 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
      v13 = objc_claimAutoreleasedReturnValue();

      v17 = __p;
      if (!__p)
        goto LABEL_5;
    }
    v22 = v17;
    operator delete(v17);
    goto LABEL_5;
  }
  v13 = 0;
LABEL_8:
  -[MPSGraph reductionSumWithTensor:axesTensor:name:](self, "reductionSumWithTensor:axesTensor:name:", v8, v13, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (MPSGraphTensor *)v18;
}

- (id)reductionSumWithTensor:(id)a3 axesTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MPSGraphReductionSumOp *v14;
  MPSGraphReductionSumOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPSGraph fixTypeOfReductionInput:](self, "fixTypeOfReductionInput:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v19[0] = v11;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  v14 = [MPSGraphReductionSumOp alloc];
  v15 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v14, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v12, MEMORY[0x1E0C9AA60], 0, v10);
  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionMaximumWithTensor:axes:name:](self, "reductionMaximumWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionMaxOp *v18;
  MPSGraphReductionMaxOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionMaxOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionMinimumWithTensor:axes:name:](self, "reductionMinimumWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionMinOp *v18;
  MPSGraphReductionMinOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionMinOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionMaximumPropagateNaNWithTensor:axes:name:](self, "reductionMaximumPropagateNaNWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionMaxPropagateNaNOp *v18;
  MPSGraphReductionMaxPropagateNaNOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionMaxPropagateNaNOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionMinimumPropagateNaNWithTensor:axes:name:](self, "reductionMinimumPropagateNaNWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionMinPropagateNaNOp *v18;
  MPSGraphReductionMinPropagateNaNOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionMinPropagateNaNOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionProductWithTensor:axes:name:](self, "reductionProductWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MPSGraphReductionProdOp *v19;
  MPSGraphReductionProdOp *v20;
  void *v21;
  void *v22;
  void *__p;
  _BYTE *v25;
  _QWORD v26[2];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  -[MPSGraph fixTypeOfReductionInput:](self, "fixTypeOfReductionInput:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v13 = v25 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 >> 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v11;
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v25 = __p;
      operator delete(__p);
    }
    v12 = (void *)v18;
  }
  v19 = [MPSGraphReductionProdOp alloc];
  v20 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v19, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)reductionArgMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  MPSGraphReductionArgMinOp *v13;
  MPSGraphReductionArgMinOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [MPSGraphReductionArgMinOp alloc];
  v14 = -[MPSGraphReductionArgBaseOp initWithGraph:inputTensors:controlDependencies:axis:name:](v13, "initWithGraph:inputTensors:controlDependencies:axis:name:", self, v12, MEMORY[0x1E0C9AA60], axis, v9);
  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reductionArgMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  MPSGraphReductionArgMaxOp *v13;
  MPSGraphReductionArgMaxOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [MPSGraphReductionArgMaxOp alloc];
  v14 = -[MPSGraphReductionArgBaseOp initWithGraph:inputTensors:controlDependencies:axis:name:](v13, "initWithGraph:inputTensors:controlDependencies:axis:name:", self, v12, MEMORY[0x1E0C9AA60], axis, v9);
  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionAndWithTensor:axes:name:](self, "reductionAndWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MPSGraphReductionAndOp *v19;
  MPSGraphReductionAndOp *v20;
  void *v21;
  void *v22;
  void *__p;
  _BYTE *v25;
  _QWORD v26[2];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  -[MPSGraph fixTypeOfReductionInput:](self, "fixTypeOfReductionInput:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v13 = v25 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 >> 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v11;
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v25 = __p;
      operator delete(__p);
    }
    v12 = (void *)v18;
  }
  v19 = [MPSGraphReductionAndOp alloc];
  v20 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v19, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", axis);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reductionOrWithTensor:axes:name:](self, "reductionOrWithTensor:axes:name:", v8, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionOrOp *v18;
  MPSGraphReductionOrOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionOrOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)meanOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSGraphReductionMeanOp *v18;
  MPSGraphReductionMeanOp *v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v24;
  _QWORD v25[2];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    v12 = v24 - (_BYTE *)__p;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v8;
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v11 = (void *)v17;
  }
  v18 = [MPSGraphReductionMeanOp alloc];
  v19 = -[MPSGraphReductionBaseOp initWithGraph:inputTensors:controlDependencies:axes:name:](v18, "initWithGraph:inputTensors:controlDependencies:axes:name:", self, v11, MEMORY[0x1E0C9AA60], v9, v10);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraph)init
{
  char *v2;
  void *v3;
  mlir::MLIRContextImpl **v4;
  _QWORD **v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char *v9;
  int v10;
  _QWORD *v11;
  _QWORD *v12;
  mlir::MLIRContext *v13;
  char v14;
  uint64_t v15;
  uint64_t UnknownLoc;
  mlir::GenericProgramPoint *v17;
  mlir::Operation *v18;
  mlir::StringAttr **v19;
  uint64_t StringAttr;
  uint64_t v21;
  mlir::MLIRContext *v22;
  uint64_t F64Type;
  mlir::MLIRContext **v24;
  uint64_t FunctionType;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char *v46;
  const char *v48;
  int v49;
  const char *v50;
  const char *v51;
  mlir::GenericProgramPoint *v52;
  __int128 v53;
  char v54;
  _BYTE v55[72];
  objc_super v56;
  pthread_mutexattr_t v57;
  unint64_t v58[2];
  unint64_t v59[2];
  __int128 v60;
  __int128 v61;
  __int16 v62;
  _QWORD *v63[11];

  v63[10] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)MPSGraph;
  v2 = -[MPSGraph init](&v56, sel_init);
  if (!v2)
    goto LABEL_29;
  v3 = operator new(0x20uLL);
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &unk_1E0E51DD8;
  *((_QWORD *)v3 + 1) = 0;
  v4 = mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v3 + 3, 0);
  v5 = (_QWORD **)(v2 + 40);
  v6 = (std::__shared_weak_count *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 5) = v4;
  *((_QWORD *)v2 + 6) = v3;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v63[0] = *v5;
  mlir::MLIRContext::getOrLoadDialect(v63[0], (uint64_t)"mps", 3, (uint64_t)&mlir::detail::TypeIDResolver<mlir::mps::MPSDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::mps::MPSDialect * mlir::MLIRContext::getOrLoadDialect<mlir::mps::MPSDialect>(void)::{lambda(void)#1}>, (uint64_t)v63);
  v63[0] = *v5;
  mlir::MLIRContext::getOrLoadDialect(v63[0], (uint64_t)"mpsx", 4, (uint64_t)&mlir::detail::TypeIDResolver<mlir::mpsx::MPSXDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::mpsx::MPSXDialect * mlir::MLIRContext::getOrLoadDialect<mlir::mpsx::MPSXDialect>(void)::{lambda(void)#1}>, (uint64_t)v63);
  v63[0] = *v5;
  mlir::MLIRContext::getOrLoadDialect(v63[0], (uint64_t)"func", 4, (uint64_t)&mlir::detail::TypeIDResolver<mlir::func::FuncDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::func::FuncDialect * mlir::MLIRContext::getOrLoadDialect<mlir::func::FuncDialect>(void)::{lambda(void)#1}>, (uint64_t)v63);
  v63[0] = *v5;
  mlir::MLIRContext::getOrLoadDialect(v63[0], (uint64_t)"scf", 3, (uint64_t)&mlir::detail::TypeIDResolver<mlir::scf::SCFDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::scf::SCFDialect * mlir::MLIRContext::getOrLoadDialect<mlir::scf::SCFDialect>(void)::{lambda(void)#1}>, (uint64_t)v63);
  v63[0] = *v5;
  mlir::MLIRContext::getOrLoadDialect(v63[0], (uint64_t)"tensor", 6, (uint64_t)&mlir::detail::TypeIDResolver<mlir::tensor::TensorDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::tensor::TensorDialect * mlir::MLIRContext::getOrLoadDialect<mlir::tensor::TensorDialect>(void)::{lambda(void)#1}>, (uint64_t)v63);
  *((_QWORD *)v2 + 11) = 1;
  *((_QWORD *)v2 + 12) = 1423;
  if (mpsgraph_mlir_onceToken == -1)
  {
    if (!getenv("MPSGRAPH_LOG_INFO"))
      goto LABEL_10;
    goto LABEL_9;
  }
  dispatch_once(&mpsgraph_mlir_onceToken, &__block_literal_global_4);
  if (getenv("MPSGRAPH_LOG_INFO"))
  {
LABEL_9:
    *((_QWORD *)v2 + 11) |= 2uLL;
    puts("MPSGRAPH_LOG_INFO EV is set.");
  }
LABEL_10:
  v9 = getenv("MPSGRAPH_COMPILER_STITCHING");
  if (v9)
  {
    v10 = atoi(v9);
    if (!v10)
      *((_QWORD *)v2 + 12) &= ~2uLL;
    printf("MPSGRAPH_COMPILER_STITCHING EV is set to %d.\n", v10);
  }
  v11 = (_QWORD *)operator new();
  *v11 = *v5;
  v11[1] = 0;
  v11[2] = 0;
  v11[3] = 0;
  *((_QWORD *)v2 + 7) = v11;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v55);
  v12 = *v5;
  v60 = 0u;
  v61 = 0u;
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)v63, (uint64_t)v55, (uint64_t)v12, &v60);
  v14 = BYTE8(v61);
  if (*((_QWORD *)&v61 + 1) >= 8uLL)
  {
    if ((BYTE8(v61) & 4) != 0)
    {
      if ((BYTE8(v61) & 2) != 0)
        v15 = (uint64_t)&v60;
      else
        v15 = v60;
      (*(void (**)(uint64_t))((*((_QWORD *)&v61 + 1) & 0xFFFFFFFFFFFFFFF8) + 16))(v15);
    }
    if ((v14 & 2) == 0)
      llvm::deallocate_buffer((llvm *)v60, *((void **)&v60 + 1));
  }
  UnknownLoc = mlir::Builder::getUnknownLoc(*((mlir::UnknownLoc ***)v2 + 7), v13);
  LOBYTE(v53) = 0;
  v54 = 0;
  v17 = mlir::ModuleOp::create(UnknownLoc, &v53);
  *(_QWORD *)&v60 = v17;
  v18 = (mlir::Operation *)*((_QWORD *)v2 + 8);
  if (v18)
    mlir::Operation::erase(v18);
  *((_QWORD *)v2 + 8) = v17;
  v19 = (mlir::StringAttr **)*((_QWORD *)v2 + 7);
  *(_QWORD *)&v60 = "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersG"
                    "raph/Core/Files/MPSGraph.mm";
  v62 = 259;
  StringAttr = mlir::Builder::getStringAttr(v19, (mlir::MLIRContext *)&v60);
  v21 = mlir::FileLineColLoc::get(StringAttr, 0x237u, 0);
  F64Type = mlir::Builder::getF64Type(*((mlir::Float64Type ***)v2 + 7), v22);
  getMLIRType(0, F64Type);
  *(_QWORD *)&v60 = &v61;
  *((_QWORD *)&v60 + 1) = 0x400000000;
  v24 = (mlir::MLIRContext **)*((_QWORD *)v2 + 7);
  mlir::ValueRange::ValueRange(v59, (uint64_t)&v61, 0);
  mlir::ValueRange::ValueRange(v58, 0, 0);
  FunctionType = mlir::Builder::getFunctionType(v24, v59[0], v59[1], v58[0], v58[1]);
  if (!v21)
  {
    v48 = "loc && \"location should never be null.\";
    v49 = 66;
    v50 = "Location.h";
    v51 = "Location";
    goto LABEL_34;
  }
  v52 = (mlir::GenericProgramPoint *)mlir::func::FuncOp::create(v21, (uint64_t)"main", 4, FunctionType, 0, 0);
  if (!v52)
  {
    v48 = "function";
    v49 = 576;
    v50 = "MPSGraph.mm";
    v51 = "-[MPSGraph init]";
LABEL_34:
    __assert_rtn(v51, v50, v49, v48);
  }
  v26 = mlir::detail::FunctionOpInterfaceTrait<mlir::func::FuncOp>::addEntryBlock((mlir::func::FuncOp *)&v52);
  v27 = *((_QWORD *)v2 + 7);
  v28 = *((_QWORD *)v26 + 5);
  *(_QWORD *)(v27 + 16) = v26;
  *(_QWORD *)(v27 + 24) = v28;
  mlir::OpTrait::SingleBlock<mlir::ModuleOp>::push_back<mlir::ModuleOp>((uint64_t *)v2 + 8, v52);
  pthread_mutexattr_init(&v57);
  pthread_mutexattr_settype(&v57, 2);
  pthread_mutex_init((pthread_mutex_t *)(v2 + 104), &v57);
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v29;

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v31;

  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v33;

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)*((_QWORD *)v2 + 23);
  *((_QWORD *)v2 + 23) = v37;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)*((_QWORD *)v2 + 21);
  *((_QWORD *)v2 + 21) = v39;

  v41 = operator new();
  *(_QWORD *)v41 = 0;
  *(_QWORD *)(v41 + 8) = 0;
  *(_QWORD *)(v41 + 16) = 0x2000000000;
  *(_OWORD *)(v41 + 24) = 0u;
  *(_OWORD *)(v41 + 40) = 0u;
  *(_DWORD *)(v41 + 56) = 1065353216;
  *((_QWORD *)v2 + 9) = v41;
  v42 = objc_opt_new();
  v43 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v42;

  v44 = objc_opt_new();
  v45 = (void *)*((_QWORD *)v2 + 24);
  *((_QWORD *)v2 + 24) = v44;

  v46 = v2;
  if ((__int128 *)v60 != &v61)
    free((void *)v60);
  mlir::SourceMgrDiagnosticHandler::~SourceMgrDiagnosticHandler((mlir::SourceMgrDiagnosticHandler *)v63);
  llvm::SourceMgr::~SourceMgr((llvm::SourceMgr *)v55);
LABEL_29:

  return (MPSGraph *)v2;
}

void __16__MPSGraph_init__block_invoke(mlir *a1)
{
  mlir::registerAsmPrinterCLOptions(a1);
  ParseEnvironmentOptions("main", "MPSGRAPH_MLIR_CL", ");
}

+ (MPSGraph)new
{
  return objc_alloc_init(MPSGraph);
}

- (NSArray)placeholderTensors
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_placeholderArray);
}

- (id)operationWithName:(id)a3
{
  id v4;
  unint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  for (i = 0; ; ++i)
  {
    if (i >= -[NSMutableArray count](self->_operations, "count"))
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if (v8)
      break;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", i);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (void)dealloc
{
  void *builder;
  MPSSymbolTable *symbolTable;
  objc_super v5;

  builder = self->_builder;
  if (builder)
    MEMORY[0x186DA1680](builder, 0x20C40DC1BFBCFLL);
  symbolTable = (MPSSymbolTable *)self->_symbolTable;
  if (symbolTable)
  {
    MPSSymbolTable::~MPSSymbolTable(symbolTable);
    MEMORY[0x186DA1680]();
  }
  v5.receiver = self;
  v5.super_class = (Class)MPSGraph;
  -[MPSGraph dealloc](&v5, sel_dealloc);
}

- (void)dump
{
  mlir::Operation::dump(self->_module.op.state);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _BYTE v10[40];
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  void **v19;
  void *v20[2];
  uint64_t v21;

  v20[0] = 0;
  v20[1] = 0;
  v21 = 0;
  v12 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 1;
  v14 = 0;
  v15 = 0;
  v13 = 0;
  v11 = &unk_1E0E22B10;
  v19 = v20;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v11, 0, 0, 0);
  mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v10);
  mlir::Operation::print(self->_module.op.state, (llvm::raw_ostream *)&v11, (const mlir::OpPrintingFlags *)v10);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MPSGraph;
  -[MPSGraph debugDescription](&v9, sel_debugDescription);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = v19;
  if (*((char *)v19 + 23) < 0)
    v6 = *v19;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : \n\nIR: %s \n\n"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v11);
  if (SHIBYTE(v21) < 0)
    operator delete(v20[0]);
  return v7;
}

- (id)compileWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6
{
  -[MPSGraph compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:](self, "compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphExecutable)compileWithDevice:(MPSGraphDevice *)device feeds:(MPSGraphTensorShapedTypeDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  MPSGraphTensorShapedTypeDictionary *v12;
  NSArray *v13;
  NSArray *v14;
  MPSGraphCompilationDescriptor *v15;
  MPSGraphExecutable *v16;
  unint64_t i;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSMutableArray *executableCache;
  _opaque_pthread_mutex_t *p_graphMutex;
  MPSGraphDevice *v26;

  v26 = device;
  v12 = feeds;
  v13 = targetTensors;
  v14 = targetOperations;
  v15 = compilationDescriptor;
  p_graphMutex = &self->_graphMutex;
  pthread_mutex_lock(&self->_graphMutex);
  if (!v15)
  {
    v15 = (MPSGraphCompilationDescriptor *)objc_opt_new();
    -[MPSGraphCompilationDescriptor setCompilerOptions:](v15, "setCompilerOptions:", self->_compilerOptions, p_graphMutex);
  }
  v16 = 0;
  for (i = 0; i < -[NSMutableArray count](self->_executableCache, "count", p_graphMutex); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_executableCache, "objectAtIndexedSubscript:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isExecutableForFeeds:targetTensors:targetOperations:compilationDescriptor:", v12, v13, v14, v15);

    if (v19)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_executableCache, "objectAtIndexedSubscript:", i);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (MPSGraphExecutable *)v20;
    }
  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setCompilerOptions:", -[MPSGraphCompilationDescriptor compilerOptions](v15, "compilerOptions"));
  objc_msgSend(v21, "setCompilationDescriptor:", v15);
  if (!v16)
  {
    v16 = -[MPSGraphExecutable initWithGraph:device:feeds:targetTensors:targetOperations:executableDescriptor:]([MPSGraphExecutable alloc], "initWithGraph:device:feeds:targetTensors:targetOperations:executableDescriptor:", self, v26, v12, v13, v14, v21);
    v22 = -[NSMutableArray count](self->_executableCache, "count");
    executableCache = self->_executableCache;
    if (v22 >= 0xF)
    {
      -[NSMutableArray removeObjectAtIndex:](executableCache, "removeObjectAtIndex:", 14);
      executableCache = self->_executableCache;
    }
    -[NSMutableArray insertObject:atIndex:](executableCache, "insertObject:atIndex:", v16, 0);
  }
  pthread_mutex_unlock(p_graphMutex);

  return v16;
}

- (MPSGraphTensorDataDictionary)runWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations
{
  MPSGraphTensorDataDictionary *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  void *v12;

  v8 = feeds;
  v9 = targetTensors;
  v10 = targetOperations;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setWaitUntilCompleted:", 1);
  -[MPSGraph runAsyncWithFeeds:targetTensors:targetOperations:executionDescriptor:](self, "runAsyncWithFeeds:targetTensors:targetOperations:executionDescriptor:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensorDataDictionary *)v12;
}

- (MPSGraphTensorDataDictionary)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations
{
  id v10;
  MPSGraphTensorDataDictionary *v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  void *v15;

  v10 = commandQueue;
  v11 = feeds;
  v12 = targetTensors;
  v13 = targetOperations;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setWaitUntilCompleted:", 1);
  -[MPSGraph runAsyncWithMTLCommandQueue:feeds:targetTensors:targetOperations:executionDescriptor:](self, "runAsyncWithMTLCommandQueue:feeds:targetTensors:targetOperations:executionDescriptor:", v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensorDataDictionary *)v15;
}

- (void)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary
{
  MPSGraphTensorDataDictionary *v10;
  NSArray *v11;
  MPSGraphTensorDataDictionary *v12;
  void *v13;
  id v14;

  v14 = commandQueue;
  v10 = feeds;
  v11 = targetOperations;
  v12 = resultsDictionary;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setWaitUntilCompleted:", 1);
  -[MPSGraph runAsyncWithMTLCommandQueue:feeds:targetOperations:resultsDictionary:executionDescriptor:](self, "runAsyncWithMTLCommandQueue:feeds:targetOperations:resultsDictionary:executionDescriptor:", v14, v10, v11, v12, v13);

}

- (MPSGraphTensorDataDictionary)runAsyncWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  MPSGraphTensorDataDictionary *v10;
  NSArray *v11;
  NSArray *v12;
  MPSGraphExecutionDescriptor *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = feeds;
  v11 = targetTensors;
  v12 = targetOperations;
  v13 = executionDescriptor;
  if (qword_1EDC0BED0 == -1)
  {
    if ((_MergedGlobals_6 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&qword_1EDC0BED0, &__block_literal_global_371);
    if ((_MergedGlobals_6 & 1) == 0)
    {
LABEL_3:
      MPSGetPreferredDevice(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_5;
    }
  }
  v14 = MTLCreateSystemDefaultDevice();
LABEL_5:
  v15 = (void *)objc_msgSend(v14, "newCommandQueue");
  if (v14)
  {
    if (!v13)
      v13 = (MPSGraphExecutionDescriptor *)objc_opt_new();
    -[MPSGraph runAsyncWithMTLCommandQueue:feeds:targetTensors:targetOperations:executionDescriptor:](self, "runAsyncWithMTLCommandQueue:feeds:targetTensors:targetOperations:executionDescriptor:", v15, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    v16 = 0;
  }

  return (MPSGraphTensorDataDictionary *)v16;
}

char *__81__MPSGraph_runAsyncWithFeeds_targetTensors_targetOperations_executionDescriptor___block_invoke()
{
  char *result;

  result = getenv("OATS_CONFIG_ID");
  if (result)
    _MergedGlobals_6 = 1;
  return result;
}

- (MPSGraphTensorDataDictionary)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  id v12;
  MPSGraphTensorDataDictionary *v13;
  NSArray *v14;
  NSArray *v15;
  MPSGraphExecutionDescriptor *v16;
  void *v17;

  v12 = commandQueue;
  v13 = feeds;
  v14 = targetTensors;
  v15 = targetOperations;
  v16 = executionDescriptor;
  if (!v16)
    v16 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  -[MPSGraph runInternalWithMTLCommandQueue:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMTLCommandQueue:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v12, v13, v14, v15, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensorDataDictionary *)v17;
}

- (void)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  MPSGraphTensorDataDictionary *v12;
  NSArray *v13;
  MPSGraphTensorDataDictionary *v14;
  MPSGraphExecutionDescriptor *v15;
  void *v16;
  id v17;
  id v18;

  v18 = commandQueue;
  v12 = feeds;
  v13 = targetOperations;
  v14 = resultsDictionary;
  v15 = executionDescriptor;
  if (!v15)
    v15 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  -[MPSGraphTensorDataDictionary allKeys](v14, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraph runInternalWithMTLCommandQueue:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMTLCommandQueue:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v18, v12, v16, v13, v14, v15);

}

- (MPSGraphTensorDataDictionary)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  MPSCommandBuffer *v12;
  MPSGraphTensorDataDictionary *v13;
  NSArray *v14;
  NSArray *v15;
  MPSGraphExecutionDescriptor *v16;
  void *v17;
  uint64_t v19;

  v12 = commandBuffer;
  v13 = feeds;
  v14 = targetTensors;
  v15 = targetOperations;
  v16 = executionDescriptor;
  if (!v16)
    v16 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  LOBYTE(v19) = 0;
  -[MPSGraph runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:", v12, v13, v14, v15, 0, v16, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensorDataDictionary *)v17;
}

- (void)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  MPSGraphTensorDataDictionary *v12;
  NSArray *v13;
  MPSGraphTensorDataDictionary *v14;
  MPSGraphExecutionDescriptor *v15;
  void *v16;
  id v17;
  uint64_t v18;
  MPSCommandBuffer *v19;

  v19 = commandBuffer;
  v12 = feeds;
  v13 = targetOperations;
  v14 = resultsDictionary;
  v15 = executionDescriptor;
  if (!v15)
    v15 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  -[MPSGraphTensorDataDictionary allKeys](v14, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = 0;
  v17 = -[MPSGraph runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:", v19, v12, v16, v13, v14, v15, v18);

}

- (id)runInternalWithMTLCommandQueue:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0CC6DE0], "commandBufferFromCommandQueue:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 1;
  -[MPSGraph runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithMPSCommandBuffer:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:mpsGraphOwnedCommandBuffer:", v19, v14, v15, v16, v17, v18, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getExecutableForDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD **v25;
  unint64_t v26;
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _BYTE *v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD **v52;
  unint64_t v53;
  void *v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _BYTE *v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD **v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  MPSGraph *v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD **v95;
  _QWORD *v96;
  uint64_t v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v14 = a4;
  v86 = a5;
  v83 = a6;
  v15 = a7;
  v84 = a8;
  v82 = v14;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_377);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v80 = self;
  v96 = 0;
  v97 = 0;
  v95 = &v96;
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v93 = 0uLL;
    v94 = 0uLL;
    v91 = 0uLL;
    v92 = 0uLL;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v92;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v92 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v19);
          v21 = objc_msgSend(v20, "index", v80, v81);
          v22 = v21;
          v23 = v96;
          v24 = &v96;
          v25 = &v96;
          if (v96)
          {
            while (1)
            {
              while (1)
              {
                v25 = (_QWORD **)v23;
                v26 = v23[4];
                if (v21 >= v26)
                  break;
                v23 = *v25;
                v24 = v25;
                if (!*v25)
                  goto LABEL_14;
              }
              if (v26 >= v21)
                break;
              v23 = v25[1];
              if (!v23)
              {
                v24 = v25 + 1;
                goto LABEL_14;
              }
            }
            v27 = v25;
          }
          else
          {
LABEL_14:
            v27 = operator new(0x30uLL);
            *((_QWORD *)v27 + 4) = v22;
            *((_QWORD *)v27 + 5) = 0;
            *(_QWORD *)v27 = 0;
            *((_QWORD *)v27 + 1) = 0;
            *((_QWORD *)v27 + 2) = v25;
            *v24 = v27;
            v28 = v27;
            if (*v95)
            {
              v95 = (_QWORD **)*v95;
              v28 = (_QWORD *)*v24;
            }
            v29 = v96;
            v30 = v28 == v96;
            *((_BYTE *)v28 + 24) = v28 == v96;
            if (!v30)
            {
              do
              {
                v31 = v28[2];
                if (*(_BYTE *)(v31 + 24))
                  break;
                v32 = *(_QWORD **)(v31 + 16);
                v33 = *v32;
                if (*v32 == v31)
                {
                  v36 = v32[1];
                  if (!v36 || (v37 = *(unsigned __int8 *)(v36 + 24), v34 = (_BYTE *)(v36 + 24), v37))
                  {
                    if (*(_QWORD **)v31 == v28)
                    {
                      *(_BYTE *)(v31 + 24) = 1;
                      *((_BYTE *)v32 + 24) = 0;
                      v40 = *(_QWORD *)(v31 + 8);
                      *v32 = v40;
                      if (v40)
                        goto LABEL_31;
                    }
                    else
                    {
                      v38 = *(uint64_t **)(v31 + 8);
                      v39 = *v38;
                      *(_QWORD *)(v31 + 8) = *v38;
                      if (v39)
                      {
                        *(_QWORD *)(v39 + 16) = v31;
                        v32 = *(_QWORD **)(v31 + 16);
                      }
                      v38[2] = (uint64_t)v32;
                      *(_QWORD *)(*(_QWORD *)(v31 + 16) + 8 * (**(_QWORD **)(v31 + 16) != v31)) = v38;
                      *v38 = v31;
                      *(_QWORD *)(v31 + 16) = v38;
                      v32 = (_QWORD *)v38[2];
                      v31 = *v32;
                      *((_BYTE *)v38 + 24) = 1;
                      *((_BYTE *)v32 + 24) = 0;
                      v40 = *(_QWORD *)(v31 + 8);
                      *v32 = v40;
                      if (v40)
LABEL_31:
                        *(_QWORD *)(v40 + 16) = v32;
                    }
                    *(_QWORD *)(v31 + 16) = v32[2];
                    *(_QWORD *)(v32[2] + 8 * (*(_QWORD *)v32[2] != (_QWORD)v32)) = v31;
                    *(_QWORD *)(v31 + 8) = v32;
LABEL_38:
                    v32[2] = v31;
                    break;
                  }
                }
                else if (!v33 || (v35 = *(unsigned __int8 *)(v33 + 24), v34 = (_BYTE *)(v33 + 24), v35))
                {
                  if (*(_QWORD **)v31 == v28)
                  {
                    v42 = v28[1];
                    *(_QWORD *)v31 = v42;
                    if (v42)
                    {
                      *(_QWORD *)(v42 + 16) = v31;
                      v32 = *(_QWORD **)(v31 + 16);
                    }
                    v28[2] = v32;
                    *(_QWORD *)(*(_QWORD *)(v31 + 16) + 8 * (**(_QWORD **)(v31 + 16) != v31)) = v28;
                    v28[1] = v31;
                    *(_QWORD *)(v31 + 16) = v28;
                    v32 = (_QWORD *)v28[2];
                    *((_BYTE *)v28 + 24) = 1;
                    *((_BYTE *)v32 + 24) = 0;
                    v31 = v32[1];
                    v41 = *(_QWORD **)v31;
                    v32[1] = *(_QWORD *)v31;
                    if (v41)
LABEL_36:
                      v41[2] = v32;
                  }
                  else
                  {
                    *(_BYTE *)(v31 + 24) = 1;
                    *((_BYTE *)v32 + 24) = 0;
                    v31 = v32[1];
                    v41 = *(_QWORD **)v31;
                    v32[1] = *(_QWORD *)v31;
                    if (v41)
                      goto LABEL_36;
                  }
                  *(_QWORD *)(v31 + 16) = v32[2];
                  *(_QWORD *)(v32[2] + 8 * (*(_QWORD *)v32[2] != (_QWORD)v32)) = v31;
                  *(_QWORD *)v31 = v32;
                  goto LABEL_38;
                }
                *(_BYTE *)(v31 + 24) = 1;
                v28 = v32;
                *((_BYTE *)v32 + 24) = v32 == v29;
                *v34 = 1;
              }
              while (v32 != v29);
            }
            ++v97;
          }
          objc_storeStrong((id *)v27 + 5, v20);
          ++v19;
        }
        while (v19 != v17);
        v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        v17 = v43;
      }
      while (v43);
    }
  }
  else
  {
    v89 = 0uLL;
    v90 = 0uLL;
    v87 = 0uLL;
    v88 = 0uLL;
    v16 = v86;
    v44 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v88;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v88 != v45)
            objc_enumerationMutation(v16);
          v47 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v46);
          v48 = objc_msgSend(v47, "index", v80, v81);
          v49 = v48;
          v50 = v96;
          v51 = &v96;
          v52 = &v96;
          if (v96)
          {
            while (1)
            {
              while (1)
              {
                v52 = (_QWORD **)v50;
                v53 = v50[4];
                if (v48 >= v53)
                  break;
                v50 = *v52;
                v51 = v52;
                if (!*v52)
                  goto LABEL_62;
              }
              if (v53 >= v48)
                break;
              v50 = v52[1];
              if (!v50)
              {
                v51 = v52 + 1;
                goto LABEL_62;
              }
            }
            v54 = v52;
          }
          else
          {
LABEL_62:
            v54 = operator new(0x30uLL);
            *((_QWORD *)v54 + 4) = v49;
            *((_QWORD *)v54 + 5) = 0;
            *(_QWORD *)v54 = 0;
            *((_QWORD *)v54 + 1) = 0;
            *((_QWORD *)v54 + 2) = v52;
            *v51 = v54;
            v55 = v54;
            if (*v95)
            {
              v95 = (_QWORD **)*v95;
              v55 = (_QWORD *)*v51;
            }
            v56 = v96;
            v30 = v55 == v96;
            *((_BYTE *)v55 + 24) = v55 == v96;
            if (!v30)
            {
              do
              {
                v57 = v55[2];
                if (*(_BYTE *)(v57 + 24))
                  break;
                v58 = *(_QWORD **)(v57 + 16);
                v59 = *v58;
                if (*v58 == v57)
                {
                  v62 = v58[1];
                  if (!v62 || (v63 = *(unsigned __int8 *)(v62 + 24), v60 = (_BYTE *)(v62 + 24), v63))
                  {
                    if (*(_QWORD **)v57 == v55)
                    {
                      *(_BYTE *)(v57 + 24) = 1;
                      *((_BYTE *)v58 + 24) = 0;
                      v66 = *(_QWORD *)(v57 + 8);
                      *v58 = v66;
                      if (v66)
                        goto LABEL_79;
                    }
                    else
                    {
                      v64 = *(uint64_t **)(v57 + 8);
                      v65 = *v64;
                      *(_QWORD *)(v57 + 8) = *v64;
                      if (v65)
                      {
                        *(_QWORD *)(v65 + 16) = v57;
                        v58 = *(_QWORD **)(v57 + 16);
                      }
                      v64[2] = (uint64_t)v58;
                      *(_QWORD *)(*(_QWORD *)(v57 + 16) + 8 * (**(_QWORD **)(v57 + 16) != v57)) = v64;
                      *v64 = v57;
                      *(_QWORD *)(v57 + 16) = v64;
                      v58 = (_QWORD *)v64[2];
                      v57 = *v58;
                      *((_BYTE *)v64 + 24) = 1;
                      *((_BYTE *)v58 + 24) = 0;
                      v66 = *(_QWORD *)(v57 + 8);
                      *v58 = v66;
                      if (v66)
LABEL_79:
                        *(_QWORD *)(v66 + 16) = v58;
                    }
                    *(_QWORD *)(v57 + 16) = v58[2];
                    *(_QWORD *)(v58[2] + 8 * (*(_QWORD *)v58[2] != (_QWORD)v58)) = v57;
                    *(_QWORD *)(v57 + 8) = v58;
LABEL_86:
                    v58[2] = v57;
                    break;
                  }
                }
                else if (!v59 || (v61 = *(unsigned __int8 *)(v59 + 24), v60 = (_BYTE *)(v59 + 24), v61))
                {
                  if (*(_QWORD **)v57 == v55)
                  {
                    v68 = v55[1];
                    *(_QWORD *)v57 = v68;
                    if (v68)
                    {
                      *(_QWORD *)(v68 + 16) = v57;
                      v58 = *(_QWORD **)(v57 + 16);
                    }
                    v55[2] = v58;
                    *(_QWORD *)(*(_QWORD *)(v57 + 16) + 8 * (**(_QWORD **)(v57 + 16) != v57)) = v55;
                    v55[1] = v57;
                    *(_QWORD *)(v57 + 16) = v55;
                    v58 = (_QWORD *)v55[2];
                    *((_BYTE *)v55 + 24) = 1;
                    *((_BYTE *)v58 + 24) = 0;
                    v57 = v58[1];
                    v67 = *(_QWORD **)v57;
                    v58[1] = *(_QWORD *)v57;
                    if (v67)
LABEL_84:
                      v67[2] = v58;
                  }
                  else
                  {
                    *(_BYTE *)(v57 + 24) = 1;
                    *((_BYTE *)v58 + 24) = 0;
                    v57 = v58[1];
                    v67 = *(_QWORD **)v57;
                    v58[1] = *(_QWORD *)v57;
                    if (v67)
                      goto LABEL_84;
                  }
                  *(_QWORD *)(v57 + 16) = v58[2];
                  *(_QWORD *)(v58[2] + 8 * (*(_QWORD *)v58[2] != (_QWORD)v58)) = v57;
                  *(_QWORD *)v57 = v58;
                  goto LABEL_86;
                }
                *(_BYTE *)(v57 + 24) = 1;
                v55 = v58;
                *((_BYTE *)v58 + 24) = v58 == v56;
                *v60 = 1;
              }
              while (v58 != v56);
            }
            ++v97;
          }
          objc_storeStrong((id *)v54 + 5, v47);
          ++v46;
        }
        while (v46 != v44);
        v69 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
        v44 = v69;
      }
      while (v69);
    }
  }

  v70 = v95;
  if (v95 != &v96)
  {
    v71 = 0;
    do
    {
      objc_msgSend(v85, "setObject:atIndexedSubscript:", v70[5], v71, v80);
      v72 = (_QWORD *)v70[1];
      if (v72)
      {
        do
        {
          v73 = (_QWORD **)v72;
          v72 = (_QWORD *)*v72;
        }
        while (v72);
      }
      else
      {
        do
        {
          v73 = (_QWORD **)v70[2];
          v30 = *v73 == v70;
          v70 = v73;
        }
        while (!v30);
      }
      ++v71;
      v70 = v73;
    }
    while (v73 != &v96);
  }
  v74 = v81;
  getMPSShapedDictionaryFromDataDictionary(v82);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "compilationDescriptor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
    v77 = v85;
  else
    v77 = v86;
  -[MPSGraph compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:](v80, "compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:", v74, v75, v77, v83, v76, v80);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  std::__tree<std::__value_type<unsigned long,MPSGraphTensor * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,MPSGraphTensor * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,MPSGraphTensor * {__strong}>>>::destroy(v96);
  return v78;
}

void __110__MPSGraph_getExecutableForDevice_feeds_targetTensors_targetOperations_resultsDictionary_executionDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  unint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;

  v22 = a2;
  v4 = a3;
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 != objc_msgSend(v6, "count") && objc_msgSend(v6, "count") && objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intValue");

    }
    v9 = objc_msgSend(v5, "count");
    if (v9 != objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v6, "count"))
      {
        if (objc_msgSend(v5, "count") != 1
          || (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v10, "intValue"),
              v10,
              v11 != 1))
        {
          if (MTLReportFailureTypeEnabled())
            MTLReportFailure();
        }
      }
    }
    if (objc_msgSend(v5, "count") != 1
      || (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "intValue"),
          v12,
          v13 != 1))
    {
      for (i = 0; i < objc_msgSend(v6, "count", v19, v20, v21); ++i)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");

        if (v16 != 0x8000000000000000 && v16 != -1 && v16 != v18 && MTLReportFailureTypeEnabled())
        {
          v20 = v18;
          v21 = i;
          v19 = v16;
          MTLReportFailure();
        }
      }
    }
  }

}

- (id)runInternalWithMPSCommandBuffer:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8 mpsGraphOwnedCommandBuffer:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  MPSGraphExecutableExecutionDescriptor *v24;
  void *v25;
  void *v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v27 = v17;
  objc_msgSend(v15, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph getExecutableForDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "getExecutableForDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v22, v16, v17, v18, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphExecutableExecutionDescriptor initWithGraphExecutionDescriptor:]([MPSGraphExecutableExecutionDescriptor alloc], "initWithGraphExecutionDescriptor:", v20);
  objc_msgSend(v23, "setOptions:", self->_options);
  objc_msgSend(v23, "runInternalWithDevice:commandBuffer:feedsDictionary:resultsDictionary:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v22, v15, v16, v19, v24, a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 && MTLReportFailureTypeEnabled())
    MTLReportFailure();

  return v25;
}

- (id)runWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    v16 = (id)objc_opt_new();
    objc_msgSend(v16, "setWaitUntilCompleted:", 1);
  }
  -[MPSGraph runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v12, v13, v14, v15, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)runWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v15)
  {
    v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setWaitUntilCompleted:", 1);
  }
  objc_msgSend(v14, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraph runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v18, v12, v16, v13, v14, v15);

}

- (id)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    v16 = (id)objc_opt_new();
    objc_msgSend(v16, "setWaitUntilCompleted:", 0);
  }
  -[MPSGraph runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v12, v13, v14, v15, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v15)
  {
    v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setWaitUntilCompleted:", 0);
  }
  objc_msgSend(v14, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraph runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "runInternalWithMPSGraphDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v18, v12, v16, v13, v14, v15);

}

- (id)runInternalWithMPSGraphDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  MPSGraphExecutableExecutionDescriptor *v23;
  void *v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v19)
  {
    v19 = (id)objc_opt_new();
    objc_msgSend(v19, "setWaitUntilCompleted:", 1);
  }
  objc_msgSend(v19, "compilationDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setCompilerOptions:", self->_compilerOptions);
    objc_msgSend(v19, "setCompilationDescriptor:", v21);

  }
  -[MPSGraph getExecutableForDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:](self, "getExecutableForDevice:feeds:targetTensors:targetOperations:resultsDictionary:executionDescriptor:", v14, v15, v16, v17, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MPSGraphExecutableExecutionDescriptor initWithGraphExecutionDescriptor:]([MPSGraphExecutableExecutionDescriptor alloc], "initWithGraphExecutionDescriptor:", v19);
  objc_msgSend(v22, "setOptions:", self->_options);
  objc_msgSend(v22, "runInternalWithDevice:commandBuffer:feedsDictionary:resultsDictionary:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v14, 0, v15, v18, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (MPSGraphOptions)options
{
  return self->_options;
}

- (void)setOptions:(MPSGraphOptions)options
{
  self->_options = options;
}

- (BOOL)pruneGraph
{
  return self->_pruneGraph;
}

- (void)setPruneGraph:(BOOL)a3
{
  self->_pruneGraph = a3;
}

- (NSMutableDictionary)tensorNameDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTensorNameDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (unint64_t)compilerOptions
{
  return self->_compilerOptions;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  self->_compilerOptions = a3;
}

- (void).cxx_destruct
{
  Operation *state;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;

  objc_storeStrong((id *)&self->_tensorNameDict, 0);
  objc_storeStrong((id *)&self->_executableCache, 0);
  objc_storeStrong((id *)&self->_traininableHighLevelOpVariables, 0);
  objc_storeStrong((id *)&self->_currentInsertionBlock, 0);
  objc_storeStrong((id *)&self->_currentControlDependencies, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  state = self->_module.op.state;
  if (state)
    mlir::Operation::erase(state);
  cntrl = self->_context.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_variableOps, 0);
  objc_storeStrong((id *)&self->_variableOpsMap, 0);
  objc_storeStrong((id *)&self->_placeholderArray, 0);
  objc_storeStrong((id *)&self->_placeholderMap, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor size:(MPSShape *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  _BOOL8 v11;
  std::vector<int>::size_type v15;
  std::vector<int>::size_type v16;
  std::vector<int>::const_iterator v17;
  std::vector<int>::const_iterator v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MPSGraphResizeOp *v24;
  void *v25;
  MPSGraphResizeOp *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  MPSGraphTensor *v31;
  NSString *v32;
  std::vector<int>::value_type __x;
  std::vector<int> v34;
  _QWORD v35[2];
  _QWORD v36[2];

  v11 = centerResult;
  v36[1] = *MEMORY[0x1E0C80C00];
  v31 = imagesTensor;
  v32 = name;
  MPSShapeToVector<int>(size, (char **)&v34);
  if (layout >= MPSGraphTensorNamedDataLayoutHW)
  {
    v15 = 0;
    v16 = 0;
  }
  else
  {
    v15 = qword_18128DFA8[layout];
    v16 = qword_18128DFD8[layout];
  }
  v17.__i_ = v34.__begin_;
  __x = -1;
  std::vector<int>::insert(&v34, v17, v16, &__x);
  v18.__i_ = v34.__end_;
  __x = -1;
  std::vector<int>::insert(&v34, v18, v15, &__x);
  v19 = (char *)v34.__end_ - (char *)v34.__begin_;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19 >> 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v20, v22, 536870944);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [MPSGraphResizeOp alloc];
  v35[0] = v31;
  v35[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = alignCorners;
  v26 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](v24, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", self, v25, MEMORY[0x1E0C9AA60], mode, 0, v11, v30, layout, v32);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34.__begin_)
  {
    v34.__end_ = v34.__begin_;
    operator delete(v34.__begin_);
  }

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](self, "resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", imagesTensor, size, mode, 0, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](self, "resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", imagesTensor, size, 0, nearestRoundingMode, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:centerResult:alignCorners:layout:name:](self, "resizeTensor:sizeTensor:mode:centerResult:alignCorners:layout:name:", imagesTensor, size, 1, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10
{
  _BOOL8 v11;
  id v16;
  NSString *v17;
  MPSGraphTensor *v18;
  MPSGraphResizeOp *v19;
  void *v20;
  void *v21;
  MPSGraphResizeOp *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  MPSGraphTensor *v27;
  id v28;
  void *v29;
  _QWORD v30[3];

  v11 = a7;
  v30[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v16 = a4;
  v17 = (NSString *)a10;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v17);
  v18 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();

  v27 = v18;
  padSizeScaleOffsetForLayout(self, v18, 0, 0, (MPSGraphTensorNamedDataLayout)a9, v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [MPSGraphResizeOp alloc];
  v30[0] = v28;
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a8;
  v22 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](v19, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", self, v21, MEMORY[0x1E0C9AA60], a5, a6, v11, v26, a9, v17);

  -[MPSGraphOperation outputTensors](v22, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:](self, "resizeTensor:sizeTensor:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:", imagesTensor, size, scaleOffset, mode, 0, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:](self, "resizeTensor:sizeTensor:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:", imagesTensor, size, scaleOffset, 0, nearestRoundingMode, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleOffsetTensor:mode:layout:name:](self, "resizeTensor:sizeTensor:scaleOffsetTensor:mode:layout:name:", imagesTensor, size, scaleOffset, 1, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  MPSGraphResizeOp *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  MPSGraphResizeOp *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id v32;
  MPSGraphTensor *v33;
  MPSGraphTensor *v34;
  MPSGraphTensor *v35;
  id v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v15 = a4;
  v36 = a5;
  v16 = a9;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v16);
  v33 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/slice0"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("resize/slice0");
  }
  -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v36, 0, 0, 2, v17);
  v35 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/slice1"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("resize/slice1");
  }
  -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v36, 0, 2, 2, v18);
  v34 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v16)

  padSizeScaleOffsetForLayout(self, v33, v35, v34, (MPSGraphTensorNamedDataLayout)a8, (NSString *)v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [MPSGraphResizeOp alloc];
  v37[0] = v32;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v21 = a8;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v31;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a7;
  v37[2] = v22;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = 0;
  v26 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](v20, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", self, v25, MEMORY[0x1E0C9AA60], a6, v23, 0, v30, v21, v16);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](self, "resizeWithGradientTensor:input:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", gradient, input, mode, 0, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](self, "resizeWithGradientTensor:input:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", gradient, input, 0, nearestRoundingMode, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:mode:centerResult:alignCorners:layout:name:](self, "resizeWithGradientTensor:input:mode:centerResult:alignCorners:layout:name:", gradient, input, 1, centerResult, alignCorners, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10
{
  _BOOL8 v11;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  MPSGraphResizeGradientOp *v20;
  void *v21;
  MPSGraphResizeGradientOp *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[3];

  v11 = a7;
  v29[2] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v28 = a4;
  v16 = a10;
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/shapeOf"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("resizeGrad/shapeOf");
  }
  -[MPSGraph shapeOfTensor:name:](self, "shapeOfTensor:name:", v28, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)

  v20 = [MPSGraphResizeGradientOp alloc];
  v29[0] = v27;
  v29[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a8;
  v22 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](v20, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", self, v21, MEMORY[0x1E0C9AA60], a5, a6, v11, v26, a9, v17);

  -[MPSGraphOperation outputTensors](v22, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:](self, "resizeWithGradientTensor:input:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:", gradient, input, scaleOffset, mode, 0, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:](self, "resizeWithGradientTensor:input:scaleOffsetTensor:mode:nearestRoundingMode:layout:name:", gradient, input, scaleOffset, 0, nearestRoundingMode, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleOffsetTensor:mode:layout:name:](self, "resizeWithGradientTensor:input:scaleOffsetTensor:mode:layout:name:", gradient, input, scaleOffset, 1, layout, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9
{
  id v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  MPSGraphResizeGradientOp *v21;
  void *v22;
  void *v23;
  void *v24;
  MPSGraphResizeGradientOp *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  MPSGraphTensor *v32;
  MPSGraphTensor *v33;
  id v34;
  id v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v34 = a4;
  v35 = a5;
  v15 = a9;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("/shapeOf"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("resizeGrad/shapeOf");
  }
  -[MPSGraph shapeOfTensor:name:](self, "shapeOfTensor:name:", v34, v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/slice0"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("resize/slice0");
  }
  -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v35, 0, 0, 2, v18);
  v33 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/slice1"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("resize/slice1");
  }
  -[MPSGraph sliceTensor:dimension:start:length:name:](self, "sliceTensor:dimension:start:length:name:", v35, 0, 2, 2, v19);
  v32 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v16)

  padSizeScaleOffsetForLayout(self, 0, v33, v32, (MPSGraphTensorNamedDataLayout)a8, (NSString *)v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [MPSGraphResizeGradientOp alloc];
  v36[0] = v30;
  v36[1] = v31;
  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v22;
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = 0;
  v25 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:](v21, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:layout:name:", self, v24, MEMORY[0x1E0C9AA60], a6, a7, 0, v29, a8, v16);

  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:name:](self, "resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:name:", imagesTensor, size, mode, 0, centerResult, alignCorners, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:centerResult:alignCorners:name:](self, "resizeTensor:sizeTensor:mode:centerResult:alignCorners:name:", imagesTensor, size, 1, centerResult, alignCorners, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:name:](self, "resizeTensor:sizeTensor:mode:nearestRoundingMode:centerResult:alignCorners:name:", imagesTensor, size, 0, nearestRoundingMode, centerResult, alignCorners, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 name:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  MPSGraphResizeOp *v19;
  void *v20;
  MPSGraphResizeOp *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[3];

  v10 = a7;
  v26[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a9;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [MPSGraphResizeOp alloc];
  v26[0] = v15;
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = a8;
  v21 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:](v19, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:", self, v20, MEMORY[0x1E0C9AA60], a5, a6, v10, v25, v17);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:](self, "resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:", imagesTensor, size, scale, offset, mode, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:name:](self, "resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:name:", imagesTensor, size, scale, offset, 1, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name
{
  -[MPSGraph resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:](self, "resizeTensor:sizeTensor:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:", imagesTensor, size, scale, offset, 0, nearestRoundingMode, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MPSGraphResizeOp *v21;
  void *v22;
  MPSGraphResizeOp *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [MPSGraphResizeOp alloc];
  v28[0] = v15;
  v28[1] = v20;
  v28[2] = v17;
  v28[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v23 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:](v21, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:", self, v22, MEMORY[0x1E0C9AA60], a7, a8, 0, v27, v19);

  -[MPSGraphOperation outputTensors](v23, "outputTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:](self, "resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:", gradient, input, scale, offset, mode, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:name:](self, "resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:name:", gradient, input, scale, offset, 1, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name
{
  -[MPSGraph resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:](self, "resizeWithGradientTensor:input:scaleTensor:offsetTensor:mode:nearestRoundingMode:name:", gradient, input, scale, offset, 0, nearestRoundingMode, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  MPSGraphResizeGradientOp *v22;
  void *v23;
  MPSGraphResizeGradientOp *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("/shapeOf"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("resizeGrad/shapeOf");
  }
  -[MPSGraph shapeOfTensor:name:](self, "shapeOfTensor:name:", v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)

  v22 = [MPSGraphResizeGradientOp alloc];
  v30[0] = v29;
  v30[1] = v21;
  v30[2] = v16;
  v30[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = 0;
  v24 = -[MPSGraphResizeBaseOp initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:](v22, "initWithGraph:inputTensors:controlDependencies:mode:nearestRoundingMode:centerResult:alignCorners:name:", self, v23, MEMORY[0x1E0C9AA60], a7, a8, 0, v28, v19);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)meanTensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSArray *v12;
  NSString *v13;
  NSString *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;

  v10 = tensor;
  v11 = meanTensor;
  v12 = axes;
  v13 = name;
  v14 = v13;
  if (v13)
  {
    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/subtraction"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("variance/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v10, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    -[NSString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("/square"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("variance/square");
  }
  -[MPSGraph squareWithTensor:name:](self, "squareWithTensor:name:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    -[NSString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("/mean"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("variance/mean");
  }
  -[MPSGraph meanOfTensor:axes:name:](self, "meanOfTensor:axes:name:", v18, v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  NSString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v8 = tensor;
  v9 = axes;
  v10 = name;
  v11 = v10;
  if (v10)
  {
    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/mean"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("variance/mean");
  }
  -[MPSGraph meanOfTensor:axes:name:](self, "meanOfTensor:axes:name:", v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  -[MPSGraph varianceOfTensor:meanTensor:axes:name:](self, "varianceOfTensor:meanTensor:axes:name:", v8, v13, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)normalizationWithTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)mean varianceTensor:(MPSGraphTensor *)variance gammaTensor:(MPSGraphTensor *)gamma betaTensor:(MPSGraphTensor *)beta epsilon:(float)epsilon name:(NSString *)name
{
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  MPSGraphTensor *v18;
  MPSGraphTensor *v19;
  MPSGraphTensor *v20;
  NSString *v21;
  MPSGraphNormalizationOp *v22;
  void *v23;
  double v24;
  MPSGraphNormalizationOp *v25;
  void *v26;
  void *v27;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v16 = tensor;
  v17 = mean;
  v18 = variance;
  v19 = gamma;
  v20 = beta;
  v21 = name;
  if (v19)
  {
    if (!v20)
      goto LABEL_5;
  }
  else
  {
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", -[MPSGraphTensor dataType](v16, "dataType"), 1.0);
    v19 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
LABEL_5:
      -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", -[MPSGraphTensor dataType](v16, "dataType"), 0.0);
      v20 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
    }
  }
  v22 = [MPSGraphNormalizationOp alloc];
  v29[0] = v16;
  v29[1] = v17;
  v29[2] = v18;
  v29[3] = v19;
  v29[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = epsilon;
  v25 = -[MPSGraphNormalizationOp initWithGraph:inputTensors:controlDependencies:epsilon:name:](v22, "initWithGraph:inputTensors:controlDependencies:epsilon:name:", self, v23, MEMORY[0x1E0C9AA60], v21, v24);

  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)normalizationGammaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name
{
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  MPSGraphTensor *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  id v37;
  void *v38;
  void *v40;
  MPSGraphTensor *v41;
  MPSGraphTensor *v42;
  NSArray *v43;
  MPSGraphTensor *v44;

  v44 = incomingGradientTensor;
  v16 = sourceTensor;
  v17 = meanTensor;
  v18 = varianceTensor;
  v43 = axes;
  v19 = name;
  v41 = v18;
  v42 = v17;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B2D8, 268435488, epsilon);
  v20 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v20;
  v21 = -[MPSGraphTensor dataType](v16, "dataType");
  if (v19)
  {
    -[NSString stringByAppendingFormat:](v19, "stringByAppendingFormat:", CFSTR("/cast"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("normalizationGradient/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    -[NSString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("/addition"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = CFSTR("batchNormGammaGradient/addition");
  }
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v18, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    -[NSString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("/sqrt"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("batchNormGammaGradient/sqrt");
  }
  -[MPSGraph squareRootWithTensor:name:](self, "squareRootWithTensor:name:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    -[NSString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("/subtraction"));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = CFSTR("batchNormGammaGradient/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v16, v17, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    -[NSString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("/divison"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = CFSTR("batchNormGammaGradient/divison");
  }
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v29, v27, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    -[NSString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("/multiplication"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = CFSTR("batchNormGammaGradient/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v44, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v19)
  {

    v35 = v34;
    -[NSString stringByAppendingFormat:](v19, "stringByAppendingFormat:", CFSTR("/sum"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = v33;
    v36 = CFSTR("batchNormGammaGradient/sum");
  }
  -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v34, v43, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)

  return (MPSGraphTensor *)v38;
}

- (MPSGraphTensor)normalizationBetaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor reductionAxes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSArray *v12;
  NSString *v13;
  MPSGraphTensor *v14;
  __CFString *v15;
  void *v16;

  v10 = incomingGradientTensor;
  v11 = sourceTensor;
  v12 = axes;
  v13 = name;
  v14 = v10;
  if (v13)
  {
    -[NSString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("/sum"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("batchNormGammaGradient/sum");
  }
  -[MPSGraph reductionSumWithTensor:axes:name:](self, "reductionSumWithTensor:axes:name:", v14, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)normalizationGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor gammaTensor:(MPSGraphTensor *)gamma gammaGradientTensor:(MPSGraphTensor *)gammaGradient betaGradientTensor:(MPSGraphTensor *)betaGradient reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name
{
  __CFString *v12;
  MPSGraphTensor *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  unint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  id v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  double v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  MPSGraphTensor *v59;
  MPSGraphTensor *v60;
  __CFString *v61;
  void *v62;
  MPSGraphTensor *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  MPSGraphTensor *v74;
  MPSGraphTensor *v75;
  MPSGraphTensor *v76;
  MPSGraphTensor *v77;
  void *v78;
  MPSGraphTensor *v79;
  MPSGraphTensor *v80;
  MPSGraphTensor *v81;
  void *v82;
  NSArray *v83;
  NSString *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v77 = incomingGradientTensor;
  v20 = sourceTensor;
  v74 = meanTensor;
  v75 = varianceTensor;
  v76 = gamma;
  v80 = gammaGradient;
  v79 = betaGradient;
  v83 = axes;
  v84 = name;
  v81 = v20;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B2F0, 268435488, epsilon);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphTensor dataType](v20, "dataType");
  if (v84)
  {
    -[NSString stringByAppendingFormat:](v84, "stringByAppendingFormat:", CFSTR("/cast"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("normalizationGradient/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v73, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v23;
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/addition"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = CFSTR("batchNormGradient/addition");
  }
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v75, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v25;
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/reciprocal"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("batchNormGradient/reciprocal");
  }
  -[MPSGraph reciprocalWithTensor:name:](self, "reciprocalWithTensor:name:", v25, v26);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/reciprocal"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = CFSTR("batchNormGradient/reciprocal2");
  }
  -[MPSGraph reciprocalSquareRootWithTensor:name:](self, "reciprocalSquareRootWithTensor:name:", v25, v27);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)

  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B308, 536870944, 1.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[NSArray count](v83, "count") > i; ++i)
  {
    -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", i);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      -[NSString stringByAppendingFormat:](v84, "stringByAppendingFormat:", CFSTR("/dimSize%d/"), i, v65, v66);
      v31 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v31;
    }
    else
    {
      objc_msgSend(CFSTR("batchNormGradient/dimSize"), "stringByAppendingFormat:", CFSTR("%d/"), i);
      v31 = objc_claimAutoreleasedReturnValue();
      v20 = (MPSGraphTensor *)v31;
    }
    -[MPSGraph dimensionSizeOfTensor:axes:name:](self, "dimensionSizeOfTensor:axes:name:", v81, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {

      -[NSString stringByAppendingFormat:](v84, "stringByAppendingFormat:", CFSTR("/mul%d/"), i);
      v33 = objc_claimAutoreleasedReturnValue();
      v27 = (__CFString *)v33;
    }
    else
    {

      objc_msgSend(CFSTR("batchNormGradient/mul"), "stringByAppendingFormat:", CFSTR("%d/"), i);
      v33 = objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)v33;
    }
    -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v82, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    if (v84)
      v35 = v27;
    else
      v35 = v12;

    v82 = (void *)v34;
  }
  v36 = v82;
  v37 = -[MPSGraphTensor dataType](v81, "dataType");
  if (v84)
  {
    -[NSString stringByAppendingFormat:](v84, "stringByAppendingFormat:", CFSTR("/cast"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = CFSTR("batchNormGradient/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v36, v37, v38);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/reciprocal"));
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = CFSTR("batchNormGradient/reciprocal");
  }
  -[MPSGraph reciprocalWithTensor:name:](self, "reciprocalWithTensor:name:", v71, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    if (v80)
    {
LABEL_40:
      if (v79)
      {
LABEL_46:
        -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication1"));
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
      -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/betaGradient"));
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/gammaGradient"));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v80)
      goto LABEL_42;
    v42 = CFSTR("batchNormGradient/gammaGradient");
  }
  *(float *)&v41 = epsilon;
  -[MPSGraph normalizationGammaGradientWithIncomingGradientTensor:sourceTensor:meanTensor:varianceTensor:reductionAxes:epsilon:name:](self, "normalizationGammaGradientWithIncomingGradientTensor:sourceTensor:meanTensor:varianceTensor:reductionAxes:epsilon:name:", v77, v81, v74, v75, v83, v42, v41);
  v80 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    goto LABEL_40;
  }
LABEL_42:
  if (v79)
    goto LABEL_47;
  v43 = CFSTR("batchNormGradient/betaGradient");
LABEL_44:
  -[MPSGraph normalizationBetaGradientWithIncomingGradientTensor:sourceTensor:reductionAxes:name:](self, "normalizationBetaGradientWithIncomingGradientTensor:sourceTensor:reductionAxes:name:", v77, v81, v83, v43);
  v79 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    goto LABEL_46;
  }
LABEL_47:
  v44 = CFSTR("batchNormGradient/multiplication1");
LABEL_48:
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v77, v78, v44);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/subtraction"));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = CFSTR("batchNormGradient/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v81, v74, v45);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication2"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = CFSTR("batchNormGradient/multiplication2");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v40, v70, v46);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication2"));
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = CFSTR("batchNormGradient/multiplication2");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v80, v72, v47);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication3"));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = CFSTR("batchNormGradient/multiplication3");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v69, v68, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication4"));
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = CFSTR("batchNormGradient/multiplication4");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v40, v79, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication5"));
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = CFSTR("batchNormGradient/multiplication5");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v51, v78, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/subtraction1"));
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = CFSTR("batchNormGradient/subtraction1");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v67, v49, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {

    -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/subtraction2"));
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = CFSTR("batchNormGradient/subtraction2");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v55, v53, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!v84)
  {
    v59 = v57;
    v60 = v76;
    if (v76)
    {
      v61 = CFSTR("batchNormGradient/multiplication");
      goto LABEL_77;
    }
LABEL_80:
    v63 = v59;
    goto LABEL_81;
  }

  v59 = v58;
  v60 = v76;
  if (!v76)
    goto LABEL_80;
  -[NSString stringByAppendingString:](v84, "stringByAppendingString:", CFSTR("/multiplication"));
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_77:
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v58, v76, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)

  v63 = v62;
  v60 = v63;
LABEL_81:

  return v63;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MPSGraphTopKOp *v16;
  void *v17;
  MPSGraphTopKOp *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = axisTensor;
  v12 = kTensor;
  v13 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v12, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v11, 1, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [MPSGraphTopKOp alloc];
  v21[0] = v10;
  v21[1] = v15;
  v21[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphTopKOp initWithGraph:inputTensors:controlDependencies:smallest:name:](v16, "initWithGraph:inputTensors:controlDependencies:smallest:name:", self, v17, MEMORY[0x1E0C9AA60], 0, v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MPSGraphTopKOp *v16;
  void *v17;
  MPSGraphTopKOp *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = axisTensor;
  v12 = kTensor;
  v13 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v12, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v11, 1, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [MPSGraphTopKOp alloc];
  v21[0] = v10;
  v21[1] = v15;
  v21[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphTopKOp initWithGraph:inputTensors:controlDependencies:smallest:name:](v16, "initWithGraph:inputTensors:controlDependencies:smallest:name:", self, v17, MEMORY[0x1E0C9AA60], 1, v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;

  v8 = source;
  v9 = kTensor;
  v10 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithSourceTensor:axisTensor:kTensor:name:](self, "topKWithSourceTensor:axisTensor:kTensor:name:", v8, v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = source;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)k);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithSourceTensor:axisTensor:kTensor:name:](self, "topKWithSourceTensor:axisTensor:kTensor:name:", v10, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = source;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)k);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph bottomKWithSourceTensor:axisTensor:kTensor:name:](self, "bottomKWithSourceTensor:axisTensor:kTensor:name:", v10, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = source;
  v9 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, -1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)k);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithSourceTensor:axisTensor:kTensor:name:](self, "topKWithSourceTensor:axisTensor:kTensor:name:", v8, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  void *v14;

  v10 = gradient;
  v11 = source;
  v12 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 32, (double)k);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithGradientTensor:source:kTensor:name:](self, "topKWithGradientTensor:source:kTensor:name:", v10, v11, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = gradient;
  v13 = source;
  v14 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 32, (double)k);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithGradientTensor:source:axisTensor:kTensor:name:](self, "topKWithGradientTensor:source:axisTensor:kTensor:name:", v12, v13, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = gradient;
  v13 = source;
  v14 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 32, (double)k);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph bottomKWithGradientTensor:source:axisTensor:kTensor:name:](self, "bottomKWithGradientTensor:source:axisTensor:kTensor:name:", v12, v13, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;

  v10 = gradient;
  v11 = source;
  v12 = kTensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, -1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph topKWithGradientTensor:source:axisTensor:kTensor:name:](self, "topKWithGradientTensor:source:axisTensor:kTensor:name:", v10, v11, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  NSString *v16;
  void *v17;
  MPSGraphTopKGradientOp *v18;
  void *v19;
  MPSGraphTopKGradientOp *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = source;
  v14 = axisTensor;
  v15 = kTensor;
  v16 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [MPSGraphTopKGradientOp alloc];
  v24[0] = v13;
  v24[1] = v12;
  v24[2] = v14;
  v24[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MPSGraphTopKGradientOp initWithGraph:inputTensors:controlDependencies:smallest:name:](v18, "initWithGraph:inputTensors:controlDependencies:smallest:name:", self, v19, MEMORY[0x1E0C9AA60], 0, v16);

  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  NSString *v16;
  void *v17;
  MPSGraphTopKGradientOp *v18;
  void *v19;
  MPSGraphTopKGradientOp *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = source;
  v14 = axisTensor;
  v15 = kTensor;
  v16 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [MPSGraphTopKGradientOp alloc];
  v24[0] = v13;
  v24[1] = v12;
  v24[2] = v14;
  v24[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MPSGraphTopKGradientOp initWithGraph:inputTensors:controlDependencies:smallest:name:](v18, "initWithGraph:inputTensors:controlDependencies:smallest:name:", self, v19, MEMORY[0x1E0C9AA60], 1, v16);

  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (id)costVolumeWithRefTensor:(id)a3 inputTensor:(id)a4 coordinatesTensor:(id)a5 windowSizes:(id)a6 layout:(unint64_t)a7 normalizeCoordinates:(BOOL)a8 relativeCoordinates:(BOOL)a9 coordinateIs1DInWidth:(BOOL)a10 similarityType:(unint64_t)a11 name:(id)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphCostVolumeOp *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  MPSGraphCostVolumeOp *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  _BOOL4 v33;
  id v34;
  _QWORD v35[5];

  v33 = a8;
  v35[3] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v34 = a12;
  v30 = v16;
  v19 = [MPSGraphCostVolumeOp alloc];
  v35[0] = v15;
  v35[1] = v16;
  v35[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");
  objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");
  BYTE1(v29) = a10;
  LOBYTE(v29) = 1;
  v25 = -[MPSGraphCostVolumeOp initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:coordinateIs1DInWidth:paddingMode:samplingMode:nearestRoundingMode:similarityType:windowWidth:windowHeight:name:](v19, "initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:coordinateIs1DInWidth:paddingMode:samplingMode:nearestRoundingMode:similarityType:windowWidth:windowHeight:name:", self, v20, MEMORY[0x1E0C9AA60], a7, v33, a9, v29, 0, 1, 4, a11, v22, v24, v34);

  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name
{
  _BOOL8 v11;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  void *v20;
  MPSGraphNonMaximumSuppressionOp *v21;
  void *v22;
  double v23;
  double v24;
  MPSGraphNonMaximumSuppressionOp *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];

  v11 = perClassSuppression;
  v29[4] = *MEMORY[0x1E0C80C00];
  v16 = boxesTensor;
  v17 = scoresTensor;
  v18 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, IOUThreshold);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, scoreThreshold);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [MPSGraphNonMaximumSuppressionOp alloc];
  v29[0] = v16;
  v29[1] = v17;
  v29[2] = v19;
  v29[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v23 = IOUThreshold;
  *(float *)&v24 = scoreThreshold;
  v25 = -[MPSGraphNonMaximumSuppressionOp initWithGraph:inputTensors:controlDependencies:iouThreshold:scoreThreshold:perClassSuppression:coordinateMode:name:](v21, "initWithGraph:inputTensors:controlDependencies:iouThreshold:scoreThreshold:perClassSuppression:coordinateMode:name:", self, v22, MEMORY[0x1E0C9AA60], v11, coordinateMode, v18, v23, v24);

  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor classIndicesTensor:(MPSGraphTensor *)classIndicesTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name
{
  _BOOL8 v12;
  MPSGraphTensor *v18;
  MPSGraphTensor *v19;
  NSString *v20;
  void *v21;
  void *v22;
  MPSGraphNonMaximumSuppressionOp *v23;
  void *v24;
  double v25;
  double v26;
  MPSGraphNonMaximumSuppressionOp *v27;
  void *v28;
  void *v29;
  MPSGraphTensor *v31;
  _QWORD v32[6];

  v12 = perClassSuppression;
  v32[5] = *MEMORY[0x1E0C80C00];
  v31 = boxesTensor;
  v18 = scoresTensor;
  v19 = classIndicesTensor;
  v20 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, IOUThreshold);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, scoreThreshold);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [MPSGraphNonMaximumSuppressionOp alloc];
  v32[0] = v31;
  v32[1] = v18;
  v32[2] = v19;
  v32[3] = v21;
  v32[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = IOUThreshold;
  *(float *)&v26 = scoreThreshold;
  v27 = -[MPSGraphNonMaximumSuppressionOp initWithGraph:inputTensors:controlDependencies:iouThreshold:scoreThreshold:perClassSuppression:coordinateMode:name:](v23, "initWithGraph:inputTensors:controlDependencies:iouThreshold:scoreThreshold:perClassSuppression:coordinateMode:name:", self, v24, MEMORY[0x1E0C9AA60], v12, coordinateMode, v20, v25, v26);

  -[MPSGraphOperation outputTensors](v27, "outputTensors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v29;
}

- (MPSGraphTensor)sparseTensorWithType:(MPSGraphSparseStorageType)sparseStorageType tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8;
  NSArray *v12;
  MPSShape *v13;
  NSString *v14;
  MPSGraphSparseTensorOp *v15;
  void *v16;
  void *v17;

  v8 = *(_QWORD *)&dataType;
  v12 = inputTensorArray;
  v13 = shape;
  v14 = name;
  v15 = -[MPSGraphSparseTensorOp initWithGraph:sparseStorageType:inputTensors:shape:dataType:name:]([MPSGraphSparseTensorOp alloc], "initWithGraph:sparseStorageType:inputTensors:shape:dataType:name:", self, sparseStorageType, v12, v13, v8, v14);
  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sparseTensorWithDescriptor:(MPSGraphCreateSparseOpDescriptor *)sparseDescriptor tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape name:(NSString *)name
{
  MPSGraphCreateSparseOpDescriptor *v10;
  NSArray *v11;
  MPSShape *v12;
  NSString *v13;
  MPSGraphSparseTensorOp *v14;
  void *v15;
  void *v16;

  v10 = sparseDescriptor;
  v11 = inputTensorArray;
  v12 = shape;
  v13 = name;
  v14 = -[MPSGraphSparseTensorOp initWithGraph:sparseStorageType:inputTensors:shape:dataType:name:]([MPSGraphSparseTensorOp alloc], "initWithGraph:sparseStorageType:inputTensors:shape:dataType:name:", self, -[MPSGraphCreateSparseOpDescriptor sparseStorageType](v10, "sparseStorageType"), v11, v12, -[MPSGraphCreateSparseOpDescriptor dataType](v10, "dataType"), v13);
  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v6;
  MPSShape *v8;
  NSString *v9;
  MPSGraphPlaceholderOp *v10;
  NSMutableDictionary *placeholderMap;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *placeholderArray;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = *(_QWORD *)&dataType;
  v8 = shape;
  v9 = name;
  v10 = -[MPSGraphPlaceholderOp initWithGraph:shape:dataType:name:]([MPSGraphPlaceholderOp alloc], "initWithGraph:shape:dataType:name:", self, v8, v6, v9);
  placeholderMap = self->_placeholderMap;
  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation name](v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](placeholderMap, "setObject:forKey:", v13, v14);

  placeholderArray = self->_placeholderArray;
  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](placeholderArray, "addObject:", v17);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape name:(NSString *)name
{
  -[MPSGraph placeholderWithShape:dataType:name:](self, "placeholderWithShape:dataType:name:", shape, 268435488, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)constantWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5;
  NSData *v8;
  MPSShape *v9;
  unint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  MPSGraphConstantOp *v15;
  void *v16;
  void *v17;
  unint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)&dataType;
  v8 = data;
  v9 = shape;
  -[MPSShape count](v9, "count");
  if (!-[MPSShape count](v9, "count") && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  for (i = 0; i < -[MPSShape count](v9, "count", v19, v20); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "integerValue");

    -[MPSShape objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 < 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        -[MPSShape objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = i;
        v20 = objc_msgSend(v14, "integerValue");
        MTLReportFailure();

      }
    }
  }
  v15 = -[MPSGraphConstantOp initWithGraph:data:shape:dataType:isSplat:name:]([MPSGraphConstantOp alloc], "initWithGraph:data:shape:dataType:isSplat:name:", self, v8, v9, v5, 0, 0);
  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)constantWithScalar:(double)scalar dataType:(MPSDataType)dataType
{
  return -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", MEMORY[0x1E0C9AA60], *(_QWORD *)&dataType, scalar);
}

- (MPSGraphTensor)constantWithScalar:(double)scalar shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5;
  MPSShape *v8;
  void *v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MPSGraphConstantOp *v17;
  void *v18;
  void *v19;
  unint64_t v21;
  uint64_t v22;

  v5 = *(_QWORD *)&dataType;
  v8 = shape;
  if (-[MPSShape count](v8, "count") == 1)
  {
    -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == -1)
    {

      v8 = (MPSShape *)MEMORY[0x1E0C9AA60];
    }
  }
  for (i = 0; i < -[MPSShape count](v8, "count", v21, v22); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "integerValue");

    -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 <= 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = i;
        v22 = objc_msgSend(v15, "integerValue");
        MTLReportFailure();

      }
    }
  }
  getConstantDataForScalar(v5, scalar);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphConstantOp initWithGraph:data:shape:dataType:isSplat:name:]([MPSGraphConstantOp alloc], "initWithGraph:data:shape:dataType:isSplat:name:", self, v16, v8, v5, 1, 0);
  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart
{
  return -[MPSGraph constantWithRealPart:imaginaryPart:dataType:](self, "constantWithRealPart:imaginaryPart:dataType:", 285212736, realPart, imaginaryPart);
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart dataType:(MPSDataType)dataType
{
  return -[MPSGraph constantWithRealPart:imaginaryPart:shape:dataType:](self, "constantWithRealPart:imaginaryPart:shape:dataType:", MEMORY[0x1E0C9AA60], *(_QWORD *)&dataType, realPart, imaginaryPart);
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v6;
  MPSShape *v10;
  void *v11;
  uint64_t v12;
  unint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MPSGraphConstantOp *v19;
  void *v20;
  void *v21;
  unint64_t v23;
  uint64_t v24;

  v6 = *(_QWORD *)&dataType;
  v10 = shape;
  if (-[MPSShape count](v10, "count") == 1)
  {
    -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (v12 == -1)
    {

      v10 = (MPSShape *)MEMORY[0x1E0C9AA60];
    }
  }
  for (i = 0; i < -[MPSShape count](v10, "count", v23, v24); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "integerValue");

    -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 <= 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = i;
        v24 = objc_msgSend(v17, "integerValue");
        MTLReportFailure();

      }
    }
  }
  getConstantDataForComplexScalar(v6, realPart, imaginaryPart);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPSGraphConstantOp initWithGraph:data:shape:dataType:isSplat:name:]([MPSGraphConstantOp alloc], "initWithGraph:data:shape:dataType:isSplat:name:", self, v18, v10, v6, 1, 0);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)variableWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v7;
  NSData *v10;
  MPSShape *v11;
  NSString *v12;
  MPSGraphVariableOp *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MPSGraphVariable *v17;
  MPSGraphVariable *variable;
  NSMutableDictionary *variableOpsMap;
  void *v20;
  void *v21;
  void *v22;

  v7 = *(_QWORD *)&dataType;
  v10 = data;
  v11 = shape;
  v12 = name;
  v13 = -[MPSGraphVariableOp initWithGraph:shape:dataType:name:]([MPSGraphVariableOp alloc], "initWithGraph:shape:dataType:name:", self, v11, v7, v12);
  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "value");

  v17 = -[MPSGraphVariable initVariableWithData:value:]([MPSGraphVariable alloc], "initVariableWithData:value:", v10, v16);
  variable = v13->_variable;
  v13->_variable = v17;

  variableOpsMap = self->_variableOpsMap;
  -[MPSGraphOperation name](v13, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](variableOpsMap, "setObject:forKey:", v13, v20);

  -[NSMutableArray addObject:](self->_variableOps, "addObject:", v13);
  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (id)variableFromTensorWithTensor:(id)a3 name:(id)a4
{
  -[MPSGraph varFromTensorWithTensor:name:](self, "varFromTensorWithTensor:name:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)readVariable:(MPSGraphTensor *)variable name:(NSString *)name
{
  MPSGraphTensor *v5;
  MPSGraphReadVariableOp *v6;
  void *v7;
  MPSGraphReadVariableOp *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = variable;
  v6 = [MPSGraphReadVariableOp alloc];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v6, "initWithGraph:inputTensors:controlDependencies:name:", self, v7, MEMORY[0x1E0C9AA60], 0);

  -[MPSGraphOperation outputTensors](v8, "outputTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v10;
}

- (MPSGraphOperation)assignVariable:(MPSGraphTensor *)variable withValueOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  MPSGraphAssignVariableOp *v11;
  void *v12;
  MPSGraphAssignVariableOp *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = variable;
  v9 = tensor;
  v10 = name;
  v11 = [MPSGraphAssignVariableOp alloc];
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  return (MPSGraphOperation *)v13;
}

- (id)createTexture:(id)a3 withPixelFormat:(unint64_t)a4 isCompressed:(BOOL)a5 name:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  MPSGraphCreateTextureTensorOp *v12;
  void *v13;
  MPSGraphCreateTextureTensorOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v7 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = [MPSGraphCreateTextureTensorOp alloc];
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphCreateTextureTensorOp initWithGraph:inputTensors:controlDependencies:pixelFormat:isCompressed:name:](v12, "initWithGraph:inputTensors:controlDependencies:pixelFormat:isCompressed:name:", self, v13, MEMORY[0x1E0C9AA60], a4, v7, v11);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name
{
  _BOOL8 v7;
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  MPSGraphSortOp *v13;
  void *v14;
  MPSGraphSortOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = descending;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [MPSGraphSortOp alloc];
  v19[0] = v10;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphSortOp initWithGraph:inputTensors:controlDependencies:descending:name:](v13, "initWithGraph:inputTensors:controlDependencies:descending:name:", self, v14, MEMORY[0x1E0C9AA60], v7, v11);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name
{
  _BOOL8 v7;
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  MPSGraphSortOp *v13;
  void *v14;
  MPSGraphSortOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = descending;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = axisTensor;
  v12 = name;
  v13 = [MPSGraphSortOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphSortOp initWithGraph:inputTensors:controlDependencies:descending:name:](v13, "initWithGraph:inputTensors:controlDependencies:descending:name:", self, v14, MEMORY[0x1E0C9AA60], v7, v12);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph sortWithTensor:axis:descending:name:](self, "sortWithTensor:axis:descending:name:", tensor, axis, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph sortWithTensor:axisTensor:descending:name:](self, "sortWithTensor:axisTensor:descending:name:", tensor, axisTensor, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name
{
  _BOOL8 v7;
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  MPSGraphArgSortOp *v13;
  void *v14;
  MPSGraphArgSortOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = descending;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [MPSGraphArgSortOp alloc];
  v19[0] = v10;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphArgSortOp initWithGraph:inputTensors:controlDependencies:descending:name:](v13, "initWithGraph:inputTensors:controlDependencies:descending:name:", self, v14, MEMORY[0x1E0C9AA60], v7, v11);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name
{
  _BOOL8 v7;
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  MPSGraphArgSortOp *v13;
  void *v14;
  MPSGraphArgSortOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = descending;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = axisTensor;
  v12 = name;
  v13 = [MPSGraphArgSortOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphArgSortOp initWithGraph:inputTensors:controlDependencies:descending:name:](v13, "initWithGraph:inputTensors:controlDependencies:descending:name:", self, v14, MEMORY[0x1E0C9AA60], v7, v12);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  -[MPSGraph argSortWithTensor:axis:descending:name:](self, "argSortWithTensor:axis:descending:name:", tensor, axis, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  -[MPSGraph argSortWithTensor:axisTensor:descending:name:](self, "argSortWithTensor:axisTensor:descending:name:", tensor, axisTensor, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)biasAddWithTensor:(id)a3 biases:(id)a4 dataLayout:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPSGraphBiasAddOp *v13;
  void *v14;
  MPSGraphBiasAddOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = [MPSGraphBiasAddOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphBiasAddOp initWithGraph:inputTensors:controlDependencies:dataLayout:name:](v13, "initWithGraph:inputTensors:controlDependencies:dataLayout:name:", self, v14, MEMORY[0x1E0C9AA60], a5, v12);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MPSGraphTensor)reLUWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphReLUOp *v8;
  void *v9;
  MPSGraphReLUOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v8 = [MPSGraphReLUOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;

  v8 = gradient;
  v9 = source;
  v10 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B350, -[MPSGraphTensor dataType](v9, "dataType"), 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/lessThanOrEqualTo"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("reLUGrad/lessThanOrEqualTo");
  }
  -[MPSGraph greaterThanWithPrimaryTensor:secondaryTensor:name:](self, "greaterThanWithPrimaryTensor:secondaryTensor:name:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/select"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("reLUGrad/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alpha:(double)alpha name:(NSString *)name
{
  MPSGraphTensor *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v8 = tensor;
  v9 = CFSTR("leakyReLU");
  if (name)
    v9 = (__CFString *)name;
  v10 = v9;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B368, -[MPSGraphTensor dataType](v8, "dataType"), alpha);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph leakyReLUWithTensor:alphaTensor:name:](self, "leakyReLUWithTensor:alphaTensor:name:", v8, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  MPSGraphLeakyReLUOp *v11;
  void *v12;
  MPSGraphLeakyReLUOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = alphaTensor;
  v10 = name;
  v11 = [MPSGraphLeakyReLUOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)leakyReLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;

  v10 = gradient;
  v11 = source;
  v12 = alphaTensor;
  v13 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B380, -[MPSGraphTensor dataType](v10, "dataType"), 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B398, -[MPSGraphTensor dataType](v10, "dataType"), 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/lessThan"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("leakyReLUGrad/lessThan");
  }
  -[MPSGraph lessThanWithPrimaryTensor:secondaryTensor:name:](self, "lessThanWithPrimaryTensor:secondaryTensor:name:", v11, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/select"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("leakyReLUGrad/select");
  }
  -[MPSGraph selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:](self, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v17, v12, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/multiplication_2"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("leakyReLUGrad/multiplication_2");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v10, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)sigmoidWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphSigmoidOp *v8;
  void *v9;
  MPSGraphSigmoidOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v8 = [MPSGraphSigmoidOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)sigmoidGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v22;

  v8 = gradient;
  v9 = source;
  v10 = name;
  v22 = 1065353216;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &v22, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v11, &unk_1E0E9B3B0, -[MPSGraphTensor dataType](v9, "dataType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/sigmoid"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("sigmoidGrad/sigmoid");
  }
  -[MPSGraph sigmoidWithTensor:name:](self, "sigmoidWithTensor:name:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/subtraction"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("sigmoidGrad/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/multiplication"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("sigmoidGrad/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v16, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/multiplication_1"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("sigmoidGrad/multiplication_1");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v8, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)softMaxWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  NSString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;

  v8 = tensor;
  v9 = name;
  v10 = v9;
  if (v9)
  {
    -[NSString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("/reductionMaximum"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("softMax/reductionMaximum");
  }
  -[MPSGraph reductionMaximumWithTensor:axis:name:](self, "reductionMaximumWithTensor:axis:name:", v8, axis, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  objc_msgSend(v12, "operation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStopGradient:", 1);

  if (v10)
  {
    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/subtraction"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("softMax/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v8, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/exponent"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("softMax/exponent");
  }
  -[MPSGraph exponentWithTensor:name:](self, "exponentWithTensor:name:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/reductionSum"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("softMax/reductionSum");
  }
  -[MPSGraph reductionSumWithTensor:axis:name:](self, "reductionSumWithTensor:axis:name:", v17, axis, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/division"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("softMax/division");
  }
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)softMaxGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;

  v10 = gradient;
  v11 = name;
  -[MPSGraph softMaxWithTensor:axis:name:](self, "softMaxWithTensor:axis:name:", source, axis, CFSTR("softMaxGradient/softMax"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/multiplication"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("softMaxGradient/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v12, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/subtraction"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("softMaxGradient/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/multiplication_1"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("softMaxGradient/multiplication_1");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v16, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphFFTDescriptor *v12;
  NSString *v13;
  MPSGraphFFTOp *v14;
  void *v15;
  MPSGraphFFTOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = axesTensor;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphFFTOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphFFTDescriptor *v11;
  NSString *v12;
  void *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;

  v10 = tensor;
  v11 = descriptor;
  v12 = name;
  axesToAxesTensor(self, axes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MPSGraph fastFourierTransformWithTensor:axesTensor:descriptor:name:](self, "fastFourierTransformWithTensor:axesTensor:descriptor:name:", v10, v13, v11, v12);
    v14 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphFFTDescriptor *v11;
  NSString *v12;
  void *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;

  v10 = tensor;
  v11 = descriptor;
  v12 = name;
  axesToAxesTensor(self, axes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MPSGraph realToHermiteanFFTWithTensor:axesTensor:descriptor:name:](self, "realToHermiteanFFTWithTensor:axesTensor:descriptor:name:", v10, v13, v11, v12);
    v14 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphFFTDescriptor *v12;
  NSString *v13;
  MPSGraphRealToHermiteanFFTOp *v14;
  void *v15;
  MPSGraphRealToHermiteanFFTOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = axesTensor;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphRealToHermiteanFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphRealToHermiteanFFTOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphFFTDescriptor *v11;
  NSString *v12;
  void *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;

  v10 = tensor;
  v11 = descriptor;
  v12 = name;
  axesToAxesTensor(self, axes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MPSGraph HermiteanToRealFFTWithTensor:axesTensor:descriptor:name:](self, "HermiteanToRealFFTWithTensor:axesTensor:descriptor:name:", v10, v13, v11, v12);
    v14 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphFFTDescriptor *v12;
  NSString *v13;
  MPSGraphHermiteanToRealFFTOp *v14;
  void *v15;
  MPSGraphHermiteanToRealFFTOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = axesTensor;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphHermiteanToRealFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphHermiteanToRealFFTOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)stochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor valuesTensor:(MPSGraphTensor *)valuesTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  NSString *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;

  v10 = learningRateTensor;
  v11 = valuesTensor;
  v12 = gradientTensor;
  v13 = name;
  v14 = v13;
  if (v13)
  {
    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/multiplication"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("stochasticGradientDescent/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v12, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    -[NSString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("/subtraction"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("stochasticGradientDescent/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v11, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)

  return (MPSGraphTensor *)v18;
}

- (MPSGraphOperation)applyStochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor variable:(MPSGraphVariableOp *)variable gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;

  v10 = learningRateTensor;
  v11 = gradientTensor;
  v12 = name;
  -[MPSGraphOperation outputTensors](variable, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph stochasticGradientDescentWithLearningRateTensor:valuesTensor:gradientTensor:name:](self, "stochasticGradientDescentWithLearningRateTensor:valuesTensor:gradientTensor:name:", v10, v14, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("/assignUpdate"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("applyStochasticGradient/assignUpdate");
  }
  -[MPSGraph assignVariable:withValueOfTensor:name:](self, "assignVariable:withValueOfTensor:name:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  return (MPSGraphOperation *)v17;
}

- (id)momentumUpdateWithBetaTensor:(id)a3 momentumTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v10 = a3;
  v26 = a4;
  v11 = a5;
  v12 = (__CFString *)a6;
  v13 = v12;
  v14 = CFSTR("momentumUpdate");
  if (v12)
    v14 = v12;
  v15 = v14;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B3C8, objc_msgSend(v11, "dataType"), 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("/sub"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v16, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("/mul"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v10, v26, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("/mul"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v18, v11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("/add"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)velocityUpdateWithBetaTensor:(id)a3 velocityTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (__CFString *)a6;
  v14 = v13;
  v15 = CFSTR("velocityUpdate");
  if (v13)
    v15 = v13;
  v16 = v15;
  v29 = v11;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B3E0, objc_msgSend(v12, "dataType"), 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/sub"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v28, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/square"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squareWithTensor:name:](self, "squareWithTensor:name:", v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/mul"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v10, v11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/mul"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v18, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/add"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)adamAssignWithInputVariableTensor:(id)a3 momentumVariableTensor:(id)a4 velocityVariableTensor:(id)a5 maximumVelocityVariableTensor:(id)a6 updates:(id)a7 name:(id)a8
{
  id v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v34 = a4;
  v33 = a5;
  v38 = a6;
  v14 = a7;
  v15 = (__CFString *)a8;
  v16 = v15;
  v17 = CFSTR("applyAdam");
  if (v15)
    v17 = v15;
  v18 = v17;
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR("/assignAdamUpdate/momentum"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph assignVariable:withValueOfTensor:name:](self, "assignVariable:withValueOfTensor:name:", v34, v37, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR("/assignAdamUpdate/velocity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph assignVariable:withValueOfTensor:name:](self, "assignVariable:withValueOfTensor:name:", v33, v36, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR("/assignAdamUpdate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph assignVariable:withValueOfTensor:name:](self, "assignVariable:withValueOfTensor:name:", v32, v35, v23);
  v24 = (id *)objc_claimAutoreleasedReturnValue();

  v25 = v24[4];
  v39[0] = v20;
  v39[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v26);

  v27 = objc_msgSend(v14, "count");
  if (v38 && v27 >= 4)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", CFSTR("/assignAdamUpdate/maximumVelocity"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph assignVariable:withValueOfTensor:name:](self, "assignVariable:withValueOfTensor:name:", v38, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24[4], "addObject:", v30);
  }

  return v24;
}

- (NSArray)adamWithCurrentLearningRateTensor:(MPSGraphTensor *)currentLearningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  -[MPSGraph adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](self, "adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", currentLearningRateTensor, beta1Tensor, beta2Tensor, epsilonTensor, valuesTensor, momentumTensor, velocityTensor, maximumVelocityTensor, gradientTensor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)adamUpdateWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 valuesTensor:(id)a7 momentumTensor:(id)a8 velocityTensor:(id)a9 maximumVelocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  __CFString *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[3];
  _QWORD v59[6];

  v59[4] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v18 = a4;
  v52 = a5;
  v51 = a6;
  v49 = a7;
  v19 = a8;
  v53 = a9;
  v57 = a10;
  v20 = a11;
  v21 = (__CFString *)a12;
  v22 = CFSTR("applyAdam");
  v47 = v21;
  if (v21)
    v22 = v21;
  v23 = v22;
  v48 = v18;
  v46 = v19;
  v54 = v20;
  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/momentumUpdate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph momentumUpdateWithBetaTensor:momentumTensor:gradientTensor:name:](self, "momentumUpdateWithBetaTensor:momentumTensor:gradientTensor:name:", v18, v19, v20, v24);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/velocityUpdate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph velocityUpdateWithBetaTensor:velocityTensor:gradientTensor:name:](self, "velocityUpdateWithBetaTensor:velocityTensor:gradientTensor:name:", v52, v53, v20, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v26;
  v28 = v27;
  if (v57)
  {
    -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/maxVelocity"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph maximumWithPrimaryTensor:secondaryTensor:name:](self, "maximumWithPrimaryTensor:secondaryTensor:name:", v28, v57, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v30;
    v55 = v31;
  }
  else
  {
    v31 = 0;
    v55 = v27;
  }
  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/squareRoot"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squareRootWithTensor:name:](self, "squareRootWithTensor:name:", v55, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/epsilon_add"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v33, v51, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/multiply"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v50, v56, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/divide"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v37, v35, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("/subtract"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v49, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v59[0] = v41;
    v59[1] = v56;
    v42 = v59;
    v43 = 4;
    v59[2] = v28;
    v59[3] = v31;
  }
  else
  {
    v58[0] = v41;
    v58[1] = v56;
    v42 = v58;
    v43 = 3;
    v58[2] = v28;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)applyAdamWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 variable:(id)a7 momentumVariable:(id)a8 velocityVariable:(id)a9 maximumVelocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v34 = v18;
  objc_msgSend(a7, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "outputTensors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }
  -[MPSGraph adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](self, "adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", v38, v37, v36, v35, v24, v26, v28, v30, v21, v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:](self, "adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:", v24, v26, v28, v30, v31, v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)currentLearningRateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 beta1PowerTensor:(id)a6 beta2PowerTensor:(id)a7 name:(id)a8
{
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;

  v31 = a3;
  v12 = a6;
  v13 = a7;
  v14 = (__CFString *)a8;
  v15 = v14;
  v16 = CFSTR("applyAdam");
  if (v14)
    v16 = v14;
  v17 = v16;
  v30 = v13;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B3F8, objc_msgSend(v12, "dataType"), 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/subPowBeta1"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v18, v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/subPowBeta2"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v18, v13, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/sqrtBeta2"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squareRootWithTensor:name:](self, "squareRootWithTensor:name:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/subBeta2"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v24, v31, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/subBeta2"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph divisionWithPrimaryTensor:secondaryTensor:name:](self, "divisionWithPrimaryTensor:secondaryTensor:name:", v26, v20, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSArray)adamWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor beta1PowerTensor:(MPSGraphTensor *)beta1PowerTensor beta2PowerTensor:(MPSGraphTensor *)beta2PowerTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  -[MPSGraph adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](self, "adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", learningRateTensor, beta1Tensor, beta2Tensor, epsilonTensor, beta1PowerTensor, beta2PowerTensor, valuesTensor, momentumTensor, velocityTensor, maximumVelocityTensor, gradientTensor, name);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 valuesTensor:(id)a9 momentumTensor:(id)a10 velocityTensor:(id)a11 maximumVelocityTensor:(id)a12 gradientTensor:(id)a13 name:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  MPSGraph *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  MPSGraph *v27;
  void *v28;
  void *v29;
  id v34;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = self;
  v34 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  -[MPSGraph currentLearningRateWithLearningRateTensor:beta1Tensor:beta2Tensor:beta1PowerTensor:beta2PowerTensor:name:](self, "currentLearningRateWithLearningRateTensor:beta1Tensor:beta2Tensor:beta1PowerTensor:beta2PowerTensor:name:", a3, v17, v18, a7, a8, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v21;
  v28 = v20;
  -[MPSGraph adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](v27, "adamUpdateWithCurrentLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", v26, v17, v18, v19, v20, v34, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 variable:(id)a9 momentumVariable:(id)a10 velocityVariable:(id)a11 gradientTensor:(id)a12 name:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v37 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  objc_msgSend(a9, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](self, "adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", v37, v36, v35, v34, v33, v18, v24, v26, v28, 0, v21, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:](self, "adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:", v24, v26, v28, 0, v29, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 valuesTensor:(id)a8 momentumTensor:(id)a9 velocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  __CFString *v38;

  v36 = a3;
  v18 = a4;
  v19 = a5;
  v34 = a6;
  v20 = a7;
  v21 = a8;
  v37 = a9;
  v22 = a10;
  v23 = a11;
  v24 = (__CFString *)a12;
  v25 = v24;
  v26 = CFSTR("applyAdam");
  if (v24)
    v26 = v24;
  v38 = v26;
  v35 = v18;
  v33 = v21;
  -[__CFString stringByAppendingString:](v38, "stringByAppendingString:", CFSTR("/beta1Power"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph powerWithPrimaryTensor:secondaryTensor:name:](self, "powerWithPrimaryTensor:secondaryTensor:name:", v18, v20, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v38, "stringByAppendingString:", CFSTR("/beta2Power"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph powerWithPrimaryTensor:secondaryTensor:name:](self, "powerWithPrimaryTensor:secondaryTensor:name:", v19, v20, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:](self, "adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:beta1PowerTensor:beta2PowerTensor:valuesTensor:momentumTensor:velocityTensor:maximumVelocityTensor:gradientTensor:name:", v36, v35, v19, v34, v28, v30, v33, v37, v22, 0, v23, v25);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 variable:(id)a8 momentumVariable:(id)a9 velocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;

  v35 = a3;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  objc_msgSend(a8, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:iterationTensor:valuesTensor:momentumTensor:velocityTensor:gradientTensor:name:](self, "adamUpdateWithLearningRateTensor:beta1Tensor:beta2Tensor:epsilonTensor:iterationTensor:valuesTensor:momentumTensor:velocityTensor:gradientTensor:name:", v35, v34, v33, v32, v18, v24, v26, v28, v21, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:](self, "adamAssignWithInputVariableTensor:momentumVariableTensor:velocityVariableTensor:maximumVelocityVariableTensor:updates:name:", v24, v26, v28, 0, v29, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)solveWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 descriptor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPSGraphMatrixSolverOp *v14;
  void *v15;
  void *v16;
  void *v17;
  MPSGraphMatrixSolverOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v12, "decompositionType"))
    __assert_rtn("-[MPSGraph(MPSGraphMatrixSolverOps) solveWithDecompositionTensor:rhsTensor:descriptor:name:]", "MPSGraphMatrixSolveOps.mm", 49, "(descriptor.decompositionType == MPSGraphMatrixDecompositionLU) && \"unsupported decomposition type\");
  v14 = [MPSGraphMatrixSolverOp alloc];
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v22[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v14, "initWithGraph:inputTensors:controlDependencies:name:", self, v17, MEMORY[0x1E0C9AA60], v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)solveLUWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphMatrixSolverOp *v11;
  void *v12;
  void *v13;
  void *v14;
  MPSGraphMatrixSolverOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphMatrixSolverOp alloc];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v14, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MPSGraphTensor)stencilWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphStencilOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphStencilOpDescriptor *v12;
  NSString *v13;
  void *v14;
  MPSGraphStencilOp *v15;
  MPSGraphStencilOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = weights;
  v12 = descriptor;
  v13 = name;
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphStencilOp alloc];
  v16 = -[MPSGraphStencilOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v15, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v14, MEMORY[0x1E0C9AA60], v12, v13);
  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (id)stencilWithSourceTensor:(id)a3 weightsTensor:(id)a4 offsets:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  MPSGraphStencilOp *v17;
  MPSGraphStencilOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22[0] = v10;
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 0;
  +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:](MPSGraphStencilOpDescriptor, "descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:", 2, v12, &unk_1E0E9B4E8, &unk_1E0E9B500, &unk_1E0E9B518, 4, v15, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [MPSGraphStencilOp alloc];
  v18 = -[MPSGraphStencilOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v17, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v14, MEMORY[0x1E0C9AA60], v16, v13);
  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)eluWithTensor:(id)a3 alpha:(double)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MPSGraphEluOp *v11;
  void *v12;
  MPSGraphEluOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B560, objc_msgSend(v8, "dataType"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [MPSGraphEluOp alloc];
  v17[0] = v8;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v9);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)eluGradientWithIncomingGradient:(id)a3 sourceTensor:(id)a4 alpha:(double)a5 name:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v26;
  id v27;

  v27 = a3;
  v10 = a4;
  v11 = a6;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B578, objc_msgSend(v10, "dataType"), a5);
  v12 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v12;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B590, objc_msgSend(v10, "dataType"), 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B5A8, objc_msgSend(v10, "dataType"), 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/lessThanOrEqualTo"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("eluGrad/lessThanOrEqualTo");
  }
  -[MPSGraph greaterThanWithPrimaryTensor:secondaryTensor:name:](self, "greaterThanWithPrimaryTensor:secondaryTensor:name:", v10, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/eluResult"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("eluGrad/eluResult");
  }
  -[MPSGraph eluWithTensor:alpha:name:](self, "eluWithTensor:alpha:name:", v10, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/negativeRegionGradient"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("eluGrad/negativeRegionGradient");
  }
  -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v18, v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/localGradient"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("eluGrad/localGradient");
  }
  -[MPSGraph selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:](self, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v16, v14, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/select"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("eluGrad/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v27, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return v24;
}

- (id)prunedTensorWithDescriptor:(id)a3 tensor:(id)a4 shape:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPSGraphPruningOp *v14;
  void *v15;
  MPSGraphPruningOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [MPSGraphPruningOp alloc];
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphPruningOp initWithGraph:inputTensors:controlDependencies:shape:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:shape:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v10, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)prunedGradientTensorWithDescriptor:(id)a3 inputTensor:(id)a4 gradientTensor:(id)a5 shape:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphPruningGradientOp *v17;
  void *v18;
  MPSGraphPruningGradientOp *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = [MPSGraphPruningGradientOp alloc];
  v23[0] = v13;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPSGraphPruningGradientOp initWithGraph:inputTensors:controlDependencies:shape:descriptor:name:](v17, "initWithGraph:inputTensors:controlDependencies:shape:descriptor:name:", self, v18, MEMORY[0x1E0C9AA60], v15, v12, v16);

  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (MPSGraphTensor)convolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphConvolution2DOpDescriptor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MPSGraphConvolution2DOp *v24;
  void *v25;
  MPSGraphConvolution2DOp *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = weights;
  v12 = descriptor;
  v13 = name;
  -[MPSGraphTensor shape](v10, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") != 4)
  {
    -[MPSGraphTensor shape](v10, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count");

  }
  -[MPSGraphTensor shape](v10, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v10, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v11, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") != 4)
  {
    -[MPSGraphTensor shape](v11, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "count");

  }
  -[MPSGraphTensor shape](v11, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v11, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v24 = [MPSGraphConvolution2DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MPSGraphConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v24, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v25, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphConvolution2DOpDescriptor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MPSGraphConvolution2DDataGradientOp *v27;
  void *v28;
  MPSGraphConvolution2DDataGradientOp *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = weights;
  v14 = outputShapeTensor;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSGraphTensor shape](v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 4)
  {
    -[MPSGraphTensor shape](v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  -[MPSGraphTensor shape](v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 4)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  -[MPSGraphTensor shape](v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v27 = [MPSGraphConvolution2DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MPSGraphConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v27, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v28, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v29, "outputTensors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphConvolution2DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = weights;
  v14 = outputShape;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 4 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  v23 = xmmword_1812876C0;
  while (v17 < -[MPSShape count](v14, "count", v23))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B5D8, 536870944);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphConvolution2DOpDescriptor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPSGraphConvolution2DWeightsGradientOp *v32;
  void *v33;
  MPSGraphConvolution2DWeightsGradientOp *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = source;
  v14 = outputShapeTensor;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSGraphTensor shape](v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 4)
  {
    -[MPSGraphTensor shape](v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  -[MPSGraphTensor shape](v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 4)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  -[MPSGraphTensor shape](v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 4)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v14, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count") != 1)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

  }
  -[MPSGraphTensor shape](v14, "shape");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count") == 1)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v32 = [MPSGraphConvolution2DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MPSGraphConvolution2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v32, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v33, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v34, "outputTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v36;
}

- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphConvolution2DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = source;
  v14 = outputShape;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 4 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  v23 = xmmword_1812876C0;
  while (v17 < -[MPSShape count](v14, "count", v23))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B5F0, 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphConvolution3DOpDescriptor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MPSGraphConvolution3DOp *v24;
  void *v25;
  MPSGraphConvolution3DOp *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v10 = source;
  v11 = weights;
  v12 = descriptor;
  v13 = name;
  -[MPSGraphTensor shape](v10, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") != 5)
  {
    -[MPSGraphTensor shape](v10, "shape");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count");

  }
  -[MPSGraphTensor shape](v10, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v10, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v11, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") != 5)
  {
    -[MPSGraphTensor shape](v11, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "count");

  }
  -[MPSGraphTensor shape](v11, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v11, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v24 = [MPSGraphConvolution3DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MPSGraphConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v24, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v25, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v26, "outputTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphConvolution3DOpDescriptor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MPSGraphConvolution3DDataGradientOp *v27;
  void *v28;
  MPSGraphConvolution3DDataGradientOp *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = weights;
  v14 = outputShapeTensor;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSGraphTensor shape](v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 5)
  {
    -[MPSGraphTensor shape](v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  -[MPSGraphTensor shape](v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 5)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  -[MPSGraphTensor shape](v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v27 = [MPSGraphConvolution3DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MPSGraphConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v27, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v28, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v29, "outputTensors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphConvolution3DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = weights;
  v14 = outputShape;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 5 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  LODWORD(v24) = 1;
  v23 = xmmword_181291090;
  while (v17 < -[MPSShape count](v14, "count", v23, v24, v25))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B608, 536870944);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph convolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphConvolution3DOpDescriptor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPSGraphConvolution3DWeightsGradientOp *v32;
  void *v33;
  MPSGraphConvolution3DWeightsGradientOp *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = source;
  v14 = outputShapeTensor;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSGraphTensor shape](v12, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 5)
  {
    -[MPSGraphTensor shape](v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "count");

  }
  -[MPSGraphTensor shape](v12, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v12, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v13, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") != 5)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "count");

  }
  -[MPSGraphTensor shape](v13, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count") == 5)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  -[MPSGraphTensor shape](v14, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count") != 1)
  {
    -[MPSGraphTensor shape](v13, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

  }
  -[MPSGraphTensor shape](v14, "shape");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count") == 1)
  {

  }
  else
  {
    -[MPSGraphTensor shape](v13, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  v32 = [MPSGraphConvolution3DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MPSGraphConvolution3DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v32, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v33, MEMORY[0x1E0C9AA60], v15, v16);

  -[MPSGraphOperation outputTensors](v34, "outputTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v36;
}

- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphConvolution3DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = incomingGradient;
  v13 = source;
  v14 = outputShape;
  v15 = forwardConvolutionDescriptor;
  v16 = name;
  -[MPSShape count](v14, "count");
  if (-[MPSShape count](v14, "count") != 5 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
  LODWORD(v24) = 1;
  v23 = xmmword_181291090;
  while (v17 < -[MPSShape count](v14, "count", v23, v24, v25))
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v23 + v17) = objc_msgSend(v18, "intValue");

    ++v17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, &unk_1E0E9B620, 536870944);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph convolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v12, v13, v20, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)randomPhiloxStateTensorWithSeed:(NSUInteger)seed name:(NSString *)name
{
  NSString *v6;
  void *v7;
  _QWORD *v8;
  void *v9;

  v6 = name;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7110]), "initPhiloxStateDescriptorWithSeed:", seed);
  v8 = (_QWORD *)objc_msgSend(v7, "state");
  -[MPSGraph randomPhiloxStateTensorWithCounterLow:counterHigh:key:name:](self, "randomPhiloxStateTensorWithCounterLow:counterHigh:key:name:", *v8, v8[1], v8[2], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)randomPhiloxStateTensorWithCounterLow:(NSUInteger)counterLow counterHigh:(NSUInteger)counterHigh key:(NSUInteger)key name:(NSString *)name
{
  NSString *v10;
  MPSGraphInitRandomPhiloxStateOp *v11;
  MPSGraphInitRandomPhiloxStateOp *v12;
  void *v13;
  void *v14;

  v10 = name;
  v11 = [MPSGraphInitRandomPhiloxStateOp alloc];
  v12 = -[MPSGraphInitRandomPhiloxStateOp initWithGraph:inputTensors:controlDependencies:counterLow:counterHigh:key:name:](v11, "initWithGraph:inputTensors:controlDependencies:counterLow:counterHigh:key:name:", self, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], counterLow, counterHigh, key, v10);
  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (id)progressRandomStateTensor:(id)a3 forShape:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  _DWORD *v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = malloc_type_malloc(4 * objc_msgSend(v9, "count"), 0x100004052888210uLL);
  for (i = 0; i < objc_msgSend(v9, "count"); ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[i] = objc_msgSend(v13, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 4 * objc_msgSend(v9, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  free(v11);
  -[MPSGraph progressRandomStateTensor:forShapeTensor:name:](self, "progressRandomStateTensor:forShapeTensor:name:", v8, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)progressRandomStateTensor:(id)a3 forShapeTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphUpdateRandomStateOp *v11;
  void *v12;
  MPSGraphUpdateRandomStateOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphUpdateRandomStateOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name
{
  ++randomLayerSeed;
  -[MPSGraph randomTensorWithShape:descriptor:seed:name:](self, "randomTensorWithShape:descriptor:seed:name:", shape, descriptor);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphRandomOpDescriptor *v9;
  NSString *v10;
  void *v11;
  void *v12;

  v8 = shapeTensor;
  v9 = descriptor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v8, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ++randomLayerSeed;
  -[MPSGraph randomTensorWithShapeTensor:descriptor:seed:name:](self, "randomTensorWithShapeTensor:descriptor:seed:name:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name
{
  MPSShape *v10;
  MPSGraphRandomOpDescriptor *v11;
  NSString *v12;
  _DWORD *v13;
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = shape;
  v11 = descriptor;
  v12 = name;
  v13 = malloc_type_malloc(4 * -[MPSShape count](v10, "count"), 0x100004052888210uLL);
  for (i = 0; i < -[MPSShape count](v10, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[i] = objc_msgSend(v15, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, 4 * -[MPSShape count](v10, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSShape count](v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v16, v18, 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  free(v13);
  -[MPSGraph randomTensorWithShapeTensor:descriptor:seed:name:](self, "randomTensorWithShapeTensor:descriptor:seed:name:", v19, v11, seed, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphRandomOpDescriptor *v11;
  NSString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  MPSGraphRandomTruncatedNormalOp *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  MPSGraphRandomNormalOp *v21;
  MPSGraphRandomUniformOp *v22;
  float v23;
  float v24;
  void *v25;
  MPSGraphRandomUniformOp *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v10 = shapeTensor;
  v11 = descriptor;
  v12 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v10, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("/state"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("/randomUniform/state");
  }
  -[MPSGraph randomPhiloxStateTensorWithSeed:name:](self, "randomPhiloxStateTensorWithSeed:name:", seed, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  v16 = -[MPSGraphRandomOpDescriptor distribution](v11, "distribution");
  switch(v16)
  {
    case 0:
      if ((-[MPSGraphRandomOpDescriptor dataType](v11, "dataType") & 0x10000000) != 0)
      {
        -[MPSGraphRandomOpDescriptor min](v11, "min");
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v23);
        v20 = objc_claimAutoreleasedReturnValue();
        -[MPSGraphRandomOpDescriptor max](v11, "max");
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v24);
      }
      else
      {
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)-[MPSGraphRandomOpDescriptor minInteger](v11, "minInteger"));
        v20 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)-[MPSGraphRandomOpDescriptor maxInteger](v11, "maxInteger"));
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)v20;
      v26 = [MPSGraphRandomUniformOp alloc];
      v33[0] = v15;
      v33[1] = v13;
      v33[2] = v18;
      v33[3] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MPSGraphRandomUniformOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v26, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v27, MEMORY[0x1E0C9AA60], v11, v12);

      goto LABEL_17;
    case 1:
      v21 = [MPSGraphRandomNormalOp alloc];
      v31[0] = v15;
      v31[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MPSGraphRandomNormalOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v21, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v18, MEMORY[0x1E0C9AA60], v11, v12);
      goto LABEL_13;
    case 2:
      v17 = [MPSGraphRandomTruncatedNormalOp alloc];
      v32[0] = v15;
      v32[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MPSGraphRandomTruncatedNormalOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v17, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v18, MEMORY[0x1E0C9AA60], v11, v12);
LABEL_13:
      v22 = (MPSGraphRandomUniformOp *)v19;
LABEL_17:

      goto LABEL_18;
  }
  v22 = 0;
LABEL_18:
  -[MPSGraphOperation outputTensors](v22, "outputTensors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v29;
}

- (NSArray)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  MPSShape *v10;
  MPSGraphRandomOpDescriptor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  _DWORD *v14;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = shape;
  v11 = descriptor;
  v12 = state;
  v13 = name;
  v14 = malloc_type_malloc(4 * -[MPSShape count](v10, "count"), 0x100004052888210uLL);
  for (i = 0; i < -[MPSShape count](v10, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[i] = objc_msgSend(v16, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, 4 * -[MPSShape count](v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSShape count](v10, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v17, v19, 536870944);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  free(v14);
  -[MPSGraph randomTensorWithShapeTensor:descriptor:stateTensor:name:](self, "randomTensorWithShapeTensor:descriptor:stateTensor:name:", v20, v11, v12, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v21;
}

- (NSArray)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphRandomOpDescriptor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  uint64_t v14;
  MPSGraphRandomTruncatedNormalOp *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  MPSGraphRandomNormalOp *v19;
  MPSGraphRandomUniformOp *v20;
  float v21;
  float v22;
  void *v23;
  MPSGraphRandomUniformOp *v24;
  void *v25;
  MPSGraphUpdateRandomStateOp *v26;
  void *v27;
  MPSGraphUpdateRandomStateOp *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v10 = shapeTensor;
  v11 = descriptor;
  v12 = state;
  v13 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v10, 1, v13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MPSGraphRandomOpDescriptor distribution](v11, "distribution");
  switch(v14)
  {
    case 0:
      if ((-[MPSGraphRandomOpDescriptor dataType](v11, "dataType") & 0x10000000) != 0)
      {
        -[MPSGraphRandomOpDescriptor min](v11, "min");
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v21);
        v18 = objc_claimAutoreleasedReturnValue();
        -[MPSGraphRandomOpDescriptor max](v11, "max");
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v22);
      }
      else
      {
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)-[MPSGraphRandomOpDescriptor minInteger](v11, "minInteger"));
        v18 = objc_claimAutoreleasedReturnValue();
        -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)-[MPSGraphRandomOpDescriptor maxInteger](v11, "maxInteger"));
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)v18;
      v24 = [MPSGraphRandomUniformOp alloc];
      v40[0] = v12;
      v40[1] = v35;
      v40[2] = v18;
      v40[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[MPSGraphRandomUniformOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v24, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v25, MEMORY[0x1E0C9AA60], v11, v13);

      goto LABEL_12;
    case 1:
      v19 = [MPSGraphRandomNormalOp alloc];
      v38[0] = v12;
      v38[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MPSGraphRandomNormalOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v19, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v16, MEMORY[0x1E0C9AA60], v11, v13);
      goto LABEL_8;
    case 2:
      v15 = [MPSGraphRandomTruncatedNormalOp alloc];
      v39[0] = v12;
      v39[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MPSGraphRandomTruncatedNormalOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v15, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v16, MEMORY[0x1E0C9AA60], v11, v13);
LABEL_8:
      v20 = (MPSGraphRandomUniformOp *)v17;
LABEL_12:

      goto LABEL_13;
  }
  v20 = 0;
LABEL_13:
  v26 = [MPSGraphUpdateRandomStateOp alloc];
  v37[0] = v12;
  v37[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v26, "initWithGraph:inputTensors:controlDependencies:name:", self, v27, MEMORY[0x1E0C9AA60], v13);

  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  -[MPSGraphOperation outputTensors](v28, "outputTensors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v33;
}

- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape name:(NSString *)name
{
  ++randomLayerSeed;
  -[MPSGraph randomUniformTensorWithShape:seed:name:](self, "randomUniformTensorWithShape:seed:name:", shape);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  void *v9;

  v6 = shapeTensor;
  v7 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ++randomLayerSeed;
  -[MPSGraph randomUniformTensorWithShapeTensor:seed:name:](self, "randomUniformTensorWithShapeTensor:seed:name:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape seed:(NSUInteger)seed name:(NSString *)name
{
  MPSShape *v8;
  NSString *v9;
  _DWORD *v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = shape;
  v9 = name;
  v10 = malloc_type_malloc(4 * -[MPSShape count](v8, "count"), 0x100004052888210uLL);
  for (i = 0; i < -[MPSShape count](v8, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[i] = objc_msgSend(v12, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, 4 * -[MPSShape count](v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSShape count](v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  free(v10);
  -[MPSGraph randomUniformTensorWithShapeTensor:seed:name:](self, "randomUniformTensorWithShapeTensor:seed:name:", v16, seed, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor seed:(NSUInteger)seed name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  MPSGraphRandomUniformOp *v18;
  void *v19;
  MPSGraphRandomUniformOp *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v8 = shapeTensor;
  v9 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("/state"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("/randomUniform/state");
  }
  -[MPSGraph randomPhiloxStateTensorWithSeed:name:](self, "randomPhiloxStateTensorWithSeed:name:", seed, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)

  +[MPSGraphRandomOpDescriptor descriptorWithDistribution:dataType:](MPSGraphRandomOpDescriptor, "descriptorWithDistribution:dataType:", 0, 268435488);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "dataType") & 0x10000000) != 0)
  {
    objc_msgSend(v13, "min");
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "max");
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v16);
  }
  else
  {
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)objc_msgSend(v13, "minInteger"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)objc_msgSend(v13, "maxInteger"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [MPSGraphRandomUniformOp alloc];
  v24[0] = v12;
  v24[1] = v10;
  v24[2] = v14;
  v24[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MPSGraphRandomUniformOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v18, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v19, MEMORY[0x1E0C9AA60], v13, v9);

  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (NSArray)randomUniformTensorWithShape:(MPSShape *)shape stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  MPSShape *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  _DWORD *v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = shape;
  v9 = state;
  v10 = name;
  v11 = malloc_type_malloc(4 * -[MPSShape count](v8, "count"), 0x100004052888210uLL);
  for (i = 0; i < -[MPSShape count](v8, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[i] = objc_msgSend(v13, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 4 * -[MPSShape count](v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSShape count](v8, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  free(v11);
  -[MPSGraph randomUniformTensorWithShapeTensor:stateTensor:name:](self, "randomUniformTensorWithShapeTensor:stateTensor:name:", v17, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
}

- (NSArray)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  MPSGraphTensor *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  MPSGraphRandomUniformOp *v13;
  void *v14;
  MPSGraphRandomUniformOp *v15;
  MPSGraphUpdateRandomStateOp *v16;
  void *v17;
  MPSGraphUpdateRandomStateOp *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  MPSGraphTensor *v27;
  NSString *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v8 = shapeTensor;
  v27 = state;
  v28 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v8, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPSGraphRandomOpDescriptor descriptorWithDistribution:dataType:](MPSGraphRandomOpDescriptor, "descriptorWithDistribution:dataType:", 0, 268435488);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "dataType") & 0x10000000) != 0)
  {
    objc_msgSend(v9, "min");
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "max");
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, v12);
  }
  else
  {
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)objc_msgSend(v9, "minInteger"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)objc_msgSend(v9, "maxInteger"));
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [MPSGraphRandomUniformOp alloc];
  v31[0] = v27;
  v31[1] = v26;
  v31[2] = v10;
  v31[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphRandomUniformOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v13, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v14, MEMORY[0x1E0C9AA60], v9, v28);

  v16 = [MPSGraphUpdateRandomStateOp alloc];
  v30[0] = v27;
  v30[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v16, "initWithGraph:inputTensors:controlDependencies:name:", self, v17, MEMORY[0x1E0C9AA60], v28);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v23;
}

- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rate:(double)rate name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v8 = tensor;
  v9 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B638, 268435488, rate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPSGraphTensor dataType](v8, "dataType");
  if (v9)
  {
    -[NSString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("/cast"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("dropout/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)

  -[MPSGraph dropoutTensor:rateTensor:name:](self, "dropoutTensor:rateTensor:name:", v8, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rateTensor:(MPSGraphTensor *)rate name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  NSString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v30;
  void *v31;

  v8 = tensor;
  v9 = rate;
  v10 = name;
  v11 = v10;
  if (v10)
  {
    -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("/shape"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("dropout/shape");
  }
  -[MPSGraph shapeOfTensor:name:](self, "shapeOfTensor:name:", v8, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/randomUniform"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("dropout/randomUniform");
  }
  -[MPSGraph randomUniformTensorWithShapeTensor:name:](self, "randomUniformTensorWithShapeTensor:name:", v31, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v11)

  v15 = -[MPSGraphTensor dataType](v8, "dataType", v14);
  if (v11)
  {
    -[NSString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("/randomUniform/cast"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("dropout/randomUniform/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/greaterEqual"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("dropout/greaterEqual");
  }
  -[MPSGraph greaterThanOrEqualToWithPrimaryTensor:secondaryTensor:name:](self, "greaterThanOrEqualToWithPrimaryTensor:secondaryTensor:name:", v17, v9, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  v20 = -[MPSGraphTensor dataType](v8, "dataType");
  if (v11)
  {
    -[NSString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("/randomUniform/cast"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("dropout/randomUniform/cast");
  }
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/reciprocal"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("dropout/reciprocal");
  }
  -[MPSGraph reciprocalWithTensor:name:](self, "reciprocalWithTensor:name:", v9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/multiplication"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("dropout/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    -[NSString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("/multiplication_1"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = CFSTR("dropout/multiplication_1");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v8, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  -[MPSGraph scatterNDWithUpdatesTensor:indicesTensor:shape:batchDimensions:mode:name:](self, "scatterNDWithUpdatesTensor:indicesTensor:shape:batchDimensions:mode:name:", updatesTensor, indicesTensor, shape, batchDimensions, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSShape *v16;
  NSString *v17;
  double v18;
  void *v19;
  void *v20;

  v14 = updatesTensor;
  v15 = indicesTensor;
  v16 = shape;
  v17 = name;
  v18 = 0.0;
  if ((unint64_t)(mode - 2) <= 3)
    v18 = dbl_1812913C8[mode - 2];
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", v16, -[MPSGraphTensor dataType](v14, "dataType"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph scatterNDWithDataTensor:updatesTensor:indicesTensor:batchDimensions:mode:name:](self, "scatterNDWithDataTensor:updatesTensor:indicesTensor:batchDimensions:mode:name:", v19, v14, v15, batchDimensions, mode, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)scatterNDWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  NSString *v17;
  MPSGraphScatterNDOp *v18;
  void *v19;
  MPSGraphScatterNDOp *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v14 = dataTensor;
  v15 = updatesTensor;
  v16 = indicesTensor;
  v17 = name;
  v18 = [MPSGraphScatterNDOp alloc];
  v24[0] = v14;
  v24[1] = v15;
  v24[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MPSGraphScatterNDOp initWithGraph:inputTensors:controlDependencies:batchDimensions:mode:name:](v18, "initWithGraph:inputTensors:controlDependencies:batchDimensions:mode:name:", self, v19, MEMORY[0x1E0C9AA60], batchDimensions, mode, v17);

  -[MPSGraphOperation outputTensors](v20, "outputTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (id)scatterWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  -[MPSGraph scatterWithUpdatesTensor:indicesTensor:shape:axis:mode:name:](self, "scatterWithUpdatesTensor:indicesTensor:shape:axis:mode:name:", a3, a4, a5, a6, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scatterWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  -[MPSGraph scatterWithDataTensor:updatesTensor:indicesTensor:axis:mode:name:](self, "scatterWithDataTensor:updatesTensor:indicesTensor:axis:mode:name:", a3, a4, a5, a6, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)scatterWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSShape *v16;
  NSString *v17;
  double v18;
  void *v19;
  void *v20;

  v14 = updatesTensor;
  v15 = indicesTensor;
  v16 = shape;
  v17 = name;
  v18 = 0.0;
  if ((unint64_t)(mode - 2) <= 3)
    v18 = dbl_1812913C8[mode - 2];
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", v16, -[MPSGraphTensor dataType](v14, "dataType"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph scatterWithDataTensor:updatesTensor:indicesTensor:axis:mode:name:](self, "scatterWithDataTensor:updatesTensor:indicesTensor:axis:mode:name:", v19, v14, v15, axis, mode, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)scatterWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  NSString *v17;
  void *v18;
  MPSGraphScatterOp *v19;
  void *v20;
  MPSGraphScatterOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v14 = dataTensor;
  v15 = updatesTensor;
  v16 = indicesTensor;
  v17 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [MPSGraphScatterOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  v25[2] = v16;
  v25[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphScatterOp initWithGraph:inputTensors:controlDependencies:axis:mode:name:](v19, "initWithGraph:inputTensors:controlDependencies:axis:mode:name:", self, v20, MEMORY[0x1E0C9AA60], axis, mode, v17);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSShape *v16;
  NSString *v17;
  void *v18;
  void *v19;

  v14 = updatesTensor;
  v15 = indicesTensor;
  v16 = shape;
  v17 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph scatterAlongAxisTensor:withUpdatesTensor:indicesTensor:shape:mode:name:](self, "scatterAlongAxisTensor:withUpdatesTensor:indicesTensor:shape:mode:name:", v18, v14, v15, v16, mode, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  NSString *v17;
  void *v18;
  void *v19;

  v14 = dataTensor;
  v15 = updatesTensor;
  v16 = indicesTensor;
  v17 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph scatterAlongAxisTensor:withDataTensor:updatesTensor:indicesTensor:mode:name:](self, "scatterAlongAxisTensor:withDataTensor:updatesTensor:indicesTensor:mode:name:", v18, v14, v15, v16, mode, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSShape *v17;
  NSString *v18;
  double v19;
  void *v20;
  void *v21;

  v14 = axisTensor;
  v15 = updatesTensor;
  v16 = indicesTensor;
  v17 = shape;
  v18 = name;
  v19 = 0.0;
  if ((unint64_t)(mode - 2) <= 3)
    v19 = dbl_1812913C8[mode - 2];
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", v17, -[MPSGraphTensor dataType](v15, "dataType"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph scatterAlongAxisTensor:withDataTensor:updatesTensor:indicesTensor:mode:name:](self, "scatterAlongAxisTensor:withDataTensor:updatesTensor:indicesTensor:mode:name:", v14, v20, v15, v16, mode, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  MPSGraphScatterAlongAxisOp *v20;
  void *v21;
  MPSGraphScatterAlongAxisOp *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v14 = axisTensor;
  v15 = dataTensor;
  v16 = updatesTensor;
  v17 = indicesTensor;
  v18 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v14, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [MPSGraphScatterAlongAxisOp alloc];
  v26[0] = v15;
  v26[1] = v16;
  v26[2] = v17;
  v26[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPSGraphScatterAlongAxisOp initWithGraph:inputTensors:controlDependencies:mode:name:](v20, "initWithGraph:inputTensors:controlDependencies:mode:name:", self, v21, MEMORY[0x1E0C9AA60], mode, v18);

  -[MPSGraphOperation outputTensors](v22, "outputTensors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v24;
}

- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  -[MPSGraph scatterAlongAxis:withUpdatesTensor:indicesTensor:shape:mode:name:](self, "scatterAlongAxis:withUpdatesTensor:indicesTensor:shape:mode:name:", a6, a3, a4, a5, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  -[MPSGraph scatterAlongAxis:withUpdatesTensor:indicesTensor:shape:mode:name:](self, "scatterAlongAxis:withUpdatesTensor:indicesTensor:shape:mode:name:", a6, a3, a4, a5, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  -[MPSGraph scatterAlongAxis:withDataTensor:updatesTensor:indicesTensor:mode:name:](self, "scatterAlongAxis:withDataTensor:updatesTensor:indicesTensor:mode:name:", a6, a3, a4, a5, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  -[MPSGraph scatterAlongAxis:withDataTensor:updatesTensor:indicesTensor:mode:name:](self, "scatterAlongAxis:withDataTensor:updatesTensor:indicesTensor:mode:name:", a6, a3, a4, a5, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)nonZeroIndicesOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphNonZeroOp *v8;
  void *v9;
  MPSGraphNonZeroOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v8 = [MPSGraphNonZeroOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)gatherNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphGatherNDOp *v15;
  void *v16;
  MPSGraphGatherNDOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = updatesTensor;
  v11 = indicesTensor;
  v12 = name;
  v13 = v11;
  v14 = v10;
  v15 = [MPSGraphGatherNDOp alloc];
  v21[0] = v14;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphGatherNDOp initWithGraph:inputTensors:controlDependencies:batchDimensions:name:](v15, "initWithGraph:inputTensors:controlDependencies:batchDimensions:name:", self, v16, MEMORY[0x1E0C9AA60], batchDimensions, v12);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)gatherWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSUInteger)axis batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  NSString *v14;
  void *v15;
  MPSGraphGatherOp *v16;
  void *v17;
  MPSGraphGatherOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = updatesTensor;
  v13 = indicesTensor;
  v14 = name;
  if (axis < batchDimensions)
    __assert_rtn("-[MPSGraph(MPSGraphGatherOps) gatherWithUpdatesTensor:indicesTensor:axis:batchDimensions:name:]", "MPSGraphGatherOps.mm", 203, "0 && \"axis must be greater than or equal to the number of batch dimensions\");
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)(uint64_t)axis);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [MPSGraphGatherOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphGatherOp initWithGraph:inputTensors:controlDependencies:axis:batchDimensions:name:](v16, "initWithGraph:inputTensors:controlDependencies:axis:batchDimensions:name:", self, v17, MEMORY[0x1E0C9AA60], axis, batchDimensions, v14);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)gatherAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  void *v14;

  v10 = updatesTensor;
  v11 = indicesTensor;
  v12 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph gatherAlongAxisTensor:withUpdatesTensor:indicesTensor:name:](self, "gatherAlongAxisTensor:withUpdatesTensor:indicesTensor:name:", v13, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)gatherAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  MPSGraphGatherAlongAxisOp *v15;
  void *v16;
  MPSGraphGatherAlongAxisOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v10 = axisTensor;
  v11 = updatesTensor;
  v12 = indicesTensor;
  v13 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v10, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [MPSGraphGatherAlongAxisOp alloc];
  v21[0] = v11;
  v21[1] = v12;
  v21[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v15, "initWithGraph:inputTensors:controlDependencies:name:", self, v16, MEMORY[0x1E0C9AA60], v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (id)gatherAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  -[MPSGraph gatherAlongAxis:withUpdatesTensor:indicesTensor:name:](self, "gatherAlongAxis:withUpdatesTensor:indicesTensor:name:", a5, a3, a4, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)quantizedGatherWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 scaleTensor:(id)a5 zeroPointTensor:(id)a6 minTensor:(id)a7 dequantDataType:(unsigned int)a8 axis:(unint64_t)a9 batchDimensions:(unint64_t)a10 name:(id)a11
{
  uint64_t v11;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  MPSGraphQuantizedGatherOp *v24;
  MPSGraphQuantizedGatherOp *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;

  v11 = *(_QWORD *)&a8;
  v30 = a3;
  v29 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  if (a9 < a10)
    __assert_rtn("-[MPSGraph(MPSGraphQuantizedGatherOpsPrivate) quantizedGatherWithUpdatesTensor:indicesTensor:scaleTensor:zeroPointTensor:minTensor:dequantDataType:axis:batchDimensions:name:]", "MPSGraphGatherOps.mm", 407, "0 && \"axis must be greater than or equal to the number of batch dimensions\");
  v21 = v11;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v30);
  objc_msgSend(v23, "addObject:", v29);
  objc_msgSend(v23, "addObject:", v22);
  objc_msgSend(v23, "addObject:", v17);
  if (v18)
    objc_msgSend(v23, "addObject:", v18);
  if (v19)
    objc_msgSend(v23, "addObject:", v19);
  v24 = [MPSGraphQuantizedGatherOp alloc];
  v25 = -[MPSGraphQuantizedGatherOp initWithGraph:inputTensors:controlDependencies:hasZeroPoint:hasMin:dequantDataType:axis:batchDimensions:name:](v24, "initWithGraph:inputTensors:controlDependencies:hasZeroPoint:hasMin:dequantDataType:axis:batchDimensions:name:", self, v23, MEMORY[0x1E0C9AA60], v18 != 0, v19 != 0, v21, a9, a10, v20);
  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (MPSGraphTensor)softMaxCrossEntropyWithSourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name
{
  MPSGraphTensor *v11;
  NSString *v12;
  NSString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v36;
  void *v37;
  void *v38;
  MPSGraphTensor *v39;
  MPSGraphTensor *v40;
  NSInteger v41;

  v11 = sourceTensor;
  v40 = labelsTensor;
  v41 = axis;
  v12 = name;
  v13 = v12;
  v39 = v11;
  if (v12)
  {
    -[NSString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("/reductionMaximum"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("softMaxCrossEntropy/reductionMaximum");
  }
  -[MPSGraph reductionMaximumWithTensor:axis:name:](self, "reductionMaximumWithTensor:axis:name:", v11, axis, v14, reductionType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)

  v38 = v15;
  objc_msgSend(v15, "operation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStopGradient:", 1);

  if (v13)
  {
    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/subtraction"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("softMaxCrossEntropy/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v11, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/exponent"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("softMaxCrossEntropy/exponent");
  }
  -[MPSGraph exponentWithTensor:name:](self, "exponentWithTensor:name:", v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v20;
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/reductionSum"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("softMaxCrossEntropy/reductionSum");
  }
  -[MPSGraph reductionSumWithTensor:axis:name:](self, "reductionSumWithTensor:axis:name:", v20, axis, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/logarithm"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("softMaxCrossEntropy/logarithm");
  }
  -[MPSGraph logarithmWithTensor:name:](self, "logarithmWithTensor:name:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/subtraction2"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("softMaxCrossEntropy/subtraction2");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v18, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/logarithm"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = CFSTR("softMaxCrossEntropy/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v26, v40, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/reductionSum_1"));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = CFSTR("softMaxCrossEntropy/reductionSum_1");
  }
  -[MPSGraph reductionSumWithTensor:axis:name:](self, "reductionSumWithTensor:axis:name:", v28, axis, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/negative"));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("softMaxCrossEntropy/negative");
  }
  -[MPSGraph negativeWithTensor:name:](self, "negativeWithTensor:name:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)

  -[MPSGraph lossReductionWithTensor:reductionType:axis:name:](self, "lossReductionWithTensor:reductionType:axis:name:", v32, v36, &v41, v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v33;
}

- (id)lossReductionWithTensor:(id)a3 reductionType:(unint64_t)a4 axis:(int64_t *)a5 name:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v26;

  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (a5)
  {
    v14 = (v13 & (*a5 >> 63)) + *a5;
    if (a4 != 2)
    {
LABEL_3:
      if (a4 == 1)
      {
        v15 = v13 - 1;
        if (v13 >= 1)
        {
          if (v11)
          {
            do
            {
              if (v14 != v15)
              {
                objc_msgSend(v11, "stringByAppendingString:", CFSTR("/lossReduction"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[MPSGraph reductionSumWithTensor:axis:name:](self, "reductionSumWithTensor:axis:name:", v10, v15, v17);
                v18 = objc_claimAutoreleasedReturnValue();

                v10 = (id)v18;
              }
              v16 = v15-- <= 0;
            }
            while (!v16);
          }
          else
          {
            do
            {
              if (v14 != v15)
              {
                -[MPSGraph reductionSumWithTensor:axis:name:](self, "reductionSumWithTensor:axis:name:", v10, v15, CFSTR("lossReduction"));
                v26 = objc_claimAutoreleasedReturnValue();

                v10 = (id)v26;
              }
              v16 = v15-- <= 0;
            }
            while (!v16);
          }
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    v14 = v13;
    if (a4 != 2)
      goto LABEL_3;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v13 >= 1)
  {
    v20 = 0;
    v21 = 1;
    do
    {
      if (v14 != v20)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v21 - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v22);

      }
      v20 = v21++;
    }
    while (v13 > v20);
  }
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/lossReduction"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("lossReduction");
  }
  -[MPSGraph meanOfTensor:axes:name:](self, "meanOfTensor:axes:name:", v10, v19, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  if (v11)
  v10 = (id)v24;
LABEL_22:

  return v10;
}

- (MPSGraphTensor)softMaxCrossEntropyGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name
{
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  NSString *v16;
  NSString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;

  v13 = gradientTensor;
  v14 = sourceTensor;
  v15 = labelsTensor;
  v16 = name;
  v17 = v16;
  if (v16)
  {
    -[NSString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("/softMax"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("softMaxCrossEntropyGradient/softMax");
  }
  -[MPSGraph softMaxWithTensor:axis:name:](self, "softMaxWithTensor:axis:name:", v14, axis, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

    -[NSString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/subtraction"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("softMaxCrossEntropyGradient/subtraction");
  }
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v19, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

    -[NSString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("/multiplication"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("softMaxCrossEntropyGradient/multiplication");
  }
  -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v13, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)

  return (MPSGraphTensor *)v23;
}

- (NSDictionary)gradientForPrimaryTensor:(MPSGraphTensor *)primaryTensor withTensors:(NSArray *)tensors name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  MPSGraph *v11;
  MPSGraphTensor *v12;
  NSArray *v13;
  __CFString *v14;
  MPSGraphTensor *v15;
  NSArray *v16;
  MPSGraph *v17;
  __CFString *v18;
  MPSGraphBlock *WeakRetained;
  unint64_t v20;
  char *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  MPSGraphBlock *v25;
  void *v26;
  void *v27;
  MPSGraphBlock *v28;
  unint64_t i;
  MPSGraphTensor *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  __CFString *v38;
  MPSGraphTensor *v39;
  NSArray *v40;
  MPSGraph *v41;
  __CFString *v42;
  _OWORD v43[2];
  int v44;
  char v45;
  MPSGraphBlock *v46;
  _QWORD *v47[2];

  v47[1] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = tensors;
  v10 = name;
  v11 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v12;
  v39 = v15;
  v16 = v13;
  v40 = v16;
  v17 = v11;
  v41 = v17;
  memset(v43, 0, sizeof(v43));
  v44 = 1065353216;
  v45 = 0;
  v18 = CFSTR("gradient");
  v38 = v14;
  if (v14)
    v18 = v14;
  v42 = v18;
  WeakRetained = (MPSGraphBlock *)objc_loadWeakRetained((id *)&v15->_parentBlock);
  Autodiff::recurseForUses((Autodiff *)&v39, WeakRetained, v15);
  v46 = WeakRetained;
  v47[0] = &v46;
  v20 = 0;
  v21 = std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::__emplace_unique_key_args<mlir::Operation *,std::piecewise_construct_t const&,std::tuple<mlir::Operation * const&>,std::tuple<>>((uint64_t)v43, (uint64_t *)&v46, (uint64_t)&std::piecewise_construct, v47)+ 24;
  while (v20 < -[NSArray count](v40, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](v40, "objectAtIndexedSubscript:", v20);
    v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v47[0] = v22;
    v23 = std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::find<mlir::Operation *>(v21, (uint64_t *)v47);

    if (!v23 || !*((_BYTE *)v23 + 48))
    {
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
    }
    ++v20;
  }
  v47[0] = &v39->super.super.isa;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  Autodiff::getFilledLike((Autodiff *)&v39, v39, 1.0, CFSTR("initialGrad"));
  v25 = (MPSGraphBlock *)objc_claimAutoreleasedReturnValue();
  v46 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  Autodiff::computeGradsForBlock((Autodiff *)&v39, WeakRetained, v24, v26);
  if (v45)
    controlFlowPostAutodiff((Autodiff *)&v39);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (MPSGraphBlock *)objc_loadWeakRetained((id *)&v15->_parentBlock);
  for (i = 0; i < -[NSArray count](v16, "count"); ++i)
  {
    -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", i);
    v30 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
    Autodiff::getGradientOf((Autodiff *)&v39, v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31 && MTLReportFailureTypeEnabled())
    {
      -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "operation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      MTLReportFailure();

    }
    -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", i, v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v31, v32);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  Autodiff::~Autodiff((Autodiff *)&v39);
  return (NSDictionary *)v34;
}

- (id)gradientForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph gradientForPrimaryTensor:withTensors:name:](self, "gradientForPrimaryTensor:withTensors:name:", v8, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "count");
  if (objc_msgSend(v12, "count") != 1 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)callSymbolName:(id)a3 inputTensors:(id)a4 outputTypes:(id)a5 name:(id)a6
{
  -[MPSGraph callWithInputTensors:outputTypes:symbolName:inliningOption:name:](self, "callWithInputTensors:outputTypes:symbolName:inliningOption:name:", a4, a5, a3, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 name:(id)a6
{
  -[MPSGraph callWithInputTensors:outputTypes:symbolName:inliningOption:name:](self, "callWithInputTensors:outputTypes:symbolName:inliningOption:name:", a3, a4, a5, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 inliningOption:(unint64_t)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphCallOp *v16;
  MPSGraphCallOp *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = [MPSGraphCallOp alloc];
  v17 = -[MPSGraphCallOp initWithGraph:inputTensors:controlDependencies:outputTypes:symbolName:inliningOption:name:](v16, "initWithGraph:inputTensors:controlDependencies:outputTypes:symbolName:inliningOption:name:", self, v12, MEMORY[0x1E0C9AA60], v13, v14, a6, v15);
  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLower:(NSInteger)numLower numUpper:(NSInteger)numUpper name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = inputTensor;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)numLower);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)numUpper);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph bandPartWithTensor:numLowerTensor:numUpperTensor:name:](self, "bandPartWithTensor:numLowerTensor:numUpperTensor:name:", v10, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLowerTensor:(MPSGraphTensor *)numLowerTensor numUpperTensor:(MPSGraphTensor *)numUpperTensor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphTensor *v12;
  NSString *v13;
  MPSGraphBandPartOp *v14;
  void *v15;
  id *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = inputTensor;
  v11 = numLowerTensor;
  v12 = numUpperTensor;
  v13 = name;
  v14 = [MPSGraphBandPartOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v14, "initWithGraph:inputTensors:controlDependencies:name:", self, v15, MEMORY[0x1E0C9AA60], v13);

  objc_msgSend(v16[3], "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShape:forwardConvolutionDescriptor:name:](self, "convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShape:forwardConvolutionDescriptor:name:", source, weights, outputShape, descriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  -[MPSGraph convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", source, weights, outputShape, descriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  -[MPSGraph convolution2DWithSourceTensor:weightsTensor:descriptor:name:](self, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", incomingGradient, weights, forwardConvolutionDescriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  -[MPSGraph convolution2DWithSourceTensor:weightsTensor:descriptor:name:](self, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", incomingGradient, weights, forwardConvolutionDescriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  -[MPSGraph convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShape:forwardConvolutionDescriptor:name:](self, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShape:forwardConvolutionDescriptor:name:", source, incomingGradientTensor, outputShape, forwardConvolutionDescriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  -[MPSGraph convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:](self, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", source, incomingGradientTensor, outputShape, forwardConvolutionDescriptor, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)cropResizeWithImagesTensor:(id)a3 boxesTensor:(id)a4 boxIndicesTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  char v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  MPSGraphCropResizeOp *v22;
  void *v23;
  MPSGraphCropResizeOp *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v33 = a4;
  v12 = a5;
  v31 = a6;
  v13 = a7;
  v14 = v12;
  LODWORD(a7) = objc_msgSend(v14, "dataType");
  if ((_DWORD)a7 == objc_msgSend(v33, "dataType"))
  {
    v32 = v14;
    if (!v13)
    {
      v15 = CFSTR("cropResize/expand");
      v16 = 1;
      v32 = v14;
      -[MPSGraph expandTensor:dimension:name:](self, "expandTensor:dimension:name:", v14, 1, CFSTR("cropResize/expand"));
      goto LABEL_12;
    }
  }
  else
  {
    v17 = objc_msgSend(v33, "dataType");
    if (v13)
    {
      objc_msgSend(v13, "stringByAppendingString:", CFSTR("/cast"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = CFSTR("cropResize/cast");
    }
    -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v14, v17, v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v15 = CFSTR("cropResize/expand");
      v16 = 1;
      goto LABEL_11;
    }

  }
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("/expand"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
LABEL_11:
  -[MPSGraph expandTensor:dimension:name:](self, "expandTensor:dimension:name:", v32, 1, v15);
LABEL_12:
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) != 0)
  {
    v20 = CFSTR("cropResize/concat1");
  }
  else
  {

    objc_msgSend(v13, "stringByAppendingString:", CFSTR("/concat1"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[MPSGraph concatTensor:withTensor:dimension:name:](self, "concatTensor:withTensor:dimension:name:", v19, v33, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) == 0)

  v22 = [MPSGraphCropResizeOp alloc];
  v34[0] = v30;
  v34[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphCropResizeOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v22, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v23, MEMORY[0x1E0C9AA60], v31, v13);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) != 0)
  {
    v27 = CFSTR("cropResize/reshape0");
  }
  else
  {
    objc_msgSend(v13, "stringByAppendingString:", CFSTR("/reshape0"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[MPSGraph squeezeTensor:dimension:name:](self, "squeezeTensor:dimension:name:", v26, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) == 0)

  return v28;
}

- (MPSGraphTensor)maxPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  MPSGraphMaxWithIndicesPooling2DOp *v12;
  void *v13;
  MPSGraphMaxWithIndicesPooling2DOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = name;
  v10 = (void *)-[MPSGraphPooling2DOpDescriptor copy](descriptor, "copy");
  if (objc_msgSend(v10, "dataLayout"))
    v11 = 3;
  else
    v11 = 2;
  objc_msgSend(v10, "setReturnIndicesMode:", v11);
  v12 = [MPSGraphMaxWithIndicesPooling2DOp alloc];
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphPooling2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v12, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v13, MEMORY[0x1E0C9AA60], v10, v9);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (NSArray)maxPooling2DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphPooling2DOpDescriptor *v9;
  NSString *v10;
  MPSGraphMaxWithIndicesPooling2DOp *v11;
  void *v12;
  MPSGraphMaxWithIndicesPooling2DOp *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphMaxWithIndicesPooling2DOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphPooling2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (MPSGraphTensor)avgPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphPooling2DOpDescriptor *v9;
  NSString *v10;
  MPSGraphAvgPooling2DOp *v11;
  void *v12;
  MPSGraphAvgPooling2DOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphAvgPooling2DOp alloc];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphPooling2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphPooling2DOpDescriptor *v12;
  NSString *v13;
  MPSGraphMaxPooling2DGradientOp *v14;
  void *v15;
  MPSGraphMaxPooling2DGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = gradient;
  v11 = source;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphMaxPooling2DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphMaxPooling2DGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:", self, v15, MEMORY[0x1E0C9AA60], v12, 0, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphPooling2DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = indices;
  v14 = outputShape;
  v15 = descriptor;
  v16 = name;
  v17 = -[MPSShape count](v14, "count", 0x100000001, 0x100000001);
  v18 = 4;
  if (v17 < 4)
    v18 = v17;
  if (v18)
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v19, "intValue");

    v20 = -[MPSShape count](v14, "count", v33);
    v21 = 4;
    if (v20 < 4)
      v21 = v20;
    if (v21 >= 2)
    {
      -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v33) = objc_msgSend(v22, "intValue");

      v23 = -[MPSShape count](v14, "count");
      v24 = 4;
      if (v23 < 4)
        v24 = v23;
      if (v24 >= 3)
      {
        -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v25, "intValue");

        v26 = -[MPSShape count](v14, "count");
        v27 = 4;
        if (v26 < 4)
          v27 = v26;
        if (v27 >= 4)
        {
          -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v28, "intValue");

          -[MPSShape count](v14, "count");
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v33, 16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v29, &unk_1E0E9B6C8, 536870944);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph maxPooling2DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:](self, "maxPooling2DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:", v12, v13, v30, v15, v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  MPSGraphPooling2DOpDescriptor *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  MPSGraphPooling2DOpDescriptor *v19;
  BOOL v20;
  uint64_t v21;
  BOOL v22;
  MPSGraphMaxPooling2DGradientOp *v23;
  void *v24;
  MPSGraphMaxPooling2DGradientOp *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = indices;
  v14 = outputShape;
  v15 = descriptor;
  v16 = name;
  v17 = -[MPSGraphPooling2DOpDescriptor dataLayout](v15, "dataLayout");
  v18 = -[MPSGraphPooling2DOpDescriptor returnIndicesMode](v15, "returnIndicesMode");
  v19 = v15;
  if (-[MPSGraphPooling2DOpDescriptor dilationRateInX](v19, "dilationRateInX") == 1)
  {
    v20 = -[MPSGraphPooling2DOpDescriptor dilationRateInY](v19, "dilationRateInY") == 1;
    if (!v17)
    {
LABEL_3:
      v21 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    v20 = 0;
    if (!v17)
      goto LABEL_3;
  }
  if (v17 != 1)
  {

LABEL_13:
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    goto LABEL_11;
  }
  v21 = 3;
LABEL_7:
  v22 = v18 == v21 && v20;

  if (!v22)
    goto LABEL_13;
LABEL_11:
  v23 = [MPSGraphMaxPooling2DGradientOp alloc];
  v29[0] = v12;
  v29[1] = v13;
  v29[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MPSGraphMaxPooling2DGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:](v23, "initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:", self, v24, MEMORY[0x1E0C9AA60], v19, 1, v16);

  -[MPSGraphOperation outputTensors](v25, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)avgPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphPooling2DOpDescriptor *v12;
  NSString *v13;
  MPSGraphAvgPooling2DGradientOp *v14;
  void *v15;
  MPSGraphAvgPooling2DGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = gradient;
  v11 = source;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphAvgPooling2DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphPooling2DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)maxPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MPSGraphMaxWithIndicesPool4DOp *v17;
  void *v18;
  MPSGraphMaxWithIndicesPool4DOp *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  MPSGraphTensor *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25 = source;
  v8 = name;
  v9 = (void *)-[MPSGraphPooling4DOpDescriptor copy](descriptor, "copy");
  objc_msgSend(v9, "kernelSizes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "intValue") == 1)
  {
    objc_msgSend(v9, "kernelSizes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "intValue") == 1)
    {
      objc_msgSend(v9, "strides");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "intValue") == 1)
      {
        objc_msgSend(v9, "strides");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "intValue") == 1)
          v16 = 2;
        else
          v16 = 3;

      }
      else
      {
        v16 = 3;
      }

    }
    else
    {
      v16 = 3;
    }

  }
  else
  {
    v16 = 3;
  }

  objc_msgSend(v9, "setReturnIndicesMode:", v16);
  v17 = [MPSGraphMaxWithIndicesPool4DOp alloc];
  v26[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v17, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v18, MEMORY[0x1E0C9AA60], v9, v8);

  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v21;
}

- (NSArray)maxPooling4DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphPooling4DOpDescriptor *v9;
  NSString *v10;
  MPSGraphMaxWithIndicesPool4DOp *v11;
  void *v12;
  MPSGraphMaxWithIndicesPool4DOp *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphMaxWithIndicesPool4DOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v12;
  MPSGraphTensor *v13;
  MPSShape *v14;
  MPSGraphPooling4DOpDescriptor *v15;
  NSString *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = gradient;
  v13 = indices;
  v14 = outputShape;
  v15 = descriptor;
  v16 = name;
  v17 = -[MPSShape count](v14, "count", 0x100000001, 0x100000001);
  v18 = 4;
  if (v17 < 4)
    v18 = v17;
  if (v18)
  {
    -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v19, "intValue");

    v20 = -[MPSShape count](v14, "count", v33);
    v21 = 4;
    if (v20 < 4)
      v21 = v20;
    if (v21 >= 2)
    {
      -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v33) = objc_msgSend(v22, "intValue");

      v23 = -[MPSShape count](v14, "count");
      v24 = 4;
      if (v23 < 4)
        v24 = v23;
      if (v24 >= 3)
      {
        -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v25, "intValue");

        v26 = -[MPSShape count](v14, "count");
        v27 = 4;
        if (v26 < 4)
          v27 = v26;
        if (v27 >= 4)
        {
          -[MPSShape objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v28, "intValue");

          -[MPSShape count](v14, "count");
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v33, 16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v29, &unk_1E0E9B6E0, 536870944);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph maxPooling4DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:](self, "maxPooling4DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:", v12, v13, v30, v15, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphPooling4DOpDescriptor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  MPSGraphMaxPool4DGradientOp *v29;
  void *v30;
  MPSGraphMaxPool4DGradientOp *v31;
  void *v32;
  void *v33;
  void *v35;
  MPSGraphTensor *v37;
  MPSGraphTensor *v38;
  MPSGraphTensor *v39;
  NSString *v40;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v38 = gradient;
  v37 = indices;
  v39 = outputShape;
  v11 = descriptor;
  v40 = name;
  -[MPSGraphPooling4DOpDescriptor kernelSizes](v11, "kernelSizes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "intValue") == 1)
  {
    -[MPSGraphPooling4DOpDescriptor kernelSizes](v11, "kernelSizes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "intValue") == 1)
    {
      -[MPSGraphPooling4DOpDescriptor strides](v11, "strides");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "intValue") == 1)
      {
        -[MPSGraphPooling4DOpDescriptor strides](v11, "strides");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue") == 1;

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  -[MPSGraphPooling4DOpDescriptor kernelSizes](v11, "kernelSizes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "intValue") == 1)
  {
    -[MPSGraphPooling4DOpDescriptor kernelSizes](v11, "kernelSizes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "intValue") == 1)
    {
      -[MPSGraphPooling4DOpDescriptor strides](v11, "strides");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "intValue") == 1)
      {
        -[MPSGraphPooling4DOpDescriptor strides](v11, "strides");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "intValue") == 1;

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  if (!v20 && !v28 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if ((isValidIndicesInput4D((MPSGraphTensorNamedDataLayout)!v20, -[MPSGraphPooling4DOpDescriptor returnIndicesMode](v11, "returnIndicesMode"), v11) & 1) == 0&& MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  v29 = [MPSGraphMaxPool4DGradientOp alloc];
  v41[0] = v38;
  v41[1] = v37;
  v41[2] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MPSGraphMaxPool4DGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:](v29, "initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:", self, v30, MEMORY[0x1E0C9AA60], v11, 1, v40);

  -[MPSGraphOperation outputTensors](v31, "outputTensors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v33;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphPooling4DOpDescriptor *v12;
  NSString *v13;
  MPSGraphMaxPool4DGradientOp *v14;
  void *v15;
  MPSGraphMaxPool4DGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = gradient;
  v11 = source;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphMaxPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphMaxPool4DGradientOp initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:gradientWithIndices:name:", self, v15, MEMORY[0x1E0C9AA60], v12, 0, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)avgPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphPooling4DOpDescriptor *v9;
  NSString *v10;
  MPSGraphAvgPool4DOp *v11;
  void *v12;
  MPSGraphAvgPool4DOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphAvgPool4DOp alloc];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)avgPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphPooling4DOpDescriptor *v12;
  NSString *v13;
  MPSGraphAvgPool4DGradientOp *v14;
  void *v15;
  MPSGraphAvgPool4DGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = gradient;
  v11 = source;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphAvgPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)L2NormPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphPooling4DOpDescriptor *v9;
  NSString *v10;
  MPSGraphL2NormPool4DOp *v11;
  void *v12;
  MPSGraphL2NormPool4DOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = source;
  v9 = descriptor;
  v10 = name;
  v11 = [MPSGraphL2NormPool4DOp alloc];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v11, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v12, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)L2NormPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  MPSGraphPooling4DOpDescriptor *v12;
  NSString *v13;
  MPSGraphL2NormPool4DGradientOp *v14;
  void *v15;
  MPSGraphL2NormPool4DGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = gradient;
  v11 = source;
  v12 = descriptor;
  v13 = name;
  v14 = [MPSGraphL2NormPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphPooling4DBaseOp initWithGraph:inputTensors:controlDependencies:descriptor:name:](v14, "initWithGraph:inputTensors:controlDependencies:descriptor:name:", self, v15, MEMORY[0x1E0C9AA60], v12, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)castTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name
{
  uint64_t v6;
  MPSGraphTensor *v8;
  NSString *v9;
  MPSGraphCastOp *v10;
  void *v11;
  MPSGraphCastOp *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v6 = *(_QWORD *)&type;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = [MPSGraphCastOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphCastOp initWithGraph:inputTensors:controlDependencies:destType:name:](v10, "initWithGraph:inputTensors:controlDependencies:destType:name:", self, v11, MEMORY[0x1E0C9AA60], v6, v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)reinterpretCastTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name
{
  uint64_t v6;
  MPSGraphTensor *v8;
  NSString *v9;
  MPSGraphReinterpretCastOp *v10;
  void *v11;
  MPSGraphReinterpretCastOp *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v6 = *(_QWORD *)&type;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  v10 = [MPSGraphReinterpretCastOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphReinterpretCastOp initWithGraph:inputTensors:controlDependencies:destType:name:](v10, "initWithGraph:inputTensors:controlDependencies:destType:name:", self, v11, MEMORY[0x1E0C9AA60], v6, v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (id)transposeTensor:(id)a3 permute:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPSGraphPermuteOp *v16;
  void *v17;
  MPSGraphPermuteOp *v18;
  void *v19;
  void *v20;
  void *__p;
  _BYTE *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MPSShapeToVector<int>(v9, (char **)&__p);
  v11 = v23 - (_BYTE *)__p;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 >> 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v12, v14, 536870944);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [MPSGraphPermuteOp alloc];
  v24[0] = v8;
  v24[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphPermuteOp initWithGraph:inputTensors:controlDependencies:permute:name:](v16, "initWithGraph:inputTensors:controlDependencies:permute:name:", self, v17, MEMORY[0x1E0C9AA60], v9, v10);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v23 = __p;
    operator delete(__p);
  }

  return v20;
}

- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor permutation:(NSArray *)permutation name:(NSString *)name
{
  -[MPSGraph transposeTensor:permute:name:](self, "transposeTensor:permute:name:", tensor, permutation, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex withDimension:(NSUInteger)dimensionIndex2 name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  MPSGraphTensor *v12;
  MPSGraphTransposeOp *v13;
  void *v14;
  MPSGraphTransposeOp *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = name;
  if (dimensionIndex == dimensionIndex2)
  {
    v12 = v10;
  }
  else
  {
    v13 = [MPSGraphTransposeOp alloc];
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MPSGraphTransposeOp initWithGraph:inputTensors:controlDependencies:dimension:withDimension:name:](v13, "initWithGraph:inputTensors:controlDependencies:dimension:withDimension:name:", self, v14, MEMORY[0x1E0C9AA60], dimensionIndex, dimensionIndex2, v11);

    -[MPSGraphOperation outputTensors](v15, "outputTensors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v12 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphReshapeOp *v12;
  void *v13;
  MPSGraphReshapeOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = shapeTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphReshapeOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShape:(MPSShape *)shape name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *__p;
  _BYTE *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = name;
  MPSShapeToVector<int>(shape, (char **)&__p);
  v10 = v18 - (_BYTE *)__p;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 >> 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v11, v13, 536870944);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph reshapeTensor:withShapeTensor:name:](self, "reshapeTensor:withShapeTensor:name:", v8, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex start:(NSInteger)start length:(NSInteger)length name:(NSString *)name
{
  MPSGraphTensor *v12;
  NSString *v13;
  MPSGraphSliceOp *v14;
  void *v15;
  MPSGraphSliceOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  v14 = [MPSGraphSliceOp alloc];
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphSliceOp initWithGraph:inputTensors:controlDependencies:dimension:start:length:name:](v14, "initWithGraph:inputTensors:controlDependencies:dimension:start:length:name:", self, v15, MEMORY[0x1E0C9AA60], dimensionIndex, start, length, v13);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (id)cropTensor:(id)a3 dimension:(unint64_t)a4 amount_before:(unint64_t)a5 amount_after:(unint64_t)a6 name:(id)a7
{
  id v12;
  id v13;
  void *v14;
  MPSGraphCropOp *v15;
  void *v16;
  MPSGraphCropOp *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphCropOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphCropOp initWithGraph:inputTensors:controlDependencies:dimension_index:amount_before:amount_after:name:](v15, "initWithGraph:inputTensors:controlDependencies:dimension_index:amount_before:amount_after:name:", self, v16, MEMORY[0x1E0C9AA60], a4, a5, a6, v13);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name
{
  uint64_t v8;

  LODWORD(v8) = 0;
  -[MPSGraph sliceTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:](self, "sliceTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", tensor, starts, ends, strides, 0, 0, v8, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name
{
  NSArray *v16;
  NSArray *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPSGraphStridedSliceOp *v31;
  void *v32;
  MPSGraphStridedSliceOp *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint32_t v38;
  MPSGraphTensor *v39;
  void *v40;
  NSArray *v41;
  NSString *v42;
  NSArray *v43;
  void *__p;
  _BYTE *v45;
  void *v46;
  _BYTE *v47;
  void *v48;
  _BYTE *v49;
  _QWORD v50[4];
  void *v51;
  void *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v39 = tensor;
  v16 = starts;
  v17 = ends;
  v43 = strides;
  v41 = v17;
  v42 = name;
  MPSShapeToVector<int>(v16, (char **)&v48);
  MPSShapeToVector<int>(v17, (char **)&v46);
  MPSShapeToVector<int>(v43, (char **)&__p);
  v18 = v49 - (_BYTE *)v48;
  v19 = (v49 - (_BYTE *)v48) >> 2;
  if ((v19 != (v47 - (_BYTE *)v46) >> 2 || v19 != (v45 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v19 != (v47 - (_BYTE *)v46) >> 2 || v19 != (v45 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v48, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = endMask;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v20, v22, 536870944);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v46, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v23, v25, 536870944);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v27, v29, 536870944);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [MPSGraphStridedSliceOp alloc];
  v50[0] = v39;
  v50[1] = v40;
  v50[2] = v26;
  v50[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = squeezeMask;
  v33 = -[MPSGraphStridedSliceOp initWithGraph:inputTensors:controlDependencies:starts:ends:strides:startMask:endMask:shrinkAxisMask:name:](v31, "initWithGraph:inputTensors:controlDependencies:starts:ends:strides:startMask:endMask:shrinkAxisMask:name:", self, v32, MEMORY[0x1E0C9AA60], v16, v41, v43, __PAIR64__(v38, startMask), v37, v42);

  -[MPSGraphOperation outputTensors](v33, "outputTensors");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v45 = __p;
    operator delete(__p);
  }
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }

  return (MPSGraphTensor *)v35;
}

- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name
{
  -[MPSGraph sliceGradientTensor:fwdInShapeTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:](self, "sliceGradientTensor:fwdInShapeTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", inputGradientTensor, fwdInShapeTensor, starts, ends, strides, 0, 0, name);
  return (MPSGraphTensor *)(id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name
{
  MPSGraphTensor *v17;
  NSArray *v18;
  NSArray *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MPSGraphStridedSliceGradientOp *v34;
  void *v35;
  MPSGraphStridedSliceGradientOp *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  MPSGraphTensor *v41;
  MPSGraphTensor *v42;
  NSArray *v43;
  void *v44;
  NSArray *v45;
  NSArray *v46;
  NSString *v47;
  void *__p;
  _BYTE *v49;
  void *v50;
  _BYTE *v51;
  void *v52;
  _BYTE *v53;
  _QWORD v54[5];
  void *v55;
  void *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v42 = inputGradientTensor;
  v17 = fwdInShapeTensor;
  v18 = starts;
  v19 = ends;
  v46 = strides;
  v47 = name;
  v43 = v18;
  v45 = v19;
  v41 = v17;
  MPSShapeToVector<int>(v18, (char **)&v52);
  MPSShapeToVector<int>(v19, (char **)&v50);
  MPSShapeToVector<int>(v46, (char **)&__p);
  v20 = v53 - (_BYTE *)v52;
  v21 = (v53 - (_BYTE *)v52) >> 2;
  if ((v21 != (v51 - (_BYTE *)v50) >> 2 || v21 != (v49 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v21 != (v51 - (_BYTE *)v50) >> 2 || v21 != (v49 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v52, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v22, v24, 536870944);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v50, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v25, v27, 536870944);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v29, v31, 536870944);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v41, 1, v47);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = [MPSGraphStridedSliceGradientOp alloc];
  v54[0] = v42;
  v54[1] = v33;
  v54[2] = v44;
  v54[3] = v28;
  v54[4] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = squeezeMask;
  v36 = -[MPSGraphStridedSliceGradientOp initWithGraph:inputTensors:controlDependencies:starts:ends:strides:startMask:endMask:shrinkAxisMask:name:](v34, "initWithGraph:inputTensors:controlDependencies:starts:ends:strides:startMask:endMask:shrinkAxisMask:name:", self, v35, MEMORY[0x1E0C9AA60], v43, v45, v46, __PAIR64__(endMask, startMask), v40, v47);

  -[MPSGraphOperation outputTensors](v36, "outputTensors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }

  return (MPSGraphTensor *)v38;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11
{
  id v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *__p;
  _BYTE *v40;
  void *v41;
  _BYTE *v42;
  void *v43;
  _BYTE *v44;
  void *v45;
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  v17 = a6;
  v38 = a7;
  v37 = a11;
  v33 = v17;
  MPSShapeToVector<int>(a5, (char **)&v43);
  MPSShapeToVector<int>(v17, (char **)&v41);
  MPSShapeToVector<int>(v38, (char **)&__p);
  v18 = v44 - (_BYTE *)v43;
  v19 = (v44 - (_BYTE *)v43) >> 2;
  if ((v19 != (v42 - (_BYTE *)v41) >> 2 || v19 != (v40 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v19 != (v42 - (_BYTE *)v41) >> 2 || v19 != (v40 - (_BYTE *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v43, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v20, v22, 536870944);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v23, v25, 536870944);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v27, v29, 536870944);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:", v34, v35, v36, v26, v30, a8, __PAIR64__(a10, a9), v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }

  return v31;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MPSGraphStridedSliceUpdateOp *v22;
  void *v23;
  MPSGraphStridedSliceUpdateOp *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a11;
  v28 = v19;
  v29 = v20;
  v22 = [MPSGraphStridedSliceUpdateOp alloc];
  v31[0] = v16;
  v31[1] = v17;
  v31[2] = v18;
  v31[3] = v19;
  v31[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphStridedSliceUpdateOp initWithGraph:inputTensors:controlDependencies:startMask:endMask:shrinkAxisMask:name:](v22, "initWithGraph:inputTensors:controlDependencies:startMask:endMask:shrinkAxisMask:name:", self, v23, MEMORY[0x1E0C9AA60], a8, a9, a10, v21);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 name:(id)a8
{
  -[MPSGraph sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:", a3, a4, a5, a6, a7, 0, 0, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 name:(id)a8
{
  -[MPSGraph sliceUpdateDataTensor:updateTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", a3, a4, a5, a6, a7, 0, 0, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex interleave:(BOOL)interleave name:(NSString *)name
{
  _BOOL8 v7;
  NSArray *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  MPSGraphConcatOp *v15;
  MPSGraphConcatOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v7 = interleave;
  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = tensors;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)dimensionIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](v10, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [MPSGraphConcatOp alloc];
  v16 = -[MPSGraphConcatOp initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:](v15, "initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:", self, v14, MEMORY[0x1E0C9AA60], dimensionIndex, v7, v11);
  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex name:(NSString *)name
{
  NSArray *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  MPSGraphConcatOp *v13;
  MPSGraphConcatOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = tensors;
  v9 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)dimensionIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](v8, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [MPSGraphConcatOp alloc];
  v14 = -[MPSGraphConcatOp initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:](v13, "initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:", self, v12, MEMORY[0x1E0C9AA60], dimensionIndex, 0, v9);
  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)concatTensor:(MPSGraphTensor *)tensor withTensor:(MPSGraphTensor *)tensor2 dimension:(NSInteger)dimensionIndex name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  MPSGraphConcatOp *v14;
  void *v15;
  MPSGraphConcatOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = tensor2;
  v12 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)dimensionIndex);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MPSGraphConcatOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphConcatOp initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:](v14, "initWithGraph:inputTensors:controlDependencies:dimension:interleave:name:", self, v15, MEMORY[0x1E0C9AA60], dimensionIndex, 0, v12);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (id)tileTensorWithMultiplier:(id)a3
{
  id v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v18;
  char *v19;
  void *__p;
  _BYTE *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MPSShapeToVector<unsigned long long>(v4, (uint64_t **)&__p);
  v5 = __p;
  v18 = 0;
  v19 = 0;
  v6 = v21 - (_BYTE *)__p;
  v7 = (v21 - (_BYTE *)__p) >> 3;
  if (v21 == __p)
  {
    v9 = 0;
  }
  else
  {
    if ((v6 & 0x8000000000000000) != 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v8 = v6 >> 1;
    v9 = (char *)operator new(v6 >> 1);
    v18 = v9;
    v19 = &v9[4 * v7];
    bzero(v9, v8);
    v10 = 0;
    v6 = (unint64_t)&v9[v8];
    if (v7 <= 1)
      v11 = 1;
    else
      v11 = v7;
    do
    {
      v12 = v5[v10];
      *(_DWORD *)&v9[4 * v10] = v12;
      if (v12 != (int)v12)
        __assert_rtn("-[MPSGraph(MPSGraphTensorShapeOps) tileTensorWithMultiplier:]", "MPSGraphTensorShapeOps.mm", 2045, "multipleVector[dim] == (int64_t)multipliers[dim]");
      ++v10;
    }
    while (v11 != v10);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v6 - (_QWORD)v9, v18, 0, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    operator delete(v9);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }

  return v16;
}

- (id)tileTensor:(id)a3 multiplierTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphTileOp *v11;
  void *v12;
  MPSGraphTileOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphTileOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MPSGraphTensor)tileTensor:(MPSGraphTensor *)tensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;

  v8 = tensor;
  v9 = name;
  -[MPSGraph tileTensorWithMultiplier:](self, "tileTensorWithMultiplier:", multiplier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph tileTensor:multiplierTensor:name:](self, "tileTensor:multiplierTensor:name:", v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v11;
}

- (id)tileGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 multiplierTensor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MPSGraphTileGradientOp *v15;
  MPSGraphTileGradientOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MPSGraphTileGradientOp alloc];
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v15, "initWithGraph:inputTensors:controlDependencies:name:", self, v14, MEMORY[0x1E0C9AA60], v13);
  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (MPSGraphTensor)tileGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  void *v14;

  v10 = incomingGradientTensor;
  v11 = sourceTensor;
  v12 = name;
  -[MPSGraph tileTensorWithMultiplier:](self, "tileTensorWithMultiplier:", multiplier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph tileGradientWithIncomingGradientTensor:sourceTensor:multiplierTensor:name:](self, "tileGradientWithIncomingGradientTensor:sourceTensor:multiplierTensor:name:", v10, v11, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v14;
}

- (id)paddingTensorWithLeftPadding:(id)a3 rightPadding:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v27;
  char *v28;
  char *v29;
  _QWORD v30[2];
  void *v31;
  _BYTE *v32;
  void *__p;
  _BYTE *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MPSShapeToVector<unsigned long long>(v6, (uint64_t **)&v31);
  MPSShapeToVector<unsigned long long>(v7, (uint64_t **)&__p);
  v9 = v31;
  v8 = v32;
  v10 = v32 - (_BYTE *)v31;
  v11 = (v32 - (_BYTE *)v31) >> 3;
  if (v11 != (v34 - (_BYTE *)__p) >> 3 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v27 = 0;
  v28 = 0;
  v29 = 0;
  if (v8 != v9)
  {
    if (v10 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v12 = (char *)operator new(v10);
    v27 = v12;
    v29 = &v12[4 * (v10 >> 2)];
    bzero(v12, v10);
    v13 = 0;
    v14 = &v12[v10];
    v28 = &v12[v10];
    if (v11 <= 1)
      v15 = 1;
    else
      v15 = v11;
    v16 = (char *)v31;
    v17 = v15;
    do
    {
      v18 = *(_QWORD *)&v16[v13];
      *(_DWORD *)&v12[v13] = v18;
      if (v18 != (int)v18)
        goto LABEL_22;
      v13 += 8;
      --v17;
    }
    while (v17);
    v19 = 0;
    v20 = (char *)__p;
    while (1)
    {
      v21 = *(_QWORD *)&v20[v19];
      *(_DWORD *)&v12[v19 + 4] = v21;
      if (v21 != (int)v21)
        break;
      v19 += 8;
      if (!--v15)
        goto LABEL_15;
    }
LABEL_22:
    __assert_rtn("-[MPSGraph(MPSGraphTensorShapeOps) paddingTensorWithLeftPadding:rightPadding:]", "MPSGraphTensorShapeOps.mm", 2126, "source[dim] == (int64_t)paddings[dim * 2 + side]");
  }
  v12 = 0;
  v14 = 0;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v14 - v12, v27, v28, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  v30[1] = &unk_1E0E98B30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v22, v24, 536870944);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    operator delete(v12);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }

  return v25;
}

- (MPSGraphTensor)padTensor:(MPSGraphTensor *)tensor withPaddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding constantValue:(double)constantValue name:(NSString *)name
{
  MPSGraphTensor *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;

  v14 = tensor;
  v15 = name;
  if (paddingMode == MPSGraphPaddingModeZero)
  {
    constantValue = 0.0;
    paddingMode = MPSGraphPaddingModeConstant;
  }
  -[MPSGraph paddingTensorWithLeftPadding:rightPadding:](self, "paddingTensorWithLeftPadding:rightPadding:", leftPadding, rightPadding);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B6F8, -[MPSGraphTensor dataType](v14, "dataType"), constantValue);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph padTensor:paddingMode:paddingTensor:constantValuesTensor:name:](self, "padTensor:paddingMode:paddingTensor:constantValuesTensor:name:", v14, paddingMode, v16, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (id)padTensor:(id)a3 paddingMode:(int64_t)a4 paddingTensor:(id)a5 constantValuesTensor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphPadOp *v16;
  void *v17;
  MPSGraphPadOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4 == 4)
    a4 = 0;
  v16 = [MPSGraphPadOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  v22[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphPadOp initWithGraph:inputTensors:controlDependencies:paddingMode:name:](v16, "initWithGraph:inputTensors:controlDependencies:paddingMode:name:", self, v17, MEMORY[0x1E0C9AA60], a4, v15);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  MPSGraphSpaceToDepth2DOp *v22;
  void *v23;
  MPSGraphSpaceToDepth2DOp *v24;
  void *v25;
  void *v26;
  MPSGraphTensor *v28;
  _QWORD v29[5];

  v9 = usePixelShuffleOrder;
  v29[4] = *MEMORY[0x1E0C80C00];
  v28 = tensor;
  v15 = widthAxisTensor;
  v16 = heightAxisTensor;
  v17 = depthAxisTensor;
  v18 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v17, 1, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [MPSGraphSpaceToDepth2DOp alloc];
  v29[0] = v28;
  v29[1] = v19;
  v29[2] = v20;
  v29[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphSpaceToDepth2DOp initWithGraph:inputTensors:controlDependencies:blockSize:usePixelShuffleOrder:name:](v22, "initWithGraph:inputTensors:controlDependencies:blockSize:usePixelShuffleOrder:name:", self, v23, MEMORY[0x1E0C9AA60], blockSize, v9, v18);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v26;
}

- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  MPSGraphDepthToSpace2DOp *v22;
  void *v23;
  MPSGraphDepthToSpace2DOp *v24;
  void *v25;
  void *v26;
  MPSGraphTensor *v28;
  _QWORD v29[5];

  v9 = usePixelShuffleOrder;
  v29[4] = *MEMORY[0x1E0C80C00];
  v28 = tensor;
  v15 = widthAxisTensor;
  v16 = heightAxisTensor;
  v17 = depthAxisTensor;
  v18 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v17, 1, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [MPSGraphDepthToSpace2DOp alloc];
  v29[0] = v28;
  v29[1] = v19;
  v29[2] = v20;
  v29[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphDepthToSpace2DOp initWithGraph:inputTensors:controlDependencies:blockSize:usePixelShuffleOrder:name:](v22, "initWithGraph:inputTensors:controlDependencies:blockSize:usePixelShuffleOrder:name:", self, v23, MEMORY[0x1E0C9AA60], blockSize, v9, v18);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v26;
}

- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = usePixelShuffleOrder;
  v15 = tensor;
  v16 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)widthAxis);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)heightAxis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)depthAxis);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph spaceToDepth2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:](self, "spaceToDepth2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:", v15, v17, v18, v19, blockSize, v9, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = usePixelShuffleOrder;
  v15 = tensor;
  v16 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)widthAxis);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)heightAxis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)depthAxis);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph depthToSpace2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:](self, "depthToSpace2DTensor:widthAxisTensor:heightAxisTensor:depthAxisTensor:blockSize:usePixelShuffleOrder:name:", v15, v17, v18, v19, blockSize, v9, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  void *v20;
  MPSGraphSpaceToBatchOp *v21;
  void *v22;
  MPSGraphSpaceToBatchOp *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];

  v9 = usePixelShuffleOrder;
  v27[4] = *MEMORY[0x1E0C80C00];
  v14 = tensor;
  v15 = spatialAxesTensor;
  v16 = batchAxisTensor;
  v17 = blockDimensionsTensor;
  v18 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [MPSGraphSpaceToBatchOp alloc];
  v27[0] = v14;
  v27[1] = v19;
  v27[2] = v20;
  v27[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MPSGraphSpaceToBatchOp initWithGraph:inputTensors:controlDependencies:usePixelShuffleOrder:name:](v21, "initWithGraph:inputTensors:controlDependencies:usePixelShuffleOrder:name:", self, v22, MEMORY[0x1E0C9AA60], v9, v18);

  -[MPSGraphOperation outputTensors](v23, "outputTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v25;
}

- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MPSGraphTensor *v25;
  NSString *v26;
  NSArray *v27;
  void *__p;
  _BYTE *v29;
  void *v30;
  _BYTE *v31;
  void *v32;
  _QWORD v33[2];

  v9 = usePixelShuffleOrder;
  v33[1] = *MEMORY[0x1E0C80C00];
  v25 = tensor;
  v27 = blockDimensions;
  v26 = name;
  MPSShapeToVector<int>(spatialAxes, (char **)&v30);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v31 - (_BYTE *)v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v31 - (_BYTE *)v30) >> 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)batchAxis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MPSShapeToVector<int>(v27, (char **)&__p);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v29 - (_BYTE *)__p);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v29 - (_BYTE *)__p) >> 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, v21, 536870944);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph spaceToBatchTensor:spatialAxesTensor:batchAxisTensor:blockDimensionsTensor:usePixelShuffleOrder:name:](self, "spaceToBatchTensor:spatialAxesTensor:batchAxisTensor:blockDimensionsTensor:usePixelShuffleOrder:name:", v25, v17, v18, v22, v9, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }

  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  MPSGraphTensor *v17;
  NSString *v18;
  void *v19;
  void *v20;
  MPSGraphBatchToSpaceOp *v21;
  void *v22;
  MPSGraphBatchToSpaceOp *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];

  v9 = usePixelShuffleOrder;
  v27[4] = *MEMORY[0x1E0C80C00];
  v14 = tensor;
  v15 = spatialAxesTensor;
  v16 = batchAxisTensor;
  v17 = blockDimensionsTensor;
  v18 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v15, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v16, 1, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [MPSGraphBatchToSpaceOp alloc];
  v27[0] = v14;
  v27[1] = v19;
  v27[2] = v20;
  v27[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MPSGraphBatchToSpaceOp initWithGraph:inputTensors:controlDependencies:usePixelShuffleOrder:name:](v21, "initWithGraph:inputTensors:controlDependencies:usePixelShuffleOrder:name:", self, v22, MEMORY[0x1E0C9AA60], v9, v18);

  -[MPSGraphOperation outputTensors](v23, "outputTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v25;
}

- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  _BOOL8 v9;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MPSGraphTensor *v25;
  NSString *v26;
  NSArray *v27;
  void *__p;
  _BYTE *v29;
  void *v30;
  _BYTE *v31;
  void *v32;
  _QWORD v33[2];

  v9 = usePixelShuffleOrder;
  v33[1] = *MEMORY[0x1E0C80C00];
  v25 = tensor;
  v27 = blockDimensions;
  v26 = name;
  MPSShapeToVector<int>(spatialAxes, (char **)&v30);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v31 - (_BYTE *)v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v31 - (_BYTE *)v30) >> 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)batchAxis);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MPSShapeToVector<int>(v27, (char **)&__p);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __p, v29 - (_BYTE *)__p);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v29 - (_BYTE *)__p) >> 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v19, v21, 536870944);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph batchToSpaceTensor:spatialAxesTensor:batchAxisTensor:blockDimensionsTensor:usePixelShuffleOrder:name:](self, "batchToSpaceTensor:spatialAxesTensor:batchAxisTensor:blockDimensionsTensor:usePixelShuffleOrder:name:", v25, v17, v18, v22, v9, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }

  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphReverseOp *v12;
  void *v13;
  MPSGraphReverseOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axesTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphReverseOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphReverseOp *v8;
  void *v9;
  MPSGraphReverseOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v8 = [MPSGraphReverseOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t i;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _OWORD v24[4];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  memset(v24, 0, sizeof(v24));
  v11 = -[NSArray count](v9, "count");
  if (v11 >= 0x10)
    v12 = 16;
  else
    v12 = v11;
  if (v12)
  {
    for (i = 0; ; ++i)
    {
      v14 = -[NSArray count](v9, "count");
      v15 = v14 >= 0x10 ? 16 : v14;
      if (i >= v15)
        break;
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v24 + i) = objc_msgSend(v16, "intValue");

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 4 * v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v17, v19, 536870944);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPSGraph reverseTensor:axesTensor:name:](self, "reverseTensor:axesTensor:name:", v8, v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MPSGraph reverseTensor:name:](self, "reverseTensor:name:", v8, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;

  v8 = tensor;
  v9 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph flatten2DTensor:axisTensor:name:](self, "flatten2DTensor:axisTensor:name:", v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphFlatten2DOp *v12;
  void *v13;
  MPSGraphFlatten2DOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axisTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphFlatten2DOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (id)padGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  MPSGraphPadGradientOp *v17;
  int64_t v18;
  MPSGraphPadGradientOp *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v23[0] = v12;
  v23[1] = v13;
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [MPSGraphPadGradientOp alloc];
  if (a5 == 4)
    v18 = 0;
  else
    v18 = a5;
  v19 = -[MPSGraphPadGradientOp initWithGraph:inputTensors:controlDependencies:paddingMode:name:](v17, "initWithGraph:inputTensors:controlDependencies:paddingMode:name:", self, v16, MEMORY[0x1E0C9AA60], v18, v15);
  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (MPSGraphTensor)padGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor paddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding name:(NSString *)name
{
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  NSString *v16;
  void *v17;
  void *v18;
  MPSGraphPaddingMode v19;
  void *v20;

  v14 = incomingGradientTensor;
  v15 = sourceTensor;
  v16 = name;
  -[MPSGraph paddingTensorWithLeftPadding:rightPadding:](self, "paddingTensorWithLeftPadding:rightPadding:", leftPadding, rightPadding);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B710, -[MPSGraphTensor dataType](v15, "dataType"), 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (paddingMode == MPSGraphPaddingModeZero)
    v19 = MPSGraphPaddingModeConstant;
  else
    v19 = paddingMode;
  -[MPSGraph padGradientWithIncomingGradientTensor:inputTensor:paddingMode:paddingTensor:constantValuesTensor:name:](self, "padGradientWithIncomingGradientTensor:inputTensor:paddingMode:paddingTensor:constantValuesTensor:name:", v14, v15, v19, v17, v18, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (id)padGradientWithIncomingGradientTensor:(id)a3 inputTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 constantValuesTensor:(id)a7 name:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphPadGradientOp *v17;
  void *v18;
  MPSGraphPadGradientOp *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  if (a5 == 4)
    a5 = 0;
  v17 = [MPSGraphPadGradientOp alloc];
  v23[0] = v13;
  v23[1] = v14;
  v23[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPSGraphPadGradientOp initWithGraph:inputTensors:controlDependencies:paddingMode:name:](v17, "initWithGraph:inputTensors:controlDependencies:paddingMode:name:", self, v18, MEMORY[0x1E0C9AA60], a5, v16);

  -[MPSGraphOperation outputTensors](v19, "outputTensors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (MPSGraphTensor)shapeOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  char *v11;
  int32x4_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t *v15;
  int32x4_t *v16;
  char *v17;
  int32x4_t *v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t *v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  MPSGraphShapeOp *v28;
  void *v29;
  MPSGraphShapeOp *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *__p;
  char *v38;
  MPSGraphTensor *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  -[MPSGraphTensor shape](v6, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = isStaticShape(v8);

  if (v9)
  {
    -[MPSGraphTensor shape](v6, "shape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MPSShapeToVector<unsigned long long>(v10, (uint64_t **)&__p);

    v12 = (int32x4_t *)__p;
    v11 = v38;
    v13 = v38 - (_BYTE *)__p;
    v14 = (v38 - (_BYTE *)__p) >> 3;
    if (v38 == __p)
    {
      v16 = 0;
    }
    else
    {
      if (v13 < 0)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
      v16 = v15;
      v17 = (char *)v12;
      v18 = v15;
      if ((unint64_t)(v13 - 8) < 0x38)
        goto LABEL_20;
      v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
      v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
      v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
      v20 = v15 + 1;
      v21 = v12 + 2;
      v22 = v19 & 0x3FFFFFFFFFFFFFF8;
      do
      {
        v24 = v21[-2];
        v23 = v21[-1];
        v26 = *v21;
        v25 = v21[1];
        v21 += 4;
        v20[-1] = vuzp1q_s32(v24, v23);
        *v20 = vuzp1q_s32(v26, v25);
        v20 += 2;
        v22 -= 8;
      }
      while (v22);
      if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
      {
LABEL_20:
        do
        {
          v27 = *(_QWORD *)v17;
          v17 += 8;
          v18->i32[0] = v27;
          v18 = (int32x4_t *)((char *)v18 + 4);
        }
        while (v17 != v11);
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, v13 >> 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v33, v35, 536870944);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      operator delete(v16);
    if (__p)
    {
      v38 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v28 = [MPSGraphShapeOp alloc];
    v39 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v28, "initWithGraph:inputTensors:controlDependencies:name:", self, v29, MEMORY[0x1E0C9AA60], v7);

    -[MPSGraphOperation outputTensors](v30, "outputTensors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (MPSGraphTensor *)v32;
}

- (id)rankOfTensor:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MPSGraphRankOp *v11;
  void *v12;
  MPSGraphRankOp *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B728, 536870944, (double)(unint64_t)objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = [MPSGraphRankOp alloc];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v7);

    -[MPSGraphOperation outputTensors](v13, "outputTensors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)sizeOfTensor:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  MPSGraphSizeOp *v16;
  void *v17;
  MPSGraphSizeOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = isStaticShape(v8);

  if (v9)
  {
    v10 = 0;
    v11 = 1;
    while (1)
    {
      objc_msgSend(v6, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v10 >= v13)
        break;
      objc_msgSend(v6, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 *= objc_msgSend(v15, "unsignedIntegerValue");

      ++v10;
    }
    -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B740, 536870944, (double)v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = [MPSGraphSizeOp alloc];
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v16, "initWithGraph:inputTensors:controlDependencies:name:", self, v17, MEMORY[0x1E0C9AA60], v7);

    -[MPSGraphOperation outputTensors](v18, "outputTensors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)dimensionSizeOfTensor:(id)a3 axes:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  int32x4_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t *v15;
  int32x4_t *v16;
  char *v17;
  int32x4_t *v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t *v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *__p;
  char *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  v12 = (int32x4_t *)__p;
  v11 = v35;
  v13 = v35 - (_BYTE *)__p;
  v14 = (v35 - (_BYTE *)__p) >> 3;
  if (v35 == __p)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    v16 = v15;
    v17 = (char *)v12;
    v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38)
      goto LABEL_18;
    v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    v20 = v15 + 1;
    v21 = v12 + 2;
    v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v24 = v21[-2];
      v23 = v21[-1];
      v26 = *v21;
      v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_18:
      do
      {
        v27 = *(_QWORD *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v28, v30, 536870944);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph dimensionSizeOfTensor:axesTensor:name:](self, "dimensionSizeOfTensor:axesTensor:name:", v8, v31, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    operator delete(v16);
  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }

  return v32;
}

- (id)dimensionSizeOfTensor:(id)a3 axesTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphDimensionSizeOp *v11;
  void *v12;
  MPSGraphDimensionSizeOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphDimensionSizeOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphBroadcastOp *v12;
  void *v13;
  MPSGraphBroadcastOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = shapeTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphBroadcastOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShape:(MPSShape *)shape name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSShape *v9;
  NSString *v10;
  unsigned int v11;
  uint64_t v12;
  MPSShape *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  int v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[28];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = shape;
  v10 = name;
  v11 = -[MPSShape count](v9, "count");
  memset(v33, 0, sizeof(v33));
  if (v11 >= 0x10)
    v12 = 16;
  else
    v12 = v11;
  v32 = 0uLL;
  v31 = 0uLL;
  v30 = 1;
  v24 = 0uLL;
  v25 = 0uLL;
  v26 = 0uLL;
  v27 = 0uLL;
  v13 = v9;
  v14 = -[MPSShape countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    v16 = &v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        *v16++ = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v24);
      }
      v14 = -[MPSShape countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v30, (4 * v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v18, v20, 536870944);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph broadcastTensor:toShapeTensor:name:](self, "broadcastTensor:toShapeTensor:name:", v8, v21, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v22;
}

- (id)broadcastGradientArgsForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphBroadcastGradientArgsOp *v11;
  void *v12;
  MPSGraphBroadcastGradientArgsOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphBroadcastGradientArgsOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  MPSGraphTensor *v6;
  NSString *v7;
  MPSGraphSqueezeOp *v8;
  void *v9;
  MPSGraphSqueezeOp *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = tensor;
  v7 = name;
  v8 = [MPSGraphSqueezeOp alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v8, "initWithGraph:inputTensors:controlDependencies:name:", self, v9, MEMORY[0x1E0C9AA60], v7);

  -[MPSGraphOperation outputTensors](v10, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v7;
  void *v8;
  void *v9;

  v7 = tensor;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B758, 536870944, (double)axis);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squeezeTensor:axesTensor:name:](self, "squeezeTensor:axesTensor:name:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  char *v11;
  int32x4_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t *v15;
  int32x4_t *v16;
  char *v17;
  int32x4_t *v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t *v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *__p;
  char *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  v12 = (int32x4_t *)__p;
  v11 = v35;
  v13 = v35 - (_BYTE *)__p;
  v14 = (v35 - (_BYTE *)__p) >> 3;
  if (v35 == __p)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    v16 = v15;
    v17 = (char *)v12;
    v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38)
      goto LABEL_18;
    v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    v20 = v15 + 1;
    v21 = v12 + 2;
    v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v24 = v21[-2];
      v23 = v21[-1];
      v26 = *v21;
      v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_18:
      do
      {
        v27 = *(_QWORD *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v28, v30, 536870944);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph squeezeTensor:axesTensor:name:](self, "squeezeTensor:axesTensor:name:", v8, v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    operator delete(v16);
  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v32;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphSqueezeOp *v12;
  void *v13;
  MPSGraphSqueezeOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axesTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphSqueezeOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (id)squeezeTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphSqueezeOp *v11;
  void *v12;
  MPSGraphSqueezeOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphSqueezeOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)squeezeTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B770, 536870944, (double)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squeezeTensor:dimensionTensor:name:](self, "squeezeTensor:dimensionTensor:name:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v7;
  void *v8;
  void *v9;

  v7 = tensor;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B788, 536870944, (double)axis);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph expandDimsOfTensor:axesTensor:name:](self, "expandDimsOfTensor:axesTensor:name:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSArray *v9;
  NSString *v10;
  char *v11;
  int32x4_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t *v15;
  int32x4_t *v16;
  char *v17;
  int32x4_t *v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t *v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *__p;
  char *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axes;
  v10 = name;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  v12 = (int32x4_t *)__p;
  v11 = v35;
  v13 = v35 - (_BYTE *)__p;
  v14 = (v35 - (_BYTE *)__p) >> 3;
  if (v35 == __p)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    v16 = v15;
    v17 = (char *)v12;
    v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38)
      goto LABEL_18;
    v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    v20 = v15 + 1;
    v21 = v12 + 2;
    v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v24 = v21[-2];
      v23 = v21[-1];
      v26 = *v21;
      v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_18:
      do
      {
        v27 = *(_QWORD *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v28, v30, 536870944);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph expandDimsOfTensor:axesTensor:name:](self, "expandDimsOfTensor:axesTensor:name:", v8, v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    operator delete(v16);
  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v32;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphExpandOp *v12;
  void *v13;
  MPSGraphExpandOp *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = tensor;
  v9 = axesTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphExpandOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v14, "outputTensors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (id)expandTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphExpandOp *v11;
  void *v12;
  MPSGraphExpandOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphExpandOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)expandTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B7A0, 536870944, (double)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph expandTensor:dimensionTensor:name:](self, "expandTensor:dimensionTensor:name:", v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizes:(NSArray *)splitSizes axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p;
  _BYTE *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = name;
  MPSShapeToVector<int>(splitSizes, (char **)&__p);
  v12 = v20 - (_BYTE *)__p;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 >> 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v13, v15, 536870944);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph splitTensor:splitSizesTensor:axis:name:](self, "splitTensor:splitSizesTensor:axis:name:", v10, v16, axis, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }

  return (NSArray *)v17;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizesTensor:(MPSGraphTensor *)splitSizesTensor axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  void *v13;
  void *v14;
  MPSGraphSplitOp *v15;
  void *v16;
  MPSGraphSplitOp *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = splitSizesTensor;
  v12 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v11, 1, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [MPSGraphSplitOp alloc];
  v20[0] = v10;
  v20[1] = v13;
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MPSGraphSplitOp initWithGraph:inputTensors:controlDependencies:dimension:name:](v15, "initWithGraph:inputTensors:controlDependencies:dimension:name:", self, v16, MEMORY[0x1E0C9AA60], axis, v12);

  -[MPSGraphOperation outputTensors](v17, "outputTensors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor numSplits:(NSUInteger)numSplits axis:(NSInteger)axis name:(NSString *)name
{
  MPSGraphTensor *v10;
  NSString *v11;
  void *v12;
  MPSGraphSplitOp *v13;
  void *v14;
  MPSGraphSplitOp *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v10 = tensor;
  v11 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [MPSGraphSplitOp alloc];
  v18[0] = v10;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphSplitOp initWithGraph:inputTensors:controlDependencies:dimension:numSplits:name:](v13, "initWithGraph:inputTensors:controlDependencies:dimension:numSplits:name:", self, v14, MEMORY[0x1E0C9AA60], axis, numSplits, v11);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (MPSGraphTensor)stackTensors:(NSArray *)inputTensors axis:(NSInteger)axis name:(NSString *)name
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSInteger v21;
  NSString *v22;
  NSArray *obj;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = inputTensors;
  v21 = axis;
  v22 = name;
  -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B7B8, 536870944, (double)axis);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v27;
    if (v22)
      v12 = (const __CFString *)v22;
    else
      v12 = CFSTR("stack");
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/expand%lu"), v12, v10 + i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraph expandTensor:dimensionTensor:name:](self, "expandTensor:dimensionTensor:name:", v14, v24, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addObject:", v16);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v10 += i;
    }
    while (v9);
  }

  v17 = (const __CFString *)v22;
  if (!v22)
    v17 = CFSTR("stack");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/concat"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph concatTensors:dimension:name:](self, "concatTensors:dimension:name:", v25, v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShape:(MPSShape *)shape name:(NSString *)name
{
  MPSShape *v8;
  NSString *v9;
  void *v10;
  void *v11;

  v8 = shape;
  v9 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph coordinateAlongAxisTensor:withShape:name:](self, "coordinateAlongAxisTensor:withShape:name:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShape:(MPSShape *)shape name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSShape *v9;
  NSString *v10;
  _DWORD *v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = axisTensor;
  v9 = shape;
  v10 = name;
  v11 = malloc_type_malloc(4 * -[MPSShape count](v9, "count"), 0x100004052888210uLL);
  for (i = 0; i < -[MPSShape count](v9, "count"); ++i)
  {
    -[MPSShape objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[i] = objc_msgSend(v13, "intValue");

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 4 * -[MPSShape count](v9, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSShape count](v9, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithData:shape:dataType:](self, "constantWithData:shape:dataType:", v14, v16, 536870944);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  free(v11);
  -[MPSGraph coordinateAlongAxisTensor:withShapeTensor:name:](self, "coordinateAlongAxisTensor:withShapeTensor:name:", v8, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  NSString *v9;
  void *v10;
  void *v11;

  v8 = shapeTensor;
  v9 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, (double)axis);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph coordinateAlongAxisTensor:withShapeTensor:name:](self, "coordinateAlongAxisTensor:withShapeTensor:name:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  void *v11;
  MPSGraphGetCoordOp *v12;
  void *v13;
  id *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = axisTensor;
  v9 = shapeTensor;
  v10 = name;
  -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPSGraphGetCoordOp alloc];
  v17[0] = v11;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v12, "initWithGraph:inputTensors:controlDependencies:name:", self, v13, MEMORY[0x1E0C9AA60], v10);

  objc_msgSend(v14[3], "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (id)getCoordinateValueWithShapeTensor:(id)a3 axisTensor:(id)a4 name:(id)a5
{
  -[MPSGraph coordinateAlongAxisTensor:withShapeTensor:name:](self, "coordinateAlongAxisTensor:withShapeTensor:name:", a4, a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fixCastIntTensor:(id)a3 toSignedness:(BOOL)a4 name:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  int v10;
  int v11;
  id v12;
  int v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "dataType");
  if (v10 <= 536870943)
  {
    if (v10 != 32)
    {
      if (v10 != 64)
        goto LABEL_11;
      goto LABEL_7;
    }
LABEL_12:
    if (v6)
      v13 = 536870944;
    else
      v13 = 32;
    if (v10 == v13)
      goto LABEL_11;
    goto LABEL_16;
  }
  if (v10 == 536870944)
    goto LABEL_12;
  if (v10 == 536870976)
  {
LABEL_7:
    if (v6)
      v11 = 536870976;
    else
      v11 = 64;
    if (v10 == v11)
      goto LABEL_11;
LABEL_16:
    -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_11:
  v12 = v8;
LABEL_17:
  v14 = v12;

  return v14;
}

- (id)interleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  MPSGraphInterleaveOp *v10;
  void *v11;
  MPSGraphInterleaveOp *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = [MPSGraphInterleaveOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphInterleaveOp initWithGraph:inputTensors:controlDependencies:interleaveFactor:name:](v10, "initWithGraph:inputTensors:controlDependencies:interleaveFactor:name:", self, v11, MEMORY[0x1E0C9AA60], a4, v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)deinterleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  MPSGraphDeinterleaveOp *v10;
  void *v11;
  MPSGraphDeinterleaveOp *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = [MPSGraphDeinterleaveOp alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphDeinterleaveOp initWithGraph:inputTensors:controlDependencies:interleaveFactor:name:](v10, "initWithGraph:inputTensors:controlDependencies:interleaveFactor:name:", self, v11, MEMORY[0x1E0C9AA60], a4, v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)makeListWithElementType:(id)a3 maxSize:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  MPSGraphMakeListOp *v10;
  void *v11;
  MPSGraphMakeListOp *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = [MPSGraphMakeListOp alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphMakeListOp initWithGraph:inputTensors:controlDependencies:elementType:maxSize:name:](v10, "initWithGraph:inputTensors:controlDependencies:elementType:maxSize:name:", self, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v8, v11, v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)makeListWithElementType:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MPSGraphMakeListOp *v8;
  MPSGraphMakeListOp *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = [MPSGraphMakeListOp alloc];
  v9 = -[MPSGraphMakeListOp initWithGraph:inputTensors:controlDependencies:elementType:maxSize:name:](v8, "initWithGraph:inputTensors:controlDependencies:elementType:maxSize:name:", self, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v6, 0, v7);
  -[MPSGraphOperation outputTensors](v9, "outputTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pushBackToList:(id)a3 element:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphListPushBackOp *v11;
  void *v12;
  MPSGraphListPushBackOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphListPushBackOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)popBackFromList:(id)a3 outputList:(id *)a4 name:(id)a5
{
  id v8;
  id v9;
  MPSGraphListPopBackOp *v10;
  void *v11;
  MPSGraphListPopBackOp *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = [MPSGraphListPopBackOp alloc];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v10, "initWithGraph:inputTensors:controlDependencies:name:", self, v11, MEMORY[0x1E0C9AA60], v9);

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  -[MPSGraphOperation outputTensors](v12, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)localConvolutionWithSourceTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphLocalConvolutionOp *v19;
  void *v20;
  MPSGraphLocalConvolutionOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = [MPSGraphLocalConvolutionOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphLocalConvolutionOp initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](v19, "initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", self, v20, MEMORY[0x1E0C9AA60], a5, v17, a7, a8, v18);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)localConvolutionWeightGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphLocalConvolutionWeightGradientOp *v19;
  void *v20;
  MPSGraphLocalConvolutionWeightGradientOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = [MPSGraphLocalConvolutionWeightGradientOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphLocalConvolutionWeightGradientOp initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](v19, "initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", self, v20, MEMORY[0x1E0C9AA60], a5, v17, a7, a8, v18);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)localConvolutionDataGradientWithIncomingGradientTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphLocalConvolutionDataGradientOp *v19;
  void *v20;
  MPSGraphLocalConvolutionDataGradientOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = [MPSGraphLocalConvolutionDataGradientOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphLocalConvolutionDataGradientOp initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](v19, "initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", self, v20, MEMORY[0x1E0C9AA60], a5, v17, a7, a8, v18);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)variableOps
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_variableOps);
}

- (id)traininableHighLevelOpVariables
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_traininableHighLevelOpVariables);
}

- (id)batchNormalizationLayerWithTensor:(id)a3 batchNormalizationGammaInitializer:(id)a4 batchNormalizationBetaInitializer:(id)a5 batchNormalizationMeanInitializer:(id)a6 batchNormalizationVarianceInitializer:(id)a7 batchNormalizationEpsilon:(double)a8 dataLayout:(unint64_t)a9 name:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableArray *traininableHighLevelOpVariables;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v63 = a4;
  v62 = a5;
  v18 = a6;
  v61 = a7;
  v19 = a10;
  v20 = v17;
  v21 = v20;
  if (!v18 && !v63 && !v62)
  {
    v22 = v20;
    if (!v61)
      goto LABEL_46;
  }
  objc_msgSend(v20, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v23;
  if (!a9)
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v28, "unsignedIntegerValue");
    v26 = &unk_1E0E9B800;

    if (!v19)
      goto LABEL_8;
LABEL_14:
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/mean"));
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (a9 != 1)
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    v25 = 0;
    v26 = 0;
    if (!v19)
      goto LABEL_8;
    goto LABEL_14;
  }
  objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  v26 = &unk_1E0E9B818;

  if (v19)
    goto LABEL_14;
LABEL_8:
  objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/mean"));
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v29 = (void *)v27;
  -[MPSGraph meanOfTensor:axes:name:](self, "meanOfTensor:axes:name:", v21, v26, v27);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/variance"));
  else
    objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/variance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph varianceOfTensor:meanTensor:axes:name:](self, "varianceOfTensor:meanTensor:axes:name:", v21, v59, v26, v30);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v63, "initializedDataWithNumberOfValues:dataType:", v25, 268435488);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/gammaVariable"));
    else
      objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/gammaVariable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v31, v33, 268435488, v34);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
    objc_msgSend(v60, "operation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](traininableHighLevelOpVariables, "addObject:", v36);

  }
  else
  {
    v60 = 0;
  }
  if (v62)
  {
    objc_msgSend(v62, "initializedDataWithNumberOfValues:dataType:", v25, 268435488);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/betaVariable"));
    else
      objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/betaVariable"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v37, v39, 268435488, v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = self->_traininableHighLevelOpVariables;
    objc_msgSend(v40, "operation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v42, "addObject:", v43);

  }
  else
  {
    v40 = 0;
  }
  if (v18)
  {
    objc_msgSend(v18, "initializedDataWithNumberOfValues:dataType:", v25, 268435488);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/runningMeanVariable"));
    else
      objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/runningMeanVariable"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v44, v46, 268435488, v47);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
  if (v61)
  {
    objc_msgSend(v61, "initializedDataWithNumberOfValues:dataType:", v25, 268435488);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/runningVarianceVariable"));
    else
      objc_msgSend(CFSTR("batchNormalization"), "stringByAppendingString:", CFSTR("/runningVarianceVariable"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v48, v50, 268435488, v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  if (v19)
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("/batchNormalization/normalization"));
  else
    objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/batchNormalization/normalization"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v54 = a8;
  -[MPSGraph normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:](self, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v21, v59, v58, v60, v40, v53, v54);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
  return v22;
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 dilationRates:(id)a7 groups:(unint64_t)a8 activationType:(unsigned int)a9 weightsInitializer:(id)a10 biasesInitializer:(id)a11 batchNormalizationGammaInitializer:(id)a12 batchNormalizationBetaInitializer:(id)a13 batchNormalizationMeanInitializer:(id)a14 batchNormalizationVarianceInitializer:(id)a15 batchNormalizationEpsilon:(double)a16 paddingStyle:(unint64_t)a17 dataLayout:(unint64_t)a18 weightsLayout:(unint64_t)a19 name:(id)a20
{
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *traininableHighLevelOpVariables;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  void *v81;
  _QWORD v82[4];
  _QWORD v83[6];

  v83[4] = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v24 = a4;
  v78 = a6;
  v77 = a7;
  v67 = a10;
  v75 = a11;
  v74 = a12;
  v73 = a13;
  v72 = a14;
  v70 = a15;
  v25 = a20;
  v69 = v24;
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedIntegerValue");

  objc_msgSend(v79, "shape");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (a18)
  {
    if (a18 != 1)
    {
      if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
        v32 = 0;
        if (a19 == 2)
          goto LABEL_6;
      }
      else
      {
        v32 = 0;
        if (a19 == 2)
          goto LABEL_6;
      }
      goto LABEL_9;
    }
    objc_msgSend(v66, "objectAtIndexedSubscript:", 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(v66, "objectAtIndexedSubscript:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");
  }
  v32 = v31;

  if (a19 == 2)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v33;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v82[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_18;
  }
LABEL_9:
  if (a19 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v33;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v68 = 0;
LABEL_18:
  objc_msgSend(v67, "initializedDataWithNumberOfValues:dataType:", v27 * a5 * v29 * v32, 268435488);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("/weightsVariable"));
  else
    objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/weightsVariable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v37, v68, 268435488, v38);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
  objc_msgSend(v76, "operation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](traininableHighLevelOpVariables, "addObject:", v40);

  objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "integerValue");
  objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "integerValue");
  objc_msgSend(v77, "objectAtIndexedSubscript:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "integerValue");
  objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphConvolution2DOpDescriptor descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingStyle:dataLayout:weightsLayout:](MPSGraphConvolution2DOpDescriptor, "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingStyle:dataLayout:weightsLayout:", v42, v44, v46, objc_msgSend(v47, "integerValue"), a8, a17, a18, a19);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("/conv2D"));
  else
    objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/conv2D"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph convolution2DWithSourceTensor:weightsTensor:descriptor:name:](self, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v79, v76, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v50;
  v52 = v51;
  if (v75)
  {
    objc_msgSend(v75, "initializedDataWithNumberOfValues:dataType:", a5, 268435488);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v25, "stringByAppendingString:", CFSTR("/biasAddVariable"));
    else
      objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/biasAddVariable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v53, v55, 268435488, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = self->_traininableHighLevelOpVariables;
    objc_msgSend(v57, "operation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v58, "addObject:", v59);

    if (v25)
      objc_msgSend(v25, "stringByAppendingString:", CFSTR("/biasAdd"));
    else
      objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/biasAdd"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v51, v57, v60);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v74 || v73 || v72 || v70)
  {
    -[MPSGraph batchNormalizationLayerWithTensor:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:dataLayout:name:](self, "batchNormalizationLayerWithTensor:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:dataLayout:name:", v52, v74, v73, v72, v70, a18, a16, v25);
    v61 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v61;
    if (a9 != 1)
      goto LABEL_43;
  }
  else if (a9 != 1)
  {
    goto LABEL_43;
  }
  if (v25)
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("/reLU"));
  else
    objc_msgSend(CFSTR("conv2DLayer"), "stringByAppendingString:", CFSTR("/reLU"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph reLUWithTensor:name:](self, "reLUWithTensor:name:", v52, v62);
  v63 = objc_claimAutoreleasedReturnValue();

  v52 = (void *)v63;
LABEL_43:

  return v52;
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 batchNormalizationGammaInitializer:(id)a10 batchNormalizationBetaInitializer:(id)a11 batchNormalizationMeanInitializer:(id)a12 batchNormalizationVarianceInitializer:(id)a13 batchNormalizationEpsilon:(double)a14 paddingStyle:(unint64_t)a15 dataLayout:(unint64_t)a16 weightsLayout:(unint64_t)a17 name:(id)a18
{
  uint64_t v19;

  LODWORD(v19) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", a3, a4, a5, a6, &unk_1E0E9B830, 1, a14, v19, a8, a9, a10, a11, a12, a13, a15,
    a16,
    a17,
    a18);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)convolution2DWithDefaultBatchNormalizationLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v29;
  id v30;
  id v31;
  id v32;

  v32 = a3;
  v31 = a4;
  v30 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a13;
  v29 = v17;
  +[MPSGraphVariableInitializer initializerWithOnes](MPSGraphVariableInitializer, "initializerWithOnes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphVariableInitializer initializerWithZeros](MPSGraphVariableInitializer, "initializerWithZeros");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", v32, v31, a5, v30, &unk_1E0E9B848, 1, 0.001, v26, v29, v18, v20, v21, v22, v23, a10,
    a11,
    a12,
    v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13
{
  uint64_t v14;

  LODWORD(v14) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", a3, a4, a5, a6, &unk_1E0E9B860, 1, 0.001, v14, a8, a9, 0, 0, 0, 0, a10,
    a11,
    a12,
    a13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fullyConnectedLayerWithTensor:(id)a3 outputChannelCount:(unint64_t)a4 activationType:(unsigned int)a5 weightsInitializer:(id)a6 biasesInitializer:(id)a7 name:(id)a8
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *traininableHighLevelOpVariables;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v42 = a6;
  v43 = a7;
  v14 = a8;
  objc_msgSend(v13, "shape");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", objc_msgSend(v40, "count") - 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "initializedDataWithNumberOfValues:dataType:", v16 * a4, 268435488);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/weightsVariable"));
  else
    objc_msgSend(CFSTR("fullyConnectedLayer"), "stringByAppendingString:", CFSTR("/weightsVariable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v19, v41, 268435488, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
  objc_msgSend(v21, "operation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](traininableHighLevelOpVariables, "addObject:", v23);

  if (v14)
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/matMul"));
  else
    objc_msgSend(CFSTR("fullyConnectedLayer"), "stringByAppendingString:", CFSTR("/matMul"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v13, v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v25;
  v27 = v26;
  if (v43)
  {
    objc_msgSend(v43, "initializedDataWithNumberOfValues:dataType:", a4, 268435488);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("/biasAddVariable"));
    else
      objc_msgSend(CFSTR("fullyConnectedLayer"), "stringByAppendingString:", CFSTR("/biasAddVariable"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph variableWithData:shape:dataType:name:](self, "variableWithData:shape:dataType:name:", v28, v30, 268435488, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = self->_traininableHighLevelOpVariables;
    objc_msgSend(v32, "operation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v33, "addObject:", v34);

    if (v14)
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("/biasAdd"));
    else
      objc_msgSend(CFSTR("fullyConnectedLayer"), "stringByAppendingString:", CFSTR("/biasAdd"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph additionWithPrimaryTensor:secondaryTensor:name:](self, "additionWithPrimaryTensor:secondaryTensor:name:", v26, v32, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a5 == 1)
  {
    if (v14)
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("/reLU"));
    else
      objc_msgSend(CFSTR("fullyConnectedLayer"), "stringByAppendingString:", CFSTR("/reLU"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph reLUWithTensor:name:](self, "reLUWithTensor:name:", v27, v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v37;
  }

  return v27;
}

- (id)maxPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v26;
  id v27;

  v27 = a3;
  v11 = a4;
  v12 = a5;
  v26 = a8;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphPooling2DOpDescriptor descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:](MPSGraphPooling2DOpDescriptor, "descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:", v14, v16, v18, objc_msgSend(v19, "integerValue"), a6, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph maxPooling2DWithSourceTensor:descriptor:name:](self, "maxPooling2DWithSourceTensor:descriptor:name:", v27, v20, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)avgPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v26;
  id v27;

  v27 = a3;
  v11 = a4;
  v12 = a5;
  v26 = a8;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphPooling2DOpDescriptor descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:](MPSGraphPooling2DOpDescriptor, "descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:", v14, v16, v18, objc_msgSend(v19, "integerValue"), a6, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph avgPooling2DWithSourceTensor:descriptor:name:](self, "avgPooling2DWithSourceTensor:descriptor:name:", v27, v20, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)absoluteErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = CFSTR("absoluteError");
  if (a6)
    v12 = (__CFString *)a6;
  v13 = v12;
  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/subtraction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v10, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/absolute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph absoluteWithTensor:name:](self, "absoluteWithTensor:name:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraph lossReductionWithTensor:reductionType:axis:name:](self, "lossReductionWithTensor:reductionType:axis:name:", v17, a5, 0, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)squaredErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = CFSTR("squaredError");
  if (a6)
    v12 = (__CFString *)a6;
  v13 = v12;
  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/subtraction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph subtractionWithPrimaryTensor:secondaryTensor:name:](self, "subtractionWithPrimaryTensor:secondaryTensor:name:", v10, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/square"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph squareWithTensor:name:](self, "squareWithTensor:name:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v17;
  v19 = v18;
  if (!a5)
  {
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", objc_msgSend(v10, "dataType"), 0.5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("/mul"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraph multiplicationWithPrimaryTensor:secondaryTensor:name:](self, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v18, v20, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MPSGraph lossReductionWithTensor:reductionType:axis:name:](self, "lossReductionWithTensor:reductionType:axis:name:", v19, a5, 0, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 name:(id)a7
{
  -[MPSGraph kernelPredictorWithSourceTensor:weightsTensor:layout:kernelShape:dilationRates:name:](self, "kernelPredictorWithSourceTensor:weightsTensor:layout:kernelShape:dilationRates:name:", a3, a4, a5, a6, &unk_1E0E9B878, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 dilationRates:(id)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = CFSTR("kernelPredictor");
  if (a8)
    v18 = (__CFString *)a8;
  v19 = v18;
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph localConvolutionWithSourceTensor:weightTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](self, "localConvolutionWithSourceTensor:weightTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", v14, v15, a5, v16, v21, objc_msgSend(v22, "integerValue"), v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)stitchedOpsWithBlock:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MPSGraphStitchedOp *v8;
  MPSGraphStitchedOp *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = [MPSGraphStitchedOp alloc];
  v9 = -[MPSGraphStitchedOp initWithGraph:withBlock:inputTensors:controlDependencies:name:](v8, "initWithGraph:withBlock:inputTensors:controlDependencies:name:", self, v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v7);
  -[MPSGraphOperation outputTensors](v9, "outputTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)varFromTensorWithTensor:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MPSGraphVariableFromTensorOp *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[MPSGraphVariableFromTensorOp initWithGraph:tensor:name:]([MPSGraphVariableFromTensorOp alloc], "initWithGraph:tensor:name:", self, v6, v7);
  -[MPSGraphOperation outputTensors](v8, "outputTensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");

  -[MPSGraphOperation outputTensors](v8, "outputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MPSGraphTensor)matrixMultiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  MPSGraphTensor *v8;
  MPSGraphTensor *v9;
  NSString *v10;
  MPSGraphMatrixMultiplicationOp *v11;
  void *v12;
  MPSGraphMatrixMultiplicationOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = primaryTensor;
  v9 = secondaryTensor;
  v10 = name;
  v11 = [MPSGraphMatrixMultiplicationOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v11, "initWithGraph:inputTensors:controlDependencies:name:", self, v12, MEMORY[0x1E0C9AA60], v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v15;
}

- (id)matrixMultiplicationPrimaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "stringByAppendingString:", CFSTR("/transpose"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("matMulGrad/transpose");
  }
  -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v12, -1, -2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)

  -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v10, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)matrixMultiplicationSecondaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "stringByAppendingString:", CFSTR("/transpose"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("matMulGrad/transpose");
  }
  -[MPSGraph transposeTensor:dimension:withDimension:name:](self, "transposeTensor:dimension:withDimension:name:", v11, -1, -2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)

  -[MPSGraph matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:](self, "matrixMultiplicationWithPrimaryTensor:secondaryTensor:name:", v16, v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MPSGraphTensor)HammingDistanceWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor resultDataType:(MPSDataType)resultDataType name:(NSString *)name
{
  uint64_t v7;
  MPSGraphTensor *v10;
  MPSGraphTensor *v11;
  NSString *v12;
  MPSGraphHammingDistanceOp *v13;
  void *v14;
  MPSGraphHammingDistanceOp *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = *(_QWORD *)&resultDataType;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = primaryTensor;
  v11 = secondaryTensor;
  v12 = name;
  v13 = [MPSGraphHammingDistanceOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPSGraphHammingDistanceOp initWithGraph:inputTensors:controlDependencies:resultDataType:name:](v13, "initWithGraph:inputTensors:controlDependencies:resultDataType:name:", self, v14, MEMORY[0x1E0C9AA60], v7, v12);

  -[MPSGraphOperation outputTensors](v15, "outputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v17;
}

- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 maskTensor:(id)a6 scale:(float)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  MPSGraphScaledDotProductAttentionOp *v22;
  void *v23;
  MPSGraphScaledDotProductAttentionOp *v24;
  void *v25;
  void *v26;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = v17;
  v20 = v19;
  if (!v19)
  {
    -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1E0E9B950, objc_msgSend(v14, "dataType"), 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", objc_msgSend(v14, "dataType"), a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [MPSGraphScaledDotProductAttentionOp alloc];
  v28[0] = v14;
  v28[1] = v15;
  v28[2] = v16;
  v28[3] = v20;
  v28[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v22, "initWithGraph:inputTensors:controlDependencies:name:", self, v23, MEMORY[0x1E0C9AA60], v18);

  -[MPSGraphOperation outputTensors](v24, "outputTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 scale:(float)a6 name:(id)a7
{
  -[MPSGraph scaledDotProductAttentionWithQueryTensor:keyTensor:valueTensor:maskTensor:scale:name:](self, "scaledDotProductAttentionWithQueryTensor:keyTensor:valueTensor:maskTensor:scale:name:", a3, a4, a5, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MPSGraphQuantizeOp *v16;
  void *v17;
  MPSGraphQuantizeOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v8 = *(_QWORD *)&dataType;
  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, scale);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870920, zeroPoint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [MPSGraphQuantizeOp alloc];
  v22[0] = v12;
  v22[1] = v14;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphQuantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v16, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v17, MEMORY[0x1E0C9AA60], v8, 0, v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8;
  MPSGraphTensor *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MPSGraphDequantizeOp *v16;
  void *v17;
  MPSGraphDequantizeOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v8 = *(_QWORD *)&dataType;
  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = tensor;
  v13 = name;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 268435488, scale);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, zeroPoint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [MPSGraphDequantizeOp alloc];
  v22[0] = v12;
  v22[1] = v14;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v16, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v17, MEMORY[0x1E0C9AA60], v8, 0, v13);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v9;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  void *v15;
  void *v16;

  v9 = *(_QWORD *)&dataType;
  v13 = tensor;
  v14 = scaleTensor;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870920, zeroPoint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:](self, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v13, v14, v15, v9, axis, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v9;
  MPSGraphTensor *v13;
  MPSGraphTensor *v14;
  void *v15;
  void *v16;

  v9 = *(_QWORD *)&dataType;
  v13 = tensor;
  v14 = scaleTensor;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870944, zeroPoint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraph dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:](self, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", v13, v14, v15, v9, axis, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v10;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  NSString *v17;
  MPSGraphQuantizeOp *v18;
  void *v19;
  void *v20;
  MPSGraphQuantizeOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];

  v10 = *(_QWORD *)&dataType;
  v25[3] = *MEMORY[0x1E0C80C00];
  v14 = tensor;
  v15 = scaleTensor;
  v16 = zeroPointTensor;
  v17 = name;
  v18 = [MPSGraphQuantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  v25[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", axis);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphQuantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v18, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v19, MEMORY[0x1E0C9AA60], v10, v20, v17);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v10;
  MPSGraphTensor *v14;
  MPSGraphTensor *v15;
  MPSGraphTensor *v16;
  NSString *v17;
  MPSGraphDequantizeOp *v18;
  void *v19;
  void *v20;
  MPSGraphDequantizeOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];

  v10 = *(_QWORD *)&dataType;
  v25[3] = *MEMORY[0x1E0C80C00];
  v14 = tensor;
  v15 = scaleTensor;
  v16 = zeroPointTensor;
  v17 = name;
  v18 = [MPSGraphDequantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  v25[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", axis);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v18, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v19, MEMORY[0x1E0C9AA60], v10, v20, v17);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSGraphTensor *)v23;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 axis:(int64_t)a8 name:(id)a9
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MPSGraphDequantizeOp *v20;
  void *v21;
  void *v22;
  MPSGraphDequantizeOp *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];

  v10 = *(_QWORD *)&a7;
  v27[4] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = [MPSGraphDequantizeOp alloc];
  v27[0] = v15;
  v27[1] = v16;
  v27[2] = v17;
  v27[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v20, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v21, MEMORY[0x1E0C9AA60], v10, v22, v19);

  -[MPSGraphOperation outputTensors](v23, "outputTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 name:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MPSGraphDequantizeOp *v19;
  void *v20;
  MPSGraphDequantizeOp *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v9 = *(_QWORD *)&a7;
  v25[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = [MPSGraphDequantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  v25[2] = v16;
  v25[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v19, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v20, MEMORY[0x1E0C9AA60], v9, 0, v18);

  -[MPSGraphOperation outputTensors](v21, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)quantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7
{
  -[MPSGraph quantizeTensor:scale:zeroPoint:dataType:name:](self, "quantizeTensor:scale:zeroPoint:dataType:name:", a3, *(_QWORD *)&a6, a7, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7
{
  -[MPSGraph dequantizeTensor:scale:zeroPoint:dataType:name:](self, "dequantizeTensor:scale:zeroPoint:dataType:name:", a3, *(_QWORD *)&a6, a7, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  -[MPSGraph quantizeTensor:scaleTensor:zeroPoint:dataType:axis:name:](self, "quantizeTensor:scaleTensor:zeroPoint:dataType:axis:name:", a3, a4, *(_QWORD *)&a6, a7, a8, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  -[MPSGraph dequantizeTensor:scaleTensor:zeroPoint:dataType:axis:name:](self, "dequantizeTensor:scaleTensor:zeroPoint:dataType:axis:name:", a3, a4, *(_QWORD *)&a6, a7, a8, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  -[MPSGraph quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:](self, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", a3, a4, a5, *(_QWORD *)&a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  -[MPSGraph dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:](self, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:", a3, a4, a5, *(_QWORD *)&a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 name:(id)a5
{
  -[MPSGraph dequantizeTensor:lutTableTensor:name:](self, "dequantizeTensor:lutTableTensor:name:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  -[MPSGraph dequantizeTensor:lutTableTensor:axis:name:](self, "dequantizeTensor:lutTableTensor:axis:name:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dataType:(unsigned int)a6 name:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphDequantizeOp *v16;
  void *v17;
  MPSGraphDequantizeOp *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v8 = *(_QWORD *)&a6;
  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = [MPSGraphDequantizeOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  v22[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v16, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v17, MEMORY[0x1E0C9AA60], v8, 0, v15);

  -[MPSGraphOperation outputTensors](v18, "outputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 dataType:(unsigned int)a5 name:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  MPSGraphDequantizeOp *v14;
  void *v15;
  MPSGraphDequantizeOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v7 = *(_QWORD *)&a5;
  v20[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870920, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MPSGraphDequantizeOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphDequantizeOp initWithGraph:inputTensors:controlDependencies:dataType:axis:name:](v14, "initWithGraph:inputTensors:controlDependencies:dataType:axis:name:", self, v15, MEMORY[0x1E0C9AA60], v7, 0, v12);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphDequantizeLUTOp *v11;
  void *v12;
  MPSGraphDequantizeLUTOp *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MPSGraphDequantizeLUTOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPSGraphDequantizeLUTOp initWithGraph:inputTensors:controlDependencies:axis:name:](v11, "initWithGraph:inputTensors:controlDependencies:axis:name:", self, v12, MEMORY[0x1E0C9AA60], 0, v10);

  -[MPSGraphOperation outputTensors](v13, "outputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPSGraphDequantizeLUTOp *v13;
  void *v14;
  void *v15;
  MPSGraphDequantizeLUTOp *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = [MPSGraphDequantizeLUTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphDequantizeLUTOp initWithGraph:inputTensors:controlDependencies:axis:name:](v13, "initWithGraph:inputTensors:controlDependencies:axis:name:", self, v14, MEMORY[0x1E0C9AA60], v15, v12);

  -[MPSGraphOperation outputTensors](v16, "outputTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
