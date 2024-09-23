@implementation CSFCoreMLComputeBackend

- (CSFCoreMLComputeBackend)initWithModelFile:(id)a3 error:(id *)a4
{
  id v6;
  CSFCoreMLComputeBackend *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  MLModel *coremlModel;
  MLPredictionOptions *v13;
  MLPredictionOptions *options;
  CSFCoreMLComputeBackend *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSFCoreMLComputeBackend;
  v7 = -[CSFCoreMLComputeBackend init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C9E960]);
    objc_msgSend(v9, "setComputeUnits:", 0);
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C9E938], "modelWithContentsOfURL:configuration:error:", v8, v9, &v20);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v20;
    coremlModel = v7->_coremlModel;
    v7->_coremlModel = (MLModel *)v10;

    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
LABEL_10:

      v15 = 0;
      goto LABEL_11;
    }
    v13 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x1E0C9E9A8]);
    options = v7->_options;
    v7->_options = v13;

    if (!-[CSFCoreMLComputeBackend _populateModelInterfaceParameters](v7, "_populateModelInterfaceParameters"))
    {
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read interface specs"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2457, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }

  }
  v15 = v7;
LABEL_11:

  return v15;
}

- (BOOL)_populateModelInterfaceParameters
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *inputSpecs;
  NSUInteger v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *outputSpecs;
  NSUInteger v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MLModel modelDescription](self->_coremlModel, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDescriptionsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSFCoreMLComputeBackend _fetchTensorPropertiesWithFeatDesc:](self, "_fetchTensorPropertiesWithFeatDesc:", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v5;

  v7 = -[NSDictionary count](self->_inputSpecs, "count");
  if (v7 == objc_msgSend(v4, "count"))
  {
    -[MLModel modelDescription](self->_coremlModel, "modelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputDescriptionsByName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSFCoreMLComputeBackend _fetchTensorPropertiesWithFeatDesc:](self, "_fetchTensorPropertiesWithFeatDesc:", v9);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    outputSpecs = self->_outputSpecs;
    self->_outputSpecs = v10;

    v12 = -[NSDictionary count](self->_outputSpecs, "count");
    v13 = v12 == objc_msgSend(v9, "count");
    if (!v13)
    {
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315138;
        v18 = "-[CSFCoreMLComputeBackend _populateModelInterfaceParameters]";
        _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Unable to extract input tensor descriptors", (uint8_t *)&v17, 0xCu);
      }
    }

  }
  else
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[CSFCoreMLComputeBackend _populateModelInterfaceParameters]";
      _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Unable to extract input tensor descriptors", (uint8_t *)&v17, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_fetchTensorPropertiesWithFeatDesc:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CSFCoreMLComputeBackend__fetchTensorPropertiesWithFeatDesc___block_invoke;
  v11[3] = &unk_1E6880998;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)getExpectedInputTensors
{
  return self->_inputSpecs;
}

- (id)getExpectedOutputTensors
{
  return self->_outputSpecs;
}

- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  MLModel *coremlModel;
  MLPredictionOptions *options;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  id v19;

  v19 = 0;
  -[CSFCoreMLComputeBackend _convertInputToCoreMLInputs:error:](self, "_convertInputToCoreMLInputs:error:", a3, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v8 = objc_retainAutorelease(v7);
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    coremlModel = self->_coremlModel;
    options = self->_options;
    v18 = 0;
    -[MLModel predictionFromFeatures:options:error:](coremlModel, "predictionFromFeatures:options:error:", v6, options, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v13)
    {
      v8 = v13;
      if (a4)
      {
        v8 = objc_retainAutorelease(v13);
        v9 = 0;
        *a4 = v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v17 = 0;
      -[CSFCoreMLComputeBackend _convertOuputsToNSArrayWithCoreMLOutputs:error:](self, "_convertOuputsToNSArrayWithCoreMLOutputs:error:", v12, &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v8 = v15;
      if (v15)
      {
        v9 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v15);
      }
      else
      {
        v9 = v14;
      }

    }
  }

  return v9;
}

