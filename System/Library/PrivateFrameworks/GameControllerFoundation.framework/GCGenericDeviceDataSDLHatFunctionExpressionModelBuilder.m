@implementation GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder

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
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder initializeWithModel:](&v11, sel_initializeWithModel_, v4);
  objc_msgSend(v4, "inputExpression", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputExpression:](self, "setInputExpression:", v5);

  objc_msgSend(v4, "inputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMinExpression:](self, "setInputMinExpression:", v6);

  objc_msgSend(v4, "inputMaxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMaxExpression:](self, "setInputMaxExpression:", v7);

  objc_msgSend(v4, "maskExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setMaskExpression:](self, "setMaskExpression:", v8);

  objc_msgSend(v4, "trueExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setTrueExpression:](self, "setTrueExpression:", v9);

  objc_msgSend(v4, "falseExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setFalseExpression:](self, "setFalseExpression:", v10);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder reset](&v3, sel_reset);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputExpression:](self, "setInputExpression:", 0);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMinExpression:](self, "setInputMinExpression:", 0);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMaxExpression:](self, "setInputMaxExpression:", 0);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setMaskExpression:](self, "setMaskExpression:", 0);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setTrueExpression:](self, "setTrueExpression:", 0);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setFalseExpression:](self, "setFalseExpression:", 0);
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  -[GCGenericDeviceDataProcessorExpressionModelBuilder build](&v30, sel_build);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder inputExpression](self, "inputExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 147, CFSTR("'inputExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder inputMinExpression](self, "inputMinExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 151, CFSTR("'inputMinExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder inputMaxExpression](self, "inputMaxExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 155, CFSTR("'inputMaxExpression' can not be nil"));

  }
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder maskExpression](self, "maskExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 159, CFSTR("'maskExpression' can not be nil"));

  }
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder trueExpression](self, "trueExpression");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 163, CFSTR("'trueExpression' can not be nil"));

  }
  v18 = objc_msgSend(v17, "copy");
  v19 = (void *)v4[5];
  v4[5] = v18;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder falseExpression](self, "falseExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDataSDLHatFunctionExpressionModel.m"), 167, CFSTR("'falseExpression' can not be nil"));

  }
  v21 = objc_msgSend(v20, "copy");
  v22 = (void *)v4[6];
  v4[6] = v21;

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

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return self->_maskExpression;
}

- (void)setMaskExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return self->_trueExpression;
}

- (void)setTrueExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return self->_falseExpression;
}

