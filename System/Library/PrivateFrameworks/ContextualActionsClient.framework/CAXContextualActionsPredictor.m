@implementation CAXContextualActionsPredictor

+ (id)decoderFileName
{
  return CFSTR("decoding.plist");
}

+ (id)encoderFileName
{
  return CFSTR("encoding.plist");
}

+ (id)personalizedModelFileName
{
  return CFSTR("personalizedCAModel.json");
}

+ (id)ioDictKey
{
  return CFSTR("ioDict");
}

+ (id)unigramDictKey
{
  return CFSTR("unigramDict");
}

+ (id)bigramDictKey
{
  return CFSTR("bigramDict");
}

+ (id)frequencyDictKey
{
  return CFSTR("frequencyDict");
}

+ (id)ioNoneType
{
  return CFSTR("None");
}

+ (id)defaultConfigFileUrl
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("config"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultGlobalModelUrl
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("globalModel"), CFSTR("json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultPersonalizedModelUrl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE042A0];
  +[CAXContextualActionsPredictor personalizedModelFileName](CAXContextualActionsPredictor, "personalizedModelFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextualActionsModelFileWithFilename:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultCoderUrlForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 configUrl:(id)a4
{
  id v7;
  id v8;
  CAXContextualActionsPredictor *v9;
  CAXContextualActionsPredictor *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CAXContextualActionsPredictor;
  v9 = -[CAXContextualActionsPredictor init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelUrl, a3);
    objc_storeStrong((id *)&v10->_configUrl, a4);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (v13)
    {
      -[CAXContextualActionsPredictor loadModelsFromUrl:](v10, "loadModelsFromUrl:", v7);
    }
    else
    {
      v14 = (void *)objc_opt_new();
      -[CAXContextualActionsPredictor setModel:](v10, "setModel:", v14);

    }
  }

  return v10;
}

- (CAXContextualActionsPredictor)initWithDefaultCodersAndModelUrl:(id)a3 configUrl:(id)a4
{
  id v6;
  CAXContextualActionsPredictor *v7;
  CAXContextualActionsPredictor *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAXContextualActionsPredictor;
  v7 = -[CAXContextualActionsPredictor init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CAXContextualActionsPredictor loadCoderFilesToInstanceFromDefaulUrls](v7, "loadCoderFilesToInstanceFromDefaulUrls");
    objc_storeStrong((id *)&v8->_modelUrl, a3);
    if (v6
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "path"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "fileExistsAtPath:", v10),
          v10,
          v9,
          v11))
    {
      -[CAXContextualActionsPredictor loadModelsFromUrl:](v8, "loadModelsFromUrl:", v6);
    }
    else
    {
      v12 = (void *)objc_opt_new();
      -[CAXContextualActionsPredictor setModel:](v8, "setModel:", v12);

    }
  }

  return v8;
}

- (CAXContextualActionsPredictor)initWithModelUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 configUrl:(id)a6
{
  id v10;
  id v11;
  id v12;
  CAXContextualActionsPredictor *v13;
  CAXContextualActionsPredictor *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CAXContextualActionsPredictor;
  v13 = -[CAXContextualActionsPredictor init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CAXContextualActionsPredictor loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:](v13, "loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:", v11, v12);
    objc_storeStrong((id *)&v14->_modelUrl, a3);
    if (v10
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "path"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "fileExistsAtPath:", v16),
          v16,
          v15,
          v17))
    {
      -[CAXContextualActionsPredictor loadModelsFromUrl:](v14, "loadModelsFromUrl:", v10);
    }
    else
    {
      v18 = (void *)objc_opt_new();
      -[CAXContextualActionsPredictor setModel:](v14, "setModel:", v18);

    }
  }

  return v14;
}

