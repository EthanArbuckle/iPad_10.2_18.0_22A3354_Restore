@implementation MPSGraphReductionMeanOp

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
  uint64_t *v25;
  uint64_t v26;
  mlir::GenericProgramPoint *v27;
  void *DefiningOp;
  void *v30[2];
  char v31;
  std::string __p;
  _BYTE __dst[24];
  uint64_t v34[4];
  __int16 v35;

  v10 = a7;
  mpsFileLoc("-[MPSGraphReductionMeanOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", v30);
  v11 = v10;
  v35 = 260;
  v34[0] = (uint64_t)v30;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x119u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.reduction_mean");
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
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = (uint64_t)p_p;
    v21 = 3;
  }
  LOBYTE(v35) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
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
      v24 = *(uint64_t **)a5;
      v25 = (uint64_t *)*((_QWORD *)a5 + 1);
      if ((unint64_t)v25 - *(_QWORD *)a5 >= 9)
        goto LABEL_22;
      goto LABEL_26;
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
  v24 = *(uint64_t **)a5;
  v25 = (uint64_t *)*((_QWORD *)a5 + 1);
  if ((unint64_t)v25 - *(_QWORD *)a5 >= 9)
  {
LABEL_22:
    v26 = v24[1];
    goto LABEL_27;
  }
LABEL_26:
  v26 = 0;
LABEL_27:
  v34[0] = v26;
  if (v25 == v24)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  __p.__r_.__value_.__s.__data_[0] = 1;
  v27 = mlir::OpBuilder::create<mlir::mps::ReductionMeanOp,mlir::Value &,mlir::Value &,BOOL>((mlir::UnitAttr **)a3, v23, v24, v34, (unsigned __int8 *)&__p);
  if (!*((_DWORD *)v27 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  *(_QWORD *)__dst = (char *)v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  MPSGraph **p_graph;
  id v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  NSArray *axes;
  __CFString *v18;
  void *v19;
  id v20;
  __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  id v27;
  __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  p_graph = &self->super.super._graph;
  v13 = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v13, "shapeOfTensor:name:", v9, CFSTR("ShapeForReductionGrad"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "broadcastTensor:toShapeTensor:name:", v10, v14, CFSTR("Broadcast to input shape"));
  v15 = objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  axes = self->super._axes;
  v33 = (void *)v15;
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("/dimSize"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("meanGrad/dimSize");
  }
  objc_msgSend(WeakRetained, "dimensionSizeOfTensor:axes:name:", v9, axes, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("/reductionProduct"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    v21 = CFSTR("meanGrad/reductionProduct");
  }
  objc_msgSend(v20, "reductionProductWithTensor:axis:name:", v19, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  v23 = objc_loadWeakRetained((id *)p_graph);
  v24 = objc_msgSend(v10, "dataType");
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("/cast"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = CFSTR("meanGrad/cast");
  }
  objc_msgSend(v23, "castTensor:toType:name:", v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    v27 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/reciprocal"));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v27 = objc_loadWeakRetained((id *)p_graph);
    v28 = CFSTR("meanGrad/reciprocal");
  }
  objc_msgSend(v27, "reciprocalWithTensor:name:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  v30 = objc_loadWeakRetained((id *)p_graph);
  objc_msgSend(v30, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v33, v29, v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
