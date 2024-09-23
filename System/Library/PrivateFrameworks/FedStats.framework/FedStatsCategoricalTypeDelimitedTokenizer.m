@implementation FedStatsCategoricalTypeDelimitedTokenizer

- (FedStatsCategoricalTypeDelimitedTokenizer)initWithDelimiter:(id)a3
{
  id v5;
  FedStatsCategoricalTypeDelimitedTokenizer *v6;
  FedStatsCategoricalTypeDelimitedTokenizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalTypeDelimitedTokenizer;
  v6 = -[FedStatsCategoricalTypeDelimitedTokenizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delimiter, a3);

  return v7;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6;
  __CFString *v7;
  void *v8;

  objc_msgSend(a3, "objectForKey:", CFSTR("delimiter"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR(" ");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithDelimiter:", v7);
  }
  else if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)tokenize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsCategoricalTypeDelimitedTokenizer delimiter](self, "delimiter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

- (NSString)delimiter
{
  return self->_delimiter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delimiter, 0);
}

@end
