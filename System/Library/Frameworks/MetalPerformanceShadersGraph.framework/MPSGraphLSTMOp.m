@implementation MPSGraphLSTMOp

- (MPSGraphLSTMOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphLSTMDescriptor *v17;
  MPSGraphLSTMDescriptor *desc;
  MPSGraphLSTMOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphLSTMDescriptor *)objc_msgSend(v15, "copy");
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
  id v14;
  const char *v15;
  size_t v16;
  size_t v17;
  int8x16_t *p_dst;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  MPSGraphRNNActivation v26;
  unsigned int v27;
  MPSGraphRNNActivation v28;
  int v29;
  MPSGraphRNNActivation v30;
  int v31;
  MPSGraphRNNActivation v32;
  int v33;
  MPSGraphRNNActivation v34;
  int v35;
  MPSGraphLSTMDescriptor *desc;
  unint64_t v37;
  mlir::UnitAttr **v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t *v44;
  unsigned int v45;
  uint64_t *Context;
  uint64_t v47;
  char v48;
  mlir::GenericProgramPoint *v49;
  void *v50;
  const char *v52;
  int v53;
  const char *v54;
  const char *v55;
  int v56;
  id v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  void *__p[2];
  char v65;
  uint64_t v66;
  const char *v67;
  __int16 v68;
  std::string v69;
  uint64_t v70;
  __int16 v71;
  int8x16_t __dst;
  unint64_t v73;
  _QWORD v74[4];
  __int16 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v57 = a7;
  mpsFileLoc("-[MPSGraphLSTMOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  v11 = v57;
  v75 = 260;
  v74[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1BDu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v73) = 8;
    strcpy(__dst.i8, "mps.lstm");
    goto LABEL_13;
  }
  v14 = v11;
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
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
    v73 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v73) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
  v11 = v14;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v69);
  v21 = (std::string *)v69.__r_.__value_.__r.__words[0];
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v69;
  v22 = 1;
  HIBYTE(v75) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v74[0] = v21;
    v22 = 3;
  }
  LOBYTE(v75) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v74);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v69.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v73) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v73) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v65 < 0)
    operator delete(__p[0]);
  v25 = -[MPSGraphLSTMDescriptor training](self->super._desc, "training");
  v26 = -[MPSGraphLSTMDescriptor inputGateActivation](self->super._desc, "inputGateActivation");
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v27 = 1;
  else
    v27 = v26;
  v28 = -[MPSGraphLSTMDescriptor forgetGateActivation](self->super._desc, "forgetGateActivation");
  if (v28 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v29 = 1;
  else
    v29 = v28;
  v30 = -[MPSGraphLSTMDescriptor cellGateActivation](self->super._desc, "cellGateActivation");
  if (v30 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v31 = 1;
  else
    v31 = v30;
  v32 = -[MPSGraphLSTMDescriptor outputGateActivation](self->super._desc, "outputGateActivation");
  if (v32 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v33 = 1;
  else
    v33 = v32;
  v63 = v33;
  v34 = -[MPSGraphLSTMDescriptor activation](self->super._desc, "activation");
  if (v34 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v35 = 1;
  else
    v35 = v34;
  v62 = v35;
  desc = self->super._desc;
  if (!desc->_hasInitState)
  {
    v61 = 0;
    v37 = 2;
    if (desc->_hasInitCell)
      goto LABEL_40;
LABEL_49:
    v58 = 0;
    v59 = v31;
    v60 = v29;
    if (desc->_hasMask)
      goto LABEL_42;
LABEL_50:
    v38 = (mlir::UnitAttr **)a3;
    v39 = 0;
    if (desc->_hasPeephole)
      goto LABEL_44;
    goto LABEL_51;
  }
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 < 0x18uLL)
  {
    v56 = 462;
    goto LABEL_67;
  }
  v61 = *(_QWORD *)(*(_QWORD *)a5 + 16);
  v37 = 3;
  if (!desc->_hasInitCell)
    goto LABEL_49;
LABEL_40:
  if (v37 >= (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
  {
    v56 = 466;
    goto LABEL_67;
  }
  v58 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v37++);
  v59 = v31;
  v60 = v29;
  if (!desc->_hasMask)
    goto LABEL_50;
LABEL_42:
  if (v37 >= (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
  {
    v56 = 470;
    goto LABEL_67;
  }
  v38 = (mlir::UnitAttr **)a3;
  v39 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v37++);
  if (desc->_hasPeephole)
  {
LABEL_44:
    if (v37 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
    {
      v40 = v11;
      v41 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v37);
      goto LABEL_52;
    }
    v56 = 474;
LABEL_67:
    __assert_rtn("-[MPSGraphLSTMOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v56, "inputValues->size() > index");
  }
LABEL_51:
  v40 = v11;
  v41 = 0;
LABEL_52:
  v42 = v25;
  v43 = -[MPSGraphLSTMDescriptor forgetGateLast](desc, "forgetGateLast");
  v44 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v45 = v43;
  v66 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v66);
  v47 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.lstm", (const unsigned __int8 *)8, Context);
  if (!v48)
  {
    v71 = 1283;
    v69.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.lstm";
    v70 = 8;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v68 = 259;
    llvm::operator+((uint64_t *)&v69, (uint64_t *)&v67, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v74, v24, v47);
  mlir::mps::LSTMOp::build(v38, (uint64_t)v74, *v44, v44[1], v27, v60, v59, v63, v62, v45, v42, v61, v58, v39, v41, 0);
  v49 = mlir::OpBuilder::create((mlir::OpBuilder *)v38, (const mlir::OperationState *)v74);
  if (!v49)
  {
    v52 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v53 = 662;
    v54 = "Casting.h";
    v55 = "dyn_cast";
    goto LABEL_62;
  }
  v50 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::LSTMOp,mlir::Operation *,llvm::CastInfo<mlir::mps::LSTMOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
  if (!v50)
  {
    v52 = "result && \"builder didn't return the right type\";
    v53 = 497;
    v54 = "Builders.h";
    v55 = "create";
LABEL_62:
    __assert_rtn(v55, v54, v53, v52);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v74);

  return v50;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPSGraphLSTMDescriptor *v11;
  MPSGraphLSTMDescriptor *desc;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t i;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  MPSGraphLSTMDescriptor *v42;
  void *v43;
  void *v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v40 = v10;
    v42 = self->super._desc;
    if (!-[MPSGraphLSTMDescriptor training](v42, "training"))
    {
      v11 = (MPSGraphLSTMDescriptor *)-[MPSGraphLSTMDescriptor copy](self->super._desc, "copy");

      v42 = v11;
      -[MPSGraphLSTMDescriptor setTraining:](v11, "setTraining:", 1);
    }
    desc = self->super._desc;
    if (desc->_hasInitState)
    {
      if (-[NSArray count](self->super.super._inputTensors, "count") <= 2)
        __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 520, "_inputTensors.count > index");
      -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 2);
      v13 = objc_claimAutoreleasedReturnValue();
      desc = self->super._desc;
      v14 = 3;
      v43 = (void *)v13;
      if (desc->_hasInitCell)
      {
LABEL_7:
        if (-[NSArray count](self->super.super._inputTensors, "count") <= v14)
          __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 524, "_inputTensors.count > index");
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        ++v14;
        desc = self->super._desc;
        v44 = (void *)v15;
        if (desc->_hasMask)
        {
LABEL_9:
          if (-[NSArray count](self->super.super._inputTensors, "count") <= v14)
            __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 528, "_inputTensors.count > index");
          -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v14++);
          v16 = objc_claimAutoreleasedReturnValue();
          if (self->super._desc->_hasPeephole)
            goto LABEL_11;
          goto LABEL_19;
        }
LABEL_18:
        v16 = 0;
        if (desc->_hasPeephole)
        {
LABEL_11:
          if (-[NSArray count](self->super.super._inputTensors, "count") <= v14)
            __assert_rtn("-[MPSGraphLSTMOp partialDerivativesForInputTensors:incomingGradients:name:]", "MPSGraphRNNOps.mm", 532, "_inputTensors.count > index");
          -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", v14);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
LABEL_19:
        v41 = 0;
LABEL_20:
        WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
        v39 = (void *)v16;
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "LSTMWithSourceTensor:recurrentWeight:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", v19, v20, 0, 0, v43, v44, v16, v41, v42, CFSTR("fwd"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v9, "count") < 2
          || (objc_msgSend(v9, "objectAtIndexedSubscript:", 1),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v22,
              (isKindOfClass & 1) != 0))
        {
          v38 = 0;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v24 = objc_loadWeakRetained((id *)&self->super.super._graph);
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v21;
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:", v25, v26, v27, v28, v30, 0, v38, 0, 0, v43, v44, v39, v41, v42, v40);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
        for (i = 0; i < objc_msgSend(v8, "count"); ++i)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", i);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            objc_msgSend(v31, "objectAtIndexedSubscript:", i);
            v36 = objc_claimAutoreleasedReturnValue();

            v33 = (void *)v36;
          }
          objc_msgSend(v17, "addObject:", v33);

        }
        v10 = v40;
        goto LABEL_30;
      }
    }
    else
    {
      v43 = 0;
      v14 = 2;
      if (desc->_hasInitCell)
        goto LABEL_7;
    }
    v44 = 0;
    if (desc->_hasMask)
      goto LABEL_9;
    goto LABEL_18;
  }
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v17 = 0;
LABEL_30:

  return v17;
}

@end
