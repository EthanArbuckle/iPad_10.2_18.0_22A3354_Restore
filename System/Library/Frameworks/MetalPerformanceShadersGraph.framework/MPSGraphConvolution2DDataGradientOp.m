@implementation MPSGraphConvolution2DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
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
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t *Context;
  uint64_t v39;
  char v40;
  mlir::GenericProgramPoint *v41;
  uint64_t v42;
  uint64_t DefiningOp;
  void *v44;
  const char *v46;
  int v47;
  const char *v48;
  const char *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  mlir::Builder *v56;
  uint64_t v57;
  void *__p[2];
  char v59;
  uint64_t v60;
  const char *v61;
  __int16 v62;
  std::string v63;
  uint64_t v64;
  __int16 v65;
  void **__dst;
  __int128 v67;
  _QWORD v68[4];
  __int16 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v50 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  v11 = v50;
  v69 = 260;
  v68[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x15Bu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v67 = xmmword_181268760;
    qmemcpy(v18, "mps.conv_2d_data_gradient", 25);
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
    *(_QWORD *)&v67 = v16;
    *((_QWORD *)&v67 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v67) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v63);
  v22 = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v63;
  v23 = 1;
  HIBYTE(v69) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v68[0] = v22;
    v23 = 3;
  }
  LOBYTE(v69) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v67) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v67) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  v56 = (mlir::Builder *)a3;
  if (v59 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v27 = -[MPSGraphConvolution2DOpDescriptor groups](self->super._desc, "groups");
  v28 = -[MPSGraphConvolution2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v29 = -[MPSGraphConvolution2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v30 = -[MPSGraphConvolution2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v31 = -[MPSGraphConvolution2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v32 = -[MPSGraphConvolution2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v55 = -[MPSGraphConvolution2DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v54 = v32;
  v53 = -[MPSGraphConvolution2DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v52 = v31;
  v33 = -[MPSGraphConvolution2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v34 = v30;
  v51 = v29;
  v35 = -[MPSGraphConvolution2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v36 = -[MPSGraphConvolution2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v37 = -[MPSGraphConvolution2DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v60 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v60);
  v39 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d_data_gradient", (const unsigned __int8 *)0x19, Context);
  if (!v40)
  {
    v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_data_gradient";
    v64 = 25;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v62 = 259;
    llvm::operator+((uint64_t *)&v63, (uint64_t *)&v61, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v25, v39);
  mlir::mps::Conv2DDataGradientOp::build(v56, (uint64_t)v68, *v26, v26[1], v26[2], v27, v28, v51, v34, v52, v54, v55, v53, v33, v35, v36, v37);
  v41 = mlir::OpBuilder::create(v56, (const mlir::OperationState *)v68);
  if (!v41)
  {
    v46 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v47 = 662;
    v48 = "Casting.h";
    v49 = "dyn_cast";
    goto LABEL_36;
  }
  v42 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v41);
  if (!v42)
  {
    v46 = "result && \"builder didn't return the right type\";
    v47 = 497;
    v48 = "Builders.h";
    v49 = "create";
LABEL_36:
    __assert_rtn(v49, v48, v47, v46);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*(_DWORD *)(v42 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v57 = v42 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v57);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v44 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v57);

  return v44;
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
  MPSGraphConvolution2DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphConvolution2DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/convolutionTranspose2DDataGradient"), v11, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v10, v20, desc, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/convolutionTranspose2DDataGradient/shapeOp"), v11, v17);
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
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/convolutionTranspose2DWeightsGradient"), v11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v21, v10, v19, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v19;
  }

  return v26;
}

@end
