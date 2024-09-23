@implementation MLModelStructureNeuralNetworkLayer

- (MLModelStructureNeuralNetworkLayer)initWithName:(id)a3 type:(id)a4 inputNames:(id)a5 outputNames:(id)a6 path:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MLModelStructureNeuralNetworkLayer *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSArray *inputNames;
  uint64_t v24;
  NSArray *outputNames;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MLModelStructureNeuralNetworkLayer;
  v17 = -[MLModelStructureNeuralNetworkLayer init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    type = v17->_type;
    v17->_type = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    inputNames = v17->_inputNames;
    v17->_inputNames = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    outputNames = v17->_outputNames;
    v17->_outputNames = (NSArray *)v24;

    objc_storeStrong((id *)&v17->_path, a7);
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (MLModelStructurePath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
