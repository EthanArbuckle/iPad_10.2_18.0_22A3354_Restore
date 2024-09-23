@implementation MPSGraphTopKOp

- (MPSGraphTopKOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 smallest:(BOOL)a6 name:(id)a7
{
  self->super._smallest = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
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
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  _BOOL4 smallest;
  uint64_t *Context;
  uint64_t v29;
  char v30;
  mlir::GenericProgramPoint *v31;
  void *v32;
  const char *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *__p[2];
  char v39;
  uint64_t v40;
  const char *v41;
  __int16 v42;
  std::string v43;
  uint64_t v44;
  __int16 v45;
  int8x16_t __dst;
  unint64_t v47;
  _QWORD v48[4];
  __int16 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphTopKOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTopKOps.mm", __p);
  v12 = v11;
  v49 = 260;
  v48[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x3Bu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v47) = 9;
    __dst.i8[8] = 107;
    __dst.i64[0] = *(_QWORD *)"mps.top_k";
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
    v47 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v47) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v22 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v43;
  v23 = 1;
  HIBYTE(v49) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v48[0] = v22;
    v23 = 3;
  }
  LOBYTE(v49) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v25 = mlir::NameLoc::get(v24, v14);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v47) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v47) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v39 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  smallest = self->super._smallest;
  v40 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.top_k", (const unsigned __int8 *)9, Context);
  if (!v30)
  {
    v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.top_k";
    v44 = 9;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v25, v29);
  mlir::mps::TopKOp::build((mlir::UnitAttr **)a3, (uint64_t)v48, *v26, v26[1], v26[2], smallest);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v31)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_34;
  }
  v32 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::TopKOp,mlir::Operation *,llvm::CastInfo<mlir::mps::TopKOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v34 = "result && \"builder didn't return the right type\";
    v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_34:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);

  return v32;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = v8;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "topKWithGradientTensor:source:kTensor:name:", v13, v15, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", v18);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v19);

  return v11;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5)
  {
    v13 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[MPSGraphOperation inputTensors](self, "inputTensors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "topKWithGradientTensor:source:kTensor:name:", v11, v10, v16, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end
