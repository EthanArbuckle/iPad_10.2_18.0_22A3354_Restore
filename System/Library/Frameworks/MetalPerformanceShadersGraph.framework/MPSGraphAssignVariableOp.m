@implementation MPSGraphAssignVariableOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
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
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  void *v30;
  const char *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *__p[2];
  char v37;
  uint64_t v38;
  const char *v39;
  __int16 v40;
  std::string v41;
  uint64_t v42;
  __int16 v43;
  _BYTE __dst[48];
  _QWORD v45[4];
  __int16 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphAssignVariableOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  v11 = v10;
  v46 = 260;
  v45[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v45);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x12Bu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 19;
    qmemcpy(__dst, "mps.assign_variable", 19);
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v41);
  v21 = (std::string *)v41.__r_.__value_.__r.__words[0];
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v41;
  v22 = 1;
  HIBYTE(v46) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v45[0] = v21;
    v22 = 3;
  }
  LOBYTE(v46) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v45);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v37 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v38 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v38);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.assign_variable", (const unsigned __int8 *)0x13, Context);
  if (!v28)
  {
    v43 = 1283;
    v41.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.assign_variable";
    v42 = 19;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v40 = 259;
    llvm::operator+((uint64_t *)&v41, (uint64_t *)&v39, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v45, v24, v27);
  mlir::mps::AssignVariableOp::build((uint64_t)a3, (uint64_t)v45, *v25, v25[1]);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v45);
  if (!v29)
  {
    v32 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v33 = 662;
    v34 = "Casting.h";
    v35 = "dyn_cast";
    goto LABEL_34;
  }
  v30 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::AssignVariableOp,mlir::Operation *,llvm::CastInfo<mlir::mps::AssignVariableOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v32 = "result && \"builder didn't return the right type\";
    v33 = 497;
    v34 = "Builders.h";
    v35 = "create";
LABEL_34:
    __assert_rtn(v35, v34, v33, v32);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v45);

  return v30;
}

@end
