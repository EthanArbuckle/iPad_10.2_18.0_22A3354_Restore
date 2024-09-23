@implementation GCGenericDeviceDataProcessorExpressionModelBuilder

- (GCGenericDeviceDataProcessorExpressionModelBuilder)init
{
  uint64_t v4;
  GCGenericDeviceDataProcessorExpressionModelBuilder *v5;
  objc_super v7;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    -[GCGenericDeviceDataProcessorExpressionModelBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataProcessorExpressionModelBuilder;
  v5 = -[GCGenericDeviceDataProcessorExpressionModelBuilder init](&v7, sel_init);
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](v5, "reset");
  return v5;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (id)build
{
  return objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "modelClass"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isEqual:", self);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceDataProcessorExpressionModelBuilder;
    v5 = -[GCGenericDeviceDataProcessorExpressionModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

@end
