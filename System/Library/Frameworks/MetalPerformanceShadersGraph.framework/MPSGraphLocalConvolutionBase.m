@implementation MPSGraphLocalConvolutionBase

- (MPSGraphLocalConvolutionBase)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSArray *v21;
  NSArray *kernelShape;
  MPSGraphLocalConvolutionBase *v23;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a10;
  self->_dataLayout = a6;
  v21 = (NSArray *)objc_msgSend(v19, "copy");
  kernelShape = self->_kernelShape;
  self->_kernelShape = v21;

  self->_dilationRateInX = a8;
  self->_dilationRateInY = a9;
  v23 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v16, v17, v18, v20);

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelShape, 0);
}

@end
