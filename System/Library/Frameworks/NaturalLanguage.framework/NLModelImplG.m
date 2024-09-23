@implementation NLModelImplG

- (NLModelImplG)initWithGazetteer:(id)a3
{
  id v5;
  NLModelImplG *v6;
  NLModelImplG *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLModelImplG;
  v6 = -[NLModelImplG init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gazetteer, a3);

  return v7;
}

- (NLModelImplG)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v11;
  NLGazetteer *v12;
  NLModelImplG *v13;
  NLModelImplG *v14;

  v11 = a3;
  v12 = -[NLGazetteer initWithData:error:]([NLGazetteer alloc], "initWithData:error:", v11, a10);

  if (v12)
  {
    self = -[NLModelImplG initWithGazetteer:](self, "initWithGazetteer:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (NLModelImplG)initWithModelTrainer:(id)a3 error:(id *)a4
{

  return 0;
}

- (unint64_t)systemVersion
{
  return 2;
}

- (id)gazetteer
{
  return self->_gazetteer;
}

- (id)modelData
{
  return -[NLGazetteer data](self->_gazetteer, "data");
}

- (id)predictedLabelForString:(id)a3
{
  return -[NLGazetteer labelForString:](self->_gazetteer, "labelForString:", a3);
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
  -[NLModelImplG predictedLabelForString:](self, "predictedLabelForString:", v5);
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
  objc_storeStrong((id *)&self->_gazetteer, 0);
}

@end
