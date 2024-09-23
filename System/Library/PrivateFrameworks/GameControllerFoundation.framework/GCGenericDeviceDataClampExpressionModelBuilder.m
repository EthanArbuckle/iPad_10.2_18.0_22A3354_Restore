@implementation GCGenericDeviceDataClampExpressionModelBuilder

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
  v8.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v8, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "inputExpression", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModelBuilder setInputExpression:](self, "setInputExpression:", v5);

  objc_msgSend(v4, "minExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModelBuilder setMinExpression:](self, "setMinExpression:", v6);

  objc_msgSend(v4, "maxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataClampExpressionModelBuilder setMaxExpression:](self, "setMaxExpression:", v7);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataClampExpressionModelBuilder setInputExpression:](self, "setInputExpression:", 0);
  -[GCGenericDeviceDataClampExpressionModelBuilder setMinExpression:](self, "setMinExpression:", 0);
  -[GCGenericDeviceDataClampExpressionModelBuilder setMaxExpression:](self, "setMaxExpression:", 0);
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v16, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModelBuilder inputExpression](self, "inputExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataClampExpressionModel.m"), 114, CFSTR("'inputExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataClampExpressionModelBuilder minExpression](self, "minExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceDataClampExpressionModelBuilder maxExpression](self, "maxExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return self->_inputExpression;
}

- (void)setInputExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GCGenericDeviceDataProcessorExpressionModel)minExpression
{
  return self->_minExpression;
}

- (void)setMinExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceDataProcessorExpressionModel)maxExpression
{
  return self->_maxExpression;
}

- (void)setMaxExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxExpression, 0);
  objc_storeStrong((id *)&self->_minExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataClampExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataClampExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  GCGenericDeviceDataClampExpressionModelBuilder *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  objc_super v59;
  _QWORD v60[4];
  _QWORD v61[4];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)GCGenericDeviceDataClampExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v59, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_42;
  v58 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputExpression"), objc_opt_class(), &v58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v58;
  if (!v8)
  {
    if (a4)
    {
      v70[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v19;
      v70[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v20;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_42;
  }
  v57 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v57);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v57;

  if (!v10)
  {
    if (!a4)
    {
LABEL_40:

LABEL_41:
LABEL_42:
      v17 = 0;
      goto LABEL_17;
    }
    v68[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v11, "localizedDescription");
    v22 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v22;
    if (!v22)
    {
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputExpression"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v49 = (void *)v22;
    v69[0] = v22;
    v68[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v11, "localizedFailureReason");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("Invalid 'Expression' definition.");
    v25 = (void *)v23;
    if (v23)
      v24 = (const __CFString *)v23;
    v69[1] = v24;
    v68[2] = *MEMORY[0x1E0CB3388];
    v26 = (uint64_t)v11;
    if (!v11)
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v48 = (void *)v26;
    v69[2] = v26;
    v68[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v11, "gc_failingKeyPath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
      v27 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v27, "arrayByAddingObject:", CFSTR("InputExpression"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v29;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    v31 = v51;
    if (!v51)

LABEL_39:
    goto LABEL_40;
  }
  -[GCGenericDeviceDataClampExpressionModelBuilder setInputExpression:](v7, "setInputExpression:", v10);

  v56 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("MinExpression"), objc_opt_class(), &v56);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v56;
  v13 = v12;
  if (!v8 && v12)
  {
    if (a4)
    {
      v66[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v10;
      v66[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v13, "localizedFailureReason");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v31;
      v32 = v67;
      v33 = v66;
LABEL_38:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v32, v33, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v13;
      goto LABEL_39;
    }
LABEL_43:
    v11 = v13;
    goto LABEL_41;
  }
  if (v8)
  {
    v55 = 0;
    +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v55);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v55;

    if (!v14)
    {
      if (!a4)
        goto LABEL_41;
      v64[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10;
      if (!v10)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("MinExpression"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v65[0] = v31;
      v64[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("Invalid 'Expression' definition.");
      v52 = (void *)v35;
      if (v35)
        v36 = (const __CFString *)v35;
      v65[1] = v36;
      v64[2] = *MEMORY[0x1E0CB3388];
      v37 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v50 = (void *)v37;
      v65[2] = v37;
      v64[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (!v38)
        v38 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v38, "arrayByAddingObject:", CFSTR("MinExpression"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] = v40;
      v41 = v65;
      v42 = v64;
LABEL_64:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v41, v42, 4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v47);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      if (v10)
        goto LABEL_40;
      goto LABEL_39;
    }
    -[GCGenericDeviceDataClampExpressionModelBuilder setMinExpression:](v7, "setMinExpression:", v14);

  }
  else
  {
    v11 = v12;
  }

  v54 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("MaxExpression"), objc_opt_class(), &v54);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v54;
  v13 = v15;
  if (!v8 && v15)
  {
    if (a4)
    {
      v62[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v10;
      v62[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v13, "localizedFailureReason");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v31;
      v32 = v63;
      v33 = v62;
      goto LABEL_38;
    }
    goto LABEL_43;
  }
  if (!v8)
  {
    v11 = v15;
    goto LABEL_16;
  }
  v53 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v53);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v53;

  if (!v16)
  {
    if (!a4)
      goto LABEL_41;
    v60[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v11, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v10;
    if (!v10)
    {
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("MaxExpression"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v61[0] = v31;
    v60[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v11, "localizedFailureReason");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = CFSTR("Invalid 'Expression' definition.");
    v52 = (void *)v43;
    if (v43)
      v44 = (const __CFString *)v43;
    v61[1] = v44;
    v60[2] = *MEMORY[0x1E0CB3388];
    v45 = (uint64_t)v11;
    if (!v11)
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v50 = (void *)v45;
    v61[2] = v45;
    v60[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v11, "gc_failingKeyPath");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v46;
    if (!v46)
      v46 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v46, "arrayByAddingObject:", CFSTR("MaxExpression"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v40;
    v41 = v61;
    v42 = v60;
    goto LABEL_64;
  }
  -[GCGenericDeviceDataClampExpressionModelBuilder setMaxExpression:](v7, "setMaxExpression:", v16);

LABEL_16:
  v17 = v7;
LABEL_17:

  return v17;
}

@end