- (void)loadCoderFilesToInstanceFromDefaulUrls
{
  void *v3;
  id v4;

  +[CAXContextualActionsPredictor defaultCoderUrlForName:](CAXContextualActionsPredictor, "defaultCoderUrlForName:", CFSTR("encoding"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor defaultCoderUrlForName:](CAXContextualActionsPredictor, "defaultCoderUrlForName:", CFSTR("decoding"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:](self, "loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:", v4, v3);

}

- (void)loadCoderFilesToInstanceFromEncoderUrl:(id)a3 decoderUrl:(id)a4
{
  NSURL *v6;
  NSURL *v7;
  NSURL *encoderUrl;
  NSURL *v9;
  NSURL *decoderUrl;
  NSURL *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = (NSURL *)a3;
  v7 = (NSURL *)a4;
  encoderUrl = self->_encoderUrl;
  self->_encoderUrl = v6;
  v9 = v6;

  decoderUrl = self->_decoderUrl;
  self->_decoderUrl = v7;
  v11 = v7;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:", v9);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  -[CAXContextualActionsPredictor setActionEncoder:](self, "setActionEncoder:", v13);

  objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  -[CAXContextualActionsPredictor setTypeEncoder:](self, "setTypeEncoder:", v15);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  -[CAXContextualActionsPredictor setActionDecoder:](self, "setActionDecoder:", v18);

  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  -[CAXContextualActionsPredictor setTypeDecoder:](self, "setTypeDecoder:", v20);

}

- (void)fillNormalizedFrequencyValuesOnPredictions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "frequency");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "intValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = (float)v6;
    v15 = v6;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v17, "frequency", (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v20 = (float)(int)objc_msgSend(v19, "intValue") / v14;
        objc_msgSend(v18, "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setNormalizedFrequency:", v21);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPriorTotal:", v22);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v12);
  }

}

- (id)predictNumActions:(unint64_t)a3 givenContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id obj;
  id obja;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "previousActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor encodeActionSequence:](self, "encodeActionSequence:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor encodeContentTypes:](self, "encodeContentTypes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictor model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor frequencyDictKey](CAXContextualActionsPredictor, "frequencyDictKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictor model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor ioDictKey](CAXContextualActionsPredictor, "ioDictKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_new();
  v61 = (void *)objc_opt_new();
  v62 = v14;
  v58 = v9;
  v59 = v7;
  v57 = v5;
  if (v9)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v9;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v67;
      v19 = 0x24DB30000uLL;
      do
      {
        v20 = 0;
        v63 = v17;
        do
        {
          if (*(_QWORD *)v67 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v20);
          objc_msgSend(v14, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAXContextualActionsPredictor combineDict:withSourceDict:](self, "combineDict:withSourceDict:", v15, v22);

          -[CAXContextualActionsPredictor typeDecoder](self, "typeDecoder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[CAXContextualActionsPredictor getWFContentTypeStringFromContentTypeString:](self, "getWFContentTypeStringFromContentTypeString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 1656)), "initWithContentType:contentMetadata:", v25, 0);
          if ((objc_msgSend(v25, "isEqualToString:", v24) & 1) == 0)
          {
            v70 = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor encodeContentTypes:](self, "encodeContentTypes:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "anyObject");
            v29 = v18;
            v30 = v15;
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v62;
            objc_msgSend(v62, "objectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor combineDict:withSourceDict:](self, "combineDict:withSourceDict:", v61, v32);

            v17 = v63;
            v15 = v30;
            v18 = v29;
            v19 = 0x24DB30000;
          }

          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v17);
    }

    v7 = v59;
  }
  -[CAXContextualActionsPredictor model](self, "model");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor unigramDictKey](CAXContextualActionsPredictor, "unigramDictKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictor model](self, "model");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor bigramDictKey](CAXContextualActionsPredictor, "bigramDictKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  obja = v35;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v45 = 0;
    }
    else
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "lastObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@, %@"), v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "objectForKey:", v44);
      v45 = objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v45 = 0;
    v40 = 0;
  }
  v55 = (void *)v45;
  -[CAXContextualActionsPredictor extractCAElementsByOrderingCounterDictByValue:](self, "extractCAElementsByOrderingCounterDictByValue:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor fillNormalizedFrequencyValuesOnPredictions:](self, "fillNormalizedFrequencyValuesOnPredictions:", v46);
  -[CAXContextualActionsPredictor extractCAElementsByOrderingCounterDictByValue:](self, "extractCAElementsByOrderingCounterDictByValue:", v40);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor fillNormalizedFrequencyValuesOnPredictions:](self, "fillNormalizedFrequencyValuesOnPredictions:", v47);
  -[CAXContextualActionsPredictor extractCAElementsByOrderingCounterDictByValue:](self, "extractCAElementsByOrderingCounterDictByValue:", v15);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor fillNormalizedFrequencyValuesOnPredictions:](self, "fillNormalizedFrequencyValuesOnPredictions:", v48);
  -[CAXContextualActionsPredictor extractCAElementsByOrderingCounterDictByValue:](self, "extractCAElementsByOrderingCounterDictByValue:", v61);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor fillNormalizedFrequencyValuesOnPredictions:](self, "fillNormalizedFrequencyValuesOnPredictions:", v49);
  -[CAXContextualActionsPredictor extractCAElementsByOrderingCounterDictByValue:](self, "extractCAElementsByOrderingCounterDictByValue:", v60);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor fillNormalizedFrequencyValuesOnPredictions:](self, "fillNormalizedFrequencyValuesOnPredictions:", v50);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v54 = (void *)v15;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor addModelResults:toFinalResults:withNumActions:seenSet:](self, "addModelResults:toFinalResults:withNumActions:seenSet:", v46, v51, a3, v52);
  -[CAXContextualActionsPredictor addModelResults:toFinalResults:withNumActions:seenSet:](self, "addModelResults:toFinalResults:withNumActions:seenSet:", v47, v51, a3, v52);
  -[CAXContextualActionsPredictor addModelResults:toFinalResults:withNumActions:seenSet:](self, "addModelResults:toFinalResults:withNumActions:seenSet:", v48, v51, a3, v52);
  -[CAXContextualActionsPredictor addModelResults:toFinalResults:withNumActions:seenSet:](self, "addModelResults:toFinalResults:withNumActions:seenSet:", v49, v51, a3, v52);
  -[CAXContextualActionsPredictor addModelResults:toFinalResults:withNumActions:seenSet:](self, "addModelResults:toFinalResults:withNumActions:seenSet:", v50, v51, a3, v52);

  return v51;
}

