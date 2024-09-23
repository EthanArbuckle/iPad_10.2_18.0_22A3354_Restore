@implementation MPSGraphDepthwiseConvolution3DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  id v14;
  const char *v15;
  size_t v16;
  size_t v17;
  void **p_dst;
  char *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  std::string *p_p;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  uint64_t *Context;
  uint64_t v36;
  char v37;
  mlir::GenericProgramPoint *v38;
  uint64_t v39;
  void *DefiningOp;
  const char *v42;
  int v43;
  const char *v44;
  const char *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52[2];
  char v53;
  uint64_t v54;
  const char *v55;
  __int16 v56;
  std::string __p;
  uint64_t v58;
  __int16 v59;
  void **__dst;
  __int128 v61;
  _QWORD v62[4];
  __int16 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", v52);
  v11 = v46;
  v63 = 260;
  v62[0] = v52;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1FFu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v19 = (char *)operator new(0x28uLL);
    __dst = (void **)v19;
    v61 = xmmword_181268740;
    qmemcpy(v19, "mps.depthwise_conv_3d_data_gradient", 35);
    v20 = v19 + 35;
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
    v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v21 = v16 | 7;
    v22 = v21 + 1;
    p_dst = (void **)operator new(v21 + 1);
    *(_QWORD *)&v61 = v17;
    *((_QWORD *)&v61 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v61) = v16;
    p_dst = (void **)&__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
  v11 = v14;
LABEL_13:
  *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v24 = 1;
  HIBYTE(v63) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v62[0] = p_p;
    v24 = 3;
  }
  LOBYTE(v63) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  v26 = mlir::NameLoc::get(v25, v13);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v61) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v61) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v53 < 0)
  {
    operator delete(v52[0]);
    v27 = *(uint64_t **)a5;
    v28 = (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3;
    v49 = v11;
    if (v28 == 2)
      goto LABEL_22;
  }
  else
  {
    v27 = *(uint64_t **)a5;
    v28 = (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3;
    v49 = v11;
    if (v28 == 2)
    {
LABEL_22:
      v29 = 0;
      goto LABEL_28;
    }
  }
  if (v28 != 3)
    __assert_rtn("-[MPSGraphDepthwiseConvolution3DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphDepthwiseConvolutionOps.mm", 513, "inputValues->size() == 2 || inputValues->size() == 3");
  v29 = v27[2];
LABEL_28:
  -[MPSGraphDepthwiseConvolution3DOpDescriptor strides](self->super._desc, "strides");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = nsArrayToAttr(v47, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = nsArrayToAttr(v48, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = nsArrayToAttr(v50, (mlir::Builder *)a3);
  v33 = -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v34 = -[MPSGraphDepthwiseConvolution3DOpDescriptor channelDimensionIndex](self->super._desc, "channelDimensionIndex");
  v54 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v54);
  v36 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_3d_data_gradient", (const unsigned __int8 *)0x23, Context);
  if (!v37)
  {
    v59 = 1283;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d_data_gradient";
    v58 = 35;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v56 = 259;
    llvm::operator+((uint64_t *)&__p, (uint64_t *)&v55, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v62, v26, v36);
  mlir::mps::DepthwiseConv3DDataGradientOp::build((mlir::Builder *)a3, (uint64_t)v62, *v27, v27[1], v29, v30, v31, v32, v33, v34);
  v38 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v62);
  if (!v38)
  {
    v42 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v43 = 662;
    v44 = "Casting.h";
    v45 = "dyn_cast";
    goto LABEL_38;
  }
  v39 = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DDataGradientOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DDataGradientOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v38);
  if (!v39)
  {
    v42 = "result && \"builder didn't return the right type\";
    v43 = 497;
    v44 = "Builders.h";
    v45 = "create";
LABEL_38:
    __assert_rtn(v45, v44, v43, v42);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v62);
  if (!*(_DWORD *)(v39 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v51 = v39 - 16;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v51);
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
  MPSGraphDepthwiseConvolution3DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphDepthwiseConvolution3DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution3DDataGradient"), v11, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "depthwiseConvolution3DWithSourceTensor:weightsTensor:descriptor:name:", v10, v20, desc, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution3DDataGradient/shapeOp"), v11, v17);
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
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution3DWeightsGradient"), v11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v21, v10, v19, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v19;
  }

  return v26;
}

@end
