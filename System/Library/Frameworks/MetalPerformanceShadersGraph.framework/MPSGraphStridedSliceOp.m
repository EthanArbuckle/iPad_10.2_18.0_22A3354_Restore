@implementation MPSGraphStridedSliceOp

- (MPSGraphStridedSliceOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 starts:(id)a6 ends:(id)a7 strides:(id)a8 startMask:(unsigned int)a9 endMask:(unsigned int)a10 shrinkAxisMask:(unsigned int)a11 name:(id)a12
{
  NSArray *v18;
  NSArray *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSArray *ends;
  NSArray *v25;
  NSArray *strides;
  MPSGraphStridedSliceOp *v27;
  id v30;

  v30 = a6;
  v18 = (NSArray *)a7;
  v19 = (NSArray *)a8;
  objc_storeStrong((id *)&self->_starts, a6);
  v20 = a12;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  ends = self->_ends;
  self->_ends = v18;
  v25 = v18;

  strides = self->_strides;
  self->_strides = v19;

  self->_begin_mask = a9;
  self->_end_mask = a10;
  self->_shrink_axis_mask = a11;
  v27 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v23, v22, v21, v20);

  return v27;
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
  __int8 *v19;
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
  std::string __p;
  int8x16_t __dst;
  unint64_t v35;
  _QWORD v36[4];
  __int16 v37;

  v11 = a7;
  mpsFileLoc("-[MPSGraphStridedSliceOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v31);
  v12 = v11;
  v37 = 260;
  v36[0] = v31;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v36);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x211u, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v35) = 17;
    LOBYTE(v35) = 101;
    __dst = *(int8x16_t *)"mps.strided_slice";
    v19 = (char *)&v35 + 1;
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v20 = v16 | 7;
    v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v17;
    v35 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v35) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
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
  v25 = mlir::NameLoc::get(v24, v14);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v35) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v32 & 0x80000000) == 0)
        goto LABEL_21;
LABEL_25:
      operator delete(v31[0]);
      v26 = *(uint64_t **)a5;
      v27 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v27)
        goto LABEL_32;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v35) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

  if (v32 < 0)
    goto LABEL_25;
LABEL_21:
  v26 = *(uint64_t **)a5;
  v27 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v27)
LABEL_32:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v27 <= 0x18)
    goto LABEL_32;
  __dst.i8[0] = 0;
  v28 = mlir::OpBuilder::create<mlir::mps::StridedSliceOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,unsigned int &,unsigned int &,unsigned int &,BOOL>((mlir::Builder *)a3, v25, v26, v26 + 1, v26 + 2, v26 + 3, &self->_begin_mask, &self->_end_mask, &self->_shrink_axis_mask, __dst.i8);
  if (!*(_DWORD *)(v28 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v36[0] = v28 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v36);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(WeakRetained, "shapeOfTensor:name:", v9, CFSTR("in shape"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v14, "sliceGradientTensor:fwdInShapeTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", v10, v13, self->_starts, self->_ends, self->_strides, self->_begin_mask, *(_QWORD *)&self->_end_mask, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_ends, 0);
  objc_storeStrong((id *)&self->_starts, 0);
}

@end
