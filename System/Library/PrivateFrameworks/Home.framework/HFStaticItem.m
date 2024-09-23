@implementation HFStaticItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  -[HFStaticItem staticResults](self, "staticResults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    -[HFStaticItem staticResults](self, "staticResults");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithResult:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFStaticItem resultsBlock](self, "resultsBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "futureWithError:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[HFStaticItem resultsBlock](self, "resultsBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flatMap:", &__block_literal_global_12);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_6:
  return v10;
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (NSDictionary)staticResults
{
  return self->_staticResults;
}

id __44__HFStaticItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFStaticItem)initWithResultsBlock:(id)a3
{
  id v4;
  HFStaticItem *v5;
  void *v6;
  id resultsBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFStaticItem;
  v5 = -[HFStaticItem init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    resultsBlock = v5->_resultsBlock;
    v5->_resultsBlock = v6;

  }
  return v5;
}

- (HFStaticItem)initWithResults:(id)a3
{
  id v5;
  HFStaticItem *v6;
  HFStaticItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFStaticItem;
  v6 = -[HFStaticItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_staticResults, a3);

  return v7;
}

+ (id)emptyItem
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithResults:", MEMORY[0x1E0C9AA70]);
}

- (HFStaticItem)init
{
  return -[HFStaticItem initWithResults:](self, "initWithResults:", MEMORY[0x1E0C9AA70]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  -[HFStaticItem staticResults](self, "staticResults", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc((Class)objc_opt_class());
    -[HFStaticItem staticResults](self, "staticResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = objc_msgSend(v6, "initWithResults:", v8);
  }
  else
  {
    -[HFStaticItem resultsBlock](self, "resultsBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStaticItem.m"), 60, CFSTR("HFStaticItem should have either staticResults or a resultsBlock, but it has neither"));
      v12 = 0;
      goto LABEL_6;
    }
    v11 = objc_alloc((Class)objc_opt_class());
    -[HFStaticItem resultsBlock](self, "resultsBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = objc_msgSend(v11, "initWithResultsBlock:", v8);
  }
  v12 = (void *)v9;

LABEL_6:
  objc_msgSend(v12, "copyLatestResultsFromItem:", self);
  return v12;
}

- (void)reset
{
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFStaticItem setResultsBlock:](self, "setResultsBlock:", 0);
    -[HFStaticItem setStaticResults:](self, "setStaticResults:", 0);
  }
}

- (void)setStaticResults:(id)a3
{
  objc_storeStrong((id *)&self->_staticResults, a3);
}

- (void)setResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_staticResults, 0);
}

@end
