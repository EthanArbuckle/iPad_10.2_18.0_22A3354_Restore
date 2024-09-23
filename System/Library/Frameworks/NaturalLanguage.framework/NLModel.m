@implementation NLModel

+ (NLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  void *v7;

  v6 = url;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContentsOfURL:error:", v6, error);

  return (NLModel *)v7;
}

+ (NLModel)modelWithMLModel:(MLModel *)mlModel error:(NSError *)error
{
  MLModel *v6;
  void *v7;

  v6 = mlModel;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMLModel:error:", v6, error);

  return (NLModel *)v7;
}

+ (NLModel)modelWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:error:", v6, a4);

  return (NLModel *)v7;
}

- (NLModel)initWithConfiguration:(id)a3 modelImpl:(id)a4
{
  id v6;
  id v7;
  NLModel *v8;
  uint64_t v9;
  NLModelConfiguration *configuration;
  dispatch_queue_t v11;
  OS_dispatch_queue *clientQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLModel;
  v8 = -[NLModel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (NLModelConfiguration *)v9;

    objc_storeStrong((id *)&v8->_modelImpl, a4);
    v11 = dispatch_queue_create("com.apple.NaturalLanguage.NLModel", 0);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v11;

  }
  return v8;
}

- (NLModel)initWithData:(id)a3 mlModel:(id)a4 error:(id *)a5
{
  id v9;
  const void *v10;
  int Type;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t Revision;
  unint64_t ModelDataCount;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NLModel *i;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id obj;
  void *v65;
  void *v66;
  id v67;
  Class v68;
  void *v69;
  id v70;
  NLModel *v71;
  id v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v70 = a4;
  v71 = self;
  if (!v9)
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      v76 = CFSTR("Failed to load model file, data is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_90;
  }
  v63 = a4;
  obj = a3;
  v10 = (const void *)NLModelContainerCreateWithContainerData();
  if (!v10)
  {
    if (a5)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v73 = *MEMORY[0x1E0CB2D50];
      v74 = CFSTR("Failed to load model file, cannot read container");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v33);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_90;
  }
  if (NLModelContainerGetSubtype() != 7 && NLModelContainerGetSubtype() != 8)
  {
    if (!a5)
    {
LABEL_89:
      CFRelease(v10);
LABEL_90:
      i = 0;
      goto LABEL_91;
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v77 = *MEMORY[0x1E0CB2D50];
    v78 = CFSTR("Failed to load model file, invalid container type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v72);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

    goto LABEL_89;
  }
  Type = NLModelContainerGetType();
  if ((Type - 1) <= 8 && ((0x1EFu >> (Type - 1)) & 1) != 0)
    v12 = (id)objc_opt_class();
  else
    v12 = 0;
  v68 = (Class)v12;
  Revision = NLModelContainerGetRevision();
  ModelDataCount = NLModelContainerGetModelDataCount();
  v72 = (id)NLModelContainerCopyInfoDictionary();
  v18 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", Revision);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithObject:forKey:", v19, CFSTR("Revision"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = unsignedIntegerForKey(v72, (uint64_t)CFSTR("ModelType"), Type == 1);
  stringForKey(v72, (uint64_t)CFSTR("Language"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    stringForKey(v72, (uint64_t)CFSTR("TrainingLanguage"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  stringForKeyWithDefault(v72, CFSTR("EmbeddingType"), CFSTR("Static"));
  i = (NLModel *)objc_claimAutoreleasedReturnValue();
  v24 = BOOLForKeyWithDefault(v72, CFSTR("UseBidirectionalNeuralNetwork"));
  if (v22)
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("Language"));
  if (i)
    objc_msgSend(v20, "setObject:forKey:", i, CFSTR("EmbeddingType"));
  if (v21)
    v25 = 0;
  else
    v25 = v24;
  if (v25 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v26, CFSTR("UseBidirectionalNeuralNetwork"));

  }
  +[NLModelConfiguration defaultModelConfigurationForType:options:error:](NLModelConfiguration, "defaultModelConfigurationForType:options:error:", v21, v20, a5);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v68 || !v69 || !ModelDataCount)
  {
    if (a5)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v79 = *MEMORY[0x1E0CB2D50];
      v80[0] = CFSTR("Failed to load model file, invalid configuration or data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_35;
  }
  v59 = (id)NLModelContainerCopyModelDataAtIndex();
  if (ModelDataCount >= 2)
  {
    v27 = NLModelContainerCopyModelDataAtIndex();
    if (ModelDataCount == 2)
    {
      v57 = 0;
      v58 = 0;
    }
    else
    {
      v58 = (void *)NLModelContainerCopyModelDataAtIndex();
      if (ModelDataCount >= 4)
      {
        v30 = (void *)NLModelContainerCopyModelDataAtIndex();
        if (ModelDataCount == 4)
          v57 = 0;
        else
          v57 = (void *)NLModelContainerCopyModelDataAtIndex();
        goto LABEL_42;
      }
      v57 = 0;
    }
    v30 = 0;
LABEL_42:
    v31 = (void *)v27;
    goto LABEL_43;
  }
  v57 = 0;
  v58 = 0;
  v30 = 0;
  v31 = 0;
LABEL_43:
  v56 = v31;
  stringArrayRepresentationFromData(v31);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  stringArrayRepresentationFromData(v58);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_retainAutorelease(v30);
  v34 = (const char *)objc_msgSend(v67, "bytes");
  if ((unint64_t)objc_msgSend(v67, "length") >= 9 && !strncmp(v34, "bplist00", 8uLL))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v67, 0, 0, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = 0;
  }

  if (v61 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v35 = v61;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    if (v36)
    {
      for (i = 0; i != (NLModel *)v36; i = (NLModel *)((char *)i + 1))
      {
        objc_msgSend(v35, "objectAtIndex:", i);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v37, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setObject:forKey:", v37, v38);

        }
      }
    }

  }
  else
  {
    v66 = 0;
  }
  if (v62 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = v62;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");
    if (v40)
    {
      for (i = 0; i != (NLModel *)v40; i = (NLModel *)((char *)i + 1))
      {
        objc_msgSend(v39, "objectAtIndex:", i);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v41, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", v42, v41);

        }
      }
    }

  }
  else
  {
    v65 = 0;
  }
  if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = objc_msgSend(v62, "count");
    v44 = v60;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "count");
    if (v43)
    {
      v47 = v46;
      for (i = 0; (NLModel *)v43 != i; i = (NLModel *)((char *)i + 1))
      {
        if ((unint64_t)i >= v47)
        {
          v48 = 0;
        }
        else
        {
          objc_msgSend(v44, "objectAtIndex:", i);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_76;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = (void *)v49;
LABEL_76:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKey:", v48, v50);

      }
    }

  }
  else
  {
    v45 = 0;
  }
  if (-[objc_class isEqual:](v68, "isEqual:", objc_opt_class())
    && (unint64_t)objc_msgSend(v59, "length") >= 4
    && *(_DWORD *)objc_msgSend(objc_retainAutorelease(v59), "bytes") == 12648430)
  {
    v68 = (Class)objc_opt_class();
  }
  v51 = (void *)objc_msgSend([v68 alloc], "initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:", v59, v69, v66, v65, v45, v57, v72, a5);
  if (v51)
  {
    v52 = -[NLModel initWithConfiguration:modelImpl:](v71, "initWithConfiguration:modelImpl:", v69, v51);
    v53 = v52;
    if (v52)
    {
      objc_storeStrong((id *)(v52 + 32), obj);
      objc_storeStrong((id *)(v53 + 40), v63);
      *(_QWORD *)(v53 + 48) = v10;
      i = (NLModel *)(id)v53;
      v54 = 0;
      v71 = i;
      goto LABEL_88;
    }
    v71 = 0;
  }
  v54 = 1;
LABEL_88:

  if ((v54 & 1) != 0)
    goto LABEL_89;
LABEL_91:

  return i;
}

