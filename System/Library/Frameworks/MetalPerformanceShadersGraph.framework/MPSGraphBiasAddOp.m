@implementation MPSGraphBiasAddOp

- (MPSGraphBiasAddOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 name:(id)a7
{
  objc_super v8;

  self->_inputLayout = a6;
  v8.receiver = self;
  v8.super_class = (Class)MPSGraphBiasAddOp;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v8, sel_initWithGraph_inputTensors_controlDependencies_name_, a3, a4, a5, a7);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  int8x16_t *p_dst;
  uint64_t v19;
  uint64_t v20;
  std::string *p_p;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *DefiningOp;
  id v29;
  void *v30[2];
  char v31;
  std::string __p;
  int8x16_t __dst;
  unint64_t v34;
  _QWORD v35[4];
  __int16 v36;

  v11 = a7;
  mpsFileLoc("-[MPSGraphBiasAddOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", v30);
  v12 = v11;
  v36 = 260;
  v35[0] = v30;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x77u, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v34) = 12;
    strcpy(__dst.i8, "mps.bias_add");
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
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    v34 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v34) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
  v12 = v29;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v22 = 1;
  HIBYTE(v36) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v35[0] = p_p;
    v22 = 3;
  }
  LOBYTE(v36) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  v24 = mlir::NameLoc::get(v23, v14);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v34) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v31 & 0x80000000) == 0)
        goto LABEL_21;
LABEL_25:
      operator delete(v30[0]);
      if (self->_inputLayout < 2)
        goto LABEL_26;
      goto LABEL_31;
    }
  }
  else if ((SHIBYTE(v34) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if (v31 < 0)
    goto LABEL_25;
LABEL_21:
  if (self->_inputLayout < 2)
    goto LABEL_26;
LABEL_31:
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_26:
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  __dst.i32[0] = self->_inputLayout;
  v26 = mlir::OpBuilder::create<mlir::mps::BiasAddOp,mlir::Value &,mlir::Value &,mlir::mps::TensorDataLayout>((mlir::MLIRContext **)a3, v24, v25, v25 + 1, __dst.i32);
  if (!*(_DWORD *)(v26 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v35[0] = v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v35);

  return DefiningOp;
}

@end
