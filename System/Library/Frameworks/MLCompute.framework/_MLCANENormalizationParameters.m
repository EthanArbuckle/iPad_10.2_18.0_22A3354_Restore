@implementation _MLCANENormalizationParameters

+ (id)normalizationUnitParametersWith:(id)a3 gocParams:(id)a4 neuronParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNormalizationParams:gocParams:neuronParams:", v10, v9, v8);

  return v11;
}

- (_MLCANENormalizationParameters)initWithNormalizationParams:(id)a3 gocParams:(id)a4 neuronParams:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MLCANENormalizationParameters *v12;
  _MLCANENormalizationParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLCANENormalizationParameters;
  v12 = -[_MLCANENormalizationParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_normalizationParams, a3);
    objc_storeStrong((id *)&v13->_gocParams, a4);
    objc_storeStrong((id *)&v13->_neuronParams, a5);
  }

  return v13;
}

- (NSDictionary)normalizationParams
{
  return self->_normalizationParams;
}

- (NSDictionary)gocParams
{
  return self->_gocParams;
}

- (NSArray)neuronParams
{
  return self->_neuronParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuronParams, 0);
  objc_storeStrong((id *)&self->_gocParams, 0);
  objc_storeStrong((id *)&self->_normalizationParams, 0);
}

@end
