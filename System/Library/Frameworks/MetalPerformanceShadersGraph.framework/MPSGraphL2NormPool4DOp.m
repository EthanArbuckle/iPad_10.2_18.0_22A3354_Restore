@implementation MPSGraphL2NormPool4DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
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
  id v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *__p[2];
  char v53;
  uint64_t v54;
  const char *v55;
  __int16 v56;
  std::string v57;
  uint64_t v58;
  __int16 v59;
  _BYTE __dst[48];
  _QWORD v61[4];
  __int16 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v44 = a7;
  mpsFileLoc("-[MPSGraphL2NormPool4DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v11 = v44;
  v62 = 260;
  v61[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x34Bu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 19;
    qmemcpy(__dst, "mps.pooling_l2_norm", 19);
    v18 = &__dst[19];
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v19 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v19 = v15 | 7;
    v20 = v19 + 1;
    v17 = operator new(v19 + 1);
    *(_QWORD *)&__dst[8] = v16;
    *(_QWORD *)&__dst[16] = v20 | 0x8000000000000000;
    *(_QWORD *)__dst = v17;
  }
  else
  {
    __dst[23] = v15;
    v17 = __dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(v17, v14, v16);
LABEL_12:
  v18 = &v17[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v57);
  v21 = (std::string *)v57.__r_.__value_.__r.__words[0];
  if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v57;
  v22 = 1;
  HIBYTE(v62) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v61[0] = v21;
    v22 = 3;
  }
  LOBYTE(v62) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v57.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v53 < 0)
    operator delete(__p[0]);
  v49 = v11;
  -[MPSGraphPooling4DOpDescriptor returnIndicesDataType](self->super._desc, "returnIndicesDataType");
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = nsArrayToAttr(v45, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = nsArrayToAttr(v46, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = nsArrayToAttr(v47, (mlir::Builder *)a3);
  v29 = -[MPSGraphPooling4DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  -[MPSGraphPooling4DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v48 = v29;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = nsArrayToAttr(v50, (mlir::Builder *)a3);
  v31 = -[MPSGraphPooling4DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v32 = -[MPSGraphPooling4DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v54 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v54);
  v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_l2_norm", (const unsigned __int8 *)0x13, Context);
  if (!v35)
  {
    v59 = 1283;
    v57.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.pooling_l2_norm";
    v58 = 19;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v56 = 259;
    llvm::operator+((uint64_t *)&v57, (uint64_t *)&v55, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v61, v24, v34);
  mlir::mps::PoolL2NormOp::build((mlir::UnitAttr **)a3, (uint64_t)v61, *v25, v26, v27, v28, v48, v30, v31, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v61);
  if (!v36)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_35;
  }
  v37 = llvm::DefaultDoCastIfPossible<mlir::mps::PoolL2NormOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolL2NormOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v36);
  if (!v37)
  {
    v40 = "result && \"builder didn't return the right type\";
    v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_35:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v61);
  if (!*(_DWORD *)(v37 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v51 = v37 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v51);
  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@/L2NormPool4DGradient"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(WeakRetained, "L2NormPooling4DGradientWithGradientTensor:sourceTensor:descriptor:name:", v10, v9, self->super._desc, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