- (id)_convertInputToCoreMLInputs:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v29 = a4;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_inputSpecs, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tensorProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v41 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read interface specs"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2455, v27);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v22 = objc_retainAutorelease(v22);
            *v29 = v22;
          }
          goto LABEL_25;
        }
        v32 = 0;
        -[CSFCoreMLComputeBackend _convertDataBufferToMLMultiArray:error:](self, "_convertDataBufferToMLMultiArray:error:", v13, &v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v32;
        if (v17)
          v19 = v18 == 0;
        else
          v19 = 0;
        if (!v19)
        {
          v22 = v18;
          if (v29)
            *v29 = objc_retainAutorelease(v18);

LABEL_25:
          v24 = 0;
          v20 = v7;
          goto LABEL_26;
        }
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v17, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      a4 = v29;
      if (v9)
        continue;
      break;
    }
  }

  v31 = 0;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E900]), "initWithDictionary:error:", v30, &v31);
  v21 = v31;
  v22 = v21;
  if (v21)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v21);
    v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSFCoreMLComputeBackend _convertInputToCoreMLInputs:error:]";
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s features input conversion to MLDictionaryFeatureProvider with error: %@", buf, 0x16u);
    }
    v24 = 0;
  }
  else
  {
    v20 = v20;
    v24 = v20;
  }
LABEL_26:

  return v24;
}

- (id)_convertDataBufferToMLMultiArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "tensorProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tensorProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CSFCoreMLComputeBackend _getMLMultiArrayDataTypeForComputeType:](self, "_getMLMultiArrayDataTypeForComputeType:", objc_msgSend(v9, "dataType"));

  if (objc_msgSend(v8, "count") == 1)
  {
    v11 = &unk_1E68A1A20;
  }
  else
  {
    if (objc_msgSend(v8, "count") != 2)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2455, 0);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_8;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = &unk_1E68A1978;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc(MEMORY[0x1E0C9E978]);
  objc_msgSend(v6, "data");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = 0;
  v15 = (void *)objc_msgSend(v13, "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v14, "bytes"), v8, v10, v11, 0, &v18);
  v16 = v18;

  if (a4)
    *a4 = objc_retainAutorelease(v16);

LABEL_8:
  return v15;
}

