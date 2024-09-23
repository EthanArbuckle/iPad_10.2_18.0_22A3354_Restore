@implementation HFItemUpdateOutcome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

- (HFItemUpdateOutcome)init
{
  void *v3;
  HFItemUpdateOutcome *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFItemUpdateOutcome initWithResults:](self, "initWithResults:", v3);

  return v4;
}

+ (id)outcomeWithResults:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResults:", v3);

  return v4;
}

- (HFItemUpdateOutcome)initWithResults:(id)a3
{
  return -[HFItemUpdateOutcome initWithResults:type:](self, "initWithResults:type:", a3, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  HFMutableItemUpdateOutcome *v6;

  v4 = [HFMutableItemUpdateOutcome alloc];
  -[HFItemUpdateOutcome results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFMutableItemUpdateOutcome initWithResults:type:](v4, "initWithResults:type:", v5, -[HFItemUpdateOutcome outcomeType](self, "outcomeType"));

  return v6;
}

- (unint64_t)outcomeType
{
  return self->_outcomeType;
}

- (HFItemUpdateOutcome)initWithResults:(id)a3 type:(unint64_t)a4
{
  id v8;
  HFItemUpdateOutcome *v9;
  HFItemUpdateOutcome *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemUpdateOutcome.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemUpdateOutcome.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[results isKindOfClass:[NSDictionary class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HFItemUpdateOutcome;
  v9 = -[HFItemUpdateOutcome init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_results, a3);
    v10->_outcomeType = a4;
  }

  return v10;
}

- (NSDictionary)results
{
  return self->_results;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemUpdateOutcome results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setOutcomeType:(unint64_t)a3
{
  self->_outcomeType = a3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFItemUpdateOutcome results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HFItemUpdateOutcome *v4;
  HFItemUpdateOutcome *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  uint64_t v12;

  v4 = (HFItemUpdateOutcome *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFItemUpdateOutcome results](v5, "results");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemUpdateOutcome results](self, "results");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFItemUpdateOutcome results](v5, "results");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFItemUpdateOutcome results](self, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

      }
      v12 = -[HFItemUpdateOutcome outcomeType](v5, "outcomeType");
      if (v12 == -[HFItemUpdateOutcome outcomeType](self, "outcomeType"))
        v11 = v10;
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSArray)allKeys
{
  void *v2;
  void *v3;

  -[HFItemUpdateOutcome results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[HFItemUpdateOutcome outcomeType](self, "outcomeType");
  v4 = CFSTR("Not set");
  if (v3 == 1)
    v4 = CFSTR("No new data");
  if (v3 == 2)
    v5 = CFSTR("New data");
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[HFItemUpdateOutcome results](self, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p> type: %@, results: %@>"), v7, self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
