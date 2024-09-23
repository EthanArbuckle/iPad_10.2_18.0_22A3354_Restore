@implementation MPSGraphConvolution3DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
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
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t *v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t *v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t *Context;
  uint64_t v46;
  char v47;
  uint64_t v48;
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
  int8x16_t __dst;
  unint64_t v72;
  _QWORD v73[4];
  __int16 v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphConvolution3DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  v11 = v10;
  v74 = 260;
  v73[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1F1u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v72) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1681088374;
    __dst.i64[0] = *(_QWORD *)"mps.conv_3d";
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
    v72 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v68);
  v21 = (std::string *)v68.__r_.__value_.__r.__words[0];
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v68;
  v22 = 1;
  HIBYTE(v74) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v73[0] = v21;
    v22 = 3;
  }
  LOBYTE(v74) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
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
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  v60 = v24;
  if (v64 < 0)
    operator delete(__p[0]);
  v25 = -[MPSGraphConvolution3DOpDescriptor strideInX](self->super._desc, "strideInX");
  v26 = -[MPSGraphConvolution3DOpDescriptor strideInY](self->super._desc, "strideInY");
  v27 = -[MPSGraphConvolution3DOpDescriptor strideInZ](self->super._desc, "strideInZ");
  v28 = (uint64_t *)operator new(0x18uLL);
  *v28 = v25;
  v28[1] = v26;
  v61 = v28;
  v28[2] = v27;
  v29 = -[MPSGraphConvolution3DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v30 = -[MPSGraphConvolution3DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v31 = -[MPSGraphConvolution3DOpDescriptor dilationRateInZ](self->super._desc, "dilationRateInZ");
  v57 = v11;
  v58 = (mlir::Builder *)a3;
  v32 = (uint64_t *)operator new(0x18uLL);
  *v32 = v29;
  v32[1] = v30;
  v32[2] = v31;
  v33 = -[MPSGraphConvolution3DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v34 = -[MPSGraphConvolution3DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v35 = -[MPSGraphConvolution3DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v36 = -[MPSGraphConvolution3DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v37 = -[MPSGraphConvolution3DOpDescriptor paddingFront](self->super._desc, "paddingFront");
  v38 = -[MPSGraphConvolution3DOpDescriptor paddingBack](self->super._desc, "paddingBack");
  v39 = (uint64_t *)operator new(0x30uLL);
  *v39 = v33;
  v39[1] = v34;
  v39[2] = v35;
  v39[3] = v36;
  v39[4] = v37;
  v39[5] = v38;
  v40 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v41 = -[MPSGraphConvolution3DOpDescriptor groups](self->super._desc, "groups");
  v42 = -[MPSGraphConvolution3DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v43 = -[MPSGraphConvolution3DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v44 = -[MPSGraphConvolution3DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v65 = v60;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v65);
  v46 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_3d", (const unsigned __int8 *)0xB, Context);
  if (!v47)
  {
    v70 = 1283;
    v68.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_3d";
    v69 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v67 = 259;
    llvm::operator+((uint64_t *)&v68, (uint64_t *)&v66, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v73, v60, v46);
  mlir::mps::Conv3DOp::build(v58, (uint64_t)v73, *v40, v40[1], v41, v61, 3, v48, v32, 3, v39, 6, v42, v43, v44);
  v49 = mlir::OpBuilder::create(v58, (const mlir::OperationState *)v73);
  if (!v49)
  {
    v53 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v54 = 662;
    v55 = "Casting.h";
    v56 = "dyn_cast";
    goto LABEL_35;
  }
  v50 = llvm::DefaultDoCastIfPossible<mlir::mps::Conv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv3DOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
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
  operator delete(v39);
  operator delete(v32);
  operator delete(v61);

  return DefiningOp;
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
  MPSGraphConvolution3DOpDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPSGraphConvolution3DOpDescriptor *desc;
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
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@/convolution3DDataGradient/shapeOp"), v10, v29);
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
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@/convolution3DDataGradient"), v10, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v36, v21, v19, desc, v26);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](inputTensors, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@/convolution3DDataGradient/shapeOp"), v10, v17);
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
    objc_msgSend(v20, "convolution3DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShapeTensor:forwardConvolutionDescriptor:name:", v36, v21, v19, v22, v26);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