- (void)saveModelToUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1608];
  -[CAXContextualActionsPredictor model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 1, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  objc_msgSend(v7, "writeToURL:atomically:", v4, 1);
  __atxlog_handle_contextual_actions();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_impl(&dword_2196B3000, v9, OS_LOG_TYPE_DEFAULT, "model saved to path: %@", buf, 0xCu);

  }
}

- (void)loadModelsFromUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error in parsing JSON binary file at %@"), v7);

  }
  -[CAXContextualActionsPredictor setModel:](self, "setModel:", v6);

}

- (id)getWFContentTypeStringFromContentTypeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  Class v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
    goto LABEL_12;
  +[CAXContextualActionsPredictor ioNoneType](CAXContextualActionsPredictor, "ioNoneType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {

LABEL_12:
    v14 = v4;
    goto LABEL_13;
  }
  v6 = NSClassFromString((NSString *)v4);

  if (!v6)
    goto LABEL_12;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getWFContentItemRegistryClass_softClass;
  v25 = getWFContentItemRegistryClass_softClass;
  if (!getWFContentItemRegistryClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getWFContentItemRegistryClass_block_invoke;
    v20 = &unk_24DB31178;
    v21 = &v22;
    __getWFContentItemRegistryClass_block_invoke((uint64_t)&v17);
    v7 = (void *)v23[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v8, "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v10 = (void *)getWFObjectTypeClass_softClass;
  v25 = getWFObjectTypeClass_softClass;
  if (!getWFObjectTypeClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getWFObjectTypeClass_block_invoke;
    v20 = &unk_24DB31178;
    v21 = &v22;
    __getWFObjectTypeClass_block_invoke((uint64_t)&v17);
    v10 = (void *)v23[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v11, "typeWithClass:", NSClassFromString((NSString *)v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_msgSend(v9, "contentItemClassForType:", v12);

  if (!v13)
    goto LABEL_12;
  NSStringFromClass(v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v15 = v14;

  return v15;
}

- (id)encodeContentTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v32 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[CAXContextualActionsPredictor typeEncoder](self, "typeEncoder");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contentType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[CAXContextualActionsPredictor typeDecoder](self, "typeDecoder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (v17
            || (objc_msgSend(v11, "contentType"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v16, "isEqualToString:", v18),
                v18,
                !v19))
          {
            -[CAXContextualActionsPredictor typeEncoder](self, "typeEncoder");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v21);
            v22 = objc_claimAutoreleasedReturnValue();

            -[CAXContextualActionsPredictor typeEncoder](self, "typeEncoder");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "contentType");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v22, v24);

            -[CAXContextualActionsPredictor typeDecoder](self, "typeDecoder");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "contentType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v26, v22);

            objc_msgSend(v6, "addObject:", v22);
            -[CAXContextualActionsPredictor encoderUrl](self, "encoderUrl");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor decoderUrl](self, "decoderUrl");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor persistCoderFileChangesToEncoderUrl:decoderUrl:](self, "persistCoderFileChangesToEncoderUrl:decoderUrl:", v27, v28);

            -[CAXContextualActionsPredictor encoderUrl](self, "encoderUrl");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor decoderUrl](self, "decoderUrl");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:](self, "loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:", v29, v30);

            v14 = (void *)v22;
          }
          else
          {
            objc_msgSend(v6, "addObject:", v14);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v8);
    }

    v5 = v32;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeActionSequence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v6 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v5;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v9 = *(_QWORD *)v29;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v10), "actionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictor actionEncoder](self, "actionEncoder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[CAXContextualActionsPredictor actionDecoder](self, "actionDecoder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && objc_msgSend(v15, "isEqualToString:", v11))
        {
          objc_msgSend(v6, "addObject:", v13);
          goto LABEL_14;
        }
      }
      else
      {
        v15 = 0;
      }
      -[CAXContextualActionsPredictor actionEncoder](self, "actionEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      -[CAXContextualActionsPredictor actionEncoder](self, "actionEncoder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v18, v11);

      -[CAXContextualActionsPredictor actionDecoder](self, "actionDecoder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v11, v18);

      objc_msgSend(v6, "addObject:", v18);
      -[CAXContextualActionsPredictor encoderUrl](self, "encoderUrl");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictor decoderUrl](self, "decoderUrl");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictor persistCoderFileChangesToEncoderUrl:decoderUrl:](self, "persistCoderFileChangesToEncoderUrl:decoderUrl:", v21, v22);

      -[CAXContextualActionsPredictor encoderUrl](self, "encoderUrl");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictor decoderUrl](self, "decoderUrl");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictor loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:](self, "loadCoderFilesToInstanceFromEncoderUrl:decoderUrl:", v23, v24);

      v13 = (void *)v18;
