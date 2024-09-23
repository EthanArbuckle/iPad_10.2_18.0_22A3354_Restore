@implementation NLModelImpl

- (NLModelImpl)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{

  return 0;
}

- (NLModelImpl)initWithModelTrainer:(id)a3 error:(id *)a4
{

  return 0;
}

- (id)modelData
{
  return 0;
}

- (NLModelConfiguration)configuration
{
  return 0;
}

- (unint64_t)systemVersion
{
  return 1;
}

- (NSDictionary)labelMap
{
  return 0;
}

- (NSDictionary)vocabularyMap
{
  return 0;
}

- (NSDictionary)documentFrequencyMap
{
  return 0;
}

- (NSData)customEmbeddingData
{
  return 0;
}

- (unint64_t)numberOfTrainingInstances
{
  return 0;
}

- (NSDictionary)trainingInfo
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("NumberOfTrainingInstances");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NLModelImpl numberOfTrainingInstances](self, "numberOfTrainingInstances"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NLGazetteer)gazetteer
{
  return 0;
}

- (NLEmbedding)embedding
{
  return 0;
}

- (NSData)embeddingData
{
  return 0;
}

- (id)predictedLabelForString:(id)a3
{
  return 0;
}

- (id)predictedLabelsForTokens:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)predictedLabelArraysForTokenArrays:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NLModelImpl predictedLabelsForTokens:](self, "predictedLabelsForTokens:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
