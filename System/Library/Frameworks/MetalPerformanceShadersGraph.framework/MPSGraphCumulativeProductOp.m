@implementation MPSGraphCumulativeProductOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  _BOOL4 exclusive;
  _BOOL4 reverse;
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
  _QWORD *AttrData;
  uint64_t v42;
  BOOL v43;
  char *v45;
  void *__p[2];
  char v47;
  uint64_t v48;
  uint64_t v49[4];
  __int16 v50;
  std::string v51;
  uint64_t v52;
  __int16 v53;
  _BYTE __dst[48];
  _QWORD v55[4];
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphCumulativeProductOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCumulativeOps.mm", __p);
  v12 = v11;
  v56 = 260;
  v55[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x4Du, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    strcpy(__dst, "mps.cumulative_product");
    __dst[23] = 22;
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v18 = operator new(v19 + 1);
    *(_QWORD *)&__dst[8] = v17;
    *(_QWORD *)&__dst[16] = v20 | 0x8000000000000000;
    *(_QWORD *)__dst = v18;
  }
  else
  {
    __dst[23] = v16;
    v18 = __dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(v18, v15, v17);
LABEL_12:
  v18[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v51);
  v21 = (std::string *)v51.__r_.__value_.__r.__words[0];
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v51;
  v22 = 1;
  HIBYTE(v56) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v21;
    v22 = 3;
  }
  LOBYTE(v56) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v24 = mlir::NameLoc::get(v23, v14);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v51.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v47 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 != 16 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  exclusive = self->super._exclusive;
  reverse = self->super._reverse;
  v48 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.cumulative_product", (const unsigned __int8 *)0x16, Context);
  if (!v30)
  {
    v53 = 1283;
    v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.cumulative_product";
    v52 = 22;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v50 = 259;
    llvm::operator+((uint64_t *)&v51, v49, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v24, v29);
  mlir::mps::CumulativeProductOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v25, v25[1], exclusive, reverse);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
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
    *(_QWORD *)__dst = *(_QWORD *)(v33 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)__dst);
    if (v42 == 22)
    {
      v43 = *AttrData == 0x756D75632E73706DLL && AttrData[1] == 0x705F65766974616CLL;
      if (v43 && *(_QWORD *)((char *)AttrData + 14) == 0x746375646F72705FLL)
      {
        v53 = 1283;
        v51.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.cumulative_product";
        v52 = 22;
        v49[0] = (uint64_t)"' failed due to the operation not being registered";
        v50 = 259;
        llvm::operator+((uint64_t *)&v51, v49, (uint64_t)__dst);
        llvm::report_fatal_error((llvm::Twine *)__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mps::CumulativeProductOp,void>::id)
  {
LABEL_50:
    v37 = "result && \"builder didn't return the right type\";
    v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_51:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*((_DWORD *)v32 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v45 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v45);

  return DefiningOp;
}

@end
