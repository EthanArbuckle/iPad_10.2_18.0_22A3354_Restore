@implementation MPSGraphAvgPool4DGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t *Context;
  uint64_t v20;
  char v21;
  mlir::GenericProgramPoint *v22;
  uint64_t v23;
  void *DefiningOp;
  const char *v26;
  int v27;
  const char *v28;
  const char *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *__p[2];
  char v38;
  uint64_t v39;
  const char *v40;
  __int16 v41;
  uint64_t v42[4];
  __int16 v43;
  _BYTE v44[40];
  _QWORD v45[40];

  v45[38] = *MEMORY[0x1E0C80C00];
  v30 = a7;
  mpsFileLoc("-[MPSGraphAvgPool4DGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v35 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolAvgGradientOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x2B8u, v30);
  if (v38 < 0)
    operator delete(__p[0]);
  v11 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = nsArrayToAttr(v31, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = nsArrayToAttr(v32, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = nsArrayToAttr(v33, (mlir::Builder *)a3);
  v15 = -[MPSGraphPooling4DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  -[MPSGraphPooling4DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = nsArrayToAttr(v34, (mlir::Builder *)a3);
  v17 = -[MPSGraphPooling4DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v18 = -[MPSGraphPooling4DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v39 = v35;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v39);
  v20 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_average_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v21)
  {
    v43 = 1283;
    v42[2] = (uint64_t)"mps.pooling_average_gradient";
    v42[3] = 28;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v41 = 259;
    llvm::operator+(v42, (uint64_t *)&v40, (uint64_t)v44);
    llvm::report_fatal_error((llvm::Twine *)v44, 1);
  }
  mlir::OperationState::OperationState(v45, v35, v20);
  mlir::mps::PoolAvgGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v45, *v11, v11[1], v12, v13, v14, v15, v16, v17, v18);
  v22 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v45);
  if (!v22)
  {
    v26 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v27 = 662;
    v28 = "Casting.h";
    v29 = "dyn_cast";
    goto LABEL_12;
  }
  v23 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolAvgGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolAvgGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v22);
  if (!v23)
  {
    v26 = "result && \"builder didn't return the right type\";
    v27 = 497;
    v28 = "Builders.h";
    v29 = "create";
LABEL_12:
    __assert_rtn(v29, v28, v27, v26);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v45);
  if (!*(_DWORD *)(v23 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v36 = v23 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v36);
  return DefiningOp;
}

@end
