@implementation GCGenericDeviceDataInterpolateExpressionModelBuilder

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
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v10, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "inputExpression", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputExpression:](self, "setInputExpression:", v5);

  objc_msgSend(v4, "inputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMinExpression:](self, "setInputMinExpression:", v6);

  objc_msgSend(v4, "inputMaxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMaxExpression:](self, "setInputMaxExpression:", v7);

  objc_msgSend(v4, "outputMinExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMinExpression:](self, "setOutputMinExpression:", v8);

  objc_msgSend(v4, "outputMaxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMaxExpression:](self, "setOutputMaxExpression:", v9);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputExpression:](self, "setInputExpression:", 0);
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMinExpression:](self, "setInputMinExpression:", 0);
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMaxExpression:](self, "setInputMaxExpression:", 0);
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMinExpression:](self, "setOutputMinExpression:", 0);
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMaxExpression:](self, "setOutputMaxExpression:", 0);
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v26, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder inputExpression](self, "inputExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGCGenericDeviceDataInterpolateExpressionModel.m"), 136, CFSTR("'inputExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataInterpolateExpressionModelBuilder inputMinExpression](self, "inputMinExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGCGenericDeviceDataInterpolateExpressionModel.m"), 140, CFSTR("'inputMinExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceDataInterpolateExpressionModelBuilder inputMaxExpression](self, "inputMaxExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGCGenericDeviceDataInterpolateExpressionModel.m"), 144, CFSTR("'inputMaxExpression' can not be nil"));

  }
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[GCGenericDeviceDataInterpolateExpressionModelBuilder outputMinExpression](self, "outputMinExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGCGenericDeviceDataInterpolateExpressionModel.m"), 148, CFSTR("'outputMinExpression' can not be nil"));

  }
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

  -[GCGenericDeviceDataInterpolateExpressionModelBuilder outputMaxExpression](self, "outputMaxExpression");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGCGenericDeviceDataInterpolateExpressionModel.m"), 152, CFSTR("'outputMaxExpression' can not be nil"));

  }
  v18 = objc_msgSend(v17, "copy");
  v19 = (void *)v4[5];
  v4[5] = v18;

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

- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression
{
  return self->_inputMinExpression;
}

- (void)setInputMinExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression
{
  return self->_inputMaxExpression;
}

- (void)setInputMaxExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression
{
  return self->_outputMinExpression;
}

- (void)setOutputMinExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression
{
  return self->_outputMaxExpression;
}

