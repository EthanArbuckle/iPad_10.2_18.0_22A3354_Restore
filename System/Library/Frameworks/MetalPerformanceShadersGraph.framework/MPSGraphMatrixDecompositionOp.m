@implementation MPSGraphMatrixDecompositionOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  void **p_dst;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *Context;
  uint64_t v28;
  char v29;
  mlir::GenericProgramPoint *v30;
  mlir::GenericProgramPoint *v31;
  uint64_t v32;
  void *v33;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  _QWORD *AttrData;
  uint64_t v40;
  void *__p[2];
  char v45;
  uint64_t v46;
  uint64_t v47[4];
  __int16 v48;
  std::string v49;
  uint64_t v50;
  __int16 v51;
  void **__dst;
  __int128 v53;
  _QWORD v54[4];
  __int16 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphMatrixDecompositionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMatrixDecompositionOps.mm", __p);
  v11 = v10;
  v55 = 260;
  v54[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x35u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v53 = xmmword_181286A20;
    qmemcpy(v18, "mps.matrix_decomposition_lu", 27);
    v19 = v18 + 27;
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v20 = v15 | 7;
    v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    *(_QWORD *)&v53 = v16;
    *((_QWORD *)&v53 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v53) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v49);
  v22 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v49;
  v23 = 1;
  HIBYTE(v55) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v54[0] = v22;
    v23 = 3;
  }
  LOBYTE(v55) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v45 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v46 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.matrix_decomposition_lu", (const unsigned __int8 *)0x1B, Context);
  if (!v29)
  {
    v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.matrix_decomposition_lu";
    v50 = 27;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v48 = 259;
    llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v54, v25, v28);
  mlir::mps::MatrixDecompositionLUOp::build((uint64_t *)a3, (uint64_t)v54, *v26);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v54);
  v31 = v30;
  if (!v30)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_49;
  }
  v32 = *((_QWORD *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v32 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v40 == 27
      && *AttrData == 0x7274616D2E73706DLL
      && AttrData[1] == 0x6D6F6365645F7869
      && AttrData[2] == 0x6E6F697469736F70
      && *(_QWORD *)((char *)AttrData + 19) == 0x756C5F6E6F697469)
    {
      v51 = 1283;
      v49.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.matrix_decomposition_lu";
      v50 = 27;
      v47[0] = (uint64_t)"' failed due to the operation not being registered";
      v48 = 259;
      llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_48;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::MatrixDecompositionLUOp,void>::id)
  {
LABEL_48:
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_49:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v54);

  return v31;
}

@end
