@implementation MPSGraphStridedSliceUpdateOp

- (MPSGraphStridedSliceUpdateOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 startMask:(unsigned int)a6 endMask:(unsigned int)a7 shrinkAxisMask:(unsigned int)a8 name:(id)a9
{
  self->_begin_mask = a6;
  self->_end_mask = a7;
  self->_shrink_axis_mask = a8;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a9);
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
  void **p_dst;
  char *v19;
  _BYTE *v20;
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
  std::string __p;
  void **__dst;
  __int128 v36;
  _QWORD v37[4];
  __int16 v38;

  v11 = a7;
  mpsFileLoc("-[MPSGraphStridedSliceUpdateOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v32);
  v12 = v11;
  v38 = 260;
  v37[0] = v32;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v37);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x295u, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    v36 = xmmword_18125D370;
    qmemcpy(v19, "mps.strided_slice_update", 24);
    v20 = v19 + 24;
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v21 = v16 | 7;
    v22 = v21 + 1;
    p_dst = (void **)operator new(v21 + 1);
    *(_QWORD *)&v36 = v17;
    *((_QWORD *)&v36 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v36) = v16;
    p_dst = (void **)&__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
LABEL_13:
  *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v24 = 1;
  HIBYTE(v38) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v37[0] = p_p;
    v24 = 3;
  }
  LOBYTE(v38) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v37);
  v26 = mlir::NameLoc::get(v25, v14);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v36) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v33 & 0x80000000) == 0)
        goto LABEL_21;
LABEL_25:
      operator delete(v32[0]);
      v27 = *(uint64_t **)a5;
      v28 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v28)
        goto LABEL_32;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v36) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);

  if (v33 < 0)
    goto LABEL_25;
LABEL_21:
  v27 = *(uint64_t **)a5;
  v28 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v28)
LABEL_32:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v28 <= 0x20)
    goto LABEL_32;
  LOBYTE(__dst) = 0;
  v29 = mlir::OpBuilder::create<mlir::mps::StridedSliceUpdateOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,unsigned int &,unsigned int &,unsigned int &,BOOL>((mlir::Builder *)a3, v26, v27, v27 + 1, v27 + 2, v27 + 3, v27 + 4, &self->_begin_mask, &self->_end_mask, &self->_shrink_axis_mask, (char *)&__dst);
  if (!*(_DWORD *)(v29 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v37[0] = v29 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v37);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
