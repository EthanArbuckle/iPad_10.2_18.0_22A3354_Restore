@implementation MPSGraphConvolution2DBaseOp

- (MPSGraphConvolution2DBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphConvolution2DOpDescriptor *v17;
  MPSGraphConvolution2DOpDescriptor *desc;
  MPSGraphConvolution2DBaseOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphConvolution2DOpDescriptor *)objc_msgSend(v15, "copy");
  desc = self->_desc;
  self->_desc = v17;

  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
