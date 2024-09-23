@implementation LACProcessingConfiguration

- (LACProcessingConfiguration)initWithNextProcessor:(id)a3
{
  id v5;
  LACProcessingConfiguration *v6;
  LACProcessingConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACProcessingConfiguration;
  v6 = -[LACProcessingConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nextProcessor, a3);

  return v7;
}

+ (id)defaultConfiguration
{
  LACProcessingConfiguration *v2;
  void *v3;
  LACProcessingConfiguration *v4;

  v2 = [LACProcessingConfiguration alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[LACProcessingConfiguration initWithNextProcessor:](v2, "initWithNextProcessor:", v3);

  return v4;
}

- (LACEvaluationRequestProcessor)nextProcessor
{
  return self->_nextProcessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextProcessor, 0);
}

@end
