@implementation GCGenericDeviceDataConstantExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v7, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "value", v7.receiver, v7.super_class);
  v6 = v5;

  -[GCGenericDeviceDataConstantExpressionModelBuilder setValue:](self, "setValue:", v6);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataConstantExpressionModelBuilder setValue:](self, "setValue:", 0.0);
}

- (id)build
{
  _QWORD *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v6, sel_build);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataConstantExpressionModelBuilder value](self, "value");
  v3[1] = v4;
  return v3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (GCGenericDeviceDataConstantExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataConstantExpressionModelBuilder *v7;
  void *v8;
  id v9;
  GCGenericDeviceDataConstantExpressionModelBuilder *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataConstantExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v16, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_4;
  }
  v15 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Value"), objc_opt_class(), &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v8)
  {
    if (a4)
    {
      v17[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v17[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v13;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "doubleValue");
  -[GCGenericDeviceDataConstantExpressionModelBuilder setValue:](v7, "setValue:");

  v10 = v7;
LABEL_4:

  return v10;
}

@end
