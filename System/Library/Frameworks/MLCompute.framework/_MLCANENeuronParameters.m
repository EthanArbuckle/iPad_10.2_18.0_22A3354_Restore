@implementation _MLCANENeuronParameters

+ (id)neuronUnitParametersWith:(id)a3 neuronType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNeuronParams:neuronType:", v6, v4);

  return v7;
}

- (_MLCANENeuronParameters)initWithNeuronParams:(id)a3 neuronType:(int)a4
{
  id v7;
  _MLCANENeuronParameters *v8;
  _MLCANENeuronParameters *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MLCANENeuronParameters;
  v8 = -[_MLCANENeuronParameters init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_neuronParams, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSArray)neuronParams
{
  return self->_neuronParams;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuronParams, 0);
}

@end
