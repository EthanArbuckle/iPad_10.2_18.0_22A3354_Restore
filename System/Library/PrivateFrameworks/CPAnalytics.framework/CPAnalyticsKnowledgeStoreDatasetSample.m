@implementation CPAnalyticsKnowledgeStoreDatasetSample

- (CPAnalyticsKnowledgeStoreDatasetSample)initWithIdentifier:(id)a3 andDate:(id)a4 forSubset:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPAnalyticsKnowledgeStoreDatasetSample *v12;
  CPAnalyticsKnowledgeStoreDatasetSample *v13;
  NSString *v14;
  NSString *subset;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsKnowledgeStoreDatasetSample;
  v12 = -[CPAnalyticsKnowledgeStoreDatasetSample init](&v17, sel_init);
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

- (id)metadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[CPAnalyticsKnowledgeStoreDatasetSample subset](self, "subset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10[0] = CFSTR("_DKPhotosMetadataKey.identifier");
    -[CPAnalyticsKnowledgeStoreDatasetSample identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("_DKPhotosMetadataKey.subset");
    v11[0] = v4;
    -[CPAnalyticsKnowledgeStoreDatasetSample subset](self, "subset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("_DKPhotosMetadataKey.identifier");
    -[CPAnalyticsKnowledgeStoreDatasetSample identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
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
