@implementation ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:hyperParameters:dataStoreWrapper:](self, "initWithCandidateId:candidateType:anchor:hyperParameters:dataStoreWrapper:", v10, v9, v8, v11, v12);

  return v13;
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:hyperParameters:dataStoreWrapper:](self, "initWithCandidateId:candidateType:anchor:hyperParameters:dataStoreWrapper:", v13, v12, v11, v10, v14);

  return v15;
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 hyperParameters:(id)a6 dataStoreWrapper:(id)a7
{
  return -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:tree:hyperParameters:dataStoreWrapper:](self, "initWithCandidateId:candidateType:anchor:tree:hyperParameters:dataStoreWrapper:", a3, a4, a5, 0, a6, a7);
}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5 tree:(id)a6 hyperParameters:(id)a7 dataStoreWrapper:(id)a8
{
  id v15;
  id v16;
  id v17;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v18;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v19;
  objc_super v21;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier;
  v18 = -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:](&v21, sel_initWithCandidateId_candidateType_anchor_, a3, a4, a5);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tree, a6);
    objc_storeStrong((id *)&v19->_storeWrapper, a8);
    objc_storeStrong((id *)&v19->_hyperParameters, a7);
  }

  return v19;
}

- (int64_t)classifierType
{
  return 3;
}

- (NSString)treeDescription
{
  NSString *treeDescription;
  id v4;
  ATXGamePlayKitDecisionTree *tree;
  NSString *v6;
  NSString *v7;

  treeDescription = self->_treeDescription;
  if (!treeDescription)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    tree = self->_tree;
    if (!tree)
      tree = (ATXGamePlayKitDecisionTree *)CFSTR("EmptyTree");
    v6 = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@"), tree);
    v7 = self->_treeDescription;
    self->_treeDescription = v6;

    treeDescription = self->_treeDescription;
  }
  return treeDescription;
}

- (NSString)description
{
  __CFString *v3;

  if (-[ATXNaivePositiveAnchorModelCandidateClassifier isTrained](self, "isTrained"))
  {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier treeDescription](self, "treeDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("GamePlayKit Decision Tree Anchor Model candidate classifier.");
  }
  return (NSString *)v3;
}

- (id)featureNames
{
  return &unk_1E83D03A0;
}

- (BOOL)shouldComputeLaunchHistoryCounts
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  if (shouldComputeLaunchHistoryCounts__pasOnceToken6 != -1)
    dispatch_once(&shouldComputeLaunchHistoryCounts__pasOnceToken6, block);
  return shouldComputeLaunchHistoryCounts__pasExprOnceResult;
}

void __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2;
  v3[3] = &unk_1E82E2AA0;
  v3[4] = *(_QWORD *)(a1 + 32);
  shouldComputeLaunchHistoryCounts__pasExprOnceResult = __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2((uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

uint64_t __92__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_shouldComputeLaunchHistoryCounts__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "featureNames", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "containsString:", CFSTR("candidateOccurrencesIn")) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (id)stringFeaturesToReplaceWithUnk
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("anchorEventIdentifier"), 0, 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)labelKey
{
  return CFSTR("candidatePerformed");
}

- (id)tree
{
  return self->_tree;
}

- (void)train
{
  ATXGamePlayKitDecisionTree *v3;
  ATXGamePlayKitDecisionTree *tree;

  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainDecisionTree](self, "trainDecisionTree");
  v3 = (ATXGamePlayKitDecisionTree *)objc_claimAutoreleasedReturnValue();
  tree = self->_tree;
  self->_tree = v3;

  -[ATXNaivePositiveAnchorModelCandidateClassifier setIsTrained:](self, "setIsTrained:", 1);
}

- (id)trainDecisionTree
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  ATXGamePlayKitDecisionTree *v15;
  void *v16;
  ATXGamePlayKitDecisionTree *v17;
  ATXGamePlayKitDecisionTree *v18;
  NSObject *v19;
  ATXGamePlayKitDecisionTree *v20;
  ATXGamePlayKitDecisionTree *v21;
  void *context;
  uint8_t buf[4];
  ATXGamePlayKitDecisionTree *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA48B6C](self, a2);
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingData](self, "trainingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingFeatureVectorsFromTrainingData:](self, "trainingFeatureVectorsFromTrainingData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingLabelsFromTrainingData:](self, "trainingLabelsFromTrainingData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier featureNames](self, "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:labels:](self, "indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:labels:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectsAtIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainDecisionTree].cold.2();

  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainDecisionTree].cold.1();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
  v13 = objc_msgSend(v12, "count");
  if (v13 == 1)
  {
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
      v15 = (ATXGamePlayKitDecisionTree *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "Skipping training decision tree for candidate %@ since there's only one known label: %@.:", buf, 0x16u);

    }
    v17 = 0;
  }
  else
  {
    v18 = [ATXGamePlayKitDecisionTree alloc];
    -[ATXAnchorModelHyperParameters ratioForLeafNodeDecision](self->_hyperParameters, "ratioForLeafNodeDecision");
    v17 = -[ATXGamePlayKitDecisionTree initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:](v18, "initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:", v8, v9, v6, 3, 3);
    __atxlog_handle_anchor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
      v20 = (ATXGamePlayKitDecisionTree *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "Finished training decision tree for candidate %@. Tree:", buf, 0xCu);

    }
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "\n%@", buf, 0xCu);
    }
  }

  objc_autoreleasePoolPop(context);
  if (v13 == 1)
    v21 = 0;
  else
    v21 = v17;

  return v21;
}

