@implementation MPSGraphDepthwiseConvolution2DDataGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  void *v14;
  const char *v15;
  size_t v16;
  size_t v17;
  void **p_dst;
  char *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  std::string *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t *Context;
  uint64_t v41;
  char v42;
  mlir::GenericProgramPoint *v43;
  mlir::GenericProgramPoint *v44;
  uint64_t v45;
  void *v46;
  uint64_t DefiningOp;
  void *v48;
  const char *v50;
  int v51;
  const char *v52;
  const char *v53;
  _QWORD *AttrData;
  uint64_t v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  mlir::Builder *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v66;
  char *v67;
  void *__p[2];
  char v69;
  uint64_t v70;
  uint64_t v71[4];
  __int16 v72;
  std::string v73;
  uint64_t v74;
  __int16 v75;
  void **__dst;
  __int128 v77;
  _QWORD v78[4];
  __int16 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution2DDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  v11 = v10;
  v79 = 260;
  v78[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v78);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xEBu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v19 = (char *)operator new(0x28uLL);
    __dst = (void **)v19;
    v77 = xmmword_181268740;
    qmemcpy(v19, "mps.depthwise_conv_2d_data_gradient", 35);
    v20 = v19 + 35;
    goto LABEL_13;
  }
  v14 = a3;
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
    *(_QWORD *)&v77 = v17;
    *((_QWORD *)&v77 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v77) = v16;
    p_dst = (void **)&__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
  a3 = v14;
LABEL_13:
  *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v73);
  v23 = (std::string *)v73.__r_.__value_.__r.__words[0];
  if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = &v73;
  v24 = 1;
  HIBYTE(v79) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v78[0] = v23;
    v24 = 3;
  }
  LOBYTE(v79) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v78);
  v26 = mlir::NameLoc::get(v25, v13);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v73.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v77) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v77) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v69 < 0)
    operator delete(__p[0]);
  v27 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v28 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v29 = -[MPSGraphDepthwiseConvolution2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v30 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v66 = v11;
  v31 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v32 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v64 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v62 = v30;
  v63 = v29;
  v61 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v33 = v32;
  v34 = v31;
  v60 = (mlir::Builder *)a3;
  v35 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v36 = v28;
  v37 = -[MPSGraphDepthwiseConvolution2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v38 = -[MPSGraphDepthwiseConvolution2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v39 = -[MPSGraphDepthwiseConvolution2DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v70 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v70);
  v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_2d_data_gradient", (const unsigned __int8 *)0x23, Context);
  if (!v42)
  {
    v75 = 1283;
    v73.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d_data_gradient";
    v74 = 35;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v72 = 259;
    llvm::operator+((uint64_t *)&v73, v71, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v78, v26, v41);
  mlir::mps::DepthwiseConv2DDataGradientOp::build(v60, (uint64_t)v78, *v27, v27[1], v27[2], v36, v63, v62, v34, v33, v64, v61, v35, v37, v38, v39);
  v43 = mlir::OpBuilder::create(v60, (const mlir::OperationState *)v78);
  v44 = v43;
  if (!v43)
  {
    v50 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v51 = 662;
    v52 = "Casting.h";
    v53 = "dyn_cast";
    goto LABEL_31;
  }
  v45 = *((_QWORD *)v43 + 6);
  v46 = *(void **)(v45 + 16);
  if (v46 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v45 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 35)
    {
      v56 = *AttrData == 0x747065642E73706DLL && AttrData[1] == 0x6F635F6573697768;
      v57 = v56 && AttrData[2] == 0x61645F64325F766ELL;
      v58 = v57 && AttrData[3] == 0x69646172675F6174;
      if (v58 && *(_QWORD *)((char *)AttrData + 27) == 0x746E656964617267)
      {
        v75 = 1283;
        v73.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v73.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_2d_data_gradient";
        v74 = 35;
        v71[0] = (uint64_t)"' failed due to the operation not being registered";
        v72 = 259;
        llvm::operator+((uint64_t *)&v73, v71, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    v50 = "result && \"builder didn't return the right type\";
    v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
LABEL_31:
    __assert_rtn(v53, v52, v51, v50);
  }
  if (v46 != &mlir::detail::TypeIDResolver<mlir::mps::DepthwiseConv2DDataGradientOp,void>::id)
  {
    v50 = "result && \"builder didn't return the right type\";
    v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
    goto LABEL_31;
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v78);
  if (!*((_DWORD *)v44 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v67 = (char *)v44 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v67);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v48 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v67);

  return v48;
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
  MPSGraphDepthwiseConvolution2DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPSGraphDepthwiseConvolution2DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution2DDataGradient"), v11, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "depthwiseConvolution2DWithSourceTensor:weightsTensor:descriptor:name:", v10, v20, desc, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution2DDataGradient/shapeOp"), v11, v17);
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
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@/depthwiseConvolution2DWeightsGradient"), v11, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:descriptor:name:", v21, v10, v19, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v19;
  }

  return v26;
}

@end
