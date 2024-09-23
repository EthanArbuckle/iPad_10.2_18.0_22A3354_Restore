@implementation ATXCandidateRelevanceLogisticRegressionModel

- (ATXCandidateRelevanceLogisticRegressionModel)initWithModel:(id)a3
{
  id v5;
  ATXCandidateRelevanceLogisticRegressionModel *v6;
  ATXCandidateRelevanceLogisticRegressionModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceLogisticRegressionModel;
  v6 = -[ATXCandidateRelevanceLogisticRegressionModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (float)predictForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;

  objc_msgSend(a5, "sparseFeatureVectorForContext:candidate:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLLogisticRegressionModel predict:](self->_model, "predict:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (id)featureContributionsDuringInferenceDescriptionForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[ATXCandidateRelevanceLogisticRegressionModel featureContributionsDuringInferenceForContext:candidate:featurizationManager:](self, "featureContributionsDuringInferenceForContext:candidate:featurizationManager:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keysSortedByValueUsingComparator:", &__block_literal_global_173);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        if (v15 >= 0.0)
          objc_msgSend(v7, "appendString:", CFSTR(" "));
        objc_msgSend(v14, "floatValue");
        objc_msgSend(v7, "appendFormat:", CFSTR("%f for %@\n"), v16, v13, (_QWORD)v18);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

uint64_t __136__ATXCandidateRelevanceLogisticRegressionModel_featureContributionsDuringInferenceDescriptionForContext_candidate_featurizationManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)featureContributionsDuringInferenceForContext:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = (id)objc_opt_new();
  v11 = objc_alloc(MEMORY[0x1E0D81020]);
  v35 = v9;
  v36 = v8;
  objc_msgSend(v10, "featuresForContext:candidate:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v11, "initWithNumbers:", v12);

  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "asMutableDenseVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = v10;
  objc_msgSend(v10, "featurizers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v15 = 0;
  if (v39)
  {
    v38 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "featureValueNames");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v41 = v17;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v18)
        {
          v19 = v18;
          v40 = i;
          v20 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              v22 = v14;
              if (*(_QWORD *)v45 != v20)
                objc_enumerationMutation(v41);
              v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              v24 = (void *)MEMORY[0x1E0CB3940];
              v25 = (objc_class *)objc_opt_class();
              NSStringFromClass(v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (%@)"), v26, v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v22;
              objc_msgSend(v22, "valueAt:", v15 + j);
              v29 = v28;
              objc_msgSend(v43, "valueAt:", v15 + j);
              if ((float)(v29 * v30) != 0.0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v31, v27);

              }
            }
            v19 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            v15 += j;
          }
          while (v19);
          i = v40;
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v39);
  }

  if (v15 < objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "valueAt:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v32, CFSTR("Bias"));

  }
  return v42;
}

- (unint64_t)modelType
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Model Type: PMLLogisticRegressionModel \n"));
  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("# Model Weights: %d\n"), objc_msgSend(v4, "length"));

  objc_msgSend(v3, "appendFormat:", CFSTR("# Non-Zero Model Weights: %lu"), -[ATXCandidateRelevanceLogisticRegressionModel numberOfNonZeroModelWeights](self, "numberOfNonZeroModelWeights"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (unint64_t)numberOfModelWeights
{
  void *v2;
  unint64_t v3;

  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "length");

  return v3;
}

- (unint64_t)numberOfNonZeroModelWeights
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  uint64_t v10;
  void *v11;
  int v12;

  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "values");

  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 < 1)
    return 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = *(float *)(v4 + 4 * v7);
    v10 = v9 > 0.0 || v9 < 0.0;
    v8 += v10;
    ++v7;
    -[PMLLogisticRegressionModel weights](self->_model, "weights");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

  }
  while (v7 < v12);
  return v8;
}

- (id)featureImportancesForFeaturizationManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
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

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = (id)objc_opt_new();
  -[PMLLogisticRegressionModel weights](self->_model, "weights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asMutableDenseVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v4;
  objc_msgSend(v4, "featurizers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v7 = 0;
  if (v25)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "featureValueNames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v27 = v9;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v10)
        {
          v11 = v10;
          v26 = i;
          v12 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v27);
              v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              v15 = (void *)MEMORY[0x1E0CB3940];
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (%@)"), v17, v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "valueAt:", v7 + j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, v18);

            }
            v11 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v7 += j;
          }
          while (v11);
          i = v26;
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }

  if (v7 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "valueAt:", v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("Bias"));

  }
  return v28;
}

- (id)featureImportanceDescriptionForFeaturizationManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ATXCandidateRelevanceLogisticRegressionModel featureImportancesForFeaturizationManager:](self, "featureImportancesForFeaturizationManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_44_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
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
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        if (v13 != 0.0)
        {
          objc_msgSend(v12, "floatValue");
          if (v14 >= 0.0)
            objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v12, "floatValue");
          objc_msgSend(v5, "appendFormat:", CFSTR("%f * %@\n"), v15, v11, (_QWORD)v17);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

uint64_t __100__ATXCandidateRelevanceLogisticRegressionModel_featureImportanceDescriptionForFeaturizationManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidateRelevanceLogisticRegressionModel *v4;
  ATXCandidateRelevanceLogisticRegressionModel *v5;
  BOOL v6;

  v4 = (ATXCandidateRelevanceLogisticRegressionModel *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidateRelevanceLogisticRegressionModel isEqualToATXCandidateRelevanceLogisticRegressionModel:](self, "isEqualToATXCandidateRelevanceLogisticRegressionModel:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModel:(id)a3
{
  PMLLogisticRegressionModel *v4;
  PMLLogisticRegressionModel *v5;
  char v6;

  v4 = self->_model;
  v5 = v4;
  if (v4 == *((PMLLogisticRegressionModel **)a3 + 1))
    v6 = 1;
  else
    v6 = -[PMLLogisticRegressionModel isEqual:](v4, "isEqual:");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  PMLBuildChunkFile();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("logisticRegressionModelData"));

}

- (ATXCandidateRelevanceLogisticRegressionModel)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXCandidateRelevanceLogisticRegressionModel *v10;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_relevance_model();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("logisticRegressionModelData"), v5, 1, CFSTR("com.apple.duetexpertd.ATXCandidateRelevanceLogisticRegressionModel"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    PMLReadChunkData();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[ATXCandidateRelevanceLogisticRegressionModel initWithModel:](self, "initWithModel:", v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PMLLogisticRegressionModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
