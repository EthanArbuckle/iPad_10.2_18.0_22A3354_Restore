@implementation MPSGraphLeakyReLUOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  int8x16_t *p_dst;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *Context;
  uint64_t v26;
  char v27;
  mlir::GenericProgramPoint *v28;
  uint64_t v29;
  void *DefiningOp;
  const char *v32;
  int v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *__p[2];
  char v38;
  uint64_t v39;
  const char *v40;
  __int16 v41;
  std::string v42;
  uint64_t v43;
  __int16 v44;
  int8x16_t __dst;
  unint64_t v46;
  _QWORD v47[4];
  __int16 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphLeakyReLUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", __p);
  v11 = v10;
  v48 = 260;
  v47[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x44u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v46) = 14;
    strcpy(__dst.i8, "mps.leaky_relu");
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v18 = v15 | 7;
    v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v16;
    v46 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v46) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v42);
  v20 = (std::string *)v42.__r_.__value_.__r.__words[0];
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v42;
  v21 = 1;
  HIBYTE(v48) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v47[0] = v20;
    v21 = 3;
  }
  LOBYTE(v48) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v47);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v42.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v46) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v46) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v38 < 0)
    operator delete(__p[0]);
  v24 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v39 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v39);
  v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.leaky_relu", (const unsigned __int8 *)0xE, Context);
  if (!v27)
  {
    v44 = 1283;
    v42.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.leaky_relu";
    v43 = 14;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v41 = 259;
    llvm::operator+((uint64_t *)&v42, (uint64_t *)&v40, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v47, v23, v26);
  mlir::mps::ATan2Op::build((mlir::Float32Type **)a3, (uint64_t)v47, *v24, v24[1]);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v47);
  if (!v28)
  {
    v32 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v33 = 662;
    v34 = "Casting.h";
    v35 = "dyn_cast";
    goto LABEL_35;
  }
  v29 = llvm::DefaultDoCastIfPossible<mlir::mps::LeakyReluOp,mlir::Operation *,llvm::CastInfo<mlir::mps::LeakyReluOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v28);
  if (!v29)
  {
    v32 = "result && \"builder didn't return the right type\";
    v33 = 497;
    v34 = "Builders.h";
    v35 = "create";
LABEL_35:
    __assert_rtn(v35, v34, v33, v32);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v47);
  if (!*(_DWORD *)(v29 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v36 = v29 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v36);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "leakyReLUGradientWithIncomingGradient:sourceTensor:alphaTensor:name:", v10, v9, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
