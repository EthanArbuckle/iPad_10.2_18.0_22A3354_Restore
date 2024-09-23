@implementation MPSGraphRankOp

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
  std::string *p_p;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  mlir::GenericProgramPoint *v25;
  void *DefiningOp;
  void *v28[2];
  char v29;
  std::string __p;
  int8x16_t __dst;
  unint64_t v32;
  _QWORD v33[4];
  __int16 v34;

  v10 = a7;
  mpsFileLoc("-[MPSGraphRankOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v28);
  v11 = v10;
  v34 = 260;
  v33[0] = v28;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v33);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x519u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v32) = 8;
    strcpy(__dst.i8, "mps.rank");
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
    v32 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v32) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
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
    if ((SHIBYTE(v32) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v29 & 0x80000000) == 0)
        goto LABEL_21;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v32) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if ((v29 & 0x80000000) == 0)
  {
LABEL_21:
    v24 = *(uint64_t **)a5;
    if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
      goto LABEL_22;
LABEL_27:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
LABEL_26:
  operator delete(v28[0]);
  v24 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    goto LABEL_27;
LABEL_22:
  v25 = mlir::OpBuilder::create<mlir::mps::RankOp,mlir::Value &>((mlir::OpBuilder *)a3, v23, v24);
  if (!*((_DWORD *)v25 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v33[0] = (char *)v25 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v33);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
