@implementation MPSGraphLocalConvolutionDataGradientOp

- (MPSGraphLocalConvolutionDataGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPSGraphLocalConvolutionDataGradientOp;
  return -[MPSGraphLocalConvolutionBase initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](&v11, sel_initWithGraph_inputTensors_controlDependencies_dataLayout_kernelShape_dilationRateInX_dilationRateInY_name_, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t KernelSizeFromShape;
  uint64_t DilationRateAttr;
  uint64_t *v15;
  uint64_t v16;
  unsigned int dataLayout;
  uint64_t *Context;
  uint64_t v19;
  char v20;
  mlir::GenericProgramPoint *v21;
  mlir::GenericProgramPoint *v22;
  uint64_t v23;
  void *v24;
  void *DefiningOp;
  const char *v27;
  int v28;
  const char *v29;
  const char *v30;
  _QWORD *AttrData;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  char *v37;
  void *__p[2];
  char v39;
  uint64_t v40;
  uint64_t v41[4];
  __int16 v42;
  uint64_t v43[2];
  const char *v44;
  uint64_t v45;
  __int16 v46;
  _QWORD v47[5];
  _QWORD v48[39];

  v48[38] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphLocalConvolutionDataGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphLocalConvolution.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::LocalConvolutionOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0xBFu, v11);
  if (v39 < 0)
    operator delete(__p[0]);
  KernelSizeFromShape = getKernelSizeFromShape(self->super._kernelShape, (mlir::Builder *)a3);
  DilationRateAttr = getDilationRateAttr(self->super._dilationRateInX, self->super._dilationRateInY, (mlir::OpBuilder *)a3);
  v15 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v16 = DilationRateAttr;
  dataLayout = self->super._dataLayout;
  v40 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  v19 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.local_convolution_data_gradient", (const unsigned __int8 *)0x23, Context);
  if (!v20)
  {
    v46 = 1283;
    v44 = "mps.local_convolution_data_gradient";
    v45 = 35;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v42 = 259;
    llvm::operator+(v43, v41, (uint64_t)v47);
    llvm::report_fatal_error((llvm::Twine *)v47, 1);
  }
  mlir::OperationState::OperationState(v48, v12, v19);
  mlir::mps::LocalConvolutionDataGradientOp::build((mlir::MLIRContext **)a3, (uint64_t)v48, *v15, v15[1], dataLayout, KernelSizeFromShape, v16);
  v21 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  v22 = v21;
  if (!v21)
  {
    v27 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v28 = 662;
    v29 = "Casting.h";
    v30 = "dyn_cast";
    goto LABEL_31;
  }
  v23 = *((_QWORD *)v21 + 6);
  v24 = *(void **)(v23 + 16);
  if (v24 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v47[0] = *(_QWORD *)(v23 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v47);
    if (v32 == 35)
    {
      v33 = *AttrData == 0x61636F6C2E73706DLL && AttrData[1] == 0x6C6F766E6F635F6CLL;
      v34 = v33 && AttrData[2] == 0x61645F6E6F697475;
      v35 = v34 && AttrData[3] == 0x69646172675F6174;
      if (v35 && *(_QWORD *)((char *)AttrData + 27) == 0x746E656964617267)
      {
        v46 = 1283;
        v43[0] = (uint64_t)"classof on '";
        v44 = "mps.local_convolution_data_gradient";
        v45 = 35;
        v41[0] = (uint64_t)"' failed due to the operation not being registered";
        v42 = 259;
        llvm::operator+(v43, v41, (uint64_t)v47);
        llvm::report_fatal_error((llvm::Twine *)v47, 1);
      }
    }
    goto LABEL_30;
  }
  if (v24 != &mlir::detail::TypeIDResolver<mlir::mps::LocalConvolutionDataGradientOp,void>::id)
  {
LABEL_30:
    v27 = "result && \"builder didn't return the right type\";
    v28 = 497;
    v29 = "Builders.h";
    v30 = "create";
LABEL_31:
    __assert_rtn(v30, v29, v28, v27);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*((_DWORD *)v22 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v37 = (char *)v22 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

@end
