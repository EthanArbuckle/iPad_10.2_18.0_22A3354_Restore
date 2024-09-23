@implementation _MLCANESoftmaxParameters

+ (id)softmaxUnitParametersWith:(id)a3 neuronParams:(id)a4 gocParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSoftmaxParams:neuronParams:gocParams:", v10, v9, v8);

  return v11;
}

- (_MLCANESoftmaxParameters)initWithSoftmaxParams:(id)a3 neuronParams:(id)a4 gocParams:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MLCANESoftmaxParameters *v12;
  _MLCANESoftmaxParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLCANESoftmaxParameters;
  v12 = -[_MLCANESoftmaxParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_softmaxParams, a3);
    objc_storeStrong((id *)&v13->_neuronParams, a4);
    objc_storeStrong((id *)&v13->_gocParams, a5);
  }

  return v13;
}

- (NSDictionary)softmaxParams
{
  return self->_softmaxParams;
}

- (NSDictionary)neuronParams
{
  return self->_neuronParams;
}

- (NSDictionary)gocParams
{
  return self->_gocParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gocParams, 0);
  objc_storeStrong((id *)&self->_neuronParams, 0);
  objc_storeStrong((id *)&self->_softmaxParams, 0);
}

@end
