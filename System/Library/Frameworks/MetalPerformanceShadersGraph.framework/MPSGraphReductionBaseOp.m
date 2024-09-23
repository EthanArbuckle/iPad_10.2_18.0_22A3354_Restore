@implementation MPSGraphReductionBaseOp

- (MPSGraphReductionBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axes:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphReductionBaseOp *v16;

  objc_storeStrong((id *)&self->_axes, a6);
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v15, v14, v13, v12);

  return v16;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v7;

  v7 = a7;
  __assert_rtn("-[MPSGraphReductionBaseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphReductionOps.mm", 43, "0 && \"use a child class\");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axes, 0);
}

@end
