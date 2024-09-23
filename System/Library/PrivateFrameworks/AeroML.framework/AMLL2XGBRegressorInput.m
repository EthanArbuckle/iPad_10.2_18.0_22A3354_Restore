@implementation AMLL2XGBRegressorInput

+ (id)logger
{
  if (logger_onceToken_0 != -1)
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  return (id)logger_logger_0;
}

void __32__AMLL2XGBRegressorInput_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.aeroml.AMLFramework", "AMLL2XGBRegressorInput");
  v1 = (void *)logger_logger_0;
  logger_logger_0 = (uint64_t)v0;

  if (!logger_logger_0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __31__AMLPhotosShareMetrics_logger__block_invoke_cold_1();
}

- (AMLL2XGBRegressorInput)initWithL1Score:(double)a3 freshness:(double)a4 photosFavorited:(double)a5 aestheticScore:(double)a6 curationScore:(double)a7 matchedFieldsCount:(double)a8 matchedPeopleRatio:(double)a9 matchedLocationRatio:(double)a10 matchedSceneLabelRatio:(double)a11 matchedSceneSynonymRatio:(double)a12 matchedOCRCharacterMatchRatio:(double)a13 matchedSceneConfidence:(double)a14 matchedSceneBoundingBox:(double)a15 matchedOCRImportance:(double)a16
{
  AMLL2XGBRegressorInput *result;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)AMLL2XGBRegressorInput;
  result = -[AMLL2XGBRegressorInput init](&v25, sel_init);
  if (result)
  {
    result->_L1Score = a3;
    result->_freshness = a4;
    result->_photosFavorited = a5;
    result->_aestheticScore = a6;
    result->_curationScore = a7;
    result->_matchedFieldsCount = a8;
    result->_matchedPeopleRatio = a9;
    result->_matchedLocationRatio = a10;
    result->_matchedSceneLabelRatio = a11;
    result->_matchedSceneSynonymRatio = a12;
    result->_matchedOCRCharacterMatchRatio = a13;
    result->_matchedSceneConfidence = a14;
    result->_matchedSceneBoundingBox = a15;
    result->_matchedOCRImportance = a16;
  }
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2507587B0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("L1Score")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput L1Score](self, "L1Score");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("freshness")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput freshness](self, "freshness");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("photosFavorited")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput photosFavorited](self, "photosFavorited");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("aestheticScore")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput aestheticScore](self, "aestheticScore");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("curationScore")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput curationScore](self, "curationScore");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedFieldsCount")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedFieldsCount](self, "matchedFieldsCount");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedPeopleRatio")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedPeopleRatio](self, "matchedPeopleRatio");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedLocationRatio")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedLocationRatio](self, "matchedLocationRatio");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedSceneLabelRatio")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedSceneLabelRatio](self, "matchedSceneLabelRatio");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedSceneSynonymRatio")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedSceneSynonymRatio](self, "matchedSceneSynonymRatio");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedOCRCharacterMatchRatio")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedOCRCharacterMatchRatio](self, "matchedOCRCharacterMatchRatio");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedSceneConfidence")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedSceneConfidence](self, "matchedSceneConfidence");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("matchedSceneBoundingBox")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("matchedOCRImportance")))
    {
      v6 = 0;
      goto LABEL_30;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[AMLL2XGBRegressorInput matchedOCRImportance](self, "matchedOCRImportance");
  }
  objc_msgSend(v5, "featureValueWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMLL2XGBRegressorInput)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("L1Score"));
  v33 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("freshness"));
  v32 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("photosFavorited"));
  v31 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("aestheticScore"));
  v30 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("curationScore"));
  v29 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedFieldsCount"));
  v28 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedPeopleRatio"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedLocationRatio"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedSceneLabelRatio"));
  v16 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedSceneSynonymRatio"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedOCRCharacterMatchRatio"));
  v20 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedSceneConfidence"));
  v22 = v21;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedSceneBoundingBox"));
  v24 = v23;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("matchedOCRImportance"));
  v26 = v25;

  return -[AMLL2XGBRegressorInput initWithL1Score:freshness:photosFavorited:aestheticScore:curationScore:matchedFieldsCount:matchedPeopleRatio:matchedLocationRatio:matchedSceneLabelRatio:matchedSceneSynonymRatio:matchedOCRCharacterMatchRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRImportance:](self, "initWithL1Score:freshness:photosFavorited:aestheticScore:curationScore:matchedFieldsCount:matchedPeopleRatio:matchedLocationRatio:matchedSceneLabelRatio:matchedSceneSynonymRatio:matchedOCRCharacterMatchRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRImportance:", v33, v32, v31, v30, v29, v28, v12, v14, v16, v18, v20, v22, v24, v26);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x23B7E7AF4]();
  -[AMLL2XGBRegressorInput L1Score](self, "L1Score");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("L1Score"));
  -[AMLL2XGBRegressorInput freshness](self, "freshness");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("freshness"));
  -[AMLL2XGBRegressorInput photosFavorited](self, "photosFavorited");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("photosFavorited"));
  -[AMLL2XGBRegressorInput aestheticScore](self, "aestheticScore");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("aestheticScore"));
  -[AMLL2XGBRegressorInput curationScore](self, "curationScore");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("curationScore"));
  -[AMLL2XGBRegressorInput matchedFieldsCount](self, "matchedFieldsCount");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedFieldsCount"));
  -[AMLL2XGBRegressorInput matchedPeopleRatio](self, "matchedPeopleRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedPeopleRatio"));
  -[AMLL2XGBRegressorInput matchedLocationRatio](self, "matchedLocationRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedLocationRatio"));
  -[AMLL2XGBRegressorInput matchedSceneLabelRatio](self, "matchedSceneLabelRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedSceneLabelRatio"));
  -[AMLL2XGBRegressorInput matchedSceneSynonymRatio](self, "matchedSceneSynonymRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedSceneSynonymRatio"));
  -[AMLL2XGBRegressorInput matchedOCRCharacterMatchRatio](self, "matchedOCRCharacterMatchRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedOCRCharacterMatchRatio"));
  -[AMLL2XGBRegressorInput matchedSceneConfidence](self, "matchedSceneConfidence");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedSceneConfidence"));
  -[AMLL2XGBRegressorInput matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedSceneBoundingBox"));
  -[AMLL2XGBRegressorInput matchedOCRImportance](self, "matchedOCRImportance");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("matchedOCRImportance"));
  objc_autoreleasePoolPop(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[AMLL2XGBRegressorInput L1Score](self, "L1Score");
    objc_msgSend(v4, "setL1Score:");
    -[AMLL2XGBRegressorInput freshness](self, "freshness");
    objc_msgSend(v4, "setFreshness:");
    -[AMLL2XGBRegressorInput photosFavorited](self, "photosFavorited");
    objc_msgSend(v4, "setPhotosFavorited:");
    -[AMLL2XGBRegressorInput aestheticScore](self, "aestheticScore");
    objc_msgSend(v4, "setAestheticScore:");
    -[AMLL2XGBRegressorInput curationScore](self, "curationScore");
    objc_msgSend(v4, "setCurationScore:");
    -[AMLL2XGBRegressorInput matchedFieldsCount](self, "matchedFieldsCount");
    objc_msgSend(v4, "setMatchedFieldsCount:");
    -[AMLL2XGBRegressorInput matchedPeopleRatio](self, "matchedPeopleRatio");
    objc_msgSend(v4, "setMatchedPeopleRatio:");
    -[AMLL2XGBRegressorInput matchedLocationRatio](self, "matchedLocationRatio");
    objc_msgSend(v4, "setMatchedLocationRatio:");
    -[AMLL2XGBRegressorInput matchedSceneLabelRatio](self, "matchedSceneLabelRatio");
    objc_msgSend(v4, "setMatchedSceneLabelRatio:");
    -[AMLL2XGBRegressorInput matchedSceneSynonymRatio](self, "matchedSceneSynonymRatio");
    objc_msgSend(v4, "setMatchedSceneSynonymRatio:");
    -[AMLL2XGBRegressorInput matchedOCRCharacterMatchRatio](self, "matchedOCRCharacterMatchRatio");
    objc_msgSend(v4, "setMatchedOCRCharacterMatchRatio:");
    -[AMLL2XGBRegressorInput matchedSceneConfidence](self, "matchedSceneConfidence");
    objc_msgSend(v4, "setMatchedSceneConfidence:");
    -[AMLL2XGBRegressorInput matchedSceneBoundingBox](self, "matchedSceneBoundingBox");
    objc_msgSend(v4, "setMatchedSceneBoundingBox:");
    -[AMLL2XGBRegressorInput matchedOCRImportance](self, "matchedOCRImportance");
    objc_msgSend(v4, "setMatchedOCRImportance:");
  }
  return v4;
}

