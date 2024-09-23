@implementation CAXContextualActionsPredictorDriver

+ (id)encoderUrl
{
  return +[CAXContextualActionsPredictor defaultCoderUrlForName:](CAXContextualActionsPredictor, "defaultCoderUrlForName:", CFSTR("encoding"));
}

+ (id)decoderUrl
{
  return +[CAXContextualActionsPredictor defaultCoderUrlForName:](CAXContextualActionsPredictor, "defaultCoderUrlForName:", CFSTR("decoding"));
}

+ (id)personalizedModelInUseKey
{
  return CFSTR("personalizedModelInUse");
}

- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3
{
  id v4;
  CAXContextualActionsPredictorDriver *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSDictionary *configDict;
  void *v11;
  CAXContextualActionsPredictor *v12;
  CAXContextualActionsPredictor *globalModel;
  NSDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  CAXContextualActionsPredictor *v21;
  CAXContextualActionsPredictor *personalizedModel;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAXContextualActionsPredictorDriver;
  v5 = -[CAXContextualActionsPredictorDriver init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v4);
      configDict = v5->_configDict;
      v5->_configDict = (NSDictionary *)v9;

    }
    +[CAXContextualActionsPredictor defaultGlobalModelUrl](CAXContextualActionsPredictor, "defaultGlobalModelUrl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CAXContextualActionsPredictor initWithDefaultCodersAndModelUrl:configUrl:]([CAXContextualActionsPredictor alloc], "initWithDefaultCodersAndModelUrl:configUrl:", v11, v4);
    globalModel = v5->_globalModel;
    v5->_globalModel = v12;

    v14 = v5->_configDict;
    +[CAXContextualActionsPredictorDriver personalizedModelInUseKey](CAXContextualActionsPredictorDriver, "personalizedModelInUseKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[CAXContextualActionsPredictor defaultPersonalizedModelUrl](CAXContextualActionsPredictor, "defaultPersonalizedModelUrl");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

      if (v20)
        v21 = -[CAXContextualActionsPredictor initWithModelUrl:configUrl:]([CAXContextualActionsPredictor alloc], "initWithModelUrl:configUrl:", v17, v4);
      else
        v21 = objc_alloc_init(CAXContextualActionsPredictor);
      personalizedModel = v5->_personalizedModel;
      v5->_personalizedModel = v21;

    }
    else
    {
      v17 = v5->_personalizedModel;
      v5->_personalizedModel = 0;
    }

  }
  return v5;
}

- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 globalModelUrl:(id)a6 personalizedModelUrl:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CAXContextualActionsPredictorDriver *v17;
  uint64_t v18;
  NSDictionary *configDict;
  CAXContextualActionsPredictor *v20;
  CAXContextualActionsPredictor *globalModel;
  NSDictionary *v22;
  void *v23;
  void *v24;
  CAXContextualActionsPredictor *v25;
  CAXContextualActionsPredictor *personalizedModel;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CAXContextualActionsPredictorDriver;
  v17 = -[CAXContextualActionsPredictorDriver init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v12);
    configDict = v17->_configDict;
    v17->_configDict = (NSDictionary *)v18;

    v20 = -[CAXContextualActionsPredictor initWithModelUrl:encoderUrl:decoderUrl:configUrl:]([CAXContextualActionsPredictor alloc], "initWithModelUrl:encoderUrl:decoderUrl:configUrl:", v15, v13, v14, v12);
    globalModel = v17->_globalModel;
    v17->_globalModel = v20;

    v22 = v17->_configDict;
    +[CAXContextualActionsPredictorDriver personalizedModelInUseKey](CAXContextualActionsPredictorDriver, "personalizedModelInUseKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = -[CAXContextualActionsPredictor initWithModelUrl:encoderUrl:decoderUrl:configUrl:]([CAXContextualActionsPredictor alloc], "initWithModelUrl:encoderUrl:decoderUrl:configUrl:", v16, v13, v14, v12);
      personalizedModel = v17->_personalizedModel;
      v17->_personalizedModel = v25;
    }
    else
    {
      personalizedModel = v17->_personalizedModel;
      v17->_personalizedModel = 0;
    }

  }
  return v17;
}

- (id)predictWithConfidenceFromContext:(id)a3 numActions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[CAXContextualActionsPredictorDriver globalModel](self, "globalModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictNumActions:givenContext:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictorDriver configDict](self, "configDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictorDriver personalizedModelInUseKey](CAXContextualActionsPredictorDriver, "personalizedModelInUseKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CAXContextualActionsPredictorDriver personalizedModel](self, "personalizedModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadCoderFilesToInstanceFromDefaulUrls");

  }
  +[CAXContextualActionsPredictorDriver decoderUrl](CAXContextualActionsPredictorDriver, "decoderUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictorDriver decodeArrayOfCAElements:fromDecoderUrl:](self, "decodeArrayOfCAElements:fromDecoderUrl:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)decodeArrayOfCAElements:(id)a3 fromDecoderUrl:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CAXContextualActionsPredictionElement *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CAXContextualActionsPredictionElement *v18;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = [CAXContextualActionsPredictionElement alloc];
        objc_msgSend(v11, "encodedActionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frequency");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "normalizedFrequency");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "priorTotal");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CAXContextualActionsPredictionElement initWithIdentifier:frequency:normalizedFrequency:priorTotal:](v12, "initWithIdentifier:frequency:normalizedFrequency:priorTotal:", v14, v15, v16, v17);

        objc_msgSend(v22, "addObject:", v18);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v22;
}

- (id)decodeArrayOfCAElementsIntoActionIds:(id)a3 fromDecoderUrl:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "encodedActionIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (CAXContextualActionsPredictor)globalModel
{
  return self->_globalModel;
}

- (void)setGlobalModel:(id)a3
{
  objc_storeStrong((id *)&self->_globalModel, a3);
}

- (CAXContextualActionsPredictor)personalizedModel
{
  return self->_personalizedModel;
}

- (void)setPersonalizedModel:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedModel, a3);
}

- (NSDictionary)configDict
{
  return self->_configDict;
}

- (void)setConfigDict:(id)a3
{
  objc_storeStrong((id *)&self->_configDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_personalizedModel, 0);
  objc_storeStrong((id *)&self->_globalModel, 0);
}

@end
