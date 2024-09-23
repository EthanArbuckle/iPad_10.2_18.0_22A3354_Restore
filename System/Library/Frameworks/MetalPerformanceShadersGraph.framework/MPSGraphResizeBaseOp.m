@implementation MPSGraphResizeBaseOp

- (MPSGraphResizeBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 centerResult:(BOOL)a8 alignCorners:(BOOL)a9 layout:(unint64_t)a10 name:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  MPSGraphTensor *v20;
  BOOL v21;
  MPSGraphResizeBaseOp *v22;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a11;
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v20 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  v21 = validateLayout(v20, (MPSGraphTensorNamedDataLayout)a10, supportedLayouts, 5);

  if (!v21 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  self->_mode = a6;
  self->_nearestRoundingMode = a7;
  self->_centerResult = a8;
  self->_alignCorners = a9;
  self->_layout = a10;
  v22 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v16, v17, v18, v19);

  return v22;
}

- (MPSGraphResizeBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 centerResult:(BOOL)a8 alignCorners:(BOOL)a9 name:(id)a10
{
  self->_mode = a6;
  self->_nearestRoundingMode = a7;
  self->_centerResult = a8;
  self->_alignCorners = a9;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a10);
}

@end
