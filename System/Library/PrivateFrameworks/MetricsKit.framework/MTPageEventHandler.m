@implementation MTPageEventHandler

- (NSMutableArray)trackedPageHistory
{
  NSMutableArray *trackedPageHistory;
  NSMutableArray *v4;
  NSMutableArray *v5;

  trackedPageHistory = self->_trackedPageHistory;
  if (!trackedPageHistory)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_trackedPageHistory;
    self->_trackedPageHistory = v4;

    trackedPageHistory = self->_trackedPageHistory;
  }
  return trackedPageHistory;
}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
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
    v9.super_class = (Class)MTPageEventHandler;
    -[MTEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("extRefUrl");
    v10[1] = CFSTR("refApp");
    v10[2] = CFSTR("pageHistory");
    v10[3] = CFSTR("refUrl");
    v10[4] = CFSTR("searchFilters");
    v10[5] = CFSTR("searchTerm");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)eventType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPageEventHandler;
  -[MTEventHandler eventType](&v6, sel_eventType);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("page");
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
  v7.super_class = (Class)MTPageEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B81F0;
  v5 = v3;

  return v5;
}

- (id)pageHistory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  MTPageEventHandler *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (MTPageEventHandler *)objc_claimAutoreleasedReturnValue();
    -[MTPageEventHandler pageHistory:](v7, "pageHistory:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageHistory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[MTPageEventHandler trackedPageHistory](v7, "trackedPageHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "copy");

    objc_sync_exit(v7);
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageHistory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (void)updatePageHistoryWithPage:(id)a3
{
  id v4;
  MTPageEventHandler *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[MTPageEventHandler trackedPageHistory](v5, "trackedPageHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 >= 5)
    {
      -[MTPageEventHandler trackedPageHistory](v5, "trackedPageHistory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

    }
    -[MTPageEventHandler trackedPageHistory](v5, "trackedPageHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_sync_exit(v5);
    v4 = v10;
  }

}

- (void)didCreateMetricsData:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__MTPageEventHandler_didCreateMetricsData___block_invoke;
  v5[3] = &unk_24C7A0308;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "addPostProcessingBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __43__MTPageEventHandler_didCreateMetricsData___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("page"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "updatePageHistoryWithPage:", v4);
}

- (void)setTrackedPageHistory:(id)a3
{
  objc_storeStrong((id *)&self->_trackedPageHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPageHistory, 0);
}

@end
