@implementation MPSGraphGRUOp

- (MPSGraphGRUOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphGRUDescriptor *v17;
  MPSGraphGRUDescriptor *desc;
  MPSGraphGRUOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphGRUDescriptor *)objc_msgSend(v15, "copy");
  desc = self->super._desc;
  self->super._desc = v17;

  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
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
  BOOL v25;
  MPSGraphRNNActivation v26;
  int v27;
  MPSGraphRNNActivation v28;
  int v29;
  MPSGraphRNNActivation v30;
  int v31;
  MPSGraphGRUDescriptor *desc;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  mlir::UnitAttr **v37;
  unsigned int v38;
  uint64_t *v39;
  unsigned int v40;
  char v41;
  unsigned __int8 v42;
  uint64_t *Context;
  uint64_t v44;
  char v45;
  mlir::GenericProgramPoint *v46;
  void *v47;
  const char *v49;
  int v50;
  const char *v51;
  const char *v52;
  int v53;
  id v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  void *v59;
  void *__p[2];
  char v61;
  uint64_t v62;
  const char *v63;
  __int16 v64;
  std::string v65;
  uint64_t v66;
  __int16 v67;
  int8x16_t __dst;
  unint64_t v69;
  _QWORD v70[4];
  __int16 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v54 = a7;
  mpsFileLoc("-[MPSGraphGRUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  v11 = v54;
  v71 = 260;
  v70[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x2BFu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v69) = 7;
    qmemcpy(&__dst, "mps.gru", 7);
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
    v69 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v69) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v65);
  v21 = (std::string *)v65.__r_.__value_.__r.__words[0];
  if ((v65.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v65;
  v22 = 1;
  HIBYTE(v71) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v70[0] = v21;
    v22 = 3;
  }
  LOBYTE(v71) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v65.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v69) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v61 < 0)
    operator delete(__p[0]);
  v25 = -[MPSGraphGRUDescriptor training](self->super._desc, "training");
  v26 = -[MPSGraphGRUDescriptor updateGateActivation](self->super._desc, "updateGateActivation");
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v27 = 1;
  else
    v27 = v26;
  v28 = -[MPSGraphGRUDescriptor resetGateActivation](self->super._desc, "resetGateActivation");
  v59 = v11;
  if (v28 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v29 = 1;
  else
    v29 = v28;
  v30 = -[MPSGraphGRUDescriptor outputGateActivation](self->super._desc, "outputGateActivation");
  if (v30 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v31 = 1;
  else
    v31 = v30;
  desc = self->super._desc;
  if (!desc->_hasInitState)
  {
    v33 = 0;
    v34 = 2;
    if (desc->_hasMask)
      goto LABEL_34;
LABEL_41:
    v55 = 0;
    v57 = v31;
    v58 = v29;
    v56 = v27;
    if (desc->_hasBias2)
      goto LABEL_36;
    goto LABEL_42;
  }
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 < 0x18uLL)
  {
    v53 = 717;
    goto LABEL_57;
  }
  v33 = *(_QWORD *)(*(_QWORD *)a5 + 16);
  v34 = 3;
  if (!desc->_hasMask)
    goto LABEL_41;
LABEL_34:
  if (v34 >= (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
  {
    v53 = 721;
    goto LABEL_57;
  }
  v55 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v34++);
  v57 = v31;
  v58 = v29;
  v56 = v27;
  if (desc->_hasBias2)
  {
LABEL_36:
    if (v34 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
    {
      v35 = v25;
      v36 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v34);
      goto LABEL_43;
    }
    v53 = 725;
LABEL_57:
    __assert_rtn("-[MPSGraphGRUOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v53, "inputValues->size() > index");
  }
LABEL_42:
  v35 = v25;
  v36 = 0;
LABEL_43:
  v37 = (mlir::UnitAttr **)a3;
  v38 = -[MPSGraphGRUDescriptor resetGateFirst](desc, "resetGateFirst");
  v39 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v40 = v38;
  v41 = -[MPSGraphGRUDescriptor resetAfter](self->super._desc, "resetAfter");
  v42 = -[MPSGraphGRUDescriptor flipZ](self->super._desc, "flipZ");
  v62 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v62);
  v44 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.gru", (const unsigned __int8 *)7, Context);
  if (!v45)
  {
    v67 = 1283;
    v65.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.gru";
    v66 = 7;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v64 = 259;
    llvm::operator+((uint64_t *)&v65, (uint64_t *)&v63, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v70, v24, v44);
  mlir::mps::GRUOp::build(v37, (uint64_t)v70, *v39, v39[1], v56, v58, v57, v40, v35, v41, v42, v33, v55, v36);
  v46 = mlir::OpBuilder::create((mlir::OpBuilder *)v37, (const mlir::OperationState *)v70);
  if (!v46)
  {
    v49 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v50 = 662;
    v51 = "Casting.h";
    v52 = "dyn_cast";
    goto LABEL_53;
  }
  v47 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::GRUOp,mlir::Operation *,llvm::CastInfo<mlir::mps::GRUOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v46);
  if (!v47)
  {
    v49 = "result && \"builder didn't return the right type\";
    v50 = 497;
    v51 = "Builders.h";
    v52 = "create";
LABEL_53:
    __assert_rtn(v52, v51, v50, v49);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v70);

  return v47;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphGRUDescriptor *v11;
  MPSGraphGRUDescriptor *v12;
  MPSGraphGRUDescriptor *desc;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t i;
  void *v30;
  void *v31;
  char isKindOfClass;
  uint64_t v33;
  MPSGraphGRUDescriptor *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = self->super._desc;
    v37 = v9;
    if (!-[MPSGraphGRUDescriptor training](v11, "training"))
    {
      v12 = (MPSGraphGRUDescriptor *)-[MPSGraphGRUDescriptor copy](self->super._desc, "copy");

      v11 = v12;
      -[MPSGraphGRUDescriptor setTraining:](v12, "setTraining:", 1);
    }
    desc = self->super._desc;
    if (desc->_hasInitState)
    {
      if (-[NSArray count](self->super.super._inputTensors, "count") <= 2)
        __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 769, "_inputTensors.count > index");
      -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 2);
      v14 = objc_claimAutoreleasedReturnValue();
      desc = self->super._desc;
      v15 = 3;
      v39 = (void *)v14;
      if (desc->_hasMask)
      {
LABEL_7:
        if (-[NSArray count](self->super.super._inputTensors, "count") <= v15)
          __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 773, "_inputTensors.count > index");
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v15++);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v10;
        if (self->super._desc->_hasBias2)
          goto LABEL_9;
        goto LABEL_16;
      }
    }
    else
    {
      v39 = 0;
      v15 = 2;
      if (desc->_hasMask)
        goto LABEL_7;
    }
    v16 = 0;
    v36 = v10;
    if (desc->_hasBias2)
    {
LABEL_9:
      if (-[NSArray count](self->super.super._inputTensors, "count") <= v15)
        __assert_rtn("-[MPSGraphGRUOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 777, "_inputTensors.count > index");
      -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    v38 = 0;
LABEL_17:
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    v35 = v11;
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "GRUWithSourceTensor:recurrentWeight:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", v19, v20, 0, 0, v39, v16, v38, v11, CFSTR("GRU fwd"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "GRUGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:outputFwd:stateGradient:inputWeight:bias:initState:mask:secondaryBias:descriptor:name:", v23, v24, v25, v26, v27, 0, 0, 0, v39, v16, v38, v35, v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", i);
        v33 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v33;
      }
      objc_msgSend(v17, "addObject:", v30);

    }
    v10 = v36;
    v9 = v37;
    goto LABEL_23;
  }
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
LABEL_23:

  return v17;
}

@end