LABEL_14:

      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v8);
LABEL_16:

  v5 = v26;
LABEL_18:

  return v6;
}

- (void)addEncodedActionSequence:(id)a3 toFrequencyDict:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = objc_msgSend(v12, "intValue") + 1;
        else
          v14 = 1;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v15, v11);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (id)extractCAElementsByOrderingCounterDictByValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  CAXContextualActionsPredictionElement *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v25;
  id v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_3);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v8;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v29)
    {
      v25 = *(_QWORD *)v37;
      v26 = v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(obj);
          v30 = v9;
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
          objc_msgSend(v3, "allKeysForObject:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "intValue"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = -[CAXContextualActionsPredictionElement initWithIdentifier:frequency:]([CAXContextualActionsPredictionElement alloc], "initWithIdentifier:frequency:", v18, v19);
                objc_msgSend(v12, "addObject:", v20);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v15);
          }

          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke_2;
          v31[3] = &unk_24DB31150;
          v31[4] = self;
          objc_msgSend(v12, "sortedArrayUsingComparator:", v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObjectsFromArray:", v21);

          v9 = v30 + 1;
          v3 = v26;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v29);
    }

    v22 = (id)v7;
  }
  else
  {
    v22 = v4;
    v28 = v22;
  }

  return v28;
}

