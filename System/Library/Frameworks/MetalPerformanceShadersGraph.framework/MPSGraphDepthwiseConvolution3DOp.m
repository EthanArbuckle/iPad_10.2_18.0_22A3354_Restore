@implementation MPSGraphDepthwiseConvolution3DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t StringAttr;
  uint64_t v12;
  const char *v13;
  size_t v14;
  size_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  uint64_t *Context;
  uint64_t v32;
  char v33;
  mlir::GenericProgramPoint *v34;
  uint64_t v35;
  uint64_t DefiningOp;
  void *v37;
  const char *v39;
  int v40;
  const char *v41;
  const char *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *__p[2];
  char v49;
  uint64_t v50;
  const char *v51;
  __int16 v52;
  std::string v53;
  uint64_t v54;
  __int16 v55;
  _BYTE __dst[48];
  _QWORD v57[4];
  __int16 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v43 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution3DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  v46 = v43;
  v58 = 260;
  v57[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0x1C4u, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v46)
  {
    __dst[23] = 21;
    qmemcpy(__dst, "mps.depthwise_conv_3d", 21);
    v17 = &__dst[21];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
  v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v15 = v14;
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v16 = operator new(v18 + 1);
    *(_QWORD *)&__dst[8] = v15;
    *(_QWORD *)&__dst[16] = v19 | 0x8000000000000000;
    *(_QWORD *)__dst = v16;
  }
  else
  {
    __dst[23] = v14;
    v16 = __dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(v16, v13, v15);
LABEL_12:
  v17 = &v16[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)__dst, &v53);
  v20 = (std::string *)v53.__r_.__value_.__r.__words[0];
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v53;
  v21 = 1;
  HIBYTE(v58) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v57[0] = v20;
    v21 = 3;
  }
  LOBYTE(v58) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v23 = mlir::NameLoc::get(v22, v12);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v53.__r_.__value_.__l.__data_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(*(void **)__dst);
LABEL_20:

  if (v49 < 0)
    operator delete(__p[0]);
  v24 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  -[MPSGraphDepthwiseConvolution3DOpDescriptor strides](self->super._desc, "strides");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = nsArrayToAttr(v44, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = nsArrayToAttr(v45, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = nsArrayToAttr(v27, (mlir::Builder *)a3);
  v29 = -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v30 = -[MPSGraphDepthwiseConvolution3DOpDescriptor channelDimensionIndex](self->super._desc, "channelDimensionIndex");
  v50 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v50);
  v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_3d", (const unsigned __int8 *)0x15, Context);
  if (!v33)
  {
    v55 = 1283;
    v53.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d";
    v54 = 21;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v52 = 259;
    llvm::operator+((uint64_t *)&v53, (uint64_t *)&v51, (uint64_t)__dst);
    llvm::report_fatal_error((llvm::Twine *)__dst, 1);
  }
  mlir::OperationState::OperationState(v57, v23, v32);
  mlir::mps::DepthwiseConv3DOp::build((mlir::Builder *)a3, (uint64_t)v57, *v24, v24[1], v25, v26, v28, v29, v30);
  v34 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v57);
  if (!v34)
  {
    v39 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v40 = 662;
    v41 = "Casting.h";
    v42 = "dyn_cast";
    goto LABEL_38;
  }
  v35 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v34);
  if (!v35)
  {
    v39 = "result && \"builder didn't return the right type\";
    v40 = 497;
    v41 = "Builders.h";
    v42 = "create";
LABEL_38:
    __assert_rtn(v42, v41, v40, v39);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v57);
  if (!*(_DWORD *)(v35 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v47 = v35 - 16;

  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v47);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  v57[0] = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  if (v57[0])
    mlir::mps::DepthwiseConv3DOp::verify((mlir::mps::DepthwiseConv3DOp *)v57);
  v37 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v47);

  return v37;
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
  MPSGraphDepthwiseConvolution3DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPSGraphDepthwiseConvolution3DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution3DDataGradient/shapeOp"), v10, v29);
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
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution3DDataGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:", v36, v21, v19, desc, v26);
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
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/convolution3DWeightsGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v36, v21, v19, v22, v26);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
