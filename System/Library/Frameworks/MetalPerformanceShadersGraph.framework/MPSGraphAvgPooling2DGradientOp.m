@implementation MPSGraphAvgPooling2DGradientOp

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
  uint64_t v19;
  MPSGraphTensorNamedDataLayout v20;
  mlir::OpBuilder *v21;
  uint64_t v22;
  uint64_t v23;
  MPSGraphTensorNamedDataLayout v24;
  mlir::OpBuilder *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unsigned int v30;
  char v31;
  char v32;
  uint64_t *Context;
  uint64_t v34;
  char v35;
  mlir::GenericProgramPoint *v36;
  uint64_t v37;
  void *DefiningOp;
  const char *v40;
  int v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *__p[2];
  char v48;
  uint64_t v49;
  const char *v50;
  __int16 v51;
  uint64_t v52[4];
  __int16 v53;
  _BYTE v54[40];
  _QWORD v55[40];

  v55[38] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphAvgPooling2DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgGradientOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x1D3u, v11);
  if (v48 < 0)
    operator delete(__p[0]);
  v13 = -[MPSGraphPooling2DOpDescriptor kernelWidth](self->super._desc, "kernelWidth");
  v14 = -[MPSGraphPooling2DOpDescriptor kernelHeight](self->super._desc, "kernelHeight");
  v15 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v17 = xyValTo4dAttr(v13, v14, v15, (mlir::Builder *)a3, v16);
  v18 = -[MPSGraphPooling2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v19 = -[MPSGraphPooling2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v20 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v44 = xyValTo4dAttr(v18, v19, v20, (mlir::Builder *)a3, v21);
  v45 = v17;
  v22 = -[MPSGraphPooling2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v23 = -[MPSGraphPooling2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v24 = -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v26 = xyValTo4dAttr(v22, v23, v24, (mlir::Builder *)a3, v25);
  v27 = padValTo4dAttr(-[MPSGraphPooling2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft"), -[MPSGraphPooling2DOpDescriptor paddingRight](self->super._desc, "paddingRight"), -[MPSGraphPooling2DOpDescriptor paddingTop](self->super._desc, "paddingTop"), -[MPSGraphPooling2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom"), -[MPSGraphPooling2DOpDescriptor dataLayout](self->super._desc, "dataLayout"), (mlir::OpBuilder *)a3);
  v28 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v29 = v27;
  v30 = -[MPSGraphPooling2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v31 = -[MPSGraphPooling2DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v32 = -[MPSGraphPooling2DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v49 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v49);
  v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_average_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v35)
  {
    v53 = 1283;
    v52[2] = (uint64_t)"mps.pooling_average_gradient";
    v52[3] = 28;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v51 = 259;
    llvm::operator+(v52, (uint64_t *)&v50, (uint64_t)v54);
    llvm::report_fatal_error((llvm::Twine *)v54, 1);
  }
  mlir::OperationState::OperationState(v55, v12, v34);
  mlir::mps::PoolAvgGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v28, v28[1], v45, v44, v26, v30, v29, v31, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v36)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_12;
  }
  v37 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolAvgGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolAvgGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v36);
  if (!v37)
  {
    v40 = "result && \"builder didn't return the right type\";
    v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_12:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*(_DWORD *)(v37 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v46 = v37 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v46);

  return DefiningOp;
}

@end
