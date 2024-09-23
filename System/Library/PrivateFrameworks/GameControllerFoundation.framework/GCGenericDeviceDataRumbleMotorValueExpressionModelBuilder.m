@implementation GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v6, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "motorName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder setMotorName:](self, "setMotorName:", v5);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder setMotorName:](self, "setMotorName:", 0);
}

- (id)build
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v10, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder motorName](self, "motorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataRumbleMotorValueExpressionModel.m"), 89, CFSTR("'motorName' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (NSString)motorName
{
  return self->_motorName;
}

- (void)setMotorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motorName, 0);
}

- (GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *v7;
  void *v8;
  id v9;
  GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder *v10;
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
  v16.super_class = (Class)GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v16, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_4;
  }
  v15 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("MotorName"), objc_opt_class(), &v15);
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
  -[GCGenericDeviceDataRumbleMotorValueExpressionModelBuilder setMotorName:](v7, "setMotorName:", v8);

  v10 = v7;
LABEL_4:

  return v10;
}

@end
