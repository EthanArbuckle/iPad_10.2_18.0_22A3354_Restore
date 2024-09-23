@implementation FeatureHashGroup

- (FeatureHashGroup)initWithHash:(id)a3 andIssues:(id)a4
{
  id v6;
  id v7;
  FeatureHashGroup *v8;
  FeatureHashGroup *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FeatureHashGroup;
  v8 = -[FeatureHashGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FeatureHashGroup setAggregateHash:](v8, "setAggregateHash:", v6);
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    -[FeatureHashGroup setIssues:](v9, "setIssues:", v10);

    -[FeatureHashGroup setCount:](v9, "setCount:", 1.0);
    -[FeatureHashGroup issues](v9, "issues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FeatureHashGroup setScreenGroupID:](v9, "setScreenGroupID:", v11);

  }
  return v9;
}

- (void)addHash:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  v18 = a3;
  for (i = 0; i != 768; ++i)
  {
    -[FeatureHashGroup aggregateHash](self, "aggregateHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    objc_msgSend(v18, "values");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v9 + v12;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FeatureHashGroup aggregateHash](self, "aggregateHash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "values");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:atIndexedSubscript:", v14, i);

  }
  -[FeatureHashGroup count](self, "count");
  -[FeatureHashGroup setCount:](self, "setCount:", v17 + 1.0);

}

- (void)setScreenGroupID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[FeatureHashGroup aggregateHash](self, "aggregateHash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hashID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setScreenGroupId:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (double)computeMeanHashDistance:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  unint64_t v25;

  v4 = a3;
  -[FeatureHashGroup count](self, "count");
  v6 = -1.0;
  if (fabs(v5) >= 1.0)
  {
    -[FeatureHashGroup aggregateHash](self, "aggregateHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      v11 = 0.0;
      do
      {
        -[FeatureHashGroup aggregateHash](self, "aggregateHash");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "values");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;
        -[FeatureHashGroup count](self, "count");
        v18 = v16 / v17;

        objc_msgSend(v4, "values");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        v11 = v11 + (v18 - v22) * (v18 - v22);
        ++v10;
        -[FeatureHashGroup aggregateHash](self, "aggregateHash");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "values");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v25 > v10);
    }
    else
    {
      v11 = 0.0;
    }
    v6 = sqrt(v11);
  }

  return v6;
}

- (FeatureHash)aggregateHash
{
  return (FeatureHash *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAggregateHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)issues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIssues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)count
{
  return self->_count;
}

- (void)setCount:(double)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);
  objc_storeStrong((id *)&self->_aggregateHash, 0);
}

@end
