@implementation GCGenericDeviceDataInputElementValueExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v7, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "elementIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", v5);

  v6 = objc_msgSend(v4, "scaleType");
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setScaleType:](self, "setScaleType:", v6);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", 0);
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setScaleType:](self, "setScaleType:", -2);
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
  v10.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v10, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataInputElementValueExpressionModel.m"), 119, CFSTR("'elementIdentifier' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  v4[2] = -[GCGenericDeviceDataInputElementValueExpressionModelBuilder scaleType](self, "scaleType");
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

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void)setScaleType:(int64_t)a3
{
  self->_scaleType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

- (GCGenericDeviceDataInputElementValueExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataInputElementValueExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  GCGenericDeviceDataInputElementValueExpressionModelBuilder *v13;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v25, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_26;
  v24 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ElementIdentifier"), objc_opt_class(), &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (!v8)
  {
    if (a4)
    {
      v30[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v20;
      v30[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v21;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setElementIdentifier:](v7, "setElementIdentifier:", v8);

  v23 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("ScaleType"), objc_opt_class(), &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  v9 = v11;
  if (!v10 && v11)
  {
    if (!a4)
      goto LABEL_24;
    v28[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    v28[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    v17 = v29;
    v18 = v28;
LABEL_23:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
LABEL_25:

LABEL_26:
    v13 = 0;
    goto LABEL_20;
  }
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Raw")) & 1) != 0)
    {
      v12 = -3;
LABEL_18:
      -[GCGenericDeviceDataInputElementValueExpressionModelBuilder setScaleType:](v7, "setScaleType:", v12);
      goto LABEL_19;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      v12 = -2;
      goto LABEL_18;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Logical")) & 1) != 0)
    {
      v12 = -1;
      goto LABEL_18;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Physical")) & 1) != 0)
    {
      v12 = 1;
      goto LABEL_18;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Exponent")) & 1) != 0)
    {
      v12 = 2;
      goto LABEL_18;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Calibrated")) & 1) != 0)
    {
      v12 = 0;
      goto LABEL_18;
    }
    if (!a4)
      goto LABEL_24;
    v26[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v26[1] = *MEMORY[0x1E0CB2D68];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid '%@'."), v10, CFSTR("ScaleType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v16;
    v17 = v27;
    v18 = v26;
    goto LABEL_23;
  }
LABEL_19:

  v13 = v7;
LABEL_20:

  return v13;
}

@end