- (void)setOutputMaxExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMaxExpression, 0);
  objc_storeStrong((id *)&self->_outputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataInterpolateExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataInterpolateExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GCGenericDeviceDataInterpolateExpressionModelBuilder *v16;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v67, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_82;
  v66 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputExpression"), objc_opt_class(), &v66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v66;
  if (!v8)
  {
    if (!a4)
      goto LABEL_65;
    v86[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v18;
    v86[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v19;
    v20 = v87;
    v21 = v86;
LABEL_64:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v20, v21, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v46);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_65;
  }
  v65 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v65);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v65;

  if (!v10)
  {
    if (a4)
    {
      v84[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v22 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v22;
      if (!v22)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputExpression"));
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v22;
      v85[0] = v22;
      v84[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v23;
      if (v23)
        v24 = (const __CFString *)v23;
      v85[1] = v24;
      v84[2] = *MEMORY[0x1E0CB3388];
      v25 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v25;
      v85[2] = v25;
      v84[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v26)
        v26 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v26, "arrayByAddingObject:", CFSTR("InputExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v28;
      v29 = v85;
      v30 = v84;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputExpression:](v7, "setInputExpression:", v10);

  v64 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputMinExpression"), objc_opt_class(), &v64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v64;
  if (!v8)
  {
    if (!a4)
      goto LABEL_65;
    v82[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v18;
    v82[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v19;
    v20 = v83;
    v21 = v82;
    goto LABEL_64;
  }
  v63 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v63);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v63;

  if (!v12)
  {
    if (a4)
    {
      v80[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v31 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v31;
      if (!v31)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputMinExpression"));
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v31;
      v81[0] = v31;
      v80[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v32;
      if (v32)
        v33 = (const __CFString *)v32;
      v81[1] = v33;
      v80[2] = *MEMORY[0x1E0CB3388];
      v34 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v34 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v34;
      v81[2] = v34;
      v80[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v35;
      if (!v35)
        v35 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v35, "arrayByAddingObject:", CFSTR("InputMinExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v81[3] = v28;
      v29 = v81;
      v30 = v80;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMinExpression:](v7, "setInputMinExpression:", v12);

  v62 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputMaxExpression"), objc_opt_class(), &v62);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v62;
  if (!v8)
  {
    if (!a4)
      goto LABEL_65;
    v78[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v18;
    v78[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v19;
    v20 = v79;
    v21 = v78;
    goto LABEL_64;
  }
  v61 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v61;

  if (!v13)
  {
    if (a4)
    {
      v76[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v36 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v36;
      if (!v36)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputMaxExpression"));
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v36;
      v77[0] = v36;
      v76[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v37;
      if (v37)
        v38 = (const __CFString *)v37;
      v77[1] = v38;
      v76[2] = *MEMORY[0x1E0CB3388];
      v39 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v39;
      v77[2] = v39;
      v76[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v40;
      if (!v40)
        v40 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v40, "arrayByAddingObject:", CFSTR("InputMaxExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v77[3] = v28;
      v29 = v77;
      v30 = v76;
      goto LABEL_76;
    }
    goto LABEL_81;
  }
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setInputMaxExpression:](v7, "setInputMaxExpression:", v13);

  v60 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("OutputMinExpression"), objc_opt_class(), &v60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v60;
  if (!v8)
  {
    if (!a4)
      goto LABEL_65;
    v74[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v18;
    v74[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v19;
    v20 = v75;
    v21 = v74;
    goto LABEL_64;
  }
  v59 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v59);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v59;

  if (!v14)
  {
    if (a4)
    {
      v72[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v41 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v41;
      if (!v41)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("OutputMinExpression"));
        v41 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v41;
      v73[0] = v41;
      v72[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v42;
      if (v42)
        v43 = (const __CFString *)v42;
      v73[1] = v43;
      v72[2] = *MEMORY[0x1E0CB3388];
      v44 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v44 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v44;
      v73[2] = v44;
      v72[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v45;
      if (!v45)
        v45 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v45, "arrayByAddingObject:", CFSTR("OutputMinExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v73[3] = v28;
      v29 = v73;
      v30 = v72;
      goto LABEL_76;
    }
LABEL_81:

    goto LABEL_82;
  }
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMinExpression:](v7, "setOutputMinExpression:", v14);

  v58 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("OutputMaxExpression"), objc_opt_class(), &v58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v58;
  if (!v8)
  {
    if (a4)
    {
      v70[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v18;
      v70[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v19;
      v20 = v71;
      v21 = v70;
      goto LABEL_64;
    }
LABEL_65:

LABEL_82:
    v16 = 0;
    goto LABEL_13;
  }
  v57 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v57);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v57;

  if (!v15)
  {
    if (a4)
    {
      v68[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v47 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v47;
      if (!v47)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("OutputMaxExpression"));
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v47;
      v69[0] = v47;
      v68[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v48;
      if (v48)
        v49 = (const __CFString *)v48;
      v69[1] = v49;
      v68[2] = *MEMORY[0x1E0CB3388];
      v50 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v50 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v50;
      v69[2] = v50;
      v68[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v51;
      if (!v51)
        v51 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v51, "arrayByAddingObject:", CFSTR("OutputMaxExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v69[3] = v28;
      v29 = v69;
      v30 = v68;
LABEL_76:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v29, v30, 4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      if (!v56)

      goto LABEL_81;
    }
    goto LABEL_81;
  }
  -[GCGenericDeviceDataInterpolateExpressionModelBuilder setOutputMaxExpression:](v7, "setOutputMaxExpression:", v15);

  v16 = v7;
LABEL_13:

  return v16;
}

@end
