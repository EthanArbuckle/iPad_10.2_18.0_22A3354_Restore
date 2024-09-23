@implementation SGQuickResponsesModel

- (id)config
{
  return -[SGQuickResponsesTransformerInstance config](self->_transformer, "config");
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  PMLMultiLabelClassifierProtocol *model;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", objc_msgSend(v6, "modelClass")) & 1) == 0)
    __assert_rtn("-[SGQuickResponsesModel predict:]", "SGQuickResponsesModel.m", 67, "[[self class] isEqual:features.source.modelClass]");

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  model = self->_model;
  objc_msgSend(v4, "vector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "vectorWithConstantColumn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMLMultiLabelClassifierProtocol predict:](model, "predict:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PMLMultiLabelClassifierProtocol predict:](model, "predict:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)featuresOf:(id)a3
{
  SGQuickResponsesTransformerInstance *transformer;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  transformer = self->_transformer;
  v5 = a3;
  -[SGQuickResponsesTransformerInstance featurizer](transformer, "featurizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesTransformerInstance source](self->_transformer, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesModel featuresOf:withFeaturizer:source:](SGQuickResponsesModel, "featuresOf:withFeaturizer:source:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)labelOf:(id)a3
{
  SGQuickResponsesTransformerInstance *transformer;
  id v4;
  void *v5;
  void *v6;

  transformer = self->_transformer;
  v4 = a3;
  -[SGQuickResponsesTransformerInstance labeler](transformer, "labeler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGQuickResponsesModel labelOf:withLabeler:](SGQuickResponsesModel, "labelOf:withLabeler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4
{
  uint64_t v4;
  SGQuickResponsesTransformerInstance *transformer;
  id v6;
  void *v7;

  v4 = a4;
  transformer = self->_transformer;
  v6 = a3;
  -[SGQuickResponsesTransformerInstance sampler](transformer, "sampler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "shouldSampleForLabel:isDynamicLabel:", v6, v4);

  return v4;
}

- (SGQuickResponsesModel)initWithEntity:(id)a3 type:(id)a4 mode:(unint64_t)a5 language:(id)a6 class:(Class)a7 modelPath:(id)a8 plistPath:(id)a9 vocabPath:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  objc_class *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  SGQuickResponsesModel *v37;
  uint64_t v38;
  SGQuickResponsesModel *v39;
  id *p_isa;
  void *v42;
  void *v43;
  id v44;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v47 = a4;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = (objc_class *)objc_opt_class();
  if (v18 && v21 == a7)
  {
    v46 = v16;
    +[SGMultiLabelEspressoClassifierCached classifierWithEspressoModelFile:](SGMultiLabelEspressoClassifierCached, "classifierWithEspressoModelFile:", v18);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((Class)objc_opt_class() != a7)
      goto LABEL_16;
    if (!v18)
    {
      v23 = v19;
      v24 = objc_alloc(MEMORY[0x24BDD17C8]);
      modelModeName(a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v24, "initWithFormat:", CFSTR("%@_%@_%@%@Model.chunk"), v25, v17, v16, v47);

      +[SGDefaultAssets checkFilesystemPathForFilename:](SGDefaultAssets, "checkFilesystemPathForFilename:", v18);
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v19 = v23;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v18 = objc_retainAutorelease(v18);
          *(_DWORD *)buf = 136315138;
          v50 = objc_msgSend(v18, "UTF8String");
          _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to locate assets resource %s", buf, 0xCu);
        }
        goto LABEL_18;
      }
      v27 = (void *)v26;

      v18 = v27;
      v19 = v23;
    }
    v46 = v16;
    PMLReadChunkFile();
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v22;
  if (!v22)
  {
    v16 = v46;
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v18 = objc_retainAutorelease(v18);
      *(_DWORD *)buf = 136316162;
      v50 = objc_msgSend(v18, "UTF8String");
      v51 = 2112;
      v52 = v47;
      v53 = 2112;
      v54 = v16;
      v55 = 2048;
      v56 = a5;
      v57 = 2112;
      v58 = v17;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to load model file resource %s, with type:%@, modelEntity:%@, mode:%lu, language:%@", buf, 0x34u);
    }
LABEL_18:
    v37 = 0;
    goto LABEL_27;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 240, CFSTR("Chunk file at %@ not the same class as type %@"), v18, v47);

  }
  objc_msgSend((id)objc_opt_class(), "transformerInstanceForLanguage:mode:plistPath:vocabPath:", v17, a5, v19, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v44 = v19;
    objc_msgSend(v29, "config");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "mode");
    objc_msgSend(v30, "config");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32 == 1)
    {
      objc_msgSend(v33, "replies");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "modelCount");
    }
    else
    {
      objc_msgSend(v33, "labels");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");
    }
    v38 = v36;

    if (objc_msgSend(v28, "outputDimension") != v38)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model.outputDimension == configCount"));

    }
    v48.receiver = self;
    v48.super_class = (Class)SGQuickResponsesModel;
    v39 = -[SGQuickResponsesModel init](&v48, sel_init);
    p_isa = (id *)&v39->super.isa;
    v19 = v44;
    if (v39)
    {
      objc_storeStrong((id *)&v39->_model, v28);
      objc_storeStrong(p_isa + 2, v30);
    }
    self = p_isa;
    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  v16 = v46;
