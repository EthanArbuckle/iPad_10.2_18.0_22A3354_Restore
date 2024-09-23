@implementation MPSGraphStencilOp

- (MPSGraphStencilOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphStencilOpDescriptor *v17;
  MPSGraphStencilOpDescriptor *desc;
  MPSGraphStencilOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphStencilOpDescriptor *)objc_msgSend(v15, "copy");
  desc = self->_desc;
  self->_desc = v17;

  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  size_t v19;
  size_t v20;
  int8x16_t *p_dst;
  __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  std::string *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t IntegerType;
  uint64_t v31;
  _QWORD *v32;
  uint64_t **v33;
  uint64_t InterfaceFor;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  llvm::APFloatBase *v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t *Context;
  uint64_t v50;
  char v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  llvm::APFloatBase *v56;
  void *v57;
  mlir::GenericProgramPoint *v58;
  uint64_t v59;
  void *DefiningOp;
  const char *v62;
  int v63;
  const char *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  mlir::Float32Type **v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *__p[2];
  char v76;
  uint64_t v77;
  const char *v78;
  __int16 v79;
  std::string v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _BYTE *v86;
  __int16 v87;
  int8x16_t __dst;
  _QWORD v89[5];

  v89[3] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphStencilOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphStencilOps.mm", __p);
  v12 = v11;
  v87 = 260;
  v85 = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v85);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x90u, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  v72 = v12;
  if (!v12)
  {
    HIBYTE(v89[0]) = 11;
    *(__int32 *)((char *)&__dst.i32[1] + 3) = 1818846062;
    __dst.i64[0] = *(_QWORD *)"mps.stencil";
    v22 = &__dst.i8[11];
    goto LABEL_13;
  }
  v15 = objc_retainAutorelease(v12);
  v16 = a4;
  v17 = a3;
  v18 = (const char *)objc_msgSend(v15, "UTF8String");
  v19 = strlen(v18);
  if (v19 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v20 = v19;
  if (v19 >= 0x17)
  {
    v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v23 = v19 | 7;
    v24 = v23 + 1;
    p_dst = (int8x16_t *)operator new(v23 + 1);
    __dst.i64[1] = v20;
    v89[0] = v24 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
    a4 = v16;
  }
  else
  {
    HIBYTE(v89[0]) = v19;
    p_dst = &__dst;
    if (!v19)
      goto LABEL_12;
  }
  memmove(p_dst, v18, v20);
LABEL_12:
  v22 = &p_dst->i8[v20];
  v12 = v72;
  a3 = v17;
LABEL_13:
  *v22 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v80);
  v25 = (std::string *)v80.__r_.__value_.__r.__words[0];
  if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v25 = &v80;
  v26 = 1;
  HIBYTE(v87) = 1;
  if (v25->__r_.__value_.__s.__data_[0])
  {
    v85 = v25;
    v26 = 3;
  }
  LOBYTE(v87) = v26;
  v27 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v85);
  v28 = mlir::NameLoc::get(v27, v14);
  if (!v28)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v80.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v89[0]) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v89[0]) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v76 < 0)
    operator delete(__p[0]);
  v29 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  -[MPSGraphStencilOpDescriptor offsets](self->_desc, "offsets");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v31 = objc_msgSend(v73, "count");
  v32 = operator new(8uLL);
  *v32 = v31;
  v33 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)v32, 1, IntegerType, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v33))
  {
    v35 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v36 = 566;
    v37 = "Casting.h";
    v38 = "cast";
LABEL_50:
    __assert_rtn(v38, v37, v36, v35);
  }
  if (v33)
  {
    InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v33);
    if (!InterfaceFor)
    {
      v35 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
      v36 = 98;
      v37 = "InterfaceSupport.h";
      v38 = "Interface";
      goto LABEL_50;
    }
  }
  else
  {
    InterfaceFor = 0;
  }
  MPSShapeToVector<unsigned long long>(v73, (uint64_t **)&v85);
  v39 = mlir::DenseElementsAttr::getFromRawBuffer(v33, InterfaceFor, v85, v86 - (_BYTE *)v85, 8, 1, 1);
  if ((mlir::DenseIntElementsAttr::classof(v39) & 1) == 0)
    __assert_rtn("cast", "Casting.h", 566, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\");
  if (v85)
  {
    v86 = v85;
    operator delete(v85);
  }
  operator delete(v32);

  -[MPSGraphStencilOpDescriptor strides](self->_desc, "strides");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = nsArrayToUI64Attr(v40, (mlir::Builder *)a3);
  -[MPSGraphStencilOpDescriptor dilationRates](self->_desc, "dilationRates");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = nsArrayToUI64Attr(v66, (mlir::Builder *)a3);
  -[MPSGraphStencilOpDescriptor explicitPadding](self->_desc, "explicitPadding");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = nsArrayToUI64Attr(v71, (mlir::Builder *)a3);
  -[MPSGraphStencilOpDescriptor paddingConstant](self->_desc, "paddingConstant");
  v45 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)&v85, v44);
  v46 = llvm::APFloatBase::IEEEsingle(v45);
  llvm::APFloat::Storage::Storage(&v83, &v85, v46);
  v70 = (mlir::Float32Type **)a3;
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v85);
  v69 = -[MPSGraphStencilOpDescriptor reductionMode](self->_desc, "reductionMode");
  v67 = v41;
  v68 = v39;
  v47 = -[MPSGraphStencilOpDescriptor boundaryMode](self->_desc, "boundaryMode");
  v48 = -[MPSGraphStencilOpDescriptor paddingStyle](self->_desc, "paddingStyle");
  v77 = v28;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v77);
  v50 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.stencil", (const unsigned __int8 *)0xB, Context);
  if (!v51)
  {
    v82 = 1283;
    v80.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.stencil";
    v81 = 11;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v79 = 259;
    llvm::operator+((uint64_t *)&v80, (uint64_t *)&v78, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(&v85, v28, v50);
  v52 = v40;
  v54 = *v29;
  v53 = v29[1];
  v55 = v83;
  v57 = llvm::APFloatBase::PPCDoubleDouble(v56);
  if (v57 == v55)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&__dst.i64[1], &v83);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&__dst.i64[1], (uint64_t)&v83);
  mlir::mps::StencilOp::build(v70, (uint64_t)&v85, v54, v53, v68, v67, v42, v43, (uint64_t)&__dst, v69, v47, v48);
  if (v57 == (void *)__dst.i64[1])
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v89);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&__dst.u64[1]);
  v58 = mlir::OpBuilder::create((mlir::OpBuilder *)v70, (const mlir::OperationState *)&v85);
  if (!v58)
  {
    v62 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v63 = 662;
    v64 = "Casting.h";
    v65 = "dyn_cast";
    goto LABEL_55;
  }
  v59 = llvm::DefaultDoCastIfPossible<mlir::mps::StencilOp,mlir::Operation *,llvm::CastInfo<mlir::mps::StencilOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v58);
  if (!v59)
  {
    v62 = "result && \"builder didn't return the right type\";
    v63 = 497;
    v64 = "Builders.h";
    v65 = "create";
LABEL_55:
    __assert_rtn(v65, v64, v63, v62);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)&v85);
  if (!*(_DWORD *)(v59 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v74 = v59 - 16;
  if (v57 == v83)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v84);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v83);

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v74);
  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
