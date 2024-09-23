@implementation GCGenericDeviceDataElementExistsExpressionModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v8, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "elementIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", v5);

  objc_msgSend(v4, "trueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setTrueExpression:](self, "setTrueExpression:", v6);

  objc_msgSend(v4, "falseExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setFalseExpression:](self, "setFalseExpression:", v7);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setElementIdentifier:](self, "setElementIdentifier:", 0);
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
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v18, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataElementExistsExpressionModel.m"), 110, CFSTR("'elementIdentifier' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataElementExistsExpressionModelBuilder trueExpression](self, "trueExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataElementExistsExpressionModel.m"), 114, CFSTR("'trueExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceDataElementExistsExpressionModelBuilder falseExpression](self, "falseExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataElementExistsExpressionModel.m"), 118, CFSTR("'falseExpression' can not be nil"));

  }
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

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

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return self->_trueExpression;
}

- (void)setTrueExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return self->_falseExpression;
}

- (void)setFalseExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

- (GCGenericDeviceDataElementExistsExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataElementExistsExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  GCGenericDeviceDataElementExistsExpressionModelBuilder *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  id *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v50, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_44;
  v49 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ElementIdentifier"), objc_opt_class(), &v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v49;
  if (!v8)
  {
    if (a4)
    {
      v59[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v17;
      v59[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v18;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_44;
  }
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setElementIdentifier:](v7, "setElementIdentifier:", v8);

  v48 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("TrueExpression"), objc_opt_class(), &v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v48;
  if (!v10)
  {
    if (a4)
    {
      v57[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v20;
      v57[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v21;
      v22 = v58;
      v23 = v57;
LABEL_26:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v23, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v35);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_27:

LABEL_44:
    v15 = 0;
    goto LABEL_8;
  }
  v47 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v10, &v47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v47;

  if (!v12)
  {
    if (a4)
    {
      v24 = a4;
      v55[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v13, "localizedDescription");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (!v25)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("TrueExpression"));
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v43 = (void *)v25;
      v56[0] = v25;
      v55[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v13, "localizedFailureReason");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("Invalid 'Expression' definition.");
      v44 = (void *)v27;
      if (v27)
        v28 = (const __CFString *)v27;
      v56[1] = v28;
      v55[2] = *MEMORY[0x1E0CB3388];
      v29 = (uint64_t)v13;
      if (!v13)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v42 = (void *)v29;
      v56[2] = v29;
      v55[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v13, "gc_failingKeyPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (!v30)
        v30 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v30, "arrayByAddingObject:", CFSTR("TrueExpression"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[3] = v32;
      v33 = v56;
      v34 = v55;
      goto LABEL_38;
    }
LABEL_43:

    goto LABEL_44;
  }
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setTrueExpression:](v7, "setTrueExpression:", v12);

  v46 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("FalseExpression"), objc_opt_class(), &v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v46;
  if (!v10)
  {
    if (a4)
    {
      v53[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v20;
      v53[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v21;
      v22 = v54;
      v23 = v53;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v45 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v10, &v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v45;

  if (!v14)
  {
    if (a4)
    {
      v24 = a4;
      v51[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v13, "localizedDescription");
      v36 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v36;
      if (!v36)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("FalseExpression"));
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v43 = (void *)v36;
      v52[0] = v36;
      v51[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v13, "localizedFailureReason");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("Invalid 'Expression' definition.");
      v44 = (void *)v37;
      if (v37)
        v38 = (const __CFString *)v37;
      v52[1] = v38;
      v51[2] = *MEMORY[0x1E0CB3388];
      v39 = (uint64_t)v13;
      if (!v13)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v42 = (void *)v39;
      v52[2] = v39;
      v51[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v13, "gc_failingKeyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v40;
      if (!v40)
        v40 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v40, "arrayByAddingObject:", CFSTR("FalseExpression"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v52[3] = v32;
      v33 = v52;
      v34 = v51;
LABEL_38:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v33, v34, 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v41);
      *v24 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13)
      if (!v26)

      goto LABEL_43;
    }
    goto LABEL_43;
  }
  -[GCGenericDeviceDataElementExistsExpressionModelBuilder setFalseExpression:](v7, "setFalseExpression:", v14);

  v15 = v7;
LABEL_8:

  return v15;
}

@end
