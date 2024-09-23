@implementation MTImpressionsEventHandler

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTImpressionsEventHandler;
    -[MTImpressionableEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", CFSTR("xpViewableThreshold"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)eventType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTImpressionsEventHandler;
  -[MTEventHandler eventType](&v6, sel_eventType);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("impressions");
  v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTImpressionsEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B82F8;
  v5 = v3;

  return v5;
}

- (id)xpViewableThreshold:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MTImpressionsEventHandler *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpViewableThreshold:", v4);
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
    v11[2] = __49__MTImpressionsEventHandler_xpViewableThreshold___block_invoke;
    v11[3] = &unk_24C7A1658;
    v12 = v4;
    v13 = self;
    objc_msgSend(v9, "computeWithConfigSources:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id __49__MTImpressionsEventHandler_xpViewableThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("xpViewableThreshold"));
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
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("impressions"), CFSTR("viewableThreshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configValueForKeyPath:sources:", v9, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
