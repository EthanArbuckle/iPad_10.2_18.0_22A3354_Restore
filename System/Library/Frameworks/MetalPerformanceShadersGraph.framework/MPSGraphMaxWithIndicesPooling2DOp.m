@implementation MPSGraphMaxWithIndicesPooling2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MPSGraphTensorNamedDataLayout v15;
  mlir::OpBuilder *v16;
  uint64_t v17;
  uint64_t v18;
  MPSGraphTensorNamedDataLayout v19;
  mlir::OpBuilder *v20;
  uint64_t v21;
  uint64_t v22;
  MPSGraphTensorNamedDataLayout v23;
  mlir::OpBuilder *v24;
  uint64_t MLIRElementType;
  uint64_t *v26;
  uint64_t v27;
  MPSGraphPoolingReturnIndicesMode v28;
  unsigned int v29;
  mlir::GenericProgramPoint *v30;
  uint64_t v32;
  unsigned int v33;
  BOOL v34;
  BOOL v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *__p[2];
  char v42;

  v11 = a7;
  mpsFileLoc("-[MPSGraphMaxWithIndicesPooling2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x124u, v11);
  if (v42 < 0)
    operator delete(__p[0]);
  v13 = -[MPSGraphPooling2DOpDescriptor kernelWidth](self->super._desc, "kernelWidth");
  v14 = -[MPSGraphPooling2DOpDescriptor kernelHeight](self->super._desc, "kernelHeight");
  v15 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v40 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  v17 = -[MPSGraphPooling2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v18 = -[MPSGraphPooling2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v19 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v39 = xyValTo4dAttr(v17, v18, v19, (mlir::Builder *)a3, v20);
  v21 = -[MPSGraphPooling2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v22 = -[MPSGraphPooling2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v23 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v38 = xyValTo4dAttr(v21, v22, v23, (mlir::Builder *)a3, v24);
  v37 = padValTo4dAttr(-[MPSGraphPooling2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft"), -[MPSGraphPooling2DOpDescriptor paddingRight](self->super._desc, "paddingRight"), -[MPSGraphPooling2DOpDescriptor paddingTop](self->super._desc, "paddingTop"), -[MPSGraphPooling2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom"), -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout"), (mlir::OpBuilder *)a3);
  MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)-[MPSGraphPooling2DOpDescriptor returnIndicesDataType](self->super._desc, "returnIndicesDataType"));
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v27 = MLIRElementType;
  v36 = -[MPSGraphPooling2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v35 = -[MPSGraphPooling2DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v34 = -[MPSGraphPooling2DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v28 = -[MPSGraphPooling2DOpDescriptor returnIndicesMode](self->super._desc, "returnIndicesMode");
  if (v28 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  else
  {
    v29 = dword_1812917B0[v28];
  }
  v33 = v29;
  v32 = mlir::TypeAttr::get(v27);
  v30 = mlir::OpBuilder::create<mlir::mps::PoolMaxOp,mlir::Value &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::mps::PaddingStyle,mlir::DenseIntElementsAttr &,BOOL,BOOL,mlir::mps::PoolIndicesMode,mlir::TypeAttr>((mlir::UnitAttr **)a3, v12, v26, &v40, &v39, &v38, &v36, &v37, (char *)&v35, (char *)&v34, &v33, &v32);

  return v30;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  MPSGraphTensorNamedDataLayout v9;
  MPSGraphPoolingReturnIndicesMode v10;
  MPSGraphPooling2DOpDescriptor *v11;
  BOOL v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *WeakRetained;
  id v21;
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
  id v33;
  uint64_t v34;
  id v35;
  id v36;

  v8 = a3;
  v35 = a4;
  v36 = a5;
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v9 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v10 = -[MPSGraphPooling2DOpDescriptor returnIndicesMode](self->super._desc, "returnIndicesMode");
  v11 = self->super._desc;
  if (-[MPSGraphPooling2DOpDescriptor dilationRateInX](v11, "dilationRateInX") == 1)
  {
    v12 = -[MPSGraphPooling2DOpDescriptor dilationRateInY](v11, "dilationRateInY") == 1;
    if (v9 == MPSGraphTensorNamedDataLayoutNCHW)
      goto LABEL_3;
  }
  else
  {
    v12 = 0;
    if (v9 == MPSGraphTensorNamedDataLayoutNCHW)
    {
LABEL_3:

      v13 = !v12;
      if (v10 != MPSGraphPoolingReturnIndicesGlobalFlatten2D)
        v13 = 1;
      if ((v13 & 1) != 0)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  if (v9 != MPSGraphTensorNamedDataLayoutNHWC)
  {

LABEL_14:
    v30 = (void *)MEMORY[0x1E0CB3940];
    v29 = (void *)v34;
    -[MPSGraphOperation name](self, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@/%@/maxPoolGrad"), v36, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "maxPooling2DGradientWithGradientTensor:sourceTensor:descriptor:name:", v23, v24, self->super._desc, v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  v14 = !v12;
  if (v10 != MPSGraphPoolingReturnIndicesGlobalFlatten3D)
    v14 = 1;
  if ((v14 & 1) != 0)
    goto LABEL_14;
LABEL_12:
  v15 = (void *)MEMORY[0x1E0CB3940];
  v33 = v8;
  -[MPSGraphOperation name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@/shapeOf"), v36, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@/%@/maxPoolGradWithIndices"), v36, v19);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shapeOfTensor:name:", v22, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation outputTensors](self, "outputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "maxPooling2DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:", v25, v27, v23, self->super._desc, WeakRetained);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v33;
  v29 = (void *)v34;
LABEL_15:

  objc_msgSend(v29, "addObject:", v28);
  return v29;
}

@end