- (id)indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:(id)a3 labels:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = v8; i < objc_msgSend(v5, "count"); ++i)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", v11) & 1) != 0)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
              objc_msgSend(v7, "addIndex:", v8);
            objc_msgSend(v6, "objectAtIndexedSubscript:", i);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              objc_msgSend(v7, "addIndex:", i);
          }
        }
        else
        {

        }
      }

      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeIndexes:", v7);

  return v17;
}

- (id)trainingData
{
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v4;
  void *v5;
  void *v6;

  storeWrapper = self->_storeWrapper;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol trainingDataForCandidate:anchor:replacementStringForNilStringValues:](storeWrapper, "trainingDataForCandidate:anchor:replacementStringForNilStringValues:", v4, v5, CFSTR("unk"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)trainingLabelsFromTrainingData:(id)a3
{
  void *v3;
  NSObject *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingLabelsFromTrainingData___block_invoke;
  v6[3] = &unk_1E82E5448;
  v6[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingLabelsFromTrainingData:].cold.1();

  return v3;
}

id __91__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingLabelsFromTrainingData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "labelKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)featureVectorFromFeatureDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  int v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier featureNames](self, "featureNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier stringFeaturesToReplaceWithUnk](self, "stringFeaturesToReplaceWithUnk");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v11);

          v12 = CFSTR("unk");
          if (!v14)
            continue;
        }
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  __atxlog_handle_anchor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier featureVectorFromFeatureDictionary:].cold.1();

  return v5;
}

- (id)trainingFeatureVectorsFromTrainingData:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingFeatureVectorsFromTrainingData___block_invoke;
  v4[3] = &unk_1E82E5448;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __99__ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier_trainingFeatureVectorsFromTrainingData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "featureVectorFromFeatureDictionary:", a2);
}

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  ATXAnchorModelClassificationResult *v17;
  double v18;
  uint64_t v19;
  ATXAnchorModelClassificationResult *v20;
  void *v21;
  NSObject *v22;
  int v24;
  _DWORD v25[7];

  *(_QWORD *)&v25[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  if (self->_tree)
  {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:](self, "inferenceFeatureDictForAnchorOccurrence:trainingResult:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    __atxlog_handle_anchor();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v24 = 138412290;
        *(_QWORD *)v25 = v9;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Inference features: %@", (uint8_t *)&v24, 0xCu);
      }

      -[ATXGamePlayKitDecisionTree findActionForAnswers:](self->_tree, "findActionForAnswers:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "BOOLValue");
        __atxlog_handle_anchor();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 67109378;
          v25[0] = v14;
          LOWORD(v25[1]) = 2112;
          *(_QWORD *)((char *)&v25[1] + 2) = v16;
          _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "GamePlayKit Decision Tree predicted %{BOOL}d for candidate %@", (uint8_t *)&v24, 0x12u);

        }
        v17 = [ATXAnchorModelClassificationResult alloc];
        v18 = 0.5;
        v19 = v14;
      }
      else
      {
        __atxlog_handle_anchor();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier classifyCandidateForAnchorOccurrence:trainingResult:].cold.1();

        v17 = [ATXAnchorModelClassificationResult alloc];
        v18 = 0.0;
        v19 = 0;
      }
      v20 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:](v17, "initWithShouldPredictCandidate:score:", v19, v18);

    }
    else
    {
      if (v12)
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        *(_QWORD *)v25 = v21;
        _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "GKDecisionTree Predicting NO because inference feature dict was an empty dictionary, likely due to an error. CandidateId: %@", (uint8_t *)&v24, 0xCu);

      }
      v20 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:]([ATXAnchorModelClassificationResult alloc], "initWithShouldPredictCandidate:score:", 0, 0.0);
    }

  }
  else
  {
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier predictWhenNoTreeInitialized](self, "predictWhenNoTreeInitialized");
    v20 = (ATXAnchorModelClassificationResult *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v8);

  return v20;
}

