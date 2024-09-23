@implementation ETOptimizerDefinition

- (ETOptimizerDefinition)initWithOptimizationAlgorithm:(int64_t)a3 parameters:(id)a4 error:(id *)a5
{
  id v8;
  ETOptimizerDefinition *v9;
  ETOptimizerDefinition *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ETOptimizerDefinition;
  v9 = -[ETOptimizerDefinition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_optimizationParameters, a4);
  }

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)optimizationParameters
{
  return self->_optimizationParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizationParameters, 0);
}

@end
