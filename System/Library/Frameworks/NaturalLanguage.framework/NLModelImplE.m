@implementation NLModelImplE

- (NLModelImplE)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v12;
  NLEmbedding *v13;
  NLModelImplE *v14;
  NLModelImplE *v15;
  objc_super v17;

  v12 = a3;
  v13 = -[NLEmbedding initWithData:error:]([NLEmbedding alloc], "initWithData:error:", v12, a10);
  if (v13
    && (v17.receiver = self,
        v17.super_class = (Class)NLModelImplE,
        v14 = -[NLModelImplE init](&v17, sel_init),
        (self = v14) != 0))
  {
    objc_storeStrong((id *)&v14->_embedding, v13);
    objc_storeStrong((id *)&self->_embeddingData, a3);
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NLModelImplE)initWithModelTrainer:(id)a3 error:(id *)a4
{

  return 0;
}

- (unint64_t)systemVersion
{
  return 2;
}

- (id)embedding
{
  return self->_embedding;
}

- (id)embeddingData
{
  return self->_embeddingData;
}

- (id)modelData
{
  return self->_embeddingData;
}

- (id)predictedLabelForString:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  void *v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NLEmbedding vectorForString:](self->_embedding, "vectorForString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((v9 & 1) == 0)
            objc_msgSend(v4, "appendString:", CFSTR(","));
          objc_msgSend(v11, "floatValue");
          objc_msgSend(v4, "appendFormat:", CFSTR("%f"), v12);
          v9 = 0;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v9 = 0;
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  -[NLModelImplE predictedLabelForString:](self, "predictedLabelForString:", v5);
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
  objc_storeStrong((id *)&self->_embeddingData, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