uint64_t __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "intValue");
  if (v6 >= (int)objc_msgSend(v5, "intValue"))
  {
    v8 = objc_msgSend(v4, "intValue");
    if (v8 <= (int)objc_msgSend(v5, "intValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __79__CAXContextualActionsPredictor_extractCAElementsByOrderingCounterDictByValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "actionDecoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodedActionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "actionDecoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodedActionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "compare:", v13);
  return v14;
}

- (void)addModelResults:(id)a3 toFinalResults:(id)a4 withNumActions:(unint64_t)a5 seenSet:(id)a6
{
  id v9;
  id v10;
  int v11;
  void *v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  double v54;
  void *v55;
  void *v56;
  id v57;

  v57 = a3;
  v9 = a4;
  v10 = a6;
  v11 = objc_msgSend(v9, "count");
  v12 = v57;
  if (v57 && v11 < a5)
  {
    v13 = 0;
    v14 = v11;
    do
    {
      if (objc_msgSend(v12, "count") <= v13)
        break;
      objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "encodedActionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "containsObject:", v16);

      if (v17)
      {
        if (objc_msgSend(v9, "count"))
        {
          v18 = 0;
          while (1)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "encodedActionIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "encodedActionIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 == v22)
              break;
            if (objc_msgSend(v9, "count") <= (unint64_t)++v18)
              goto LABEL_22;
          }
          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "frequency");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "integerValue");

          objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "frequency");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "integerValue");

          if (v28 <= v31)
            v32 = v31;
          else
            v32 = v28;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setFrequency:", v33);

          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "normalizedFrequency");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "floatValue");
          v38 = v37;

          objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "normalizedFrequency");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "floatValue");
          v42 = v41;

          if (v38 >= v42)
            *(float *)&v43 = v38;
          else
            *(float *)&v43 = v42;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setNormalizedFrequency:", v44);

          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "priorTotal");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "floatValue");
          v49 = v48;

          objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "priorTotal");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "floatValue");
          v53 = v52;

          if (v49 >= v53)
            *(float *)&v54 = v49;
          else
            *(float *)&v54 = v53;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setPriorTotal:", v55);

        }
      }
      else
      {
        objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v23);

        objc_msgSend(v57, "objectAtIndexedSubscript:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "encodedActionIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v25);

        ++v14;
      }
LABEL_22:
      v12 = v57;
      ++v13;
    }
    while (v14 < a5);
  }

}

- (id)convertToStringEncodedActionSequence:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = &stru_24DB31608;
    do
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v7, "intValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v4 != objc_msgSend(v3, "count") - 1)
      {
        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(", "));
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (__CFString *)v10;
      }
      ++v4;
      v5 = v9;
    }
    while (objc_msgSend(v3, "count") > v4);
  }
  else
  {
    v9 = &stru_24DB31608;
  }

  return v9;
}

- (void)addKeyString:(id)a3 andValueString:(id)a4 toCounterDict:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "intValue") + 1;
    else
      v13 = 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, v15);

  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v15);
  }

  objc_msgSend(v7, "setObject:forKey:", v10, v8);
}

- (void)combineDict:(id)a3 withSourceDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v29)
    {
      v27 = v5;
      v28 = *(_QWORD *)v36;
      v26 = v7;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v7);
          v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v30 = i;
            objc_msgSend(v5, "objectForKeyedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v11, "mutableCopy");

            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v32 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                  objc_msgSend(v12, "objectForKey:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = v20;
                  if (v19)
                  {
                    v22 = objc_msgSend(v20, "intValue");

                    objc_msgSend(v12, "objectForKeyedSubscript:", v18);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v23, "intValue");

                    if ((int)v22 <= (int)v24)
                      v25 = v24;
                    else
                      v25 = v22;
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v25);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(v12, "setObject:forKey:", v21, v18);

                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v15);
            }

            v7 = v26;
            v5 = v27;
            i = v30;
          }
          else
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v12, v9);
          }

        }
        v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v29);
    }
  }

}