- (void)setFalseExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder *v17;
  void *v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  objc_super v75;
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
  _QWORD v87[2];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[4];
  _QWORD v93[4];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[2];
  _QWORD v99[4];

  v99[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder;
  v7 = -[GCGenericDeviceDataProcessorExpressionModelBuilder initWithDictionaryRepresentation:error:](&v75, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_96;
  v74 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputExpression"), objc_opt_class(), &v74);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v74;
  if (!v8)
  {
    if (!a4)
      goto LABEL_79;
    v98[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v19;
    v98[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v20;
    v21 = v99;
    v22 = v98;
LABEL_78:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v21, v22, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v52);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_79;
  }
  v73 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v73);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v73;

  if (!v10)
  {
    if (a4)
    {
      v96[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v23 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v23;
      if (!v23)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputExpression"));
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v23;
      v97[0] = v23;
      v96[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v24;
      if (v24)
        v25 = (const __CFString *)v24;
      v97[1] = v25;
      v96[2] = *MEMORY[0x1E0CB3388];
      v26 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v26;
      v97[2] = v26;
      v96[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (!v27)
        v27 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v27, "arrayByAddingObject:", CFSTR("InputExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v97[3] = v29;
      v30 = v97;
      v31 = v96;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputExpression:](v7, "setInputExpression:", v10);

  v72 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputMinExpression"), objc_opt_class(), &v72);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v72;
  if (!v8)
  {
    if (!a4)
      goto LABEL_79;
    v94[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v19;
    v94[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v20;
    v21 = v95;
    v22 = v94;
    goto LABEL_78;
  }
  v71 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v71);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v71;

  if (!v12)
  {
    if (a4)
    {
      v92[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v32 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v32;
      if (!v32)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputMinExpression"));
        v32 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v32;
      v93[0] = v32;
      v92[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v33;
      if (v33)
        v34 = (const __CFString *)v33;
      v93[1] = v34;
      v92[2] = *MEMORY[0x1E0CB3388];
      v35 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v35 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v35;
      v93[2] = v35;
      v92[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v36;
      if (!v36)
        v36 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v36, "arrayByAddingObject:", CFSTR("InputMinExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v93[3] = v29;
      v30 = v93;
      v31 = v92;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMinExpression:](v7, "setInputMinExpression:", v12);

  v70 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("InputMaxExpression"), objc_opt_class(), &v70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v70;
  if (!v8)
  {
    if (!a4)
      goto LABEL_79;
    v90[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v19;
    v90[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v20;
    v21 = v91;
    v22 = v90;
    goto LABEL_78;
  }
  v69 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v69);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v69;

  if (!v13)
  {
    if (a4)
    {
      v88[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v37 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v37;
      if (!v37)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("InputMaxExpression"));
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v37;
      v89[0] = v37;
      v88[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v38;
      if (v38)
        v39 = (const __CFString *)v38;
      v89[1] = v39;
      v88[2] = *MEMORY[0x1E0CB3388];
      v40 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v40 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v40;
      v89[2] = v40;
      v88[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v41;
      if (!v41)
        v41 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v41, "arrayByAddingObject:", CFSTR("InputMaxExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v89[3] = v29;
      v30 = v89;
      v31 = v88;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setInputMaxExpression:](v7, "setInputMaxExpression:", v13);

  v68 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("MaskExpression"), objc_opt_class(), &v68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v68;
  if (!v8)
  {
    if (!a4)
      goto LABEL_79;
    v86[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v19;
    v86[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v20;
    v21 = v87;
    v22 = v86;
    goto LABEL_78;
  }
  v67 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v67);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v67;

  if (!v14)
  {
    if (a4)
    {
      v84[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v42 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v42;
      if (!v42)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("MaskExpression"));
        v42 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v42;
      v85[0] = v42;
      v84[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v43;
      if (v43)
        v44 = (const __CFString *)v43;
      v85[1] = v44;
      v84[2] = *MEMORY[0x1E0CB3388];
      v45 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v45 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v45;
      v85[2] = v45;
      v84[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v46;
      if (!v46)
        v46 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v46, "arrayByAddingObject:", CFSTR("MaskExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v29;
      v30 = v85;
      v31 = v84;
      goto LABEL_90;
    }
    goto LABEL_95;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setMaskExpression:](v7, "setMaskExpression:", v14);

  v66 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("TrueExpression"), objc_opt_class(), &v66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v66;
  if (!v8)
  {
    if (!a4)
      goto LABEL_79;
    v82[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v19;
    v82[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v20;
    v21 = v83;
    v22 = v82;
    goto LABEL_78;
  }
  v65 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v65;

  if (!v15)
  {
    if (a4)
    {
      v80[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v47 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v47;
      if (!v47)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("TrueExpression"));
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v47;
      v81[0] = v47;
      v80[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v48;
      if (v48)
        v49 = (const __CFString *)v48;
      v81[1] = v49;
      v80[2] = *MEMORY[0x1E0CB3388];
      v50 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v50 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v50;
      v81[2] = v50;
      v80[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v51;
      if (!v51)
        v51 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v51, "arrayByAddingObject:", CFSTR("TrueExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v81[3] = v29;
      v30 = v81;
      v31 = v80;
      goto LABEL_90;
    }
LABEL_95:

    goto LABEL_96;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setTrueExpression:](v7, "setTrueExpression:", v15);

  v64 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("FalseExpression"), objc_opt_class(), &v64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v64;
  if (!v8)
  {
    if (a4)
    {
      v78[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v19;
      v78[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v20;
      v21 = v79;
      v22 = v78;
      goto LABEL_78;
    }
LABEL_79:

LABEL_96:
    v17 = 0;
    goto LABEL_15;
  }
  v63 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v8, &v63);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v63;

  if (!v16)
  {
    if (a4)
    {
      v76[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v11, "localizedDescription");
      v53 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v53;
      if (!v53)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating model for '%@'."), CFSTR("FalseExpression"));
        v53 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v53;
      v77[0] = v53;
      v76[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("Invalid 'Expression' definition.");
      v61 = (void *)v54;
      if (v54)
        v55 = (const __CFString *)v54;
      v77[1] = v55;
      v76[2] = *MEMORY[0x1E0CB3388];
      v56 = (uint64_t)v11;
      if (!v11)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v56;
      v77[2] = v56;
      v76[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v11, "gc_failingKeyPath");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v57;
      if (!v57)
        v57 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v57, "arrayByAddingObject:", CFSTR("FalseExpression"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v77[3] = v29;
      v30 = v77;
      v31 = v76;
LABEL_90:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v30, v31, 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v58);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v11)
      if (!v62)

      goto LABEL_95;
    }
    goto LABEL_95;
  }
  -[GCGenericDeviceDataSDLHatFunctionExpressionModelBuilder setFalseExpression:](v7, "setFalseExpression:", v16);

  v17 = v7;
LABEL_15:

  return v17;
}

@end
