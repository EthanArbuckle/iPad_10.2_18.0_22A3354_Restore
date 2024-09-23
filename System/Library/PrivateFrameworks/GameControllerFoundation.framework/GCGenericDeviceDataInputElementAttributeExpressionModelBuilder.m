@implementation GCGenericDeviceDataInputElementAttributeExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v7, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "elementIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", v5);

  objc_msgSend(v4, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setAttribute:](self, "setAttribute:", v6);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", 0);
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setAttribute:](self, "setAttribute:", 0);
}

- (id)build
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v14, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataInputElementAttributeExpressionModel.m"), 98, CFSTR("'elementIdentifier' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder attribute](self, "attribute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataInputElementAttributeExpressionModel.m"), 102, CFSTR("'attribute' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

- (GCGenericDeviceDataInputElementAttributeExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  GCGenericDeviceDataInputElementAttributeExpressionModelBuilder *v11;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v20, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_12;
  v19 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ElementIdentifier"), objc_opt_class(), &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (!v8)
  {
    if (a4)
    {
      v23[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v23[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      v15 = v24;
      v16 = v23;
LABEL_10:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v15, v16, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:

LABEL_12:
    v11 = 0;
    goto LABEL_5;
  }
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setElementIdentifier:](v7, "setElementIdentifier:", v8);

  v18 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Attribute"), objc_opt_class(), &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (!v10)
  {
    if (a4)
    {
      v21[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      v21[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v14;
      v15 = v22;
      v16 = v21;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[GCGenericDeviceDataInputElementAttributeExpressionModelBuilder setAttribute:](v7, "setAttribute:", v10);

  v11 = v7;
LABEL_5:

  return v11;
}

@end
