@implementation MTImpressionableEventHandler

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTImpressionableEventHandler;
    -[MTEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("impressions");
    v10[1] = CFSTR("xpViewablePercentage");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)impressions:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "impressions:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("impressions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)xpViewablePercentage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MTImpressionableEventHandler *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpViewablePercentage:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTObject metricsKit](self, "metricsKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__MTImpressionableEventHandler_xpViewablePercentage___block_invoke;
    v11[3] = &unk_24C7A1658;
    v12 = v4;
    v13 = self;
    objc_msgSend(v9, "computeWithConfigSources:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id __53__MTImpressionableEventHandler_xpViewablePercentage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("xpViewablePercentage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "metricsKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("impressions"), CFSTR("viewablePercentage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configValueForKeyPath:sources:", v9, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
