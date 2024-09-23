@implementation GCGenericDeviceDataBitTestExpressionModelBuilder

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
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v10, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "inputExpression", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setInputExpression:](self, "setInputExpression:", v5);

  objc_msgSend(v4, "maskExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setMaskExpression:](self, "setMaskExpression:", v6);

  objc_msgSend(v4, "trueExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setTrueExpression:](self, "setTrueExpression:", v7);

  objc_msgSend(v4, "falseExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setFalseExpression:](self, "setFalseExpression:", v8);

  v9 = objc_msgSend(v4, "partialMatch");
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setPartialMatch:](self, "setPartialMatch:", v9);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setInputExpression:](self, "setInputExpression:", 0);
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setMaskExpression:](self, "setMaskExpression:", 0);
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setTrueExpression:](self, "setTrueExpression:", 0);
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setFalseExpression:](self, "setFalseExpression:", 0);
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setPartialMatch:](self, "setPartialMatch:", 0);
}

- (id)build
{
  uint64_t v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v22, sel_build);
  v4 = objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModelBuilder inputExpression](self, "inputExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataBitTestExpressionModel.m"), 135, CFSTR("'inputExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v6;

  -[GCGenericDeviceDataBitTestExpressionModelBuilder maskExpression](self, "maskExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataBitTestExpressionModel.m"), 139, CFSTR("'maskExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v9;

  -[GCGenericDeviceDataBitTestExpressionModelBuilder trueExpression](self, "trueExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataBitTestExpressionModel.m"), 143, CFSTR("'trueExpression' can not be nil"));

  }
  v12 = objc_msgSend(v11, "copy");
  v13 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v12;

  -[GCGenericDeviceDataBitTestExpressionModelBuilder falseExpression](self, "falseExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataBitTestExpressionModel.m"), 147, CFSTR("'falseExpression' can not be nil"));

  }
  v15 = objc_msgSend(v14, "copy");
  v16 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v15;

  *(_BYTE *)(v4 + 40) = -[GCGenericDeviceDataBitTestExpressionModelBuilder partialMatch](self, "partialMatch");
  return (id)v4;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return self->_inputExpression;
}

- (void)setInputExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return self->_maskExpression;
}

- (void)setMaskExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return self->_trueExpression;
}

- (void)setTrueExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return self->_falseExpression;
}

- (void)setFalseExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)partialMatch
{
  return self->_partialMatch;
}

- (void)setPartialMatch:(BOOL)a3
{
  self->_partialMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataBitTestExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataBitTestExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  GCGenericDeviceDataBitTestExpressionModelBuilder *v18;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
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
  objc_super v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v66.receiver = self;
  v66.super_class = (Class)GCGenericDeviceDataBitTestExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v66, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_72;
  v65 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputExpression"), objc_opt_class(), &v65);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v65;
  if (!v8)
  {
    if (!a4)
      goto LABEL_55;
    v83[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v20;
    v83[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v21;
    v22 = v84;
    v23 = v83;
LABEL_54:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v23, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_55;
  }
  v64 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v64;

  if (!v10)
  {
    if (a4)
    {
      v81[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v24 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v24;
      if (!v24)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputExpression"));
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v24;
      v82[0] = v24;
      v81[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v25;
      if (v25)
        v26 = (const __CFString *)v25;
      v82[1] = v26;
      v81[2] = *MEMORY[0x1E0CB3388];
      v27 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v27;
      v82[2] = v27;
      v81[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
        v28 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v28, "arrayByAddingObject:", CFSTR("InputExpression"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v82[3] = v30;
      v31 = v82;
      v32 = v81;
      goto LABEL_66;
    }
    goto LABEL_71;
  }
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setInputExpression:](v7, "setInputExpression:", v10);

  v63 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("MaskExpression"), objc_opt_class(), &v63);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v63;
  if (!v8)
  {
    if (!a4)
      goto LABEL_55;
    v79[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v20;
    v79[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v21;
    v22 = v80;
    v23 = v79;
    goto LABEL_54;
  }
  v62 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v62);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v62;

  if (!v12)
  {
    if (a4)
    {
      v77[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v33 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v33;
      if (!v33)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("MaskExpression"));
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v33;
      v78[0] = v33;
      v77[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v34;
      if (v34)
        v35 = (const __CFString *)v34;
      v78[1] = v35;
      v77[2] = *MEMORY[0x1E0CB3388];
      v36 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v36;
      v78[2] = v36;
      v77[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v37;
      if (!v37)
        v37 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v37, "arrayByAddingObject:", CFSTR("MaskExpression"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v78[3] = v30;
      v31 = v78;
      v32 = v77;
      goto LABEL_66;
    }
    goto LABEL_71;
  }
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setMaskExpression:](v7, "setMaskExpression:", v12);

  v61 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("TrueExpression"), objc_opt_class(), &v61);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v61;
  if (!v8)
  {
    if (!a4)
      goto LABEL_55;
    v75[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v20;
    v75[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v21;
    v22 = v76;
    v23 = v75;
    goto LABEL_54;
  }
  v60 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v60);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v60;

  if (!v13)
  {
    if (a4)
    {
      v73[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v38 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v38;
      if (!v38)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("TrueExpression"));
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v38;
      v74[0] = v38;
      v73[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v39;
      if (v39)
        v40 = (const __CFString *)v39;
      v74[1] = v40;
      v73[2] = *MEMORY[0x1E0CB3388];
      v41 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v41;
      v74[2] = v41;
      v73[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v42;
      if (!v42)
        v42 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v42, "arrayByAddingObject:", CFSTR("TrueExpression"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v30;
      v31 = v74;
      v32 = v73;
      goto LABEL_66;
    }
LABEL_71:

    goto LABEL_72;
  }
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setTrueExpression:](v7, "setTrueExpression:", v13);

  v59 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("FalseExpression"), objc_opt_class(), &v59);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v59;
  if (!v8)
  {
    if (a4)
    {
      v71[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v20;
      v71[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v21;
      v22 = v72;
      v23 = v71;
      goto LABEL_54;
    }
LABEL_55:

LABEL_72:
    v18 = 0;
    goto LABEL_15;
  }
  v58 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v58);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v58;

  if (!v14)
  {
    if (a4)
    {
      v69[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v44 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v44;
      if (!v44)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("FalseExpression"));
        v44 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v44;
      v70[0] = v44;
      v69[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("Invalid 'Expression' definition.");
      v55 = (void *)v45;
      if (v45)
        v46 = (const __CFString *)v45;
      v70[1] = v46;
      v69[2] = *MEMORY[0x1E0CB3388];
      v47 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v53 = (void *)v47;
      v70[2] = v47;
      v69[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v48;
      if (!v48)
        v48 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v48, "arrayByAddingObject:", CFSTR("FalseExpression"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v70[3] = v30;
      v31 = v70;
      v32 = v69;
LABEL_66:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v31, v32, 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v49);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      if (!v56)

      goto LABEL_71;
    }
    goto LABEL_71;
  }
  -[GCGenericDeviceDataBitTestExpressionModelBuilder setFalseExpression:](v7, "setFalseExpression:", v14);

  v57 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("PartialMatch"), objc_opt_class(), &v57);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v57;
  v17 = v16;
  if (!v15 && v16)
  {
    if (a4)
    {
      v67[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v50;
      v67[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v17, "localizedFailureReason");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v51;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_72;
  }
  if (v15)
    -[GCGenericDeviceDataBitTestExpressionModelBuilder setPartialMatch:](v7, "setPartialMatch:", objc_msgSend(v15, "BOOLValue"));

  v18 = v7;
LABEL_15:

  return v18;
}

@end