- (NLModel)initWithData:(id)a3 error:(id *)a4
{
  return -[NLModel initWithData:mlModel:error:](self, "initWithData:mlModel:error:", a3, 0, a4);
}

- (NLModel)initWithClassifierMLModel:(id)a3
{
  id v5;
  void *v6;
  NLModelImplML *v7;
  NLModel *v8;

  v5 = a3;
  +[NLModelConfiguration defaultModelConfigurationForType:](NLModelConfiguration, "defaultModelConfigurationForType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NLModelImplML initWithMLModel:configuration:]([NLModelImplML alloc], "initWithMLModel:configuration:", v5, v6);
  if (v7)
  {
    v8 = -[NLModel initWithConfiguration:modelImpl:](self, "initWithConfiguration:modelImpl:", v6, v7);
    self = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_mlModel, a3);
  }

  return self;
}

- (NLModel)initWithMLModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NLModel *v9;
  NLModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelParameterData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[NLModel initWithData:mlModel:error:](self, "initWithData:mlModel:error:", v8, v6, a4);
LABEL_7:
      self = v9;
      v10 = self;
LABEL_23:

      goto LABEL_24;
    }
  }
  if (v6)
  {
    objc_msgSend(v6, "modelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputDescriptionsByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v8, "inputDescriptionsByName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "type") == 3)
      {
        objc_msgSend(v8, "outputDescriptionsByName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count") == 1)
        {
          objc_msgSend(v8, "outputDescriptionsByName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "allValues");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v16, "type");

          if (v23 == 3)
          {
            v9 = -[NLModel initWithClassifierMLModel:](self, "initWithClassifierMLModel:", v6);
            goto LABEL_7;
          }
LABEL_20:
          if (a4)
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v26 = *MEMORY[0x1E0CB2D50];
            v27[0] = CFSTR("MLModel does not have supported input and output descriptions for use with NLModel");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 2, v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v10 = 0;
          goto LABEL_23;
        }

      }
    }

    goto LABEL_20;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("MLModel is nil, cannot create NLModel");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 2, v8);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (NLModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  int v8;
  ssize_t v9;
  int v10;
  NLModel *v11;
  NLModel *v12;
  NLModel *v13;
  int v15;

  v6 = a3;
  if (!objc_msgSend(v6, "isFileURL"))
    goto LABEL_7;
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);

  if (v8 < 0)
    goto LABEL_7;
  v15 = 0;
  v9 = read(v8, &v15, 4uLL);
  v10 = v15;
  close(v8);
  if (v9 == 4 && v10 == 156685278)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, a4);
    v11 = (NLModel *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v11 = -[NLModel initWithData:error:](self, "initWithData:error:", v11, a4);
LABEL_9:
      self = v11;
    }
  }
  else
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v6, a4);
    v11 = (NLModel *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v11 = -[NLModel initWithMLModel:error:](self, "initWithMLModel:error:", v11, a4);
      goto LABEL_9;
    }
  }
  v13 = v11;

  return v13;
}

