@implementation NLPMLClassifierModel

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NLPMLClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
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
  void *v18;
  NLPMLClassifierModel *v19;
  NLPMLClassifierModel *v20;
  NLPMLClassifierModel *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  void *v26;
  NLPMLClassifierModel *v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "inputDescriptionsByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 1)
    goto LABEL_10;
  v27 = self;
  objc_msgSend(v9, "inputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "type") != 3)
  {
LABEL_9:

    self = v27;
LABEL_10:

    goto LABEL_11;
  }
  v26 = v10;
  objc_msgSend(v9, "outputDescriptionsByName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 1)
  {

    v10 = v26;
    goto LABEL_9;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v17, "type");

  v10 = v26;
  self = v27;
  if (v25 == 3)
  {
    objc_msgSend(v26, "objectForKey:", CFSTR("modelData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28.receiver = v27;
    v28.super_class = (Class)NLPMLClassifierModel;
    v19 = -[NLModel initWithData:error:](&v28, sel_initWithData_error_, v18, a5);
    v20 = v19;
    if (v19)
      objc_storeStrong((id *)&v19->_modelDescription, a3);
    self = v20;
    v21 = self;
    goto LABEL_13;
  }
LABEL_11:
  if (!a5)
  {
    v21 = 0;
    goto LABEL_15;
  }
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v29 = *MEMORY[0x1E0CB2D50];
  v30[0] = CFSTR("Failed to load model file");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 2, v18);
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_15:
  return v21;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  modelDescription = self->_modelDescription;
  v8 = a3;
  -[MLModelDescription inputDescriptionsByName](modelDescription, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "featureValueForName:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLModel predictedLabelForString:](self, "predictedLabelForString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithDictionary:error:", v20, a5);

  }
  else
  {
    if (!a5)
    {
      v21 = 0;
      goto LABEL_6;
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Prediction failed due to missing input");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v17);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
