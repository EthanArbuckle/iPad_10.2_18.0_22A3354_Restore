@implementation ATXActionPredictableParameters

- (ATXActionPredictableParameters)init
{
  void *v3;
  ATXActionPredictableParameters *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXActionPredictableParameters initWithParameterKeys:](self, "initWithParameterKeys:", v3);

  return v4;
}

- (ATXActionPredictableParameters)initWithParameterKeys:(id)a3
{
  id v4;
  ATXActionPredictableParameters *v5;
  uint64_t v6;
  NSSet *parameterKeys;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionPredictableParameters;
  v5 = -[ATXActionPredictableParameters init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    parameterKeys = v5->_parameterKeys;
    v5->_parameterKeys = (NSSet *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_parameterKeys, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXActionPredictableParameters *v4;
  ATXActionPredictableParameters *v5;
  BOOL v6;

  v4 = (ATXActionPredictableParameters *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActionPredictableParameters isEqualToATXActionPredictableParameters:](self, "isEqualToATXActionPredictableParameters:", v5);

  return v6;
}

- (BOOL)isEqualToATXActionPredictableParameters:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "parameterKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictableParameters parameterKeys](self, "parameterKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToSet:", v5);

  return v6;
}

- (NSSet)parameterKeys
{
  return self->_parameterKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKeys, 0);
}

@end
