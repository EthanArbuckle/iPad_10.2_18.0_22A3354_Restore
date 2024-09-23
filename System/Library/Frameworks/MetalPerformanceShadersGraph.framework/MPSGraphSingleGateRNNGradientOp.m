@implementation MPSGraphSingleGateRNNGradientOp

- (MPSGraphSingleGateRNNGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphSingleGateRNNDescriptor *v17;
  MPSGraphSingleGateRNNDescriptor *desc;
  MPSGraphSingleGateRNNGradientOp *v19;

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
  void **p_dst;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  MPSGraphRNNActivation v26;
  unsigned int v27;
  MPSGraphSingleGateRNNDescriptor *desc;
  _BOOL4 hasInitState;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *Context;
  uint64_t v37;
  char v38;
  mlir::GenericProgramPoint *v39;
  mlir::GenericProgramPoint *v40;
  uint64_t v41;
  void *v42;
  const char *v44;
  int v45;
  const char *v46;
  const char *v47;
  int v48;
  _QWORD *AttrData;
  uint64_t v50;
  void *__p[2];
  char v56;
  uint64_t v57;
  uint64_t v58[4];
  __int16 v59;
  std::string v60;
  uint64_t v61;
  __int16 v62;
  void **__dst;
  __int128 v64;
  _QWORD v65[4];
  __int16 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphSingleGateRNNGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRNNOps.mm", __p);
  v11 = v10;
  v66 = 260;
  v65[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x178u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v64 = xmmword_181286A20;
    qmemcpy(v18, "mps.singlegate_rnn_gradient", 27);
    v19 = v18 + 27;
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v20 = v15 | 7;
    v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    *(_QWORD *)&v64 = v16;
    *((_QWORD *)&v64 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v64) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v60);
  v22 = (std::string *)v60.__r_.__value_.__r.__words[0];
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v60;
  v23 = 1;
  HIBYTE(v66) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v65[0] = v22;
    v23 = 3;
  }
  LOBYTE(v66) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v60.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v64) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v64) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v56 < 0)
    operator delete(__p[0]);
  v26 = -[MPSGraphSingleGateRNNDescriptor activation](self->super._desc, "activation");
  if (v26 >= (MPSGraphRNNActivationHardSigmoid|MPSGraphRNNActivationRelu))
    v27 = 1;
  else
    v27 = v26;
  desc = self->super._desc;
  hasInitState = desc->_hasInitState;
  v31 = *(uint64_t **)a5;
  v30 = (uint64_t *)*((_QWORD *)a5 + 1);
  v32 = (uint64_t)v30 - *(_QWORD *)a5;
  if (!desc->_hasInitState)
  {
    v33 = 0;
    v34 = 3;
    if (desc->_hasMask)
      goto LABEL_28;
LABEL_34:
    v35 = 0;
    if (v30 == v31)
      goto LABEL_48;
    goto LABEL_35;
  }
  if ((unint64_t)v32 < 0x20)
  {
    v48 = 385;
    goto LABEL_47;
  }
  v33 = v31[3];
  v34 = 4;
  if (!desc->_hasMask)
    goto LABEL_34;
LABEL_28:
  if (v34 >= v32 >> 3)
  {
    v48 = 390;
LABEL_47:
    __assert_rtn("-[MPSGraphSingleGateRNNGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphRNNOps.mm", v48, "inputValues->size() > index");
  }
  v35 = v31[v34];
  if (v30 == v31)
LABEL_48:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
LABEL_35:
  if ((unint64_t)v32 <= 0x10)
    goto LABEL_48;
  v57 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v57);
  v37 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.singlegate_rnn_gradient", (const unsigned __int8 *)0x1B, Context);
  if (!v38)
  {
    v62 = 1283;
    v60.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.singlegate_rnn_gradient";
    v61 = 27;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v59 = 259;
    llvm::operator+((uint64_t *)&v60, v58, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v65, v25, v37);
  mlir::mps::SingleGateRNNGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v65, *v31, v31[1], v31[2], v27, hasInitState, v33, v35);
  v39 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v65);
  v40 = v39;
  if (!v39)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_63;
  }
  v41 = *((_QWORD *)v39 + 6);
  v42 = *(void **)(v41 + 16);
  if (v42 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v41 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v50 == 27
      && *AttrData == 0x676E69732E73706DLL
      && AttrData[1] == 0x725F65746167656CLL
      && AttrData[2] == 0x69646172675F6E6ELL
      && *(_QWORD *)((char *)AttrData + 19) == 0x746E656964617267)
    {
      v62 = 1283;
      v60.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v60.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.singlegate_rnn_gradient";
      v61 = 27;
      v58[0] = (uint64_t)"' failed due to the operation not being registered";
      v59 = 259;
      llvm::operator+((uint64_t *)&v60, v58, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_62;
  }
  if (v42 != &mlir::detail::TypeIDResolver<mlir::mps::SingleGateRNNGradientOp,void>::id)
  {
LABEL_62:
    v44 = "result && \"builder didn't return the right type\";
    v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_63:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v65);

  return v40;
}

@end
