@implementation MPSGraphCumulativeBaseOp

- (MPSGraphCumulativeBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 exclusive:(BOOL)a6 reverse:(BOOL)a7 name:(id)a8
{
  self->_exclusive = a6;
  self->_reverse = a7;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a8);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v7;

  v7 = a7;
  llvm::llvm_unreachable_internal((llvm *)"use a child class", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCumulativeOps.mm", (const char *)0x2E);
}

@end
