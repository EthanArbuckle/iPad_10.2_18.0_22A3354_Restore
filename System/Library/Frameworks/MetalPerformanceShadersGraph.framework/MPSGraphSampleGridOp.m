@implementation MPSGraphSampleGridOp

- (MPSGraphSampleGridOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 layout:(unint64_t)a6 normalizeCoordinates:(BOOL)a7 relativeCoordinates:(BOOL)a8 alignCorners:(BOOL)a9 paddingMode:(int64_t)a10 samplingMode:(unint64_t)a11 nearestRoundingMode:(unint64_t)a12 name:(id)a13
{
  self->_relativeCoordinates = a7;
  self->_alignCorners = a8;
  *(&self->_alignCorners + 1) = a9;
  self->_paddingMode = a10;
  self->_samplingMode = a11;
  self->_nearestRoundingMode = a12;
  self->_layout = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a13);
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@/sampleGridDataGradient/shapeOp"), v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shapeOfTensor:name:", v16, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%@/sampleGridDataGradient"), v11, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_loadWeakRetained((id *)&self->super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sampleGridDataGradientWithIncomingGradientTensor:coordinateTensor:outputShapeTensor:normalizeCoordinates:relativeCoordinates:paddingMode:samplingMode:name:", v10, v25, v20, self->_relativeCoordinates, self->_alignCorners, self->_paddingMode, self->_samplingMode, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v11;
  uint64_t *v12;
  unsigned int layout;
  uint64_t v14;
  uint64_t *Context;
  uint64_t v16;
  char v17;
  mlir::GenericProgramPoint *v18;
  uint64_t v19;
  void *DefiningOp;
  const char *v22;
  int v23;
  const char *v24;
  const char *v25;
  unsigned int samplingMode;
  unsigned int paddingMode;
  id v28;
  uint64_t v29;
  void *__p[2];
  char v31;
  uint64_t v32;
  const char *v33;
  __int16 v34;
  uint64_t v35[4];
  __int16 v36;
  _BYTE v37[40];
  _QWORD v38[40];

  v38[38] = *MEMORY[0x1E0C80C00];
  v28 = a7;
  mpsFileLoc("-[MPSGraphSampleGridOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphSampleGrid.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x61u, v28);
  if (v31 < 0)
    operator delete(__p[0]);
  v12 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  samplingMode = self->_samplingMode;
  paddingMode = self->_paddingMode;
  layout = self->_layout;
  v14 = mlir::mps::NearestRoundingModeAttr::get(*(mlir::MLIRContext **)a3, self->_nearestRoundingMode);
  v32 = v11;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v32);
  v16 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.sample_grid", (const unsigned __int8 *)0xF, Context);
  if (!v17)
  {
    v36 = 1283;
    v35[2] = (uint64_t)"mps.sample_grid";
    v35[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v34 = 259;
    llvm::operator+(v35, (uint64_t *)&v33, (uint64_t)v37);
    llvm::report_fatal_error((llvm::Twine *)v37, 1);
  }
  mlir::OperationState::OperationState(v38, v11, v16);
  mlir::mps::SampleGridOp::build((mlir::UnitAttr **)a3, (uint64_t)v38, *v12, v12[1], v12[2], self->_relativeCoordinates, self->_alignCorners, *((unsigned __int8 *)&self->_alignCorners + 1), paddingMode, samplingMode, layout, v14);
  v18 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v38);
  if (!v18)
  {
    v22 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v23 = 662;
    v24 = "Casting.h";
    v25 = "dyn_cast";
    goto LABEL_12;
  }
  v19 = llvm::DefaultDoCastIfPossible<mlir::mps::SampleGridOp,mlir::Operation *,llvm::CastInfo<mlir::mps::SampleGridOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v18);
  if (!v19)
  {
    v22 = "result && \"builder didn't return the right type\";
    v23 = 497;
    v24 = "Builders.h";
    v25 = "create";
LABEL_12:
    __assert_rtn(v25, v24, v23, v22);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v38);
  if (!*(_DWORD *)(v19 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v29 = v19 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v29);

  return DefiningOp;
}

@end
