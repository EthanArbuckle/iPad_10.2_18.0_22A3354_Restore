@implementation MPSGraphNonZeroOp

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
  const char *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t AttrData;
  uint64_t v38;
  void *__p[2];
  char v41;
  uint64_t v42;
  uint64_t v43[4];
  __int16 v44;
  std::string v45;
  uint64_t v46;
  __int16 v47;
  int8x16_t __dst;
  unint64_t v49;
  _QWORD v50[4];
  __int16 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphNonZeroOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphNonZeroOps.mm", __p);
  v11 = v10;
  v51 = 260;
  v50[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1Cu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v49) = 12;
    strcpy(__dst.i8, "mps.non_zero");
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
    v49 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v49) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v45);
  v20 = (std::string *)v45.__r_.__value_.__r.__words[0];
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v45;
  v21 = 1;
  HIBYTE(v51) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v50[0] = v20;
    v21 = 3;
  }
  LOBYTE(v51) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v50);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v45.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v49) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v49) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v41 < 0)
    operator delete(__p[0]);
  v24 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v42 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v42);
  v26 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.non_zero", (const unsigned __int8 *)0xC, Context);
  if (!v27)
  {
    v47 = 1283;
    v45.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.non_zero";
    v46 = 12;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v44 = 259;
    llvm::operator+((uint64_t *)&v45, v43, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v50, v23, v26);
  mlir::mps::NonZeroOp::build((mlir::UnknownLoc **)a3, (uint64_t)v50, *v24);
  v28 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v50);
  v29 = v28;
  if (!v28)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_43;
  }
  v30 = *((_QWORD *)v28 + 6);
  v31 = *(void **)(v30 + 16);
  if (v31 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v30 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v38 == 12 && *(_QWORD *)AttrData == 0x5F6E6F6E2E73706DLL && *(_DWORD *)(AttrData + 8) == 1869768058)
    {
      v47 = 1283;
      v45.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v45.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.non_zero";
      v46 = 12;
      v43[0] = (uint64_t)"' failed due to the operation not being registered";
      v44 = 259;
      llvm::operator+((uint64_t *)&v45, v43, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_42;
  }
  if (v31 != &mlir::detail::TypeIDResolver<mlir::mps::NonZeroOp,void>::id)
  {
LABEL_42:
    v33 = "result && \"builder didn't return the right type\";
    v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_43:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v50);

  return v29;
}

@end
