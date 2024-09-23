@implementation _MLNLPWordTaggingModel

- (_MLNLPWordTaggingModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _MLNLPWordTaggingModel *v24;
  void *v25;
  _MLNLPWordTaggingModel *v26;
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
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _MLNLPWordTaggingModel *v45;
  objc_super v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_MLNLPFrameworkHandle sharedHandle](_MLNLPFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isValid") & 1) == 0)
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = CFSTR("NaturalLanguage framework not available on this OS version");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
LABEL_23:
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v23);
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 1)
  {

LABEL_15:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v54 = CFSTR("Must only have one string input feature");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v54;
      v32 = &v53;
LABEL_22:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
      goto LABEL_23;
    }
LABEL_25:
    v26 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v45 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");

  self = v45;
  if (v16 != 3)
    goto LABEL_15;
  objc_msgSend(v9, "outputDescriptionsByName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 3)
  {
LABEL_19:

LABEL_20:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = CFSTR("Must only have three sequence output features");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v52;
      v32 = &v51;
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "type") != 7)
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "allValues");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "type") != 7)
  {

    self = v45;
    goto LABEL_18;
  }
  objc_msgSend(v9, "outputDescriptionsByName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
  v41 = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v22, "type");

  self = v45;
  if (v42 != 7)
    goto LABEL_20;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("modelData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
    {
LABEL_30:
      v26 = 0;
      goto LABEL_24;
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("parameters['modelData'] does not exist or is not a string");
    v35 = (void *)MEMORY[0x1E0C99D80];
    v36 = &v50;
    v37 = &v49;
LABEL_29:
    objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v38);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  v46.receiver = v45;
  v46.super_class = (Class)_MLNLPWordTaggingModel;
  v24 = -[_MLNLPWordTaggingModel init](&v46, sel_init);
  self = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelDescription, a3);
    v25 = (void *)objc_msgSend(v11, "initializeWordTaggingModelWithData:error:", v23, a5);
    self->_wordTaggingModel = v25;
    if (!v25)
    {
      if (!a5)
        goto LABEL_30;
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("initialization of sequence model with model data failed");
      v35 = (void *)MEMORY[0x1E0C99D80];
      v36 = &v48;
      v37 = &v47;
      goto LABEL_29;
    }
  }
  self = self;
  v26 = self;
LABEL_24:

LABEL_26:
  return v26;
}

- (void)dealloc
{
  void *wordTaggingModel;
  objc_super v4;

  wordTaggingModel = self->_wordTaggingModel;
  if (wordTaggingModel)
    CFRelease(wordTaggingModel);
  v4.receiver = self;
  v4.super_class = (Class)_MLNLPWordTaggingModel;
  -[_MLNLPWordTaggingModel dealloc](&v4, sel_dealloc);
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MLDictionaryFeatureProvider *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  MLDictionaryFeatureProvider *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  _QWORD v56[3];
  _QWORD v57[3];
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
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

    -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v17 = objc_claimAutoreleasedReturnValue();

    -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "featureValueForName:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)v17;
    if (v21)
    {
      objc_msgSend(v8, "predictTokensLabelsLocationsLengthsForString:inputString:error:", self->_wordTaggingModel, v21, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v47 = [MLDictionaryFeatureProvider alloc];
        v56[0] = v17;
        v53 = v7;
        v51 = v21;
        objc_msgSend(v22, "allKeys");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v43);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLSequence sequenceWithStringArray:](MLSequence, "sequenceWithStringArray:", v50);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v49);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v48;
        v56[1] = v55;
        objc_msgSend(v22, "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v44);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v41);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v40;
        v56[2] = v14;
        v52 = v11;
        objc_msgSend(v22, "allKeys");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLSequence sequenceWithInt64Array:](MLSequence, "sequenceWithInt64Array:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLFeatureValue featureValueWithSequence:](MLFeatureValue, "featureValueWithSequence:", v25);
        v26 = v8;
        v27 = v14;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v47, "initWithDictionary:error:", v29, a5);

        v31 = (void *)v43;
        v14 = v27;
        v8 = v26;
        v32 = v46;

        v11 = v52;
        v7 = v53;

        v21 = v51;
      }
      else
      {
        if (!a5)
        {
          v22 = 0;
          v30 = 0;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction failed"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v58 = *MEMORY[0x1E0CB2D50];
        v59 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v31 = (void *)v36;
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v36);
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (!a5)
      {
        v30 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input string feature '%@' not found"), v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2D50];
      v61 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v32);
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  if (a5)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v62 = *MEMORY[0x1E0CB2D50];
    v63[0] = CFSTR("NaturalLanguage framework not available on this OS version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v11);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  v30 = 0;
LABEL_17:

  return v30;
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