- (id)predictWhenNoTreeInitialized
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  ATXAnchorModelClassificationResult *v13;
  void *v14;
  ATXAnchorModelClassificationResult *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingData](self, "trainingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingFeatureVectorsFromTrainingData:](self, "trainingFeatureVectorsFromTrainingData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier trainingLabelsFromTrainingData:](self, "trainingLabelsFromTrainingData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:labels:](self, "indicesToKeepInTrainingAfterRemovingDuplicateFeatureVectorsWithConflictingLabels:labels:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
  v9 = objc_msgSend(v8, "count");
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == 1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "Tree not initialized but asked to make a prediction. Since this was a pure candidate, we're predicting the only label we have. %@", (uint8_t *)&v17, 0xCu);

    }
    v13 = [ATXAnchorModelClassificationResult alloc];
    objc_msgSend(v8, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:](v13, "initWithShouldPredictCandidate:score:", objc_msgSend(v14, "BOOLValue"), 1.0);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier predictWhenNoTreeInitialized].cold.1(self, v11);

    v15 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:]([ATXAnchorModelClassificationResult alloc], "initWithShouldPredictCandidate:score:", 0, 0.0);
  }

  return v15;
}

- (id)inferenceFeatureDictForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:].cold.4(self, v8);

  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier candidateFeaturesWithAnchorOccurrence:trainingResult:](self, "candidateFeaturesWithAnchorOccurrence:trainingResult:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:].cold.3();

    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier anchorFeaturesWithAnchorOccurrence:](self, "anchorFeaturesWithAnchorOccurrence:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject count](v12, "count");
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:].cold.2();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v12);
      __atxlog_handle_anchor();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier inferenceFeatureDictForAnchorOccurrence:trainingResult:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Anchor features were empty for candidateId: %@, anchor: %@", (uint8_t *)&v22, 0x16u);

      }
      v16 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Candidate features were empty for candidateId: %@, anchor: %@", (uint8_t *)&v22, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

