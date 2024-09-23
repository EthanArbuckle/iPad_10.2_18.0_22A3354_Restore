@implementation MPSGraphReductionAndOp

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
  std::string *p_p;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *Context;
  uint64_t v29;
  char v30;
  mlir::GenericProgramPoint *v31;
  mlir::GenericProgramPoint *v32;
  uint64_t v33;
  void *v34;
  void *DefiningOp;
  const char *v37;
  int v38;
  const char *v39;
  const char *v40;
  uint64_t AttrData;
  uint64_t v42;
  BOOL v43;
  char *v45;
  void *v46[2];
  char v47;
  uint64_t v48;
  uint64_t v49[4];
  __int16 v50;
  std::string __p;
  uint64_t v52;
  __int16 v53;
  int8x16_t __dst;
  unint64_t v55;
  _QWORD v56[4];
  __int16 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphReductionAndOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v46);
  v11 = v10;
  v57 = 260;
  v56[0] = v46;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xE5u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v55) = 17;
    LOBYTE(v55) = 100;
    __dst = *(int8x16_t *)"mps.reduction_and";
    v18 = (char *)&v55 + 1;
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
    v55 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v55) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v22 = 1;
  HIBYTE(v57) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v56[0] = p_p;
    v22 = 3;
  }
  LOBYTE(v57) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v55) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v55) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v47 < 0)
  {
    operator delete(v46[0]);
    v26 = *(uint64_t **)a5;
    v25 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v25 - *(_QWORD *)a5 >= 9)
      goto LABEL_22;
  }
  else
  {
    v26 = *(uint64_t **)a5;
    v25 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v25 - *(_QWORD *)a5 >= 9)
    {
LABEL_22:
      v27 = v26[1];
      goto LABEL_27;
    }
  }
  v27 = 0;
LABEL_27:
  if (v25 == v26)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v48 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.reduction_and", (const unsigned __int8 *)0x11, Context);
  if (!v30)
  {
    v53 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_and";
    v52 = 17;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v50 = 259;
    llvm::operator+((uint64_t *)&__p, v49, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v56, v24, v29);
  mlir::mps::ReductionAndOp::build((mlir::UnitAttr **)a3, (uint64_t)v56, *v26, v27, 1);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v56);
  v32 = v31;
  if (!v31)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_51;
  }
  v33 = *((_QWORD *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v33 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v42 == 17)
    {
      v43 = *(_QWORD *)AttrData == 0x756465722E73706DLL && *(_QWORD *)(AttrData + 8) == 0x6E615F6E6F697463;
      if (v43 && *(_BYTE *)(AttrData + 16) == 100)
      {
        v53 = 1283;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.reduction_and";
        v52 = 17;
        v49[0] = (uint64_t)"' failed due to the operation not being registered";
        v50 = 259;
        llvm::operator+((uint64_t *)&__p, v49, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mps::ReductionAndOp,void>::id)
  {
LABEL_50:
    v37 = "result && \"builder didn't return the right type\";
    v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_51:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v56);
  if (!*((_DWORD *)v32 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v45 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v45);

  return DefiningOp;
}

@end
