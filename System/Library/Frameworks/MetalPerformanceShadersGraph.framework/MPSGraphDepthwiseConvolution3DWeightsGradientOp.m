@implementation MPSGraphDepthwiseConvolution3DWeightsGradientOp

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
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  uint64_t *Context;
  uint64_t v34;
  char v35;
  mlir::GenericProgramPoint *v36;
  mlir::GenericProgramPoint *v37;
  uint64_t v38;
  void *v39;
  uint64_t DefiningOp;
  void *v41;
  const char *v43;
  int v44;
  const char *v45;
  const char *v46;
  _QWORD *AttrData;
  uint64_t v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  void *__p[2];
  char v59;
  uint64_t v60;
  uint64_t v61[4];
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
  v53 = a7;
  mpsFileLoc("-[MPSGraphDepthwiseConvolution3DWeightsGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphDepthwiseConvolutionOps.mm", __p);
  v11 = v53;
  v69 = 260;
  v68[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x238u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x28uLL);
    __dst = (void **)v18;
    v67 = xmmword_181287DB0;
    qmemcpy(v18, "mps.depthwise_conv_3d_weights_gradient", 38);
    v19 = v18 + 38;
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

  v26 = v11;
  if (v59 < 0)
    operator delete(__p[0]);
  v27 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  -[MPSGraphDepthwiseConvolution3DOpDescriptor strides](self->super._desc, "strides");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = nsArrayToAttr(v54, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = nsArrayToAttr(v55, (mlir::Builder *)a3);
  -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = nsArrayToAttr(v56, (mlir::Builder *)a3);
  v31 = -[MPSGraphDepthwiseConvolution3DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  v32 = -[MPSGraphDepthwiseConvolution3DOpDescriptor channelDimensionIndex](self->super._desc, "channelDimensionIndex");
  v60 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v60);
  v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.depthwise_conv_3d_weights_gradient", (const unsigned __int8 *)0x26, Context);
  if (!v35)
  {
    v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d_weights_gradient";
    v64 = 38;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v62 = 259;
    llvm::operator+((uint64_t *)&v63, v61, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v25, v34);
  mlir::mps::DepthwiseConv3DWeightsGradientOp::build((mlir::Builder *)a3, (uint64_t)v68, *v27, v27[1], v27[2], v28, v29, v30, v31, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v68);
  v37 = v36;
  if (!v36)
  {
    v43 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v44 = 662;
    v45 = "Casting.h";
    v46 = "dyn_cast";
    goto LABEL_58;
  }
  v38 = *((_QWORD *)v36 + 6);
  v39 = *(void **)(v38 + 16);
  if (v39 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v38 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v48 == 38)
    {
      v49 = *AttrData == 0x747065642E73706DLL && AttrData[1] == 0x6F635F6573697768;
      v50 = v49 && AttrData[2] == 0x65775F64335F766ELL;
      v51 = v50 && AttrData[3] == 0x72675F7374686769;
      if (v51 && *(_QWORD *)((char *)AttrData + 30) == 0x746E656964617267)
      {
        v65 = 1283;
        v63.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.depthwise_conv_3d_weights_gradient";
        v64 = 38;
        v61[0] = (uint64_t)"' failed due to the operation not being registered";
        v62 = 259;
        llvm::operator+((uint64_t *)&v63, v61, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_57;
  }
  if (v39 != &mlir::detail::TypeIDResolver<mlir::mps::DepthwiseConv3DWeightsGradientOp,void>::id)
  {
LABEL_57:
    v43 = "result && \"builder didn't return the right type\";
    v44 = 497;
    v45 = "Builders.h";
    v46 = "create";
LABEL_58:
    __assert_rtn(v46, v45, v44, v43);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*((_DWORD *)v37 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v57 = (char *)v37 - 16;

  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v57);
  if (!DefiningOp)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  v68[0] = llvm::DefaultDoCastIfPossible<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,llvm::CastInfo<mlir::mps::DepthwiseConv3DOp,mlir::Operation *,void>>::doCastIfPossible(DefiningOp);
  if (v68[0])
    mlir::mps::DepthwiseConv3DOp::verify((mlir::mps::DepthwiseConv3DOp *)v68);
  v41 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v57);

  return v41;
}

@end