LABEL_27:

  return v37;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (id)configForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "transformerInstanceForLanguage:mode:plistPath:vocabPath:", v11, a4, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)featuresOf:(id)a3 withFeaturizer:(id)a4 source:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SGModelFeatures *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesModel.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[data isKindOfClass:NSString.class]"));

  }
  v12 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(v10, "transform:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesModel.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[vector isKindOfClass:PMLSparseVector.class]"));

  }
  v14 = -[SGModelFeatures initWithSource:vector:]([SGModelFeatures alloc], "initWithSource:vector:", v11, v13);

  objc_autoreleasePoolPop(v12);
  return v14;
}

+ (id)featuresOf:(id)a3 inLanguage:(id)a4 andMode:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a1, "transformerInstanceForLanguage:mode:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "featurizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGQuickResponsesModel featuresOf:withFeaturizer:source:](SGQuickResponsesModel, "featuresOf:withFeaturizer:source:", v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)labelOf:(id)a3 withLabeler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesModel.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[data isKindOfClass:NSString.class]"));

  }
  v9 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(v8, "transform:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesModel.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[label isKindOfClass:NSNumber.class]"));

  }
  objc_autoreleasePoolPop(v9);

  return v10;
}

+ (id)labelOf:(id)a3 inLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "transformerInstanceForLanguage:mode:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "labeler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGQuickResponsesModel labelOf:withLabeler:](SGQuickResponsesModel, "labelOf:withLabeler:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldSampleForLabel:(id)a3 inLanguage:(id)a4 isDynamicLabel:(BOOL)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "transformerInstanceForLanguage:mode:", a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "shouldSampleForLabel:isDynamicLabel:", v8, v5);

  return v5;
}

+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[SGQuickResponsesConfig configWithLanguage:mode:plistPath:vocabPath:](SGQuickResponsesConfig, "configWithLanguage:mode:plistPath:vocabPath:", v12, a4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "predictionParams");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "modelTypeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "predictionParams");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subModelKeyString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v19, v21);
    objc_msgSend(a1, "modelForLanguage:mode:chunkPath:plistPath:vocabPath:modelTypeAndSubModelKey:", v12, a4, v13, v14, v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v25 = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v14;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "config not found for language %@ and plist path %@", (uint8_t *)&v25, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)modelForLanguage:(id)a3 mode:(unint64_t)a4 chunkPath:(id)a5 plistPath:(id)a6 vocabPath:(id)a7 modelTypeAndSubModelKey:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  SGQuickResponsesClassificationModel *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v14;
  objc_msgSend(v17, "first");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("quickResponsesBinaryLogisticMultiLabel"));

  if (v20)
  {
    v21 = -[SGQuickResponsesModel initWithEntity:type:mode:language:class:modelPath:plistPath:vocabPath:]([SGQuickResponsesClassificationModel alloc], "initWithEntity:type:mode:language:class:modelPath:plistPath:vocabPath:", CFSTR("quickResponses"), CFSTR("BinaryLogisticMultiLabel"), a4, v13, objc_opt_class(), v18, v15, v16);
LABEL_8:
    v26 = v18;
    goto LABEL_9;
  }
  objc_msgSend(v17, "first");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel"));

  if (!v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "first");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v30 = objc_msgSend(v28, "UTF8String");
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unknown model name: %s", buf, 0xCu);

    }
    v21 = 0;
    goto LABEL_8;
  }
  v24 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v17, "second");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@:%@"), v18, v25);

  v21 = -[SGQuickResponsesModel initWithEntity:type:mode:language:class:modelPath:plistPath:vocabPath:]([SGQuickResponsesClassificationModel alloc], "initWithEntity:type:mode:language:class:modelPath:plistPath:vocabPath:", CFSTR("quickResponses"), CFSTR("EspressoClassifierMultiLabel"), a4, v13, objc_opt_class(), v26, v15, v16);
LABEL_9:

  return v21;
}

+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "transformerInstanceForLanguage:mode:plistPath:vocabPath:", a3, a4, 0, 0);
}

