@implementation MPSGraphSortOp

- (MPSGraphSortOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descending:(BOOL)a6 name:(id)a7
{
  self->_descending = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  BOOL descending;
  void *__p[2];
  char v18;

  v11 = a7;
  mpsFileLoc("-[MPSGraphSortOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphSortOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::SortOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x2Du, v11);
  if (v18 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 != 16 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v13 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  descending = self->_descending;
  v14 = (void *)mlir::OpBuilder::create<mlir::mps::SortOp,mlir::Value &,mlir::Value &,BOOL>((mlir::UnitAttr **)a3, v12, v13, v13 + 1, (unsigned __int8 *)&descending);

  return v14;
}

@end
