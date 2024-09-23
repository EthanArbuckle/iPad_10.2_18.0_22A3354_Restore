@implementation MPSGraphAvgPooling2DOp

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
  uint64_t *v25;
  mlir::GenericProgramPoint *v26;
  void *DefiningOp;
  BOOL v29;
  BOOL v30;
  unsigned int v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *__p[2];
  char v38;

  v11 = a7;
  mpsFileLoc("-[MPSGraphAvgPooling2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x165u, v11);
  if (v38 < 0)
    operator delete(__p[0]);
  v13 = -[MPSGraphPooling2DOpDescriptor kernelWidth](self->super._desc, "kernelWidth");
  v14 = -[MPSGraphPooling2DOpDescriptor kernelHeight](self->super._desc, "kernelHeight");
  v15 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v36 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  v17 = -[MPSGraphPooling2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v18 = -[MPSGraphPooling2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v19 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v35 = xyValTo4dAttr(v17, v18, v19, (mlir::Builder *)a3, v20);
  v21 = -[MPSGraphPooling2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v22 = -[MPSGraphPooling2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v23 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v34 = xyValTo4dAttr(v21, v22, v23, (mlir::Builder *)a3, v24);
  v33 = padValTo4dAttr(-[MPSGraphPooling2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft"), -[MPSGraphPooling2DOpDescriptor paddingRight](self->super._desc, "paddingRight"), -[MPSGraphPooling2DOpDescriptor paddingTop](self->super._desc, "paddingTop"), -[MPSGraphPooling2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom"), -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout"), (mlir::OpBuilder *)a3);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v31 = -[MPSGraphPooling2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v30 = -[MPSGraphPooling2DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v29 = -[MPSGraphPooling2DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v26 = mlir::OpBuilder::create<mlir::mps::PoolAvgOp,mlir::Value &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::DenseIntElementsAttr &,mlir::mps::PaddingStyle,mlir::DenseIntElementsAttr &,BOOL,BOOL>((mlir::UnitAttr **)a3, v12, v25, &v36, &v35, &v34, &v31, &v33, (char *)&v30, (char *)&v29);
  if (!*((_DWORD *)v26 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v32 = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v32);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  MPSGraphPooling2DOpDescriptor *desc;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  desc = self->super._desc;
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@/maxPoolGrad"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "avgPooling2DGradientWithGradientTensor:sourceTensor:descriptor:name:", v10, v9, desc, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