- (id)candidateFeaturesWithAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateType](self, "candidateType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isEqualToString:", CFSTR("action"));

  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "phase1TrainingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "launchHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:](self, "candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:", v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ATXNaivePositiveAnchorModelCandidateClassifier candidateType](self, "candidateType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("app"));

    if (v15)
    {
      objc_msgSend(v6, "phase1TrainingResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "launchHistory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:](self, "candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:", v9, v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateType](self, "candidateType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("mode"));

      if (v17)
      {
        objc_msgSend(v6, "phase1TrainingResult");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "launchHistory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:](self, "candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:", v9, v12);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier candidateType](self, "candidateType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("linkaction"));

        if (!v19)
        {
          v20 = (void *)objc_opt_new();
          goto LABEL_10;
        }
        objc_msgSend(v6, "phase1TrainingResult");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "launchHistory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:](self, "candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:cachedLaunchHistory:", v9, v12);
        v13 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v20 = (void *)v13;

LABEL_10:
  return v20;
}

- (id)candidateFeaturesForActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  id v6;
  id v7;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  storeWrapper = self->_storeWrapper;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol appIntentDuetEventFromCandidateId:date:](storeWrapper, "appIntentDuetEventFromCandidateId:date:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setShouldComputeLaunchHistoryForAppLaunches:", 0);
    objc_msgSend(v11, "setShouldComputeLaunchHistoryForActionKeyLaunches:", 0);
    v12 = 0;
    if (!v7)
      v12 = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier shouldComputeLaunchHistoryCounts](self, "shouldComputeLaunchHistoryCounts", 0);
    objc_msgSend(v11, "setShouldComputeLaunchHistoryForActionUUIDLaunches:", v12);
    objc_msgSend(v11, "featurizeActionEvent:anchorOccurrenceDate:", v10, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      __atxlog_handle_anchor();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory. Filling in the recent history.", buf, 0xCu);

      }
      objc_msgSend(v13, "actionUUIDMetadatas");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActionUUIDLaunchHistory:", v7);

      objc_msgSend(v11, "recentHistoryForActionUUIDWithAppIntentDuetEvent:anchorOccurrenceDate:", v10, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionUUIDMetadatas");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionUUIDLaunchHistory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mergeFrom:", v18);

    }
    objc_msgSend((id)objc_opt_class(), "actionCandidateFeaturesFromActionEvent:actionMetadata:actionOccurred:actionEngaged:", v10, v13, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)candidateFeaturesForAppCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  id v6;
  id v7;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  storeWrapper = self->_storeWrapper;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol appLaunchDuetEventFromCandidateId:date:](storeWrapper, "appLaunchDuetEventFromCandidateId:date:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  if (v7)
    v12 = 0;
  else
    v12 = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier shouldComputeLaunchHistoryCounts](self, "shouldComputeLaunchHistoryCounts");
  objc_msgSend(v11, "setShouldComputeLaunchHistoryForAppLaunches:", v12);
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "setAppLaunchHistory:", v7);
    if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier shouldComputeLaunchHistoryCounts](self, "shouldComputeLaunchHistoryCounts"))
    {
      objc_msgSend(v11, "recentHistoryForAppLaunchDuetEvent:anchorOccurrenceDate:", v10, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appLaunchHistory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mergeFrom:", v16);

    }
    else
    {
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier setRecentAppLaunchCountsFromAppInfoManager:anchorOccurrenceDate:](self, "setRecentAppLaunchCountsFromAppInfoManager:anchorOccurrenceDate:", v15, v6);
    }
  }
  objc_msgSend((id)objc_opt_class(), "appCandidateFeaturesFromAppLaunchEvent:appMetadata:appWasLaunched:appEngaged:", v10, v15, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)candidateFeaturesForModeCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  id v6;
  id v7;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  storeWrapper = self->_storeWrapper;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol modeBiomeEventFromCandidateId:date:](storeWrapper, "modeBiomeEventFromCandidateId:date:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "featurizeModeEvent:anchorOccurrenceDate:", v10, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7)
    {
      objc_msgSend(v12, "setModeHistory:", v7);
      if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier shouldComputeLaunchHistoryCounts](self, "shouldComputeLaunchHistoryCounts"))
      {
        objc_msgSend(v11, "recentHistoryForModeWithModeEvent:anchorOccurrenceDate:", v10, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "modeHistory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mergeFrom:", v14);

      }
    }
    objc_msgSend((id)objc_opt_class(), "modeCandidateFeaturesFromModeEvent:modeMetadata:modeOccurred:modeEngaged:", v10, v13, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)candidateFeaturesForLinkActionCandidateOnAnchorOccurrenceDate:(id)a3 cachedLaunchHistory:(id)a4
{
  id v6;
  id v7;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  storeWrapper = self->_storeWrapper;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol linkActionBiomeEventFromCandidateId:date:](storeWrapper, "linkActionBiomeEventFromCandidateId:date:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "featurizeLinkActionEvent:anchorOccurrenceDate:", v10, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      __atxlog_handle_anchor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v14;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory. Filling in the recent history.", (uint8_t *)&v19, 0xCu);

      }
      objc_msgSend(v12, "setActionHistory:", v7);
      objc_msgSend(v11, "historyForLinkActionChangeEvent:anchorOccurrenceDate:", v10, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionHistory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mergeFrom:", v15);

    }
    objc_msgSend((id)objc_opt_class(), "linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:", v10, v12, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setRecentAppLaunchCountsFromAppInfoManager:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v9;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Featurizing %@, already have cachedLaunchHistory and we don't need to compute the launch history counts. Accessing the last app launch date from ATXAppInfoManager.", (uint8_t *)&v19, 0xCu);

  }
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastLaunchDateForBundleId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -43200.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "earlierDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v13)
  {
    objc_msgSend(v6, "appLaunchHistory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLaunchesInLast24Hours:", 1);

  }
  objc_msgSend(v12, "earlierDate:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 == v14)
  {
    objc_msgSend(v6, "appLaunchHistory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLaunchesInLast12Hours:", 1);

  }
}

- (id)anchorFeaturesWithAnchorOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featurizeAnchorEvent:anchor:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anchorFeaturesForAnchorOccurrence:anchor:anchorMetadata:", v4, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

+ (void)configureKeyedArchiver:(id)a3
{
  +[ATXGamePlayKitDecisionTree configureKeyedArchiver:](ATXGamePlayKitDecisionTree, "configureKeyedArchiver:", a3);
}

+ (void)configureKeyedUnarchiver:(id)a3
{
  +[ATXGamePlayKitDecisionTree configureKeyedUnarchiver:](ATXGamePlayKitDecisionTree, "configureKeyedUnarchiver:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("codingKeyForCandidateId"));

  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateType](self, "candidateType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("codingKeyForCandidateType"));

  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("codingKeyForAnchorInstance"));

  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier treeDescription](self, "treeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("EmptyTree"));

  if ((v8 & 1) == 0)
    objc_msgSend(v10, "encodeObject:forKey:", self->_tree, CFSTR("codingKeyForGKDecisionTree"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXNaivePositiveAnchorModelCandidateClassifier isTrained](self, "isTrained"), CFSTR("codingKeyForDecisionTreeIsTrained"));
  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier treeDescription](self, "treeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("codingKeyForDecisionTreeDescription"));

}

