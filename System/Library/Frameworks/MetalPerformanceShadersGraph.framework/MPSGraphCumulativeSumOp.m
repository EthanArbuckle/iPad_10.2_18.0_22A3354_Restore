@implementation MPSGraphCumulativeSumOp

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
  std::string *p_p;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  mlir::GenericProgramPoint *v26;
  void *DefiningOp;
  id v29;
  void *v30[2];
  char v31;
  std::string __p;
  _BYTE __dst[24];
  _QWORD v34[4];
  __int16 v35;

  v11 = a7;
  mpsFileLoc("-[MPSGraphCumulativeSumOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCumulativeOps.mm", v30);
  v12 = v11;
  v35 = 260;
  v34[0] = v30;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x4Cu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.cumulative_sum");
    goto LABEL_13;
  }
  v29 = v12;
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
  v12 = v29;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v22 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = p_p;
    v22 = 3;
  }
  LOBYTE(v35) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v24 = mlir::NameLoc::get(v23, v14);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_20:

      if ((v31 & 0x80000000) == 0)
        goto LABEL_21;
LABEL_25:
      operator delete(v30[0]);
      if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 == 16)
        goto LABEL_26;
      goto LABEL_31;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);

  if (v31 < 0)
    goto LABEL_25;
LABEL_21:
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 == 16)
    goto LABEL_26;
LABEL_31:
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_26:
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  __dst[0] = self->super._exclusive;
  __p.__r_.__value_.__s.__data_[0] = self->super._reverse;
  v26 = mlir::OpBuilder::create<mlir::mps::CumulativeSumOp,mlir::Value &,mlir::Value &,BOOL,BOOL>((mlir::UnitAttr **)a3, v24, v25, v25 + 1, __dst, (unsigned __int8 *)&__p);
  if (!*((_DWORD *)v26 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v34[0] = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v34);

  return DefiningOp;
}

@end
