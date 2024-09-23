@implementation MPSGraphResizeGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t StringAttr;
  uint64_t v12;
  const char *v13;
  size_t v14;
  size_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  std::string *p_p;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int mode;
  uint64_t v30;
  uint64_t *Context;
  uint64_t v32;
  char v33;
  mlir::GenericProgramPoint *v34;
  mlir::GenericProgramPoint *v35;
  uint64_t v36;
  void *v37;
  void *DefiningOp;
  const char *v40;
  int v41;
  const char *v42;
  const char *v43;
  _QWORD *AttrData;
  uint64_t v45;
  BOOL v46;
  id v48;
  char *v50;
  void *v51[2];
  char v52;
  uint64_t v53;
  uint64_t v54[4];
  __int16 v55;
  std::string __p;
  uint64_t v57;
  __int16 v58;
  _BYTE __dst[48];
  _QWORD v60[4];
  __int16 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v48 = a7;
  mpsFileLoc("-[MPSGraphResizeGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphResizeOps.mm", v51);
  v10 = v48;
  v61 = 260;
  v60[0] = v51;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0xFEu, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v10)
  {
    __dst[23] = 19;
    qmemcpy(__dst, "mps.resize_gradient", 19);
    v17 = &__dst[19];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v15 = v14;
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v16 = operator new(v18 + 1);
    *(_QWORD *)&__dst[8] = v15;
    *(_QWORD *)&__dst[16] = v19 | 0x8000000000000000;
    *(_QWORD *)__dst = v16;
  }
  else
  {
    __dst[23] = v14;
    v16 = __dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(v16, v13, v15);
LABEL_12:
  v17 = &v16[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v21 = 1;
  HIBYTE(v61) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v60[0] = p_p;
    v21 = 3;
  }
  LOBYTE(v61) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  v23 = mlir::NameLoc::get(v22, v12);
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

  if (v52 < 0)
  {
    operator delete(v51[0]);
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((_QWORD *)a5 + 1);
    v26 = (unint64_t)v24 - *(_QWORD *)a5;
    if (v26 == 32)
      goto LABEL_22;
  }
  else
  {
    v25 = *(uint64_t **)a5;
    v24 = (uint64_t *)*((_QWORD *)a5 + 1);
    v26 = (unint64_t)v24 - *(_QWORD *)a5;
    if (v26 == 32)
    {
LABEL_22:
      v28 = v25[2];
      v27 = v25[3];
      goto LABEL_29;
    }
  }
  if (v24 == v25 || v26 <= 8)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v27 = 0;
  v28 = 0;
LABEL_29:
  mode = self->super._mode;
  v30 = mlir::mps::NearestRoundingModeAttr::get(*(mlir::MLIRContext **)a3, self->super._nearestRoundingMode);
  v53 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v53);
  v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.resize_gradient", (const unsigned __int8 *)0x13, Context);
  if (!v33)
  {
    v58 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.resize_gradient";
    v57 = 19;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v55 = 259;
    llvm::operator+((uint64_t *)&__p, v54, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v60, v23, v32);
  mlir::mps::ResizeGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v60, *v25, v25[1], v28, v27, mode, self->super._centerResult, self->super._alignCorners, v30);
  v34 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v60);
  v35 = v34;
  if (!v34)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_51;
  }
  v36 = *((_QWORD *)v34 + 6);
  v37 = *(void **)(v36 + 16);
  if (v37 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(_QWORD *)__dst = *(_QWORD *)(v36 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v45 == 19)
    {
      v46 = *AttrData == 0x697365722E73706DLL && AttrData[1] == 0x69646172675F657ALL;
      if (v46 && *(_QWORD *)((char *)AttrData + 11) == 0x746E656964617267)
      {
        v58 = 1283;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.resize_gradient";
        v57 = 19;
        v54[0] = (uint64_t)"' failed due to the operation not being registered";
        v55 = 259;
        llvm::operator+((uint64_t *)&__p, v54, (uint64_t)__dst);
        llvm::report_fatal_error((llvm::Twine *)__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v37 != &mlir::detail::TypeIDResolver<mlir::mps::ResizeGradientOp,void>::id)
  {
LABEL_50:
    v40 = "result && \"builder didn't return the right type\";
    v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_51:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v60);
  if (!*((_DWORD *)v35 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v50 = (char *)v35 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v50);

  return DefiningOp;
}

@end
