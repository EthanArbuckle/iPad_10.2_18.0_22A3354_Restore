@implementation GCGenericDeviceDataAddExpressionModelBuilder

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
  v7.super_class = (Class)GCGenericDeviceDataAddExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v7, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "leftExpression", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataAddExpressionModelBuilder setLeftExpression:](self, "setLeftExpression:", v5);

  objc_msgSend(v4, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataAddExpressionModelBuilder setRightExpression:](self, "setRightExpression:", v6);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataAddExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataAddExpressionModelBuilder setLeftExpression:](self, "setLeftExpression:", 0);
  -[GCGenericDeviceDataAddExpressionModelBuilder setRightExpression:](self, "setRightExpression:", 0);
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
  v14.super_class = (Class)GCGenericDeviceDataAddExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v14, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataAddExpressionModelBuilder leftExpression](self, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataAddExpressionModel.m"), 103, CFSTR("'leftExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataAddExpressionModelBuilder rightExpression](self, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataAddExpressionModel.m"), 107, CFSTR("'rightExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)leftExpression
{
  return self->_leftExpression;
}

- (void)setLeftExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GCGenericDeviceDataProcessorExpressionModel)rightExpression
{
  return self->_rightExpression;
}

- (void)setRightExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpression, 0);
  objc_storeStrong((id *)&self->_leftExpression, 0);
}

- (GCGenericDeviceDataAddExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataAddExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  GCGenericDeviceDataAddExpressionModelBuilder *v13;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCGenericDeviceDataAddExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v43, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_40;
  v42 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("LeftExpression"), objc_opt_class(), &v42);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v42;
  if (!v8)
  {
    if (a4)
    {
      v50[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v15;
      v50[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v16;
      v17 = v51;
      v18 = v50;
LABEL_22:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_23:

LABEL_40:
    v13 = 0;
    goto LABEL_7;
  }
  v41 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v41);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v41;

  if (!v10)
  {
    if (a4)
    {
      v48[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v19;
      if (!v19)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("LeftExpression"));
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (void *)v19;
      v49[0] = v19;
      v48[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("Invalid 'Expression' definition.");
      v37 = (void *)v20;
      if (v20)
        v21 = (const __CFString *)v20;
      v49[1] = v21;
      v48[2] = *MEMORY[0x1E0CB3388];
      v22 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v22;
      v49[2] = v22;
      v48[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
        v23 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v23, "arrayByAddingObject:", CFSTR("LeftExpression"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v25;
      v26 = v49;
      v27 = v48;
      goto LABEL_34;
    }
LABEL_39:

    goto LABEL_40;
  }
  -[GCGenericDeviceDataAddExpressionModelBuilder setLeftExpression:](v7, "setLeftExpression:", v10);

  v40 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("RightExpression"), objc_opt_class(), &v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v40;
  if (!v8)
  {
    if (a4)
    {
      v46[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v15;
      v46[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v16;
      v17 = v47;
      v18 = v46;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v39 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v39;

  if (!v12)
  {
    if (a4)
    {
      v44[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v29 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v29;
      if (!v29)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("RightExpression"));
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (void *)v29;
      v45[0] = v29;
      v44[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("Invalid 'Expression' definition.");
      v37 = (void *)v30;
      if (v30)
        v31 = (const __CFString *)v30;
      v45[1] = v31;
      v44[2] = *MEMORY[0x1E0CB3388];
      v32 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v32 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v32;
      v45[2] = v32;
      v44[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v33;
      if (!v33)
        v33 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v33, "arrayByAddingObject:", CFSTR("RightExpression"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v25;
      v26 = v45;
      v27 = v44;
LABEL_34:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v26, v27, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      if (!v38)

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  -[GCGenericDeviceDataAddExpressionModelBuilder setRightExpression:](v7, "setRightExpression:", v12);

  v13 = v7;
LABEL_7:

  return v13;
}

@end