+ (id)photosSearchModelDataFrom:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v9, v4, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (v11)
  {
    +[AMLL2XGBRegressorInput logger](AMLL2XGBRegressorInput, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[AMLL2XGBRegressorInput photosSearchModelDataFrom:].cold.1(v11, v12);

  }
  return v10;
}

+ (id)photosSearchModelContentForFeatureProvider:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x24BDD17C8];
    v5 = v3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "L1Score");
    v36 = v7;
    objc_msgSend(v5, "freshness");
    v35 = v8;
    objc_msgSend(v5, "photosFavorited");
    v34 = v9;
    objc_msgSend(v5, "aestheticScore");
    v33 = v10;
    objc_msgSend(v5, "curationScore");
    v32 = v11;
    objc_msgSend(v5, "matchedFieldsCount");
    v31 = v12;
    objc_msgSend(v5, "matchedPeopleRatio");
    v14 = v13;
    objc_msgSend(v5, "matchedLocationRatio");
    v16 = v15;
    objc_msgSend(v5, "matchedSceneLabelRatio");
    v18 = v17;
    objc_msgSend(v5, "matchedSceneSynonymRatio");
    v20 = v19;
    objc_msgSend(v5, "matchedOCRCharacterMatchRatio");
    v22 = v21;
    objc_msgSend(v5, "matchedSceneConfidence");
    v24 = v23;
    objc_msgSend(v5, "matchedSceneBoundingBox");
    v26 = v25;
    objc_msgSend(v5, "matchedOCRImportance");
    v28 = v27;

    v29 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("L2XGRegressorInput:\n\t\tl1Score: %lf\n\t\tfreshness: %lf\n\t\tphotosFavorited: %lf\n\t\taestheticScore: %lf\n\t\tcurationScore: %lf\n\t\tmatchedFieldsCount:%lf\n\t\tmatchedPeopleRatio:%lf\n\t\tmatchedLocationRatio: %lf\n\t\tmatchedSceneLabelRatio: %lf\n\t\tmatchedSceneSynonymRatio:%lf \n\t\tmatchedOCRCharacterMatchRatio: %lf \n\t\tmatchedSceneConfidence: %lf\n\t\tmatchedSceneBoundingBox: %lf\n\t\tmatchedOCRImportance: %lf"), v36, v35, v34, v33, v32, v31, v14, v16, v18, v20, v22, v24, v26, v28);
  }
  else
  {
    v29 = CFSTR("No supporting model description found");
  }

  return v29;
}

