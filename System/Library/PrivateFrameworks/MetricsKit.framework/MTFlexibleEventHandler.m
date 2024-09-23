@implementation MTFlexibleEventHandler

- (id)metricsDataWithEventType:(id)a3 eventData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = CFSTR("eventType");
  v13[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEventHandler metricsDataWithFields:](self, "metricsDataWithFields:", v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)eventTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTObject metricsKit](self, "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventTime:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

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
    v9.super_class = (Class)MTFlexibleEventHandler;
    -[MTEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("eventTime");
    v10[1] = CFSTR("eventType");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)mtIncludeBaseFields
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mtIncludeBaseFields");

  return v6;
}

@end
