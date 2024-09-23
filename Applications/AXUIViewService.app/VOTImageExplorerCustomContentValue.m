@implementation VOTImageExplorerCustomContentValue

- (VOTImageExplorerCustomContentValue)initWithFeatureValue:(id)a3 featureType:(id)a4
{
  id v6;
  id v7;
  VOTImageExplorerCustomContentValue *v8;
  VOTImageExplorerCustomContentValue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTImageExplorerCustomContentValue;
  v8 = -[VOTImageExplorerCustomContentValue init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[VOTImageExplorerCustomContentValue setValue:](v8, "setValue:", v6);
    -[VOTImageExplorerCustomContentValue setType:](v9, "setType:", v7);
  }

  return v9;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
