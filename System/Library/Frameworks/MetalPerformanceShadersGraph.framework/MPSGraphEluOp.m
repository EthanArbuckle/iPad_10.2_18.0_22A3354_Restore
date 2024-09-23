@implementation MPSGraphEluOp

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
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  uint64_t v30;
  void *DefiningOp;
  const char *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *__p[2];
  char v39;
  uint64_t v40;
  const char *v41;
  __int16 v42;
  std::string v43;
  uint64_t v44;
  __int16 v45;
  int8x16_t __dst;
  unint64_t v47;
  _QWORD v48[4];
  __int16 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphEluOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphEluActivationOp.mm", __p);
  v11 = v10;
  v49 = 260;
  v48[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1Du, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v47) = 7;
    qmemcpy(&__dst, "mps.elu", 7);
    v18 = &__dst.i8[7];
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
    v47 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v47) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v21 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v43;
  v22 = 1;
  HIBYTE(v49) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v48[0] = v21;
    v22 = 3;
  }
  LOBYTE(v49) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v47) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v47) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v39 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v40 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.elu", (const unsigned __int8 *)7, Context);
  if (!v28)
  {
    v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.elu";
    v44 = 7;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v24, v27);
  mlir::mps::ATan2Op::build((mlir::Float32Type **)a3, (uint64_t)v48, *v25, v25[1]);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v29)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_35;
  }
  v30 = llvm::DefaultDoCastIfPossible<mlir::mps::EluOp,mlir::Operation *,llvm::CastInfo<mlir::mps::EluOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v33 = "result && \"builder didn't return the right type\";
    v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_35:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*(_DWORD *)(v30 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v37 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  MPSGraph **p_graph;
  id WeakRetained;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  __CFString *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;

  v9 = a3;
  v39 = a4;
  v10 = a6;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);

  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v9 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  p_graph = &self->super._graph;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(WeakRetained, "constantWithScalar:shape:dataType:", &unk_1E0E9B530, objc_msgSend(v9, "dataType"), 0.0);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)&self->super._graph);
  v37 = (void *)v16;
  objc_msgSend(v17, "constantWithScalar:shape:dataType:", &unk_1E0E9B548, objc_msgSend(v9, "dataType"), 1.0);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = objc_loadWeakRetained((id *)&self->super._graph);
  v38 = (void *)v18;
  if (v10)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/lessThanOrEqualTo"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("eluGrad/lessThanOrEqualTo");
  }
  objc_msgSend(v19, "greaterThanWithPrimaryTensor:secondaryTensor:name:", v9, v16, v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  v21 = objc_loadWeakRetained((id *)&self->super._graph);
  -[MPSGraphOperation outputTensors](self, "outputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/negativeRegionGradient"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("eluGrad/negativeRegionGradient");
  }
  objc_msgSend(v21, "additionWithPrimaryTensor:secondaryTensor:name:", v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  v28 = objc_loadWeakRetained((id *)p_graph);
  if (v10)
  {
    v30 = v38;
    v29 = v39;
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/localGradient"));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("eluGrad/localGradient");
    v30 = v38;
    v29 = v39;
  }
  objc_msgSend(v28, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v40, v30, v27, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    v33 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/select"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v33 = objc_loadWeakRetained((id *)p_graph);
    v34 = CFSTR("eluGrad/multiplication");
  }
  objc_msgSend(v33, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v29, v32, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  return v35;
}

@end
