@implementation MPSGraphSplitOp

- (MPSGraphSplitOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(int64_t)a6 name:(id)a7
{
  self->_dimensionIndex = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
}

- (MPSGraphSplitOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(int64_t)a6 numSplits:(unint64_t)a7 name:(id)a8
{
  self->_dimensionIndex = a6;
  self->_numSplits = a7;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a8);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  int8x16_t *p_dst;
  __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *p_p;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  mlir::GenericProgramPoint *v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  const char *v37;
  uint64_t IntegerType;
  uint64_t v39;
  uint64_t *Context;
  uint64_t v41;
  char v42;
  mlir::GenericProgramPoint *v43;
  const char *v45;
  int v46;
  const char *v47;
  const char *v48;
  void *v49[2];
  char v50;
  uint64_t v51;
  uint64_t v52[4];
  __int16 v53;
  std::string __p;
  uint64_t v55;
  __int16 v56;
  int8x16_t __dst;
  unint64_t v58;
  _QWORD v59[4];
  __int16 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphSplitOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v49);
  v12 = v11;
  v60 = 260;
  v59[0] = v49;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v59);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x5CBu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v58) = 9;
    __dst.i8[8] = 116;
    __dst.i64[0] = *(_QWORD *)"mps.split";
    v19 = &__dst.i8[9];
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v20 = v16 | 7;
    v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v17;
    v58 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v58) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v23 = 1;
  HIBYTE(v60) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v59[0] = p_p;
    v23 = 3;
  }
  LOBYTE(v60) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v59);
  v25 = mlir::NameLoc::get(v24, v14);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v58) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v58) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v50 < 0)
  {
    operator delete(v49[0]);
    v27 = *(uint64_t **)a5;
    v26 = (uint64_t *)*((_QWORD *)a5 + 1);
    v28 = (unint64_t)v26 - *(_QWORD *)a5;
    if (v28 == 24)
      goto LABEL_22;
LABEL_29:
    if (v26 == v27 || v28 <= 8)
      std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
    IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 0);
    v39 = mlir::IntegerAttr::get(IntegerType, self->_numSplits);
    v51 = v25;
    Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v51);
    v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.split", (const unsigned __int8 *)9, Context);
    if (!v42)
    {
      v56 = 1283;
      __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.split";
      v55 = 9;
                        " been added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loade"
                        "d-dependent-whats-up-with-dialects-management";
      v53 = 259;
      llvm::operator+((uint64_t *)&__p, v52, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    mlir::OperationState::OperationState(v59, v25, v41);
    mlir::mps::SplitOp::build((mlir::UnknownLoc **)a3, (uint64_t)v59, *v27, v27[1], 0, v39);
    v43 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v59);
    if (v43)
    {
      v33 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::SplitOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SplitOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v43);
      if (v33)
        goto LABEL_34;
      v45 = "result && \"builder didn't return the right type\";
      v46 = 497;
      v47 = "Builders.h";
      v48 = "create";
    }
    else
    {
      v45 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
      v46 = 662;
      v47 = "Casting.h";
      v48 = "dyn_cast";
    }
    __assert_rtn(v48, v47, v46, v45);
  }
  v27 = *(uint64_t **)a5;
  v26 = (uint64_t *)*((_QWORD *)a5 + 1);
  v28 = (unint64_t)v26 - *(_QWORD *)a5;
  if (v28 != 24)
    goto LABEL_29;
LABEL_22:
  v51 = v25;
  v29 = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v51);
  v30 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.split", (const unsigned __int8 *)9, v29);
  if (!v31)
  {
    v56 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.split";
    v55 = 9;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v53 = 259;
    llvm::operator+((uint64_t *)&__p, v52, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v59, v25, v30);
  mlir::mps::SplitOp::build((mlir::UnknownLoc **)a3, (uint64_t)v59, *v27, v27[1], v27[2], 0);
  v32 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v59);
  if (!v32)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
LABEL_40:
    __assert_rtn(v37, v36, v35, v34);
  }
  v33 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::SplitOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SplitOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v32);
  if (!v33)
  {
    v34 = "result && \"builder didn't return the right type\";
    v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
    goto LABEL_40;
  }
LABEL_34:
  mlir::OperationState::~OperationState((mlir::OperationState *)v59);

  return v33;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *WeakRetained;
  int64_t dimensionIndex;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  dimensionIndex = self->_dimensionIndex;
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@/concat"), v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "concatTensors:dimension:name:", v9, dimensionIndex, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v17);

  while (1)
  {

    v18 = objc_msgSend(v11, "count");
    if (v18 > objc_msgSend(v8, "count"))
      break;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", WeakRetained);
  }

  return v11;
}

@end
