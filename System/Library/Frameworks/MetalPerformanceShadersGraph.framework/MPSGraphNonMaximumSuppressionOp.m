@implementation MPSGraphNonMaximumSuppressionOp

- (MPSGraphNonMaximumSuppressionOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 iouThreshold:(float)a6 scoreThreshold:(float)a7 perClassSuppression:(BOOL)a8 coordinateMode:(unint64_t)a9 name:(id)a10
{
  self->_scoreThreshold = a6;
  *(float *)&self->_perClassSuppression = a7;
  *(&self->_perClassSuppression + 4) = a8;
  self->_coordinateMode = a9;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a10);
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int coordinateMode;
  uint64_t *Context;
  uint64_t v24;
  char v25;
  mlir::GenericProgramPoint *v26;
  mlir::GenericProgramPoint *v27;
  uint64_t v28;
  void *v29;
  const char *v31;
  int v32;
  const char *v33;
  const char *v34;
  _QWORD *AttrData;
  uint64_t v36;
  id v40;
  void *__p[2];
  char v42;
  uint64_t v43;
  uint64_t v44[4];
  __int16 v45;
  uint64_t v46[2];
  const char *v47;
  uint64_t v48;
  __int16 v49;
  _QWORD v50[5];
  _QWORD v51[40];

  v51[38] = *MEMORY[0x1E0C80C00];
  v40 = a7;
  mpsFileLoc("-[MPSGraphNonMaximumSuppressionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphNonMaximumSuppressionOps.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SampleGridOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x3Eu, v40);
  if (v42 < 0)
  {
    operator delete(__p[0]);
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((_QWORD *)a5 + 1);
    v14 = (unint64_t)v13 - *(_QWORD *)a5;
    if (v14 == 32)
      goto LABEL_3;
  }
  else
  {
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((_QWORD *)a5 + 1);
    v14 = (unint64_t)v13 - *(_QWORD *)a5;
    if (v14 == 32)
    {
LABEL_3:
      v15 = 0;
      v16 = v12 + 2;
      v17 = 3;
      goto LABEL_8;
    }
  }
  if (v13 == v12 || v14 <= 0x20)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v15 = v12[2];
  v16 = v12 + 3;
  v17 = 4;
LABEL_8:
  v18 = *v12;
  v19 = v12[1];
  v20 = v12[v17];
  v21 = *v16;
  coordinateMode = self->_coordinateMode;
  v43 = v11;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  v24 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.non_maximum_suppression", (const unsigned __int8 *)0x1B, Context);
  if (!v25)
  {
    v49 = 1283;
    v47 = "mps.non_maximum_suppression";
    v48 = 27;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v45 = 259;
    llvm::operator+(v46, v44, (uint64_t)v50);
    llvm::report_fatal_error((llvm::Twine *)v50, 1);
  }
  mlir::OperationState::OperationState(v51, v11, v24);
  mlir::mps::NonMaximumSuppressionOp::build((mlir::UnitAttr **)a3, (uint64_t)v51, v18, v19, v15, v21, v20, *((unsigned __int8 *)&self->_perClassSuppression + 4), coordinateMode, 0);
  v26 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v51);
  v27 = v26;
  if (!v26)
  {
    v31 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v32 = 662;
    v33 = "Casting.h";
    v34 = "dyn_cast";
    goto LABEL_30;
  }
  v28 = *((_QWORD *)v26 + 6);
  v29 = *(void **)(v28 + 16);
  if (v29 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v50[0] = *(_QWORD *)(v28 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v50);
    if (v36 == 27
      && *AttrData == 0x5F6E6F6E2E73706DLL
      && AttrData[1] == 0x5F6D756D6978616DLL
      && AttrData[2] == 0x7373657270707573
      && *(_QWORD *)((char *)AttrData + 19) == 0x6E6F697373657270)
    {
      v49 = 1283;
      v46[0] = (uint64_t)"classof on '";
      v47 = "mps.non_maximum_suppression";
      v48 = 27;
      v44[0] = (uint64_t)"' failed due to the operation not being registered";
      v45 = 259;
      llvm::operator+(v46, v44, (uint64_t)v50);
      llvm::report_fatal_error((llvm::Twine *)v50, 1);
    }
    goto LABEL_29;
  }
  if (v29 != &mlir::detail::TypeIDResolver<mlir::mps::NonMaximumSuppressionOp,void>::id)
  {
LABEL_29:
    v31 = "result && \"builder didn't return the right type\";
    v32 = 497;
    v33 = "Builders.h";
    v34 = "create";
LABEL_30:
    __assert_rtn(v34, v33, v32, v31);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v51);

  return v27;
}

@end
