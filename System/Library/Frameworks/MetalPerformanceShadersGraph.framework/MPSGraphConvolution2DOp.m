@implementation MPSGraphConvolution2DOp

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
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t *Context;
  uint64_t v38;
  char v39;
  mlir::GenericProgramPoint *v40;
  uint64_t v41;
  uint64_t DefiningOp;
  void *v43;
  const char *v45;
  int v46;
  const char *v47;
  const char *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  mlir::Builder *v55;
  uint64_t v56;
  void *__p[2];
  char v58;
  uint64_t v59;
  const char *v60;
  __int16 v61;
  std::string v62;
  uint64_t v63;
  __int16 v64;
  int8x16_t __dst;
  unint64_t v66;
  _QWORD v67[4];
  __int16 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v49 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  v11 = v49;
  v68 = 260;
  v67[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v67);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x118u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v66) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1681022838;
    __dst.i64[0] = *(_QWORD *)"mps.conv_2d";
    v18 = &__dst.i8[11];
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
    v66 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v66) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v62);
  v21 = (std::string *)v62.__r_.__value_.__r.__words[0];
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v62;
  v22 = 1;
  HIBYTE(v68) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v67[0] = v21;
    v22 = 3;
  }
  LOBYTE(v68) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v67);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v62.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v66) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v66) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  v55 = (mlir::Builder *)a3;
  if (v58 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v26 = -[MPSGraphConvolution2DOpDescriptor groups](self->super._desc, "groups");
  v27 = -[MPSGraphConvolution2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v28 = -[MPSGraphConvolution2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v29 = -[MPSGraphConvolution2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v30 = -[MPSGraphConvolution2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v31 = -[MPSGraphConvolution2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v54 = -[MPSGraphConvolution2DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v52 = v31;
  v53 = v30;
  v32 = -[MPSGraphConvolution2DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v33 = -[MPSGraphConvolution2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v50 = v29;
  v51 = v28;
  v34 = -[MPSGraphConvolution2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v35 = -[MPSGraphConvolution2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v36 = -[MPSGraphConvolution2DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v59 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v59);
  v38 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d", (const unsigned __int8 *)0xB, Context);
  if (!v39)
  {
    v64 = 1283;
    v62.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d";
    v63 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v61 = 259;
    llvm::operator+((uint64_t *)&v62, (uint64_t *)&v60, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v67, v24, v38);
  mlir::mps::Conv2DOp::build(v55, (uint64_t)v67, *v25, v25[1], v26, v27, v51, v50, v53, v52, v54, v32, v33, v34, v35, v36);
  v40 = mlir::OpBuilder::create(v55, (const mlir::OperationState *)v67);
  if (!v40)
  {
    v45 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v46 = 662;
    v47 = "Casting.h";
    v48 = "dyn_cast";
    goto LABEL_36;
  }
  v41 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v40);
  if (!v41)
  {
    v45 = "result && \"builder didn't return the right type\";
    v46 = 497;
    v47 = "Builders.h";
    v48 = "create";
LABEL_36:
    __assert_rtn(v48, v47, v46, v45);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v67);
  if (!*(_DWORD *)(v41 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v56 = v41 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v56);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v43 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v56);

  return v43;
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
  MPSGraphConvolution2DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPSGraphConvolution2DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/convolutionTranspose2DDataGradient/shapeOp"), v10, v29);
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
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@/convolution2DDataGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v36, v21, v19, desc, v26);
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
    objc_msgSend(v20, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v36, v21, v19, v22, v26);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