+ (id)dictionariesFromBatchProvider:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = (id)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "featuresAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "featureNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v6, "featureValueForName:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }
      objc_msgSend(v15, "addObject:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }

  return v15;
}

+ (id)photosSearchModelArrayForArrayProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  id obj;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v26 = (id)objc_opt_new();
  v22 = v3;
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = v25;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v30;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14);
              objc_msgSend(v8, "featureValueForName:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "type") == 1)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v16, "int64Value"));
                v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
                v19 = (void *)v17;
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

                goto LABEL_18;
              }
              if (objc_msgSend(v16, "type") == 2)
              {
                v18 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v16, "doubleValue");
                objc_msgSend(v18, "numberWithDouble:");
                v17 = objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
              if (objc_msgSend(v16, "type") == 3)
              {
                objc_msgSend(v16, "stringValue");
                v17 = objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
              objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v15);
LABEL_18:

              ++v14;
            }
            while (v12 != v14);
            v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v12 = v20;
          }
          while (v20);
        }

        objc_msgSend(v26, "addObject:", v9);
        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

  return v26;
}

+ (id)photosSearchModelContentForBatchProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "dictionariesFromBatchProvider:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "count") >= 1)
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "featuresAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "photosSearchModelContentForFeatureProvider:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v9);

        }
        else
        {
          objc_msgSend(v5, "addObject:", CFSTR("No supporting model description found"));
        }
        ++v7;

      }
      while (v7 < objc_msgSend(v4, "count"));
    }
    v6 = v5;
  }
  v10 = v6;

  return v10;
}

