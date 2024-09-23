@implementation FHNaturalLanguageClassificationModel

- (FHNaturalLanguageClassificationModel)initWithModelURL:(id)a3
{
  FHNaturalLanguageClassificationModel *v3;
  FHNaturalLanguageClassificationModel *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NLModel *nlModel;
  NSObject *v9;
  void *v10;
  NLModel *v11;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)FHNaturalLanguageClassificationModel;
  v3 = -[FHModel initWithModelURL:](&v14, sel_initWithModelURL_, a3);
  v4 = v3;
  if (v3)
  {
    -[FHModel mlModel](v3, "mlModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDDFD60], "modelWithMLModel:error:", v5, &v13);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v13;
      nlModel = v4->_nlModel;
      v4->_nlModel = (NLModel *)v6;

      if (v7)
      {
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "localizedDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_23B4A2000, v9, OS_LOG_TYPE_ERROR, "Failed to create natural language model, error: %@", buf, 0xCu);

        }
        v11 = v4->_nlModel;
        v4->_nlModel = 0;

      }
    }

  }
  return v4;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  NLModel *nlModel;
  id v5;

  nlModel = self->_nlModel;
  if (nlModel)
  {
    -[NLModel predictedLabelHypothesesForString:maximumCount:](nlModel, "predictedLabelHypothesesForString:maximumCount:", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  return v5;
}

- (NLModel)nlModel
{
  return self->_nlModel;
}

- (void)setNlModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlModel, 0);
}

@end
