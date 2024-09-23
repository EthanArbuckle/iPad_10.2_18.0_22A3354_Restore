@implementation MPSGraphDequantizeLUTOp

- (MPSGraphDequantizeLUTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphDequantizeLUTOp *v16;

  objc_storeStrong((id *)&self->_axis, a6);
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v15, v14, v13, v12);

  return v16;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t IntegerType;
  id v13;
  uint64_t StringAttr;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *p_p;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  void *DefiningOp;
  void *v31[2];
  char v32;
  uint64_t v33;
  std::string __p;
  _BYTE __dst[24];
  _QWORD v36[4];
  __int16 v37;

  v11 = a7;
  v33 = 0;
  if (self->_axis)
  {
    IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 1);
    v33 = mlir::IntegerAttr::get(IntegerType, -[NSNumber intValue](self->_axis, "intValue"));
  }
  mpsFileLoc("-[MPSGraphDequantizeLUTOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphQuantizationOps.mm", v31);
  v13 = v11;
  v37 = 260;
  v36[0] = v31;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  v15 = mlir::FileLineColLoc::get(StringAttr, 0xAAu, 0);
  if (!v15)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v13)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.dequantize_lut");
    goto LABEL_15;
  }
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    v19 = operator new(v20 + 1);
    *(_QWORD *)&__dst[8] = v18;
    *(_QWORD *)&__dst[16] = v21 | 0x8000000000000000;
    *(_QWORD *)__dst = v19;
  }
  else
  {
    __dst[23] = v17;
    v19 = __dst;
    if (!v17)
      goto LABEL_14;
  }
  memmove(v19, v16, v18);
LABEL_14:
  v19[v18] = 0;
LABEL_15:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v23 = 1;
  HIBYTE(v37) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v36[0] = p_p;
    v23 = 3;
  }
  LOBYTE(v37) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  v25 = mlir::NameLoc::get(v24, v15);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_22:

      if ((v32 & 0x80000000) == 0)
        goto LABEL_23;
LABEL_27:
      operator delete(v31[0]);
      v26 = *(uint64_t **)a5;
      v27 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v27)
        goto LABEL_34;
      goto LABEL_28;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete(*(void **)__dst);

  if (v32 < 0)
    goto LABEL_27;
LABEL_23:
  v26 = *(uint64_t **)a5;
  v27 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v27)
LABEL_34:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_28:
  if (v27 <= 8)
    goto LABEL_34;
  v28 = mlir::OpBuilder::create<mlir::mps::DequantizeLUTOp,mlir::Value &,mlir::Value &,mlir::IntegerAttr &>((mlir::UnknownLoc **)a3, v25, v26, v26 + 1, &v33);
  if (!*(_DWORD *)(v28 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v36[0] = v28 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v36);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
