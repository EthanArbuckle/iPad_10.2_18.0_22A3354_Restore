@implementation NLModelImplML

- (NLModelImplML)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{

  return 0;
}

- (NLModelImplML)initWithModelTrainer:(id)a3 error:(id *)a4
{

  return 0;
}

- (NLModelImplML)initWithMLModel:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NLModelImplML *v16;
  NLModelConfiguration *v17;
  NLModelConfiguration *configuration;
  NSString *v19;
  NSString *inputName;
  NSString *v21;
  NSString *outputName;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputDescriptionsByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "outputDescriptionsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
    {
      if (v12)
      {
        if (v15)
        {
          v24.receiver = self;
          v24.super_class = (Class)NLModelImplML;
          v16 = -[NLModelImplML init](&v24, sel_init);
          self = v16;
          if (v16)
          {
            objc_storeStrong((id *)&v16->_mlModel, a3);
            v17 = (NLModelConfiguration *)objc_msgSend(v8, "copy");
            configuration = self->_configuration;
            self->_configuration = v17;

            v19 = (NSString *)objc_msgSend(v12, "copy");
            inputName = self->_inputName;
            self->_inputName = v19;

            v21 = (NSString *)objc_msgSend(v15, "copy");
            outputName = self->_outputName;
            self->_outputName = v21;

          }
        }
      }
    }
  }

  return self;
}

- (id)modelData
{
  return 0;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)predictedLabelForString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  MLModel *mlModel;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  NSString *inputName;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_mlModel || !self->_inputName || !self->_outputName)
  {
    v14 = 0;
    v9 = 0;
    v8 = 0;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v5 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  inputName = self->_inputName;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &inputName, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:error:", v7, &v18);
  v9 = v18;

  if (!v8)
  {
    v14 = 0;
    goto LABEL_7;
  }
  mlModel = self->_mlModel;
  v17 = v9;
  -[MLModel predictionFromFeatures:error:](mlModel, "predictionFromFeatures:error:", v8, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;

  objc_msgSend(v11, "featureValueForName:", self->_outputName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
LABEL_8:
  v15 = v14;

  return v15;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;

  v4 = a3;
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplML predictedLabelForString:](self, "predictedLabelForString:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    if (v6)
      v9 = v6;
    else
      v9 = &stru_1E4A3BA10;
    do
    {
      objc_msgSend(v7, "addObject:", v9);
      ++v8;
    }
    while (v8 < objc_msgSend(v4, "count"));
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

@end