- (id)_convertOuputsToNSArrayWithCoreMLOutputs:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  CSFComputeDataBuffer *v21;
  void *v22;
  id *v23;
  CSFComputeDataBuffer *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  BOOL v40;
  void *v41;
  void *v42;
  unint64_t v43;
  CSFComputeDataBuffer *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  id obj;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  void *v73;
  _QWORD v74[2];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v5, "featureNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  v7 = 0;
  if (v59)
  {
    v58 = *(_QWORD *)v69;
    v52 = *MEMORY[0x1E0CB2D50];
    v53 = a4;
    v56 = v6;
    v57 = v5;
LABEL_3:
    v8 = 0;
    while (1)
    {
      v62 = v7;
      if (*(_QWORD *)v69 != v58)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v8);
      objc_msgSend(v5, "featureValueForName:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "multiArrayValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSFTensorProperties propertyWithShape:dataType:](CSFTensorProperties, "propertyWithShape:dataType:", v12, -[CSFCoreMLComputeBackend _getComputeDataTypeForMLType:](self, "_getComputeDataTypeForMLType:", objc_msgSend(v11, "dataType")));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") == 1)
      {
        v61 = v10;
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongValue");

        if (v15)
        {
          v16 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v17);

            ++v16;
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedLongValue");

          }
          while (v16 < v19);
        }
        v20 = v11;
        v21 = [CSFComputeDataBuffer alloc];
        v22 = v62;
        v67 = v62;
        v23 = &v67;
        v24 = -[CSFComputeDataBuffer initWithInputArray:name:properties:errOut:](v21, "initWithInputArray:name:properties:errOut:", v13, v9, v63, &v67);
      }
      else
      {
        if (objc_msgSend(v12, "count") != 2)
        {
          if (a4)
          {
            v46 = (void *)MEMORY[0x1E0CB35C8];
            v72 = v52;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("output shape not supported"));
            v47 = v11;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v48;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2455, v49);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v11 = v47;
          }
          v45 = 0;
          v7 = v62;
          goto LABEL_28;
        }
        v54 = v9;
        v61 = v10;
        v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedLongValue");

        if (v26)
        {
          v27 = 0;
          do
          {
            v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "unsignedLongValue");

            v30 = v12;
            if (v29)
            {
              v31 = 0;
              do
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v74[0] = v32;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v74[1] = v33;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
                v34 = v27;
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "objectForKeyedSubscript:", v35);
                v36 = v11;
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "addObject:", v37);

                ++v31;
                objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "unsignedLongValue");

                v11 = v36;
                v40 = v31 >= v39;
                v27 = v34;
              }
              while (!v40);
            }
            v41 = (void *)objc_msgSend(v65, "copy");
            objc_msgSend(v64, "addObject:", v41);

            ++v27;
            objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "unsignedLongValue");

            v12 = v30;
          }
          while (v27 < v43);
        }
        v20 = v11;
        v44 = [CSFComputeDataBuffer alloc];
        v22 = v62;
        v66 = v62;
        v23 = &v66;
        v13 = v64;
        v9 = v54;
        v24 = -[CSFComputeDataBuffer initWithInputArray:name:properties:errOut:](v44, "initWithInputArray:name:properties:errOut:", v64, v54, v63, &v66);
        a4 = v53;
      }
      v7 = *v23;

      v6 = v56;
      objc_msgSend(v56, "setObject:forKey:", v24, v9);

      v45 = 1;
      v11 = v20;
      if (a4)
      {
        v5 = v57;
        if (v7)
        {
          v7 = objc_retainAutorelease(v7);
          v45 = 0;
          *a4 = v7;
        }
      }
      else
      {
        v5 = v57;
      }
      v10 = v61;
LABEL_28:

      if (!v45)
      {

        v50 = 0;
        goto LABEL_33;
      }
      if (++v8 == v59)
      {
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
        if (v59)
          goto LABEL_3;
        break;
      }
    }
  }

  v50 = (void *)objc_msgSend(v6, "copy");
LABEL_33:

  return v50;
}

- (unint64_t)_getComputeDataTypeForMLType:(int64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 == 131104)
    v3 = 0;
  if (a3 == 65600)
    v3 = 1;
  if (a3 == 65568)
    return 1;
  else
    return v3;
}

- (int64_t)_getMLMultiArrayDataTypeForComputeType:(unint64_t)a3
{
  int64_t v3;

  v3 = 65600;
  if (a3 == 1)
    v3 = 65568;
  if (a3)
    return v3;
  else
    return 131104;
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setInputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_inputSpecs, a3);
}

- (NSDictionary)outputSpecs
{
  return self->_outputSpecs;
}

- (void)setOutputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_outputSpecs, a3);
}

- (MLModel)coremlModel
{
  return self->_coremlModel;
}

- (void)setCoremlModel:(id)a3
{
  objc_storeStrong((id *)&self->_coremlModel, a3);
}

- (MLPredictionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_coremlModel, 0);
  objc_storeStrong((id *)&self->_outputSpecs, 0);
  objc_storeStrong((id *)&self->_inputSpecs, 0);
}

void __62__CSFCoreMLComputeBackend__fetchTensorPropertiesWithFeatDesc___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  objc_msgSend(v7, "multiArrayConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v7, "multiArrayConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "_getComputeDataTypeForMLType:", objc_msgSend(v11, "dataType"));
  if (v12 == 2)
  {
    *a4 = 1;
  }
  else
  {
    +[CSFTensorProperties propertyWithShape:dataType:](CSFTensorProperties, "propertyWithShape:dataType:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, v14);

  }
}

@end
