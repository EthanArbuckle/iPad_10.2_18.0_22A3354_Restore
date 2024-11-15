@implementation MPSGraphReadVariableOp

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
  __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *Context;
  uint64_t v28;
  char v29;
  mlir::GenericProgramPoint *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *DefiningOp;
  const char *v36;
  int v37;
  const char *v38;
  const char *v39;
  const char *v40;
  int v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *__p[2];
  char v46;
  uint64_t v47;
  const char *v48;
  __int16 v49;
  std::string v50;
  uint64_t v51;
  __int16 v52;
  int8x16_t __dst;
  unint64_t v54;
  _QWORD v55[4];
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphReadVariableOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  v11 = v10;
  v56 = 260;
  v55[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x10Eu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v54) = 17;
    LOBYTE(v54) = 101;
    __dst = *(int8x16_t *)"mps.read_variable";
    v18 = (char *)&v54 + 1;
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
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v16;
    v54 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v54) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v50);
  v21 = (std::string *)v50.__r_.__value_.__r.__words[0];
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v50;
  v22 = 1;
  HIBYTE(v56) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v21;
    v22 = 3;
  }
  LOBYTE(v56) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v50.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v54) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v54) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v46 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v26 = *(_QWORD *)(*v25 + 8);
  v47 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v47);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.read_variable", (const unsigned __int8 *)0x11, Context);
  if (!v29)
  {
    v52 = 1283;
    v50.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.read_variable";
    v51 = 17;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v49 = 259;
    llvm::operator+((uint64_t *)&v50, (uint64_t *)&v48, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v24, v28);
  mlir::anec::Broadcast::build((uint64_t)a3, (uint64_t)v55, v26 & 0xFFFFFFFFFFFFFFF8, *v25);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v30)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_38;
  }
  v31 = llvm::DefaultDoCastIfPossible<mlir::mps::ReadVariableOp,mlir::Operation *,llvm::CastInfo<mlir::mps::ReadVariableOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v30);
  if (!v31)
  {
    v36 = "result && \"builder didn't return the right type\";
    v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_38:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*(_DWORD *)(v31 + 36))
  {
    v40 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v41 = 984;
    v42 = "Operation.h";
    v43 = "getOpResultImpl";
    goto LABEL_42;
  }
  v32 = *(_QWORD *)(*(_QWORD *)(v31 - 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v32)
  {
    v40 = "abstractType && \"Malformed type storage object.\";
    v41 = 160;
    v42 = "TypeSupport.h";
    v43 = "getAbstractType";
    goto LABEL_42;
  }
  v33 = *(void **)(v32 + 136);
  if (v33 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v33 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v40 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v41 = 566;
    v42 = "Casting.h";
    v43 = "cast";
LABEL_42:
    __assert_rtn(v43, v42, v41, v40);
  }
  v44 = v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v44);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return a4;
}

@end
