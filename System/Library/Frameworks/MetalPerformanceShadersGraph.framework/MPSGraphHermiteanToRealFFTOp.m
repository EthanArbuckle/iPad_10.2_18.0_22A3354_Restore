@implementation MPSGraphHermiteanToRealFFTOp

- (MPSGraphHermiteanToRealFFTOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphFFTDescriptor *v17;
  MPSGraphFFTDescriptor *desc;
  MPSGraphHermiteanToRealFFTOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphFFTDescriptor *)objc_msgSend(v15, "copy");
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
  int v27;
  MPSGraphFFTScalingMode v28;
  unsigned int v29;
  _BOOL4 v30;
  uint64_t *v31;
  int v32;
  uint64_t *Context;
  uint64_t v34;
  char v35;
  mlir::GenericProgramPoint *v36;
  mlir::GenericProgramPoint *v37;
  uint64_t v38;
  void *v39;
  const char *v41;
  int v42;
  const char *v43;
  const char *v44;
  uint64_t AttrData;
  uint64_t v46;
  void *__p[2];
  char v51;
  uint64_t v52;
  uint64_t v53[4];
  __int16 v54;
  std::string v55;
  uint64_t v56;
  __int16 v57;
  void **__dst;
  __int128 v59;
  _QWORD v60[4];
  __int16 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphHermiteanToRealFFTOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphFourierTransformOps.mm", __p);
  v12 = v11;
  v61 = 260;
  v60[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0xD0u, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    v19 = (char *)operator new(0x20uLL);
    __dst = (void **)v19;
    v59 = xmmword_181268760;
    qmemcpy(v19, "mps.hermitean_to_real_fft", 25);
    v20 = v19 + 25;
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
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
    *(_QWORD *)&v59 = v17;
    *((_QWORD *)&v59 + 1) = v22 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v59) = v16;
    p_dst = (void **)&__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v20 = (char *)p_dst + v17;
LABEL_13:
  *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v55);
  v23 = (std::string *)v55.__r_.__value_.__r.__words[0];
  if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = &v55;
  v24 = 1;
  HIBYTE(v61) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v60[0] = v23;
    v24 = 3;
  }
  LOBYTE(v61) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v60);
  v26 = mlir::NameLoc::get(v25, v14);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v55.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v59) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v51 < 0)
    operator delete(__p[0]);
  v27 = -[MPSGraphFFTDescriptor inverse](self->_desc, "inverse");
  v28 = -[MPSGraphFFTDescriptor scalingMode](self->_desc, "scalingMode");
  if (v28 == MPSGraphFFTScalingModeUnitary)
    v29 = 2;
  else
    v29 = v28 == MPSGraphFFTScalingModeSize;
  v30 = -[MPSGraphFFTDescriptor roundToOddHermitean](self->_desc, "roundToOddHermitean");
  v31 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v32 = v30;
  v52 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v52);
  v34 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.hermitean_to_real_fft", (const unsigned __int8 *)0x19, Context);
  if (!v35)
  {
    v57 = 1283;
    v55.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.hermitean_to_real_fft";
    v56 = 25;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v54 = 259;
    llvm::operator+((uint64_t *)&v55, v53, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v60, v26, v34);
  mlir::mps::HermiteanToRealFFTOp::build((mlir::UnitAttr **)a3, (uint64_t)v60, *v31, v31[1], v29, v27, v32);
  v36 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v60);
  v37 = v36;
  if (!v36)
  {
    v41 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v42 = 662;
    v43 = "Casting.h";
    v44 = "dyn_cast";
    goto LABEL_52;
  }
  v38 = *((_QWORD *)v36 + 6);
  v39 = *(void **)(v38 + 16);
  if (v39 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v38 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v46 == 25
      && *(_QWORD *)AttrData == 0x6D7265682E73706DLL
      && *(_QWORD *)(AttrData + 8) == 0x6F745F6E61657469
      && *(_QWORD *)(AttrData + 16) == 0x66665F6C6165725FLL
      && *(_BYTE *)(AttrData + 24) == 116)
    {
      v57 = 1283;
      v55.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v55.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.hermitean_to_real_fft";
      v56 = 25;
      v53[0] = (uint64_t)"' failed due to the operation not being registered";
      v54 = 259;
      llvm::operator+((uint64_t *)&v55, v53, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_51;
  }
  if (v39 != &mlir::detail::TypeIDResolver<mlir::mps::HermiteanToRealFFTOp,void>::id)
  {
LABEL_51:
    v41 = "result && \"builder didn't return the right type\";
    v42 = 497;
    v43 = "Builders.h";
    v44 = "create";
LABEL_52:
    __assert_rtn(v44, v43, v42, v41);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v60);

  return v37;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