- (void)dealloc
{
  void *container;
  objc_super v4;

  container = self->_container;
  if (container)
    CFRelease(container);
  v4.receiver = self;
  v4.super_class = (Class)NLModel;
  -[NLModel dealloc](&v4, sel_dealloc);
}

- (id)data
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  const void *v53;
  void *v55;
  void *v56;
  NLModel *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[18];

  v62[16] = *MEMORY[0x1E0C80C00];
  -[NLModel labelMap](self, "labelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stringArrayRepresentationFromInverseMap(v3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = self;
  -[NLModel vocabularyMap](self, "vocabularyMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v8);
  }

  stringArrayRepresentationFromInverseMap(v5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[NLModel documentFrequencyMap](v57, "documentFrequencyMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        objc_msgSend(v13, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");

        if (v23 >= 2)
        {
          v24 = objc_msgSend(v21, "unsignedIntegerValue");
          if (v24 > v18)
            v18 = v24;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  v25 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v14, "addObject:", v27);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v28);

    }
    ++v25;
  }
  while (v25 <= v18);

  -[NLModel configuration](v57, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "revision");

  -[NLModelImpl trainingInfo](v57->_modelImpl, "trainingInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModel configuration](v57, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30;
  v33 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "type"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dictionaryWithObject:forKey:", v34, CFSTR("ModelType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v31, "type");
  objc_msgSend(v31, "language");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "options");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v38, CFSTR("EmbeddingType"), CFSTR("Static"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = BOOLForKeyWithDefault(v38, CFSTR("UseBidirectionalNeuralNetwork"));
  if (v37)
    objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("Language"));
  if (v39)
    objc_msgSend(v35, "setObject:forKey:", v39, CFSTR("EmbeddingType"));
  if (v36)
    v41 = 0;
  else
    v41 = v40;
  if (v41 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v42, CFSTR("UseBidirectionalNeuralNetwork"));

  }
  objc_msgSend(v35, "addEntriesFromDictionary:", v32);

  -[NLModelImpl modelData](v57->_modelImpl, "modelData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v55;
  dataFromStringArrayRepresentation(v55);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  dataFromStringArrayRepresentation(v56);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImpl customEmbeddingData](v57->_modelImpl, "customEmbeddingData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  if (v35 && v43 && v45)
  {
    v50 = (void *)objc_opt_class();
    v51 = modelMethodTypeForImplClass(v50);
    v62[0] = 0;
    if (v51
      && (objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v43, v45, v46, v47, v48, 0),
          (v52 = NLModelContainerCreate()) != 0))
    {
      v53 = (const void *)v52;
      v49 = (void *)NLModelContainerCopyContainerData();
      CFRelease(v53);
    }
    else
    {
      v49 = 0;
    }
    v44 = v55;
  }

  return v49;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a4;
  v8 = a3;
  -[NLModel data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "writeToURL:options:error:", v8, v6, a5);
  else
    v11 = 0;

  return v11;
}

- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id *v32;
  char v33;
  id v34;
  void *v35;
  id *v36;
  char v37;
  BOOL v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  int v47;
  unint64_t v48;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _QWORD v66[7];

  v66[5] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v7 = a4;
  -[NLModel configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  v10 = (void *)objc_opt_class();
  v47 = modelMethodTypeForImplClass(v10);
  v48 = -[NLModel systemVersion](self, "systemVersion");
  -[NLModel configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "language");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[NLModel labelArray](self, "labelArray");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9E888];
  v66[0] = *MEMORY[0x1E0C9E870];
  v66[1] = v14;
  v15 = *MEMORY[0x1E0C9E880];
  v66[2] = *MEMORY[0x1E0C9E860];
  v66[3] = v15;
  v66[4] = *MEMORY[0x1E0C9E868];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 5);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v13, "setObject:forKey:", v22, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v18);
  }

  if (v9)
  {
    if (v9 != 1)
    {
      v30 = 0;
      v38 = 0;
      v36 = a5;
      v31 = v50;
      if (!a5)
        goto LABEL_38;
      goto LABEL_37;
    }
    stringForKey(v12, (uint64_t)CFSTR("InputFeatureName"), CFSTR("text"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    stringForKey(v12, (uint64_t)CFSTR("OutputFeatureName"), CFSTR("labels"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x1E0C9E8D8]);
    -[NLModel data](self, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v51, "count");
    v28 = &unk_1E4A47D58;
    if (v27)
      v28 = v51;
    v60 = 0;
    v29 = (void *)objc_msgSend(v25, "initWithData:language:inputFeatureName:tokensFeatureName:tokenTagsFeatureName:tokenLocationsFeatureName:tokenLengthsFeatureName:modelData:tagNames:metadata:error:", v48, v52, v23, CFSTR("tokens"), v24, CFSTR("locations"), CFSTR("lengths"), v26, v28, v13, &v60);
    v30 = v60;

    v31 = v50;
    if (v29)
    {
      v59 = v30;
      v32 = &v59;
      v33 = objc_msgSend(MEMORY[0x1E0C9E8D0], "saveAppleWordTaggingModelToURL:wordTaggerParameters:error:", v50, v29, &v59);
LABEL_27:
      v38 = v33;
      v36 = a5;
LABEL_35:
      v45 = *v32;

      v30 = v45;
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (v47 == 7)
  {
    stringForKey(v12, (uint64_t)CFSTR("InputFeatureName"), CFSTR("text"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    stringForKey(v12, (uint64_t)CFSTR("OutputFeatureName"), CFSTR("label"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc(MEMORY[0x1E0C9E898]);
    -[NLModel data](self, "data");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
      v41 = v51;
    else
      v41 = &unk_1E4A47D70;
    v56 = 0;
    v29 = (void *)objc_msgSend(v39, "initWithData:language:inputFeatureName:outputFeatureName:modelData:labelNames:metadata:error:", v48, v52, v23, v24, v40, v41, v13, &v56);
    v30 = v56;

    v31 = v50;
    if (v29)
    {
      v55 = v30;
      v32 = &v55;
      v33 = objc_msgSend(MEMORY[0x1E0C9E890], "saveAppleGazetteerModelToURL:gazetteerParameters:error:", v50, v29, &v55);
      goto LABEL_27;
    }
LABEL_28:
    v38 = 0;
    v36 = a5;
    goto LABEL_36;
  }
  v31 = v50;
  if (v47 == 8)
  {
    stringForKey(v12, (uint64_t)CFSTR("InputFeatureName"), CFSTR("text"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    stringForKey(v12, (uint64_t)CFSTR("OutputFeatureName"), CFSTR("vector"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_alloc(MEMORY[0x1E0C9E8C8]);
    -[NLModel data](self, "data");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v29 = (void *)objc_msgSend(v34, "initWithData:language:inputFeatureName:outputFeatureName:modelData:metadata:error:", v48, v52, v23, v24, v35, v13, &v58);
    v30 = v58;

    v36 = a5;
    if (v29)
    {
      v57 = v30;
      v32 = &v57;
      v37 = objc_msgSend(MEMORY[0x1E0C9E8C0], "saveAppleWordEmbeddingModelToURL:wordEmbeddingParameters:error:", v50, v29, &v57);
LABEL_34:
      v38 = v37;
      goto LABEL_35;
    }
  }
  else
  {
    stringForKey(v12, (uint64_t)CFSTR("InputFeatureName"), CFSTR("text"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    stringForKey(v12, (uint64_t)CFSTR("OutputFeatureName"), CFSTR("label"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x1E0C9E8B8]);
    -[NLModel data](self, "data");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "count"))
      v44 = v51;
    else
      v44 = &unk_1E4A47D88;
    v54 = 0;
    v29 = (void *)objc_msgSend(v42, "initWithData:language:inputFeatureName:outputFeatureName:modelData:labelNames:metadata:error:", v48, v52, v23, v24, v43, v44, v13, &v54);
    v30 = v54;

    v36 = a5;
    if (v29)
    {
      v53 = v30;
      v32 = &v53;
      v37 = objc_msgSend(MEMORY[0x1E0C9E8B0], "saveAppleTextClassifierModelToURL:textClassifierParameters:error:", v50, v29, &v53);
      goto LABEL_34;
    }
  }
  v38 = 0;
LABEL_36:

  if (v36)
LABEL_37:
    *v36 = objc_retainAutorelease(v30);
LABEL_38:

  return v38;
}

- (BOOL)writeMLModelToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v6 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("AtomicWrite");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[NLModel writeMLModelToURL:options:error:](self, "writeMLModelToURL:options:error:", v9, v11, a5);

  return (char)a5;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (id)mlModel
{
  return self->_mlModel;
}

- (unint64_t)systemVersion
{
  return -[NLModelImpl systemVersion](self->_modelImpl, "systemVersion");
}

- (id)labelMap
{
  return -[NLModelImpl labelMap](self->_modelImpl, "labelMap");
}

- (id)labelArray
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NLModel labelMap](self, "labelMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  stringArrayRepresentationFromInverseMap(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "length") && (objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)vocabularyMap
{
  return -[NLModelImpl vocabularyMap](self->_modelImpl, "vocabularyMap");
}

- (id)documentFrequencyMap
{
  return -[NLModelImpl documentFrequencyMap](self->_modelImpl, "documentFrequencyMap");
}

- (id)gazetteer
{
  return -[NLModelImpl gazetteer](self->_modelImpl, "gazetteer");
}

- (id)embedding
{
  return -[NLModelImpl embedding](self->_modelImpl, "embedding");
}

- (id)embeddingData
{
  return -[NLModelImpl embeddingData](self->_modelImpl, "embeddingData");
}

- (NSString)predictedLabelForString:(NSString *)string
{
  NSString *v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  NSString *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = string;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__NLModel_predictedLabelForString___block_invoke;
      block[3] = &unk_1E4A3A5E8;
      v10 = &v11;
      block[4] = self;
      v9 = v4;
      dispatch_sync(clientQueue, block);

    }
  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

void __35__NLModel_predictedLabelForString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelForString:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)predictedLabelsForTokens:(NSArray *)tokens
{
  NSArray *v4;
  NSObject *clientQueue;
  id v6;
  _QWORD block[5];
  NSArray *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = tokens;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)MEMORY[0x1E0C9AA60];
  if (isAcceptableTokenArray(v4))
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__NLModel_predictedLabelsForTokens___block_invoke;
    block[3] = &unk_1E4A3A5E8;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(clientQueue, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

void __36__NLModel_predictedLabelsForTokens___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelsForTokens:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)predictedLabelArraysForTokenArrays:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *clientQueue;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = (id)MEMORY[0x1E0C9AA60];
  v5 = v4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          if (!isAcceptableTokenArray(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v9)))
          {

            goto LABEL_14;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          continue;
        break;
      }
    }

    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NLModel_predictedLabelArraysForTokenArrays___block_invoke;
    block[3] = &unk_1E4A3A5E8;
    v15 = &v16;
    block[4] = self;
    v14 = v6;
    dispatch_sync(clientQueue, block);

  }
  else
  {

  }
LABEL_14:
  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __46__NLModel_predictedLabelArraysForTokenArrays___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelArraysForTokenArrays:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)predictedLabelHypothesesForString:(NSString *)string maximumCount:(NSUInteger)maximumCount
{
  NSString *v6;
  NSObject *clientQueue;
  id v8;
  _QWORD v10[5];
  NSString *v11;
  uint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = string;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
  {
    if (maximumCount)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        clientQueue = self->_clientQueue;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __58__NLModel_predictedLabelHypothesesForString_maximumCount___block_invoke;
        v10[3] = &unk_1E4A3A610;
        v12 = &v14;
        v10[4] = self;
        v11 = v6;
        v13 = maximumCount;
        dispatch_sync(clientQueue, v10);

      }
    }
  }
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSDictionary *)v8;
}

void __58__NLModel_predictedLabelHypothesesForString_maximumCount___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelHypothesesForString:maximumCount:", a1[5], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelForString:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v11 = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

- (NSArray)predictedLabelHypothesesForTokens:(NSArray *)tokens maximumCount:(NSUInteger)maximumCount
{
  NSArray *v6;
  NSObject *clientQueue;
  id v8;
  _QWORD v10[5];
  NSArray *v11;
  uint64_t *v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = tokens;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = (id)MEMORY[0x1E0C9AA60];
  if (isAcceptableTokenArray(v6))
  {
    clientQueue = self->_clientQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__NLModel_predictedLabelHypothesesForTokens_maximumCount___block_invoke;
    v10[3] = &unk_1E4A3A610;
    v12 = &v14;
    v10[4] = self;
    v11 = v6;
    v13 = maximumCount;
    dispatch_sync(clientQueue, v10);

  }
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSArray *)v8;
}

void __58__NLModel_predictedLabelHypothesesForTokens_maximumCount___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelHypothesesForTokens:maximumCount:", a1[5], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "predictedLabelsForTokens:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          if (a1[7])
          {
            v20 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0, (_QWORD)v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v13 = (void *)MEMORY[0x1E0C9AA70];
          }
          objc_msgSend(v6, "addObject:", v13, (_QWORD)v16);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v9);
    }

    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v6;

  }
}

