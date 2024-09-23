@implementation MPSGraphPermuteOp

- (MPSGraphPermuteOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 permute:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphPermuteOp *v16;

  objc_storeStrong((id *)&self->_permute, a6);
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v15, v14, v13, v12);

  return v16;
}

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
  unint64_t v26;
  uint64_t v27;
  void *DefiningOp;
  void *v30[2];
  char v31;
  std::string __p;
  int8x16_t __dst;
  unint64_t v34;
  _QWORD v35[4];
  __int16 v36;

  v10 = a7;
  mpsFileLoc("-[MPSGraphPermuteOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v30);
  v11 = v10;
  v36 = 260;
  v35[0] = v30;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x107u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v34) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1702131053;
    __dst.i64[0] = *(_QWORD *)"mps.permute";
    v18 = &__dst.i8[11];
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
    v34 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v34) = v15;
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
  HIBYTE(v36) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v35[0] = p_p;
    v22 = 3;
  }
  LOBYTE(v36) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v35);
  v24 = mlir::NameLoc::get(v23, v13);
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
      v25 = *(uint64_t **)a5;
      v26 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
      if (!v26)
        goto LABEL_32;
      goto LABEL_26;
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
  v25 = *(uint64_t **)a5;
  v26 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (!v26)
LABEL_32:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_26:
  if (v26 <= 8)
    goto LABEL_32;
  v27 = mlir::OpBuilder::create<mlir::mps::PermuteOp,mlir::Value &,mlir::Value &>((mlir::OpBuilder *)a3, v24, v25, v25 + 1);
  if (!*(_DWORD *)(v27 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v35[0] = v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v35);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  void *v11;
  size_t v12;
  uint64_t *v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;

  v9 = a4;
  v10 = a6;
  if (a5)
  {
    v11 = 0;
  }
  else
  {
    v12 = -[NSArray count](self->_permute, "count");
    v13 = (uint64_t *)malloc_type_calloc(v12, 8uLL, 0x100004000313F17uLL);
    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](self->_permute, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        v13[(v12 & (v16 >> 63)) + v16] = i;
      }
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
    if (v12)
    {
      v18 = v13;
      do
      {
        v19 = *v18++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v20);

        --v12;
      }
      while (v12);
    }
    free(v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    v22 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@/%@/transposePermute"), v10, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "transposeTensor:permute:name:", v9, v17, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permute, 0);
}

@end
