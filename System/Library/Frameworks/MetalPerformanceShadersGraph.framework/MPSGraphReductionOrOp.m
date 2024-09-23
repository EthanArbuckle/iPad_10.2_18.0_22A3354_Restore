@implementation MPSGraphReductionOrOp

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
  uint64_t v18;
  uint64_t v19;
  std::string *p_p;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *Context;
  uint64_t v28;
  char v29;
  mlir::GenericProgramPoint *v30;
  mlir::GenericProgramPoint *v31;
  uint64_t v32;
  void *v33;
  void *DefiningOp;
  const char *v36;
  int v37;
  const char *v38;
  const char *v39;
  _QWORD *AttrData;
  uint64_t v41;
  char *v43;
  void *v44[2];
  char v45;
  uint64_t v46;
  uint64_t v47[4];
  __int16 v48;
  std::string __p;
  uint64_t v50;
  __int16 v51;
  _BYTE __dst[48];
  _QWORD v53[4];
  __int16 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphReductionOrOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v44);
  v11 = v10;
  v54 = 260;
  v53[0] = v44;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xFFu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 16;
    strcpy(__dst, "mps.reduction_or");
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
    v17 = operator new(v18 + 1);
    *(_QWORD *)&__dst[8] = v16;
    *(_QWORD *)&__dst[16] = v19 | 0x8000000000000000;
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
  v17[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v21 = 1;
  HIBYTE(v54) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v53[0] = p_p;
    v21 = 3;
  }
  LOBYTE(v54) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v45 < 0)
  {
    operator delete(v44[0]);
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v24 - *(_QWORD *)a5 >= 9)
      goto LABEL_22;
  }
  else
  {
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v24 - *(_QWORD *)a5 >= 9)
    {
LABEL_22:
      v26 = v25[1];
      goto LABEL_27;
    }
  }
  v26 = 0;
LABEL_27:
  if (v24 == v25)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v46 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.reduction_or", (const unsigned __int8 *)0x10, Context);
  if (!v29)
  {
    v51 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_or";
    v50 = 16;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v48 = 259;
    llvm::operator+((uint64_t *)&__p, v47, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v53, v23, v28);
  mlir::mps::ReductionOrOp::build((mlir::UnitAttr **)a3, (uint64_t)v53, *v25, v26, 1);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v53);
  v31 = v30;
  if (!v30)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_48;
  }
  v32 = *((_QWORD *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(_QWORD *)__dst = *(_QWORD *)(v32 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v41 == 16 && *AttrData == 0x756465722E73706DLL && AttrData[1] == 0x726F5F6E6F697463)
    {
      v51 = 1283;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_or";
      v50 = 16;
      v47[0] = (uint64_t)"' failed due to the operation not being registered";
      v48 = 259;
      llvm::operator+((uint64_t *)&__p, v47, (uint64_t)__dst);
      llvm::report_fatal_error((llvm::Twine *)__dst, 1);
    }
    goto LABEL_47;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::ReductionOrOp,void>::id)
  {
LABEL_47:
    v36 = "result && \"builder didn't return the right type\";
    v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_48:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v53);
  if (!*((_DWORD *)v31 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v43 = (char *)v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

@end
