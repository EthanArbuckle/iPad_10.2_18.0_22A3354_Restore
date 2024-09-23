@implementation ETLayerInitializationParameters

- (ETLayerInitializationParameters)initWithMode:(unint64_t)a3 parameters:(id)a4 error:(id *)a5
{
  id v7;
  ETLayerInitializationParameters *v8;
  ETLayerInitializationParameters *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ETLayerInitializationParameters;
  v8 = -[ETLayerInitializationParameters init](&v11, sel_init);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_parameters, a4);

  return v9;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