- (id)classifierTestResultsWithDataProvider:(id)a3
{
  id v4;
  unint64_t v5;
  double Current;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfInstances");
  Current = CFAbsoluteTimeGetCurrent();
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "instanceAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLModel predictedLabelForString:](self, "predictedLabelForString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);
      v8 += v14 ^ 1;
      v7 += v14;

    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v15 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v16, CFSTR("NumberOfInstances"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v17, CFSTR("NumberOfInstancesCorrect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("NumberOfInstancesIncorrect"));

  v19 = v15 - Current;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("OverallTestingTime"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v7 / (double)v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v21, CFSTR("InstanceAccuracy"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 / (double)v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("PerInstanceTestingTime"));

  }
  return v24;
}

- (id)sequenceTestResultsWithDataProvider:(id)a3
{
  id v3;
  unint64_t v4;
  double Current;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  unint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  v4 = objc_msgSend(v3, "numberOfInstances");
  Current = CFAbsoluteTimeGetCurrent();
  if (v4)
  {
    v42 = 0;
    v43 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    for (i = v4; i != v9; v4 = i)
    {
      v41 = v7;
      objc_msgSend(v37, "instanceAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tokens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "labels");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLModel predictedLabelsForTokens:](self, "predictedLabelsForTokens:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v11;
      v14 = objc_msgSend(v11, "count");
      v39 = v10;
      v40 = v6;
      if (v14)
      {
        v15 = 0;
        v16 = 1;
        do
        {
          if (v15 < objc_msgSend(v12, "count")
            && v15 < objc_msgSend(v13, "count")
            && (objc_msgSend(v12, "objectAtIndex:", v15),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v13, "objectAtIndex:", v15),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v17, "isEqualToString:", v18),
                v18,
                v17,
                v19))
          {
            ++v43;
          }
          else
          {
            v16 = 0;
            ++v8;
          }
          ++v15;
        }
        while (v14 != v15);
      }
      else
      {
        v16 = 1;
      }
      v6 = v40 + ((v16 & 1) == 0);
      v42 += v16 & 1;
      v7 = v14 + v41;

      ++v9;
    }
  }
  else
  {
    v8 = 0;
    v42 = 0;
    v43 = 0;
    v7 = 0;
    v6 = 0;
  }
  v20 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v21, CFSTR("NumberOfInstances"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v22, CFSTR("NumberOfInstancesCorrect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v23, CFSTR("NumberOfInstancesIncorrect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v24, CFSTR("NumberOfTokens"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v25, CFSTR("NumberOfTokensCorrect"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v26, CFSTR("NumberOfTokensIncorrect"));

  v27 = v20 - Current;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", v28, CFSTR("OverallTestingTime"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v42 / (double)v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v29, CFSTR("InstanceAccuracy"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 / (double)v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v30, CFSTR("PerInstanceTestingTime"));

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v43 / (double)v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v31, CFSTR("TokenAccuracy"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 / (double)v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v32, CFSTR("PerTokenTestingTime"));

  }
  return v34;
}

- (id)testResultsWithDataProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[NLModel configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6)
  {
    if (v6 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[NLModel sequenceTestResultsWithDataProvider:](self, "sequenceTestResultsWithDataProvider:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NLModel classifierTestResultsWithDataProvider:](self, "classifierTestResultsWithDataProvider:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)testResultsWithDataSet:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataProviderOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModel testResultsWithDataProvider:](self, "testResultsWithDataProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_modelImpl, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
