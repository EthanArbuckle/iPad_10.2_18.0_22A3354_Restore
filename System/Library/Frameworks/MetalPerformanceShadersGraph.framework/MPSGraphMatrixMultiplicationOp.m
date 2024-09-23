@implementation MPSGraphMatrixMultiplicationOp

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
  unint64_t v25;
  mlir::GenericProgramPoint *v26;
  void *DefiningOp;
  void *v29[2];
  char v30;
  std::string __p;
  int8x16_t __dst;
  unint64_t v33;
  _QWORD v34[4];
  __int16 v35;

  v10 = a7;
  mpsFileLoc("-[MPSGraphMatrixMultiplicationOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMatrixMultiplicationOps.mm", v29);
  v11 = v10;
  v35 = 260;
  v34[0] = v29;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x2Bu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v33) = 10;
    strcpy(__dst.i8, "mps.matmul");
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
    v33 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v33) = v15;
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
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = p_p;
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
    if ((SHIBYTE(v33) & 0x80000000) == 0)
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
  else if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);

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
  v26 = mlir::OpBuilder::create<mlir::mps::MatMulOp,mlir::Value &,mlir::Value &>((mlir::BoolAttr **)a3, v23, v24, v24 + 1);
  if (!*((_DWORD *)v26 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v34[0] = (char *)v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v34);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id WeakRetained;
  id v43;
  void *v44;

  v41 = a3;
  v43 = a4;
  v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@/matMulSecondaryGrad"), v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "matrixMultiplicationSecondaryGradientWithIncomingGradientTensor:primaryTensor:secondaryTensor:name:", v43, v12, v14, v17);
  }
  else
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@/matMulPrimaryGrad"), v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "matrixMultiplicationPrimaryGradientWithIncomingGradientTensor:primaryTensor:secondaryTensor:name:", v43, v12, v14, v17);
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_loadWeakRetained((id *)&self->super._graph);
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v10, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v44, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_loadWeakRetained((id *)&self->super._graph);
  v26 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v10, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reductionSumWithTensor:axesTensor:name:", v44, v24, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_loadWeakRetained((id *)&self->super._graph);
  v31 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v10, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "shapeOfTensor:name:", v41, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_loadWeakRetained((id *)&self->super._graph);
  v36 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v10, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reshapeTensor:withShapeTensor:name:", v29, v34, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

@end
