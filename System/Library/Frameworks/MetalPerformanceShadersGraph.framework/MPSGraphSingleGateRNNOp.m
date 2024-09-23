@implementation MPSGraphSingleGateRNNOp

- (MPSGraphSingleGateRNNOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphSingleGateRNNDescriptor *v17;
  MPSGraphSingleGateRNNDescriptor *desc;
  MPSGraphSingleGateRNNOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphSingleGateRNNDescriptor *)objc_msgSend(v15, "copy");
  desc = self->super._desc;
  self->super._desc = v17;

  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);
  return v19;
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
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  MPSGraphRNNActivation v25;
  unsigned int v26;
  MPSGraphSingleGateRNNDescriptor *desc;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *Context;
  uint64_t v35;
  char v36;
  mlir::GenericProgramPoint *v37;
  void *v38;
  const char *v40;
  int v41;
  const char *v42;
  const char *v43;
  int v44;
  void *__p[2];
  char v47;
  uint64_t v48;
  const char *v49;
  __int16 v50;
  std::string v51;
  uint64_t v52;
  __int16 v53;
  _BYTE __dst[48];
  _QWORD v55[4];
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphSingleGateRNNOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  v11 = v10;
  v56 = 260;
  v55[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x110u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 18;
    strcpy(__dst, "mps.singlegate_rnn");
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
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v51);
  v20 = (std::string *)v51.__r_.__value_.__r.__words[0];
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v51;
  v21 = 1;
  HIBYTE(v56) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v20;
    v21 = 3;
  }
  LOBYTE(v56) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v51.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v47 < 0)
    operator delete(__p[0]);
  v24 = -[MPSGraphSingleGateRNNDescriptor training](self->super._desc, "training");
  v25 = -[MPSGraphSingleGateRNNDescriptor activation](self->super._desc, "activation");
  if (v25 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v26 = 1;
  else
    v26 = v25;
  desc = self->super._desc;
  v29 = *(uint64_t **)a5;
  v28 = (uint64_t *)*((_QWORD *)a5 + 1);
  if (!desc->_hasInitState)
  {
    v30 = 0;
    v31 = 2;
    if (desc->_hasMask)
      goto LABEL_28;
LABEL_34:
    v33 = 0;
    v32 = (char *)v28 - (char *)v29;
    if (v28 == v29)
      goto LABEL_49;
    goto LABEL_35;
  }
  if ((unint64_t)((char *)v28 - (char *)v29) < 0x18)
  {
    v44 = 282;
    goto LABEL_48;
  }
  v30 = v29[2];
  v31 = 3;
  if (!desc->_hasMask)
    goto LABEL_34;
LABEL_28:
  v32 = (char *)v28 - (char *)v29;
  if (v31 >= v28 - v29)
  {
    v44 = 286;
LABEL_48:
    __assert_rtn("-[MPSGraphSingleGateRNNOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v44, "inputValues->size() > index");
  }
  v33 = v29[v31];
  if (v28 == v29)
LABEL_49:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_35:
  if (v32 <= 8)
    goto LABEL_49;
  v48 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  v35 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.singlegate_rnn", (const unsigned __int8 *)0x12, Context);
  if (!v36)
  {
    v53 = 1283;
    v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.singlegate_rnn";
    v52 = 18;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v50 = 259;
    llvm::operator+((uint64_t *)&v51, (uint64_t *)&v49, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v23, v35);
  mlir::mps::SingleGateRNNOp::build((mlir::UnitAttr **)a3, (uint64_t)v55, *v29, v29[1], v26, v24, v30, v33);
  v37 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  if (!v37)
  {
    v40 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v41 = 662;
    v42 = "Casting.h";
    v43 = "dyn_cast";
    goto LABEL_45;
  }
  v38 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::SingleGateRNNOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SingleGateRNNOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v37);
  if (!v38)
  {
    v40 = "result && \"builder didn't return the right type\";
    v41 = 497;
    v42 = "Builders.h";
    v43 = "create";
LABEL_45:
    __assert_rtn(v43, v42, v41, v40);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);

  return v38;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphSingleGateRNNDescriptor *v11;
  MPSGraphSingleGateRNNDescriptor *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  void *v27;
  char isKindOfClass;
  uint64_t v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = self->super._desc;
    if (!-[MPSGraphSingleGateRNNDescriptor training](v11, "training"))
    {
      v12 = (MPSGraphSingleGateRNNDescriptor *)-[MPSGraphSingleGateRNNDescriptor copy](self->super._desc, "copy");

      v11 = v12;
      -[MPSGraphSingleGateRNNDescriptor setTraining:](v12, "setTraining:", 1);
    }
    if (v11->_hasInitState)
    {
      -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 3;
      v33 = v9;
      v31 = v10;
      if (v11->_hasMask)
      {
LABEL_6:
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {
      v33 = v9;
      v34 = 0;
      v13 = 2;
      v31 = v10;
      if (v11->_hasMask)
        goto LABEL_6;
    }
    v14 = 0;
LABEL_12:
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "singleGateRNNWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:descriptor:name:", v17, v18, 0, 0, v34, v14, v11, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "singleGateRNNGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:inputWeight:bias:initState:mask:descriptor:name:", v20, v21, v22, v23, 0, 0, v34, v14, v11, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", i);
        v29 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v29;
      }
      objc_msgSend(v15, "addObject:", v26);

    }
    v9 = v33;
    v10 = v31;
    goto LABEL_18;
  }
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v15 = 0;
LABEL_18:

  return v15;
}

@end
