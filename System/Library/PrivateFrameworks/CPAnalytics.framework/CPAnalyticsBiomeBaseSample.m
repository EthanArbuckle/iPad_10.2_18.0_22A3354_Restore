@implementation CPAnalyticsBiomeBaseSample

- (CPAnalyticsBiomeBaseSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPAnalyticsBiomeBaseSample *v12;
  CPAnalyticsBiomeBaseSample *v13;
  NSString *v14;
  NSString *subset;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsBiomeBaseSample;
  v12 = -[CPAnalyticsBiomeBaseSample init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (NSString *)v11;
LABEL_6:
      subset = v13->_subset;
      v13->_subset = v14;

      goto LABEL_7;
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v11);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)subset
{
  return self->_subset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subset, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
