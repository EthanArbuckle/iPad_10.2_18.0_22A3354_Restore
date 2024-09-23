@implementation MPSGraphCropResizeOp

- (MPSGraphCropResizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphCropResizeOp *v16;

  objc_storeStrong((id *)&self->_desc, a6);
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v15, v14, v13, v12);

  return v16;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t *v13;
  unsigned int v14;
  unsigned int v15;
  _BOOL4 v16;
  float v17;
  llvm::APFloatBase *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t *Context;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  llvm::APFloatBase *v29;
  void *v30;
  mlir::GenericProgramPoint *v31;
  uint64_t v32;
  void *DefiningOp;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  int v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  void *__p[2];
  char v44;
  uint64_t v45;
  const char *v46;
  __int16 v47;
  uint64_t v48[4];
  __int16 v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[38];
  _BYTE v53[8];
  void *v54;
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphCropResizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCropResizeOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x6Eu, v11);
  if (v44 < 0)
    operator delete(__p[0]);
  v13 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v14 = -[MPSGraphCropResizeOpDescriptor resizeHeight](self->_desc, "resizeHeight");
  v15 = -[MPSGraphCropResizeOpDescriptor resizeWidth](self->_desc, "resizeWidth");
  v16 = -[MPSGraphCropResizeOpDescriptor normalizeCoordinates](self->_desc, "normalizeCoordinates");
  -[MPSGraphCropResizeOpDescriptor spatialScale](self->_desc, "spatialScale");
  v18 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v52, v17);
  v19 = llvm::APFloatBase::IEEEsingle(v18);
  llvm::APFloat::Storage::Storage(&v50, v52, v19);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v52);
  v20 = -[MPSGraphCropResizeOpDescriptor resizeMode](self->_desc, "resizeMode");
  v41 = -[MPSGraphCropResizeOpDescriptor samplingMode](self->_desc, "samplingMode");
  v21 = -[MPSGraphCropResizeOpDescriptor coordinateMode](self->_desc, "coordinateMode");
  v45 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v45);
  v23 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.crop_resize", (const unsigned __int8 *)0xF, Context);
  if (!v24)
  {
    v49 = 1283;
    v48[2] = (uint64_t)"mps.crop_resize";
    v48[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v47 = 259;
    llvm::operator+(v48, (uint64_t *)&v46, (uint64_t)v53);
    llvm::report_fatal_error((llvm::Twine *)v53, 1);
  }
  mlir::OperationState::OperationState(v52, v12, v23);
  v39 = v16;
  v25 = v14;
  v40 = v11;
  v26 = *v13;
  v27 = v13[1];
  v28 = v50;
  v30 = llvm::APFloatBase::PPCDoubleDouble(v29);
  if (v30 == v28)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v54, &v50);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v54, (uint64_t)&v50);
  mlir::mps::CropResizeOp::build((mlir::Builder *)a3, (uint64_t)v52, v26, v27, v25, v15, v39, (uint64_t)v53, v20, v41, v21);
  if (v30 == v54)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v55);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v54);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v52);
  if (!v31)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_21;
  }
  v32 = llvm::DefaultDoCastIfPossible<mlir::mps::CropResizeOp,mlir::Operation *,llvm::CastInfo<mlir::mps::CropResizeOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v31);
  if (!v32)
  {
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_21:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v52);
  if (!*(_DWORD *)(v32 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v42 = v32 - 16;
  if (v30 == v50)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v51);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v50);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v42);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
