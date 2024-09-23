@implementation NLPMLSequenceModel

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NLPMLSequenceModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NLPMLSequenceModel *v18;
  NLPMLSequenceModel *v19;
  NLPMLSequenceModel *v20;
  void *v21;
  char v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "outputDescriptionsByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "inputDescriptionsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") != 1)
    goto LABEL_11;
  objc_msgSend(v9, "inputDescriptionsByName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "type") != 3
    || objc_msgSend(v12, "count") != 3
    || !objc_msgSend(v12, "containsObject:", CFSTR("labels"))
    || !objc_msgSend(v12, "containsObject:", CFSTR("locations")))
  {

LABEL_11:
    goto LABEL_12;
  }
  v23 = objc_msgSend(v12, "containsObject:", CFSTR("lengths"));

  if ((v23 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("modelData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24.receiver = self;
    v24.super_class = (Class)NLPMLSequenceModel;
    v18 = -[NLModel initWithData:error:](&v24, sel_initWithData_error_, v17, a5);
    v19 = v18;
    if (v18)
      objc_storeStrong((id *)&v18->_modelDescription, a3);
    self = v19;
    v20 = self;
    goto LABEL_14;
  }
LABEL_12:
  if (!a5)
  {
    v20 = 0;
    goto LABEL_16;
  }
  v21 = (void *)MEMORY[0x1E0CB35C8];
  v25 = *MEMORY[0x1E0CB2D50];
  v26[0] = CFSTR("Failed to load model file");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 2, v17);
  v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  return v20;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  MLModelDescription *modelDescription;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  modelDescription = self->_modelDescription;
  v8 = a3;
  -[MLModelDescription inputDescriptionsByName](modelDescription, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "featureValueForName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v35 = a5;
    v38 = v11;
    generateTokenSequence(v13, 0, v14, v15, v16);
    -[NLModel predictedLabelsForTokens:](self, "predictedLabelsForTokens:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v19 = objc_msgSend(v15, "count");
    v20 = objc_msgSend(v16, "count");
    v21 = 0;
    if (v17 && v18)
    {
      objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithStringArray:", v17);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
    if (v15 && v19)
    {
      objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithInt64Array:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = 0;
    v36 = v14;
    v37 = v13;
    v34 = v15;
    if (v16 && v20)
    {
      objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithInt64Array:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v39[0] = CFSTR("labels");
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithSequence:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v39[1] = CFSTR("locations");
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithSequence:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v26;
    v39[2] = CFSTR("lengths");
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithSequence:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v28 = (void *)v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v24, "initWithDictionary:error:", v29, v35);

    v31 = v28;
    v13 = v37;
    v11 = v38;
    v14 = v36;
    v15 = v34;
  }
  else
  {
    if (!a5)
    {
      v30 = 0;
      goto LABEL_15;
    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42[0] = CFSTR("Prediction failed due to missing input");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v31);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