+ (id)transformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  objc_class *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (__mockTransformerForTesting)
  {
    v13 = objc_opt_class();
    objc_msgSend((id)__mockTransformerForTesting, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "modelClass");

    if (v13 == v15)
    {
      objc_msgSend((id)__mockTransformerForTesting, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "language");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", v10))
      {
        v18 = objc_msgSend(v16, "mode");

        if (v18 == a4)
        {
          v19 = (id)__mockTransformerForTesting;

          goto LABEL_16;
        }
      }
      else
      {

      }
    }
  }
  v20 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(a1, "_transformerCacheKeyForLanguage:mode:plistPath:", v10, a4, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1 && !v11)
    objc_msgSend(a1, "_addModelAssetUpdateHandler");
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__479;
  v45 = __Block_byref_object_dispose__480;
  v46 = 0;
  objc_msgSend(a1, "_sharedInvalidKeysCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __81__SGQuickResponsesModel_transformerInstanceForLanguage_mode_plistPath_vocabPath___block_invoke;
  v33[3] = &unk_24DDC4508;
  v23 = v21;
  v34 = v23;
  v38 = &v41;
  v39 = a1;
  v24 = v10;
  v35 = v24;
  v40 = a4;
  v25 = v11;
  v36 = v25;
  v37 = v12;
  objc_msgSend(v22, "runWithLockAcquired:", v33);

  v26 = (void *)v42[5];
  if (!v26)
  {
    v27 = MEMORY[0x24BDACB70];
    v28 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      modelModeName(a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = v31;
      v49 = 2112;
      v50 = v24;
      v51 = 2112;
      v52 = v32;
      v53 = 2112;
      v54 = v25;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "No transformer instance for model %@ in language %@ and mode %@ at path %@", buf, 0x2Au);

    }
    v26 = (void *)v42[5];
  }
  v19 = v26;

  _Block_object_dispose(&v41, 8);
  objc_autoreleasePoolPop(v20);
LABEL_16:

  return v19;
}

+ (id)_transformerCacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5
{
  objc_class *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = (__CFString *)a5;
  v10 = (__CFString *)a3;
  v11 = [v8 alloc];
  if (v10)
    v12 = v10;
  else
    v12 = &stru_24DDC5810;
  NSStringFromClass((Class)a1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v9)
    v15 = v9;
  else
    v15 = &stru_24DDC5810;
  v16 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@%lu%@%@"), v12, a4, v13, v15);

  return v16;
}

+ (id)_sharedTransformerCache
{
  if (_sharedTransformerCache__pasOnceToken383 != -1)
    dispatch_once(&_sharedTransformerCache__pasOnceToken383, &__block_literal_global_478);
  return (id)objc_msgSend((id)_sharedTransformerCache__pasExprOnceResult, "result");
}

+ (id)_sharedInvalidKeysCache
{
  if (_sharedInvalidKeysCache__pasOnceToken384 != -1)
    dispatch_once(&_sharedInvalidKeysCache__pasOnceToken384, &__block_literal_global_50);
  return (id)objc_msgSend((id)_sharedInvalidKeysCache__pasExprOnceResult, "result");
}

+ (void)_addModelAssetUpdateHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_addModelAssetUpdateHandler_onceToken_471 != -1)
    dispatch_once(&_addModelAssetUpdateHandler_onceToken_471, block);
}

+ (id)newTransformerInstanceForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesModel.m"), 345, CFSTR("%@ must implement +newTransformerInstanceForLanguage:mode:plistPath:"), objc_opt_class());

  return 0;
}

+ (void)setGlobalTransformerForTesting:(id)a3
{
  objc_storeStrong((id *)&__mockTransformerForTesting, a3);
}

uint64_t __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_2;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[SGModelAsset registerOnUpdateBlock:](SGModelAsset, "registerOnUpdateBlock:", v2);
}

void __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sharedTransformerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "_sharedInvalidKeysCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runWithLockAcquired:", &__block_literal_global_56_474);

}

uint64_t __52__SGQuickResponsesModel__addModelAssetUpdateHandler__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

void __48__SGQuickResponsesModel__sharedInvalidKeysCache__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:", &__block_literal_global_52);
  v2 = (void *)_sharedInvalidKeysCache__pasExprOnceResult;
  _sharedInvalidKeysCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __48__SGQuickResponsesModel__sharedInvalidKeysCache__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE7A610]);
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

void __48__SGQuickResponsesModel__sharedTransformerCache__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_48, 600.0);
  v2 = (void *)_sharedTransformerCache__pasExprOnceResult;
  _sharedTransformerCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __48__SGQuickResponsesModel__sharedTransformerCache__block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 6);
}

void __81__SGQuickResponsesModel_transformerInstanceForLanguage_mode_plistPath_vocabPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 72), "_sharedTransformerCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v7 = objc_msgSend(*(id *)(a1 + 72), "newTransformerInstanceForLanguage:mode:plistPath:vocabPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 72), "_sharedTransformerCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));

      }
      else
      {
        objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 32));
      }
    }
  }

}

@end