- (void)persistCoderFileChangesToEncoderUrl:(id)a3 decoderUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[CAXContextualActionsPredictor actionEncoder](self, "actionEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  -[CAXContextualActionsPredictor typeEncoder](self, "typeEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictor actionDecoder](self, "actionDecoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  -[CAXContextualActionsPredictor typeDecoder](self, "typeDecoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = objc_msgSend(v10, "writeToURL:atomically:", v7, 1);
  if ((_DWORD)v11)
    NSLog(CFSTR("encoder updated."));
  if (objc_msgSend(v13, "writeToURL:atomically:", v6, 1))
    NSLog(CFSTR("decoder updated."));

}

- (id)extractInputTypesAsCAXContentFromActionId:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CAXContextualActionContent *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  objc_class *v14;
  CAXContextualActionContent *v15;
  void *v16;
  CAXContextualActionContent *v17;
  CAXContextualActionContent *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v3 = (void *)getWFActionRegistryClass_softClass;
  v30 = getWFActionRegistryClass_softClass;
  if (!getWFActionRegistryClass_softClass)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __getWFActionRegistryClass_block_invoke;
    v26[3] = &unk_24DB31178;
    v26[4] = &v27;
    __getWFActionRegistryClass_block_invoke((uint64_t)v26);
    v3 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v4, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createActionWithIdentifier:serializedParameters:", v21, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inputContentClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = -[CAXContextualActionContent countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(objc_class **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v15 = [CAXContextualActionContent alloc];
          NSStringFromClass(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[CAXContextualActionContent initWithContentType:contentMetadata:](v15, "initWithContentType:contentMetadata:", v16, 0);

          objc_msgSend(v9, "addObject:", v17);
        }
        v11 = -[CAXContextualActionContent countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v11);
    }
  }
  else
  {
    v18 = [CAXContextualActionContent alloc];
    +[CAXContextualActionsPredictor ioNoneType](CAXContextualActionsPredictor, "ioNoneType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CAXContextualActionContent initWithContentType:contentMetadata:](v18, "initWithContentType:contentMetadata:", v19, 0);

    v32[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)updateModelWithSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[16];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = objc_claimAutoreleasedReturnValue();

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v70 = v4;
  v8 = v4;
  v9 = (void *)v7;
  objc_msgSend(v8, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v82 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "actionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAXContextualActionsPredictor extractInputTypesAsCAXContentFromActionId:](self, "extractInputTypesAsCAXContentFromActionId:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAXContextualActionsPredictor encodeContentTypes:](self, "encodeContentTypes:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v12);
  }

  objc_msgSend(v70, "actions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor encodeActionSequence:](self, "encodeActionSequence:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAXContextualActionsPredictor model](self, "model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0x24DB30000uLL;
  +[CAXContextualActionsPredictor frequencyDictKey](CAXContextualActionsPredictor, "frequencyDictKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[CAXContextualActionsPredictor model](self, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAXContextualActionsPredictor frequencyDictKey](CAXContextualActionsPredictor, "frequencyDictKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v26, "mutableCopy");

    v21 = 0x24DB30000;
  }
  else
  {
    v71 = (void *)objc_opt_new();
  }

  -[CAXContextualActionsPredictor model](self, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v21 + 1688), "ioDictKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[CAXContextualActionsPredictor model](self, "model");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAXContextualActionsPredictor ioDictKey](CAXContextualActionsPredictor, "ioDictKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    v21 = 0x24DB30000;
  }
  else
  {
    v33 = (void *)objc_opt_new();
  }

  -[CAXContextualActionsPredictor model](self, "model");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v21 + 1688), "unigramDictKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKey:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[CAXContextualActionsPredictor model](self, "model");
    v72 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v21 + 1688), "unigramDictKey");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", v38);
    v39 = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v40, "mutableCopy");

    v34 = v39;
    v35 = v72;
  }
  else
  {
    v74 = (void *)objc_opt_new();
  }

  -[CAXContextualActionsPredictor model](self, "model");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v21 + 1688), "bigramDictKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[CAXContextualActionsPredictor model](self, "model");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v21 + 1688), "bigramDictKey");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v45);
    v46 = v41;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v47, "mutableCopy");

    v41 = v46;
  }
  else
  {
    v73 = (void *)objc_opt_new();
  }

  -[CAXContextualActionsPredictor addEncodedActionSequence:toFrequencyDict:](self, "addEncodedActionSequence:toFrequencyDict:", v19, v71);
  if (objc_msgSend(v19, "count"))
  {
    v48 = 0;
    v75 = v9;
    do
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v78;
        do
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v78 != v52)
              objc_enumerationMutation(v49);
            v54 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
            objc_msgSend(v19, "objectAtIndexedSubscript:", v48);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAXContextualActionsPredictor addKeyString:andValueString:toCounterDict:](self, "addKeyString:andValueString:toCounterDict:", v54, v55, v33);

          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        }
        while (v51);
      }

      if (v48)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", (v48 - 1));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v48);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAXContextualActionsPredictor addKeyString:andValueString:toCounterDict:](self, "addKeyString:andValueString:toCounterDict:", v56, v57, v74);

        if (objc_msgSend(v19, "count") - 1 > v48)
        {
          v58 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v19, "objectAtIndexedSubscript:", (v48 - 1));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v48);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringWithFormat:", CFSTR("%@, %@"), v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "objectAtIndexedSubscript:", v48 + 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAXContextualActionsPredictor addKeyString:andValueString:toCounterDict:](self, "addKeyString:andValueString:toCounterDict:", v61, v62, v73);

        }
      }
      ++v48;
      v9 = v75;
    }
    while (objc_msgSend(v19, "count") > v48);
  }
  v63 = (void *)objc_opt_new();
  +[CAXContextualActionsPredictor ioDictKey](CAXContextualActionsPredictor, "ioDictKey");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v33, v64);

  +[CAXContextualActionsPredictor unigramDictKey](CAXContextualActionsPredictor, "unigramDictKey");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v74, v65);

  +[CAXContextualActionsPredictor bigramDictKey](CAXContextualActionsPredictor, "bigramDictKey");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v73, v66);

  +[CAXContextualActionsPredictor frequencyDictKey](CAXContextualActionsPredictor, "frequencyDictKey");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v71, v67);

  -[CAXContextualActionsPredictor setModel:](self, "setModel:", v63);
  __atxlog_handle_contextual_actions();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2196B3000, v68, OS_LOG_TYPE_DEFAULT, "Personalized model updated.", buf, 2u);
  }

  -[CAXContextualActionsPredictor modelUrl](self, "modelUrl");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXContextualActionsPredictor saveModelToUrl:](self, "saveModelToUrl:", v69);

}

