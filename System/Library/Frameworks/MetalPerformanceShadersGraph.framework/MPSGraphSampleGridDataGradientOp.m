@implementation MPSGraphSampleGridDataGradientOp

- (MPSGraphSampleGridDataGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10
{
  int64_t v10;

  if (a8 == 4)
    v10 = 0;
  else
    v10 = a8;
  self->_relativeCoordinates = a6;
  *(&self->_relativeCoordinates + 1) = a7;
  self->_paddingMode = v10;
  self->_samplingMode = a9;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a10);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t *v13;
  unsigned int paddingMode;
  unsigned int samplingMode;
  uint64_t *Context;
  uint64_t v17;
  char v18;
  mlir::GenericProgramPoint *v19;
  mlir::GenericProgramPoint *v20;
  uint64_t v21;
  void *v22;
  void *DefiningOp;
  const char *v25;
  int v26;
  const char *v27;
  const char *v28;
  _QWORD *AttrData;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  char *v34;
  void *__p[2];
  char v36;
  uint64_t v37;
  uint64_t v38[4];
  __int16 v39;
  uint64_t v40[2];
  const char *v41;
  uint64_t v42;
  __int16 v43;
  _QWORD v44[5];
  _QWORD v45[40];

  v45[38] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphSampleGridDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphSampleGrid.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x99u, v11);
  if (v36 < 0)
    operator delete(__p[0]);
  v13 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  paddingMode = self->_paddingMode;
  samplingMode = self->_samplingMode;
  v37 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v37);
  v17 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.sample_grid_data_gradient", (const unsigned __int8 *)0x1D, Context);
  if (!v18)
  {
    v43 = 1283;
    v41 = "mps.sample_grid_data_gradient";
    v42 = 29;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v39 = 259;
    llvm::operator+(v40, v38, (uint64_t)v44);
    llvm::report_fatal_error((llvm::Twine *)v44, 1);
  }
  mlir::OperationState::OperationState(v45, v12, v17);
  mlir::mps::SampleGridDataGradientOp::build((mlir::UnitAttr **)a3, (uint64_t)v45, *v13, v13[1], v13[2], self->_relativeCoordinates, *((unsigned __int8 *)&self->_relativeCoordinates + 1), paddingMode, samplingMode);
  v19 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v45);
  v20 = v19;
  if (!v19)
  {
    v25 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v26 = 662;
    v27 = "Casting.h";
    v28 = "dyn_cast";
    goto LABEL_28;
  }
  v21 = *((_QWORD *)v19 + 6);
  v22 = *(void **)(v21 + 16);
  if (v22 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v44[0] = *(_QWORD *)(v21 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v44);
    if (v30 == 29)
    {
      v31 = *AttrData == 0x706D61732E73706DLL && AttrData[1] == 0x5F646972675F656CLL;
      v32 = v31 && AttrData[2] == 0x6172675F61746164;
      if (v32 && *(_QWORD *)((char *)AttrData + 21) == 0x746E656964617267)
      {
        v43 = 1283;
        v40[0] = (uint64_t)"classof on '";
        v41 = "mps.sample_grid_data_gradient";
        v42 = 29;
        v38[0] = (uint64_t)"' failed due to the operation not being registered";
        v39 = 259;
        llvm::operator+(v40, v38, (uint64_t)v44);
        llvm::report_fatal_error((llvm::Twine *)v44, 1);
      }
    }
    goto LABEL_27;
  }
  if (v22 != &mlir::detail::TypeIDResolver<mlir::mps::SampleGridDataGradientOp,void>::id)
  {
LABEL_27:
    v25 = "result && \"builder didn't return the right type\";
    v26 = 497;
    v27 = "Builders.h";
    v28 = "create";
LABEL_28:
    __assert_rtn(v28, v27, v26, v25);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v45);
  if (!*((_DWORD *)v20 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v34 = (char *)v20 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v34);

  return DefiningOp;
}

@end
