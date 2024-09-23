@implementation MPSGraphConvolution2DWeightsGradientOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  void *v15;
  const char *v16;
  size_t v17;
  size_t v18;
  void **p_dst;
  char *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  std::string *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  mlir::Builder *v36;
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
  uint64_t AttrData;
  uint64_t v55;
  BOOL v56;
  BOOL v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char *v66;
  void *__p[2];
  char v68;
  uint64_t v69;
  uint64_t v70[4];
  __int16 v71;
  std::string v72;
  uint64_t v73;
  __int16 v74;
  void **__dst;
  __int128 v76;
  _QWORD v77[4];
  __int16 v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphConvolution2DWeightsGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphConvolutionOps.mm", __p);
  v12 = v11;
  v78 = 260;
  v77[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v77);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x19Cu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    v20 = (char *)operator new(0x20uLL);
    __dst = (void **)v20;
    v76 = xmmword_181268750;
    qmemcpy(v20, "mps.conv_2d_weights_gradient", 28);
    v21 = v20 + 28;
    goto LABEL_13;
  }
  v15 = a3;
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v22 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v22 = v17 | 7;
    v23 = v22 + 1;
    p_dst = (void **)operator new(v22 + 1);
    *(_QWORD *)&v76 = v18;
    *((_QWORD *)&v76 + 1) = v23 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v76) = v17;
    p_dst = (void **)&__dst;
    if (!v17)
      goto LABEL_12;
  }
  memmove(p_dst, v16, v18);
LABEL_12:
  a3 = v15;
  v21 = (char *)p_dst + v18;
LABEL_13:
  *v21 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v72);
  v24 = (std::string *)v72.__r_.__value_.__r.__words[0];
  if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = &v72;
  v25 = 1;
  HIBYTE(v78) = 1;
  if (v24->__r_.__value_.__s.__data_[0])
  {
    v77[0] = v24;
    v25 = 3;
  }
  LOBYTE(v78) = v25;
  v26 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v77);
  v27 = mlir::NameLoc::get(v26, v14);
  if (!v27)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v72.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v76) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v76) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  v65 = v12;
  if (v68 < 0)
    operator delete(__p[0]);
  v28 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v29 = -[MPSGraphConvolution2DOpDescriptor groups](self->super._desc, "groups");
  v30 = -[MPSGraphConvolution2DOpDescriptor strideInX](self->super._desc, "strideInX");
  v31 = -[MPSGraphConvolution2DOpDescriptor strideInY](self->super._desc, "strideInY");
  v32 = -[MPSGraphConvolution2DOpDescriptor dilationRateInX](self->super._desc, "dilationRateInX");
  v33 = -[MPSGraphConvolution2DOpDescriptor dilationRateInY](self->super._desc, "dilationRateInY");
  v64 = -[MPSGraphConvolution2DOpDescriptor paddingLeft](self->super._desc, "paddingLeft");
  v63 = v33;
  v62 = -[MPSGraphConvolution2DOpDescriptor paddingRight](self->super._desc, "paddingRight");
  v34 = -[MPSGraphConvolution2DOpDescriptor paddingTop](self->super._desc, "paddingTop");
  v59 = v32;
  v60 = v31;
  v61 = v30;
  v35 = -[MPSGraphConvolution2DOpDescriptor paddingBottom](self->super._desc, "paddingBottom");
  v36 = (mlir::Builder *)a3;
  v37 = -[MPSGraphConvolution2DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v38 = -[MPSGraphConvolution2DOpDescriptor dataLayout](self->super._desc, "dataLayout");
  v39 = -[MPSGraphConvolution2DOpDescriptor weightsLayout](self->super._desc, "weightsLayout");
  v69 = v27;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v69);
  v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.conv_2d_weights_gradient", (const unsigned __int8 *)0x1C, Context);
  if (!v42)
  {
    v74 = 1283;
    v72.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_weights_gradient";
    v73 = 28;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v71 = 259;
    llvm::operator+((uint64_t *)&v72, v70, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v77, v27, v41);
  mlir::mps::Conv2DWeightsGradientOp::build(v36, (uint64_t)v77, *v28, v28[1], v28[2], v29, v61, v60, v59, v63, v64, v62, v34, v35, v37, v38, v39);
  v43 = mlir::OpBuilder::create(v36, (const mlir::OperationState *)v77);
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
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 28)
    {
      v56 = *(_QWORD *)AttrData == 0x766E6F632E73706DLL && *(_QWORD *)(AttrData + 8) == 0x676965775F64325FLL;
      v57 = v56 && *(_QWORD *)(AttrData + 16) == 0x646172675F737468;
      if (v57 && *(_DWORD *)(AttrData + 24) == 1953391977)
      {
        v74 = 1283;
        v72.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v72.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.conv_2d_weights_gradient";
        v73 = 28;
        v70[0] = (uint64_t)"' failed due to the operation not being registered";
        v71 = 259;
        llvm::operator+((uint64_t *)&v72, v70, (uint64_t)&__dst);
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
  if (v46 != &mlir::detail::TypeIDResolver<mlir::mps::Conv2DWeightsGradientOp,void>::id)
  {
    v50 = "result && \"builder didn't return the right type\";
    v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
    goto LABEL_31;
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v77);
  if (!*((_DWORD *)v44 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v66 = (char *)v44 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v66);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  llvm::DefaultDoCastIfPossible<mlir::mps::Conv2DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::Conv2DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  v48 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v66);

  return v48;
}

@end