- (ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  objc_class *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v27;
  void *v28;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForCandidateId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("codingKeyForCandidateId"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForCandidateType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v7, CFSTR("codingKeyForCandidateType"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
    {
      v6 = 0;
LABEL_40:

      goto LABEL_41;
    }
    +[ATXAnchor allAnchorClasses](ATXAnchor, "allAnchorClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("codingKeyForAnchorInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_6;
    __atxlog_handle_anchor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.5(v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v12, CFSTR("codingKeyForAnchor"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
    {
      v9 = 0;
LABEL_13:
      v6 = 0;
LABEL_38:

      goto LABEL_39;
    }
    +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enabledAnchors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v12);

    if ((v15 & 1) != 0)
    {
      if (NSClassFromString((NSString *)v12))
      {
        v16 = objc_opt_new();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v9 = v16;
LABEL_6:
          v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("codingKeyForDecisionTreeIsTrained"));
          if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:", v10, CFSTR("codingKeyForDecisionTreeIsTrained"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
          {
            v6 = 0;
LABEL_39:

            goto LABEL_40;
          }
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForDecisionTreeDescription"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v12, CFSTR("codingKeyForDecisionTreeDescription"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
          {
            goto LABEL_13;
          }
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("EmptyTree")) & 1) != 0)
          {
            v27 = 0;
LABEL_24:
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = objc_claimAutoreleasedReturnValue();
            +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "enabledAnchors");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)v18;
            LOBYTE(v18) = objc_msgSend(v20, "containsObject:", v18);

            if ((v18 & 1) != 0)
            {
              +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_opt_new();
              v16 = v27;
              self = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:tree:hyperParameters:dataStoreWrapper:](self, "initWithCandidateId:candidateType:anchor:tree:hyperParameters:dataStoreWrapper:", v5, v7, v9, v27, v21, v22);

              -[ATXNaivePositiveAnchorModelCandidateClassifier setIsTrained:](self, "setIsTrained:", v10);
              -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier setTreeDescription:](self, "setTreeDescription:", v12);
              v6 = self;
              v23 = v28;
            }
            else
            {
              __atxlog_handle_anchor();
              v24 = objc_claimAutoreleasedReturnValue();
              v16 = v27;
              v23 = v28;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.2();

              v6 = 0;
            }

            goto LABEL_37;
          }
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForGKDecisionTree"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (!-[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v16, CFSTR("codingKeyForGKDecisionTree"), v4, CFSTR("com.apple.proactive.GamePlayKitDecisionTreeAnchorModelCandidateClassifier"), -1))
          {
            v27 = v16;
            goto LABEL_24;
          }
LABEL_36:
          v6 = 0;
LABEL_37:

          goto LABEL_38;
        }
        __atxlog_handle_anchor();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.3();

      }
      else
      {
        __atxlog_handle_anchor();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.1();
      }
    }
    else
    {
      __atxlog_handle_anchor();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCoder:].cold.2();
    }
    v9 = 0;
    goto LABEL_36;
  }
  v6 = 0;
LABEL_41:

  return v6;
}

- (void)setTreeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_treeDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeDescription, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_tree, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
}

- (void)trainDecisionTree
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Examples: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)trainingLabelsFromTrainingData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Label Vector: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)featureVectorFromFeatureDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "Feature Vector: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)classifyCandidateForAnchorOccurrence:trainingResult:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "GamePlayKit Decision Tree predicted a label that was not an NSNumber. Returning False to be safe.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)predictWhenNoTreeInitialized
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Tree not initialized but asked to make a prediction. Returning NO for candidate: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Finished generating feature dict GameplayKit inference.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "> done generating anchor features.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)inferenceFeatureDictForAnchorOccurrence:trainingResult:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "> done generating candidate features.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)inferenceFeatureDictForAnchorOccurrence:(void *)a1 trainingResult:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "Generating feature dict for GameplayKit inference of %@...", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "When decoding %@, encountered an unknown/non-existent Anchor Class String.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "When decoding %@, attempted to deserialize object with a non-whitelisted anchor: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCoder:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "When decoding %@, decoded an object that is not a known Anchor type.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(os_log_t)log .cold.5(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = CFSTR("codingKeyForAnchorInstance");
  v3 = 2112;
  v4 = CFSTR("codingKeyForAnchor");
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "When decoding object at %@, the output was nil. Falling back to reading anchor type string from %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
