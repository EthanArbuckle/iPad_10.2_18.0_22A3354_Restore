@implementation MPSGraphLocalConvolutionOp

- (MPSGraphLocalConvolutionOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPSGraphLocalConvolutionOp;
  return -[MPSGraphLocalConvolutionBase initWithGraph:inputTensors:controlDependencies:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](&v11, sel_initWithGraph_inputTensors_controlDependencies_dataLayout_kernelShape_dilationRateInX_dilationRateInY_name_, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  if (v13 == v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@/LocalConvolutionDataGradient"), v11, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localConvolutionDataGradientWithIncomingGradientTensor:weightTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", v10, v18, self->super._dataLayout, self->super._kernelShape, self->super._dilationRateInX, self->super._dilationRateInY, v16);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@/LocalConvolutionDataGradient"), v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    -[NSArray objectAtIndexedSubscript:](self->super.super._inputTensors, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localConvolutionWeightGradientWithIncomingGradientTensor:sourceTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", v10, v18, self->super._dataLayout, self->super._kernelShape, self->super._dilationRateInX, self->super._dilationRateInY, v16);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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
  char *v35;
  void *__p[2];
  char v37;
  uint64_t v38;
  uint64_t v39[4];
  __int16 v40;
  uint64_t v41[2];
  const char *v42;
  uint64_t v43;
  __int16 v44;
  _QWORD v45[5];
  _QWORD v46[39];

  v46[38] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphLocalConvolutionOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphLocalConvolution.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::LocalConvolutionOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x8Cu, v11);
  if (v37 < 0)
    operator delete(__p[0]);
  KernelSizeFromShape = getKernelSizeFromShape(self->super._kernelShape, (mlir::Builder *)a3);
  DilationRateAttr = getDilationRateAttr(self->super._dilationRateInX, self->super._dilationRateInY, (mlir::OpBuilder *)a3);
  v15 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v16 = DilationRateAttr;
  dataLayout = self->super._dataLayout;
  v38 = v12;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v38);
  v19 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.local_convolution", (const unsigned __int8 *)0x15, Context);
  if (!v20)
  {
    v44 = 1283;
    v42 = "mps.local_convolution";
    v43 = 21;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v40 = 259;
    llvm::operator+(v41, v39, (uint64_t)v45);
    llvm::report_fatal_error((llvm::Twine *)v45, 1);
  }
  mlir::OperationState::OperationState(v46, v12, v19);
  mlir::mps::LocalConvolutionOp::build((mlir::MLIRContext **)a3, (uint64_t)v46, *v15, v15[1], dataLayout, KernelSizeFromShape, v16);
  v21 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v46);
  v22 = v21;
  if (!v21)
  {
    v27 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v28 = 662;
    v29 = "Casting.h";
    v30 = "dyn_cast";
    goto LABEL_25;
  }
  v23 = *((_QWORD *)v21 + 6);
  v24 = *(void **)(v23 + 16);
  if (v24 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v45[0] = *(_QWORD *)(v23 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v45);
    if (v32 == 21)
    {
      v33 = *AttrData == 0x61636F6C2E73706DLL && AttrData[1] == 0x6C6F766E6F635F6CLL;
      if (v33 && *(_QWORD *)((char *)AttrData + 13) == 0x6E6F6974756C6F76)
      {
        v44 = 1283;
        v41[0] = (uint64_t)"classof on '";
        v42 = "mps.local_convolution";
        v43 = 21;
        v39[0] = (uint64_t)"' failed due to the operation not being registered";
        v40 = 259;
        llvm::operator+(v41, v39, (uint64_t)v45);
        llvm::report_fatal_error((llvm::Twine *)v45, 1);
      }
    }
    goto LABEL_24;
  }
  if (v24 != &mlir::detail::TypeIDResolver<mlir::mps::LocalConvolutionOp,void>::id)
  {
LABEL_24:
    v27 = "result && \"builder didn't return the right type\";
    v28 = 497;
    v29 = "Builders.h";
    v30 = "create";
LABEL_25:
    __assert_rtn(v30, v29, v28, v27);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v46);
  if (!*((_DWORD *)v22 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v35 = (char *)v22 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v35);

  return DefiningOp;
}

@end
