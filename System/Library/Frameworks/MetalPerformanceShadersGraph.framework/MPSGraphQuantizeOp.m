@implementation MPSGraphQuantizeOp

- (MPSGraphQuantizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 axis:(id)a7 name:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphQuantizeOp *v17;

  *(&self->_dataType + 1) = a6;
  objc_storeStrong((id *)&self->_axis, a7);
  v13 = a8;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v16, v15, v14, v13);

  return v17;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t MLIRElementType;
  uint64_t IntegerType;
  id v14;
  uint64_t StringAttr;
  uint64_t v16;
  const char *v17;
  size_t v18;
  size_t v19;
  int8x16_t *p_dst;
  uint64_t v21;
  uint64_t v22;
  std::string *p_p;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  void *DefiningOp;
  void *v32[2];
  char v33;
  uint64_t v34;
  uint64_t v35;
  std::string __p;
  int8x16_t __dst;
  unint64_t v38;
  _QWORD v39[4];
  __int16 v40;

  v11 = a7;
  MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v34 = 0;
  v35 = mlir::TypeAttr::get(MLIRElementType);
  if (self->_axis)
  {
    IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 1);
    v34 = mlir::IntegerAttr::get(IntegerType, -[NSNumber intValue](self->_axis, "intValue"));
  }
  mpsFileLoc("-[MPSGraphQuantizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphQuantizationOps.mm", v32);
  v14 = v11;
  v40 = 260;
  v39[0] = v32;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v39);
  v16 = mlir::FileLineColLoc::get(StringAttr, 0x41u, 0);
  if (!v16)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v14)
  {
    HIBYTE(v38) = 12;
    strcpy(__dst.i8, "mps.quantize");
    goto LABEL_15;
  }
  v17 = (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  v18 = strlen(v17);
  if (v18 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v19 = v18;
  if (v18 >= 0x17)
  {
    v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v21 = v18 | 7;
    v22 = v21 + 1;
    p_dst = (int8x16_t *)operator new(v21 + 1);
    __dst.i64[1] = v19;
    v38 = v22 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v38) = v18;
    p_dst = &__dst;
    if (!v18)
      goto LABEL_14;
  }
  memmove(p_dst, v17, v19);
LABEL_14:
  p_dst->i8[v19] = 0;
LABEL_15:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v24 = 1;
  HIBYTE(v40) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v39[0] = p_p;
    v24 = 3;
  }
  LOBYTE(v40) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v39);
  v26 = mlir::NameLoc::get(v25, v16);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v38) & 0x80000000) == 0)
    {
LABEL_22:

      if ((v33 & 0x80000000) == 0)
        goto LABEL_23;
LABEL_27:
      operator delete(v32[0]);
      v27 = *(uint64_t **)a5;
      v28 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v28)
        goto LABEL_34;
      goto LABEL_28;
    }
  }
  else if ((SHIBYTE(v38) & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete((void *)__dst.i64[0]);

  if (v33 < 0)
    goto LABEL_27;
LABEL_23:
  v27 = *(uint64_t **)a5;
  v28 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v28)
LABEL_34:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_28:
  if (v28 <= 0x10)
    goto LABEL_34;
  v29 = mlir::OpBuilder::create<mlir::mps::QuantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::UnknownLoc **)a3, v26, v27, v27 + 1, v27 + 2, &v35, &v34);
  if (!*(_DWORD *)(v29 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v39[0] = v29 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v39);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