- (NSURL)modelUrl
{
  return self->_modelUrl;
}

- (void)setModelUrl:(id)a3
{
  objc_storeStrong((id *)&self->_modelUrl, a3);
}

- (NSURL)configUrl
{
  return self->_configUrl;
}

- (void)setConfigUrl:(id)a3
{
  objc_storeStrong((id *)&self->_configUrl, a3);
}

- (NSURL)encoderUrl
{
  return self->_encoderUrl;
}

- (void)setEncoderUrl:(id)a3
{
  objc_storeStrong((id *)&self->_encoderUrl, a3);
}

- (NSURL)decoderUrl
{
  return self->_decoderUrl;
}

- (void)setDecoderUrl:(id)a3
{
  objc_storeStrong((id *)&self->_decoderUrl, a3);
}

- (NSMutableDictionary)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSMutableDictionary)typeEncoder
{
  return self->_typeEncoder;
}

- (void)setTypeEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_typeEncoder, a3);
}

- (NSMutableDictionary)actionEncoder
{
  return self->_actionEncoder;
}

- (void)setActionEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_actionEncoder, a3);
}

- (NSMutableDictionary)typeDecoder
{
  return self->_typeDecoder;
}

- (void)setTypeDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_typeDecoder, a3);
}

- (NSMutableDictionary)actionDecoder
{
  return self->_actionDecoder;
}

- (void)setActionDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_actionDecoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDecoder, 0);
  objc_storeStrong((id *)&self->_typeDecoder, 0);
  objc_storeStrong((id *)&self->_actionEncoder, 0);
  objc_storeStrong((id *)&self->_typeEncoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_decoderUrl, 0);
  objc_storeStrong((id *)&self->_encoderUrl, 0);
  objc_storeStrong((id *)&self->_configUrl, 0);
  objc_storeStrong((id *)&self->_modelUrl, 0);
}

@end
