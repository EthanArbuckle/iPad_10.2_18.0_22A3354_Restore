@implementation MPSGraphSizeOp

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
  mlir::GenericProgramPoint *v29;
  uint64_t v30;
  void *v31;
  void *DefiningOp;
  const char *v34;
  int v35;
  const char *v36;
  const char *v37;
  _QWORD *AttrData;
  uint64_t v39;
  char *v40;
  void *__p[2];
  char v42;
  uint64_t v43;
  uint64_t v44[4];
  __int16 v45;
  std::string v46;
  uint64_t v47;
  __int16 v48;
  int8x16_t __dst;
  unint64_t v50;
  _QWORD v51[4];
  __int16 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphSizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v11 = v10;
  v52 = 260;
  v51[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v51);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x536u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v50) = 8;
    strcpy(__dst.i8, "mps.size");
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
    v50 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v50) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v46);
  v20 = (std::string *)v46.__r_.__value_.__r.__words[0];
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v46;
  v21 = 1;
  HIBYTE(v52) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v51[0] = v20;
    v21 = 3;
  }
  LOBYTE(v52) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v51);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v46.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v50) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v50) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v42 < 0)
    operator delete(__p[0]);
  v24 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v43 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.size", (const unsigned __int8 *)8, Context);
  if (!v27)
  {
    v48 = 1283;
    v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.size";
    v47 = 8;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v45 = 259;
    llvm::operator+((uint64_t *)&v46, v44, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v51, v23, v26);
  mlir::mps::RankOp::build((uint64_t)a3, (uint64_t)v51, *v24);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v51);
  v29 = v28;
  if (!v28)
  {
    v34 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v35 = 662;
    v36 = "Casting.h";
    v37 = "dyn_cast";
    goto LABEL_41;
  }
  v30 = *((_QWORD *)v28 + 6);
  v31 = *(void **)(v30 + 16);
  if (v31 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v30 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v39 == 8 && *AttrData == 0x657A69732E73706DLL)
    {
      v48 = 1283;
      v46.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v46.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.size";
      v47 = 8;
      v44[0] = (uint64_t)"' failed due to the operation not being registered";
      v45 = 259;
      llvm::operator+((uint64_t *)&v46, v44, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_40;
  }
  if (v31 != &mlir::detail::TypeIDResolver<mlir::mps::SizeOp,void>::id)
  {
LABEL_40:
    v34 = "result && \"builder didn't return the right type\";
    v35 = 497;
    v36 = "Builders.h";
    v37 = "create";
LABEL_41:
    __assert_rtn(v37, v36, v35, v34);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v51);
  if (!*((_DWORD *)v29 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v40 = (char *)v29 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v40);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
