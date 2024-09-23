@implementation _MLNLPSentenceClassifierModel

- (_MLNLPSentenceClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _MLNLPSentenceClassifierModel *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _MLNLPSentenceClassifierModel *v24;
  void *v25;
  _MLNLPSentenceClassifierModel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  void *v34;
  void *v35;
  const __CFString **v36;
  uint64_t *v37;
  void *v38;
  void *v39;
  objc_super v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isValid") & 1) == 0)
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = CFSTR("NaturalLanguage framework not available on this OS version");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
LABEL_16:
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v23);
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_21;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 1)
  {

LABEL_13:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("Must only have one string input feature");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v48;
      v32 = &v47;
LABEL_15:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
      goto LABEL_16;
    }
LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v39 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "type");

  self = v14;
  v10 = v39;

  if (v17 != 3)
    goto LABEL_13;
  objc_msgSend(v9, "outputDescriptionsByName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") != 1)
  {

LABEL_19:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = CFSTR("Must only have one string output feature");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v46;
      v32 = &v45;
      goto LABEL_15;
    }
    goto LABEL_21;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "type");

  self = v14;
  v10 = v39;

  if (v22 != 3)
    goto LABEL_19;
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("modelData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
    {
LABEL_26:
      v26 = 0;
      goto LABEL_17;
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("parameters['modelData'] does not exist or is not a string");
    v35 = (void *)MEMORY[0x1E0C99D80];
    v36 = &v44;
    v37 = &v43;
LABEL_25:
    objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v38);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  v40.receiver = v14;
  v40.super_class = (Class)_MLNLPSentenceClassifierModel;
  v24 = -[_MLNLPSentenceClassifierModel init](&v40, sel_init);
  self = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelDescription, a3);
    v25 = (void *)objc_msgSend(v11, "initializeSentenceClassifierModelWithData:error:", v23, a5);
    self->_sentenceClassifierModel = v25;
    if (!v25)
    {
      if (!a5)
        goto LABEL_26;
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("initialization of classifier model with model data failed");
      v35 = (void *)MEMORY[0x1E0C99D80];
      v36 = &v42;
      v37 = &v41;
      goto LABEL_25;
    }
  }
  self = self;
  v26 = self;
LABEL_17:

LABEL_22:
  return v26;
}

- (void)dealloc
{
  void *sentenceClassifierModel;
  objc_super v4;

  sentenceClassifierModel = self->_sentenceClassifierModel;
  if (sentenceClassifierModel)
    CFRelease(sentenceClassifierModel);
  v4.receiver = self;
  v4.super_class = (Class)_MLNLPSentenceClassifierModel;
  -[_MLNLPSentenceClassifierModel dealloc](&v4, sel_dealloc);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MLDictionaryFeatureProvider *v19;
  void *v20;
  MLDictionaryFeatureProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isValid") & 1) != 0)
  {
    -[MLModelDescription inputDescriptionsByName](self->_modelDescription, "inputDescriptionsByName");
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

    objc_msgSend(v7, "featureValueForName:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "predictLabelsForSentenceString:inputString:error:", self->_sentenceClassifierModel, v16, a5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [MLDictionaryFeatureProvider alloc];
        v27 = v14;
        v28 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v19, "initWithDictionary:error:", v20, a5);
      }
      else
      {
        if (!a5)
        {
          v18 = 0;
          v21 = 0;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction failed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v25);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v21 = 0;
      }
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input string feature '%@' not found"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v20);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  if (a5)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("NaturalLanguage framework not available on this OS version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v11);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModelDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
