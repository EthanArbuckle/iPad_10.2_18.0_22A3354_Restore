@implementation MPSGraphDepthwiseConvolution2DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  NSUInteger v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t *Context;
  uint64_t v37;
  char v38;
  mlir::GenericProgramPoint *v39;
  uint64_t v40;
  uint64_t DefiningOp;
  void *v42;
  const char *v44;
  int v45;
  const char *v46;
  const char *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  mlir::Builder *v54;
  uint64_t v55;
  void *__p[2];
  char v57;
  uint64_t v58;
  const char *v59;
  __int16 v60;
  std::string v61;
  uint64_t v62;
  __int16 v63;
  _BYTE __dst[48];
  _QWORD v65[4];
  __int16 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v48 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  v11 = v48;
  v66 = 260;
  v65[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xA8u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    __dst[23] = 21;
    qmemcpy(__dst, "mps.depthwise_conv_2d", 21);
    v18 = &__dst[21];
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
    v17 = operator new(v19 + 1);
    *(_QWORD *)&__dst[8] = v16;
    *(_QWORD *)&__dst[16] = v20 | 0x8000000000000000;
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
  v18 = &v17[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v61);
  v21 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v61;
  v22 = 1;
  HIBYTE(v66) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v65[0] = v21;
    v22 = 3;
  }
  LOBYTE(v66) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v65);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  v54 = (mlir::Builder *)a3;
  if (v57 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v26 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v27 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v28 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v53 = v11;
  v29 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v30 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v52 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v51 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v50 = v29;
  v31 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v49 = v28;
  v32 = v26;
  v33 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v34 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v35 = -[MPSGraphDepthwiseConvolution2DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v58 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v58);
  v37 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_2d", (const unsigned __int8 *)0x15, Context);
  if (!v38)
  {
    v63 = 1283;
    v61.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d";
    v62 = 21;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v60 = 259;
    llvm::operator+((uint64_t *)&v61, (uint64_t *)&v59, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v65, v24, v37);
  mlir::mps::DepthwiseConv2DOp::build(v54, (uint64_t)v65, *v25, v25[1], v32, v27, v49, v50, v30, v52, v51, v31, v33, v34, v35);
  v39 = mlir::OpBuilder::create(v54, (const mlir::OperationState *)v65);
  if (!v39)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_36;
  }
  v40 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v39);
  if (!v40)
  {
    v44 = "result && \"builder didn't return the right type\";
    v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_36:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v65);
  if (!*(_DWORD *)(v40 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v55 = v40 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v55);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v42 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v55);

  return v42;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id WeakRetained;
  NSArray *inputTensors;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  MPSGraphDepthwiseConvolution2DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPSGraphDepthwiseConvolution2DOpDescriptor *desc;
  void *v32;
  void *v33;
  void *v35;
  id v36;

  v9 = a3;
  v36 = a4;
  v10 = a6;
  v35 = v9;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
  inputTensors = self->super.super._inputTensors;
  if (v12 == v9)
  {
    -[NSArray objectAtIndexedSubscript:](inputTensors, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution2DDataGradient/shapeOp"), v10, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shapeOfTensor:name:", v27, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    desc = self->super._desc;
    v32 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v36;
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution2DDataGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:", v36, v21, v19, desc, v26);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](inputTensors, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/convolutionTranspose2DDataGradient/shapeOp"), v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shapeOfTensor:name:", v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->super._desc;
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v36;
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/convolution2DWeightsGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v36, v21, v19, v22, v26);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