+ (id)photosSearchDataMetricsForFeatureProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (double)L1Score
{
  return self->_L1Score;
}

- (void)setL1Score:(double)a3
{
  self->_L1Score = a3;
}

- (double)freshness
{
  return self->_freshness;
}

- (void)setFreshness:(double)a3
{
  self->_freshness = a3;
}

- (double)photosFavorited
{
  return self->_photosFavorited;
}

- (void)setPhotosFavorited:(double)a3
{
  self->_photosFavorited = a3;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (void)setAestheticScore:(double)a3
{
  self->_aestheticScore = a3;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(double)a3
{
  self->_curationScore = a3;
}

- (double)matchedFieldsCount
{
  return self->_matchedFieldsCount;
}

- (void)setMatchedFieldsCount:(double)a3
{
  self->_matchedFieldsCount = a3;
}

- (double)matchedPeopleRatio
{
  return self->_matchedPeopleRatio;
}

- (void)setMatchedPeopleRatio:(double)a3
{
  self->_matchedPeopleRatio = a3;
}

- (double)matchedLocationRatio
{
  return self->_matchedLocationRatio;
}

- (void)setMatchedLocationRatio:(double)a3
{
  self->_matchedLocationRatio = a3;
}

- (double)matchedSceneLabelRatio
{
  return self->_matchedSceneLabelRatio;
}

- (void)setMatchedSceneLabelRatio:(double)a3
{
  self->_matchedSceneLabelRatio = a3;
}

- (double)matchedSceneSynonymRatio
{
  return self->_matchedSceneSynonymRatio;
}

- (void)setMatchedSceneSynonymRatio:(double)a3
{
  self->_matchedSceneSynonymRatio = a3;
}

- (double)matchedOCRCharacterMatchRatio
{
  return self->_matchedOCRCharacterMatchRatio;
}

- (void)setMatchedOCRCharacterMatchRatio:(double)a3
{
  self->_matchedOCRCharacterMatchRatio = a3;
}

- (double)matchedSceneConfidence
{
  return self->_matchedSceneConfidence;
}

- (void)setMatchedSceneConfidence:(double)a3
{
  self->_matchedSceneConfidence = a3;
}

- (double)matchedSceneBoundingBox
{
  return self->_matchedSceneBoundingBox;
}

- (void)setMatchedSceneBoundingBox:(double)a3
{
  self->_matchedSceneBoundingBox = a3;
}

- (double)matchedOCRImportance
{
  return self->_matchedOCRImportance;
}

- (void)setMatchedOCRImportance:(double)a3
{
  self->_matchedOCRImportance = a3;
}

+ (void)photosSearchModelDataFrom:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_235F59000, a2, OS_LOG_TYPE_ERROR, "Encountered error when unarchiving model data: %@ Description: %@", (uint8_t *)&v5, 0x16u);

}

@end
