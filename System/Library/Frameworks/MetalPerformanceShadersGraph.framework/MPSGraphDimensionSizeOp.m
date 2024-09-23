@implementation MPSGraphDimensionSizeOp

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
  unint64_t v25;
  mlir::GenericProgramPoint *v26;
  void *DefiningOp;
  void *v29[2];
  char v30;
  std::string __p;
  _BYTE __dst[24];
  _QWORD v33[4];
  __int16 v34;

  v10 = a7;
  mpsFileLoc("-[MPSGraphDimensionSizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v29);
  v11 = v10;
  v34 = 260;
  v33[0] = v29;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v33);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x552u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.dimension_size");
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
  HIBYTE(v34) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v33[0] = p_p;
    v21 = 3;
  }
  LOBYTE(v34) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v33);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_20:

      if ((v30 & 0x80000000) == 0)
        goto LABEL_21;
LABEL_25:
      operator delete(v29[0]);
      v24 = *(uint64_t **)a5;
      v25 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v25)
        goto LABEL_32;
      goto LABEL_26;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);

  if (v30 < 0)
    goto LABEL_25;
LABEL_21:
  v24 = *(uint64_t **)a5;
  v25 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v25)
LABEL_32:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v25 <= 8)
    goto LABEL_32;
  v26 = mlir::OpBuilder::create<mlir::mps::DimensionSizeOp,mlir::Value &,mlir::Value &>((mlir::OpBuilder *)a3, v23, v24, v24 + 1);
  if (!*((_DWORD *)v26 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v33[0] = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v33);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
