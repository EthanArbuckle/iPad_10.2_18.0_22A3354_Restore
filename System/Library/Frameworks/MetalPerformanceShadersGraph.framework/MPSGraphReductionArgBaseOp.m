@implementation MPSGraphReductionArgBaseOp

- (MPSGraphReductionArgBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  self->_axis = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v7;

  v7 = a7;
  __assert_rtn("-[MPSGraphReductionArgBaseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphReductionOps.mm", 353, "0 && \"use a child class\");
}

@end
