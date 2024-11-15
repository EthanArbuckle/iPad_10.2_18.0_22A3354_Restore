@implementation MPSGraphConvolution3DDataGradientOp

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
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t *v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t *v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t *Context;
  uint64_t v47;
  char v48;
  mlir::GenericProgramPoint *v49;
  uint64_t v50;
  void *DefiningOp;
  const char *v53;
  int v54;
  const char *v55;
  const char *v56;
  void *v57;
  mlir::Builder *v58;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void *__p[2];
  char v64;
  uint64_t v65;
  const char *v66;
  __int16 v67;
  std::string v68;
  uint64_t v69;
  __int16 v70;
  void **__dst;
  __int128 v72;
  _QWORD v73[4];
  __int16 v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  v11 = v10;
  v74 = 260;
  v73[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x22Cu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v72 = xmmword_181268760;
    qmemcpy(v18, "mps.conv_3d_data_gradient", 25);
    v19 = v18 + 25;
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
    *(_QWORD *)&v72 = v16;
    *((_QWORD *)&v72 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v68);
  v22 = (std::string *)v68.__r_.__value_.__r.__words[0];
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v68;
  v23 = 1;
  HIBYTE(v74) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v73[0] = v22;
    v23 = 3;
  }
  LOBYTE(v74) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v68.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v72) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  v60 = v25;
  if (v64 < 0)
    operator delete(__p[0]);
  v26 = -[MPSGraphConvolution3DOpDescriptor strideInX](self->super._desc, "strideInX");
  v27 = -[MPSGraphConvolution3DOpDescriptor strideInY](self->super._desc, "strideInY");
  v28 = -[MPSGraphConvolution3DOpDescriptor strideInZ](self->super._desc, "strideInZ");
  v29 = (uint64_t *)operator new(0x18uLL);
  *v29 = v26;
  v29[1] = v27;
  v61 = v29;
  v29[2] = v28;
  v30 = -[MPSGraphConvolution3DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v31 = -[MPSGraphConvolution3DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v32 = -[MPSGraphConvolution3DOpDescriptor dilationRateInZ](self->super._desc, "dilationRateInZ");
  v57 = v11;
  v58 = (mlir::Builder *)a3;
  v33 = (uint64_t *)operator new(0x18uLL);
  *v33 = v30;
  v33[1] = v31;
  v33[2] = v32;
  v34 = -[MPSGraphConvolution3DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v35 = -[MPSGraphConvolution3DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v36 = -[MPSGraphConvolution3DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v37 = -[MPSGraphConvolution3DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v38 = -[MPSGraphConvolution3DOpDescriptor paddingFront](self->super._desc, "paddingFront");
  v39 = -[MPSGraphConvolution3DOpDescriptor paddingBack](self->super._desc, "paddingBack");
  v40 = (uint64_t *)operator new(0x30uLL);
  *v40 = v34;
  v40[1] = v35;
  v40[2] = v36;
  v40[3] = v37;
  v40[4] = v38;
  v40[5] = v39;
  v41 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v42 = -[MPSGraphConvolution3DOpDescriptor groups](self->super._desc, "groups");
  v43 = -[MPSGraphConvolution3DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v44 = -[MPSGraphConvolution3DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v45 = -[MPSGraphConvolution3DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v65 = v60;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v65);
  v47 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_3d_data_gradient", (const unsigned __int8 *)0x19, Context);
  if (!v48)
  {
    v70 = 1283;
    v68.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d_data_gradient";
    v69 = 25;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v67 = 259;
    llvm::operator+((uint64_t *)&v68, (uint64_t *)&v66, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v73, v60, v47);
  mlir::mps::Conv3DDataGradientOp::build(v58, (uint64_t)v73, *v41, v41[1], v41[2], v42, v61, 3, v33, 3, v40, 6, v43, v44, v45);
  v49 = mlir::OpBuilder::create(v58, (const mlir::OperationState *)v73);
  if (!v49)
  {
    v53 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v54 = 662;
    v55 = "Casting.h";
    v56 = "dyn_cast";
    goto LABEL_35;
  }
  v50 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv3DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv3DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
  if (!v50)
  {
    v53 = "result && \"builder didn't return the right type\";
    v54 = 497;
    v55 = "Builders.h";
    v56 = "create";
LABEL_35:
    __assert_rtn(v56, v55, v54, v53);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v73);
  if (!*(_DWORD *)(v50 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v62 = v50 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v62);
  operator delete(v40);
  operator delete(v33);
  operator delete(v61);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MPSGraphConvolution3DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphConvolution3DOpDescriptor *desc;
  void *v28;
  void *v30;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v30 = v9;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
  if (v13 == v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    desc = self->super._desc;
    v28 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/convolution3DDataGradient"), v11, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convolution3DWithSourceTensor:weightsTensor:descriptor:name:", v10, v20, desc, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/convolution3DDataGradient/shapeOp"), v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shapeOfTensor:name:", v15, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->super._desc;
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/convolution3DWeightsGradient"), v11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v21, v10, v19, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v19;
  }

  return v26;
}

@end
