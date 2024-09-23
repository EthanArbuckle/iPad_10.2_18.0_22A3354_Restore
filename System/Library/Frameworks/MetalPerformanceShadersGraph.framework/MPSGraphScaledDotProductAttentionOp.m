@implementation MPSGraphScaledDotProductAttentionOp

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
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  mlir::GenericProgramPoint *v30;
  uint64_t v31;
  void *v32;
  void *DefiningOp;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  uint64_t AttrData;
  uint64_t v40;
  char *v42;
  void *__p[2];
  char v44;
  uint64_t v45;
  uint64_t v46[4];
  __int16 v47;
  std::string v48;
  uint64_t v49;
  __int16 v50;
  int8x16_t __dst;
  unint64_t v52;
  _QWORD v53[4];
  __int16 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphScaledDotProductAttentionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMatrixMultiplicationOps.mm", __p);
  v11 = v10;
  v54 = 260;
  v53[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x8Du, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v52) = 9;
    __dst.i8[8] = 97;
    __dst.i64[0] = *(_QWORD *)"mpsx.sdpa";
    v18 = &__dst.i8[9];
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
    v52 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v52) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v48);
  v21 = (std::string *)v48.__r_.__value_.__r.__words[0];
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v48;
  v22 = 1;
  HIBYTE(v54) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v53[0] = v21;
    v22 = 3;
  }
  LOBYTE(v54) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v48.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v52) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v52) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v44 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x20uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v45 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v45);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.sdpa", (const unsigned __int8 *)9, Context);
  if (!v28)
  {
    v50 = 1283;
    v48.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.sdpa";
    v49 = 9;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v47 = 259;
    llvm::operator+((uint64_t *)&v48, v46, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v53, v24, v27);
  mlir::mpsx::ScaledDotProductAttentionOp::build((mlir::Float32Type **)a3, (uint64_t)v53, *v25, v25[1], v25[2], v25[3], v25[4]);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v53);
  v30 = v29;
  if (!v29)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_45;
  }
  v31 = *((_QWORD *)v29 + 6);
  v32 = *(void **)(v31 + 16);
  if (v32 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v31 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v40 == 9 && *(_QWORD *)AttrData == 0x7064732E7873706DLL && *(_BYTE *)(AttrData + 8) == 97)
    {
      v50 = 1283;
      v48.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v48.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.sdpa";
      v49 = 9;
      v46[0] = (uint64_t)"' failed due to the operation not being registered";
      v47 = 259;
      llvm::operator+((uint64_t *)&v48, v46, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v32 != &mlir::detail::TypeIDResolver<mlir::mpsx::ScaledDotProductAttentionOp,void>::id)
  {
LABEL_44:
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_45:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v53);
  if (!*((_DWORD *)v30 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v42 = (char *)v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v42);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
