@implementation _MLCANEConvolutionParameters

+ (id)convolutionUnitParametersWith:(id)a3 biasParams:(id)a4 neuronParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConvolutionParams:biasParams:neuronParams:", v10, v9, v8);

  return v11;
}

- (_MLCANEConvolutionParameters)initWithConvolutionParams:(id)a3 biasParams:(id)a4 neuronParams:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MLCANEConvolutionParameters *v12;
  _MLCANEConvolutionParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLCANEConvolutionParameters;
  v12 = -[_MLCANEConvolutionParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_convolutionParams, a3);
    objc_storeStrong((id *)&v13->_biasParams, a4);
    objc_storeStrong((id *)&v13->_neuronParams, a5);
  }

  return v13;
}

- (NSDictionary)convolutionParams
{
  return self->_convolutionParams;
}

- (NSDictionary)biasParams
{
  return self->_biasParams;
}

- (NSArray)neuronParams
{
  return self->_neuronParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuronParams, 0);
  objc_storeStrong((id *)&self->_biasParams, 0);
  objc_storeStrong((id *)&self->_convolutionParams, 0);
}

@end
