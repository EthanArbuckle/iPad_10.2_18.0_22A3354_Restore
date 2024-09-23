@implementation AMSPageRenderMetricsPresenter

- (AMSPageRenderMetricsPresenter)initWithBag:(id)a3 metrics:(id)a4
{
  id v6;
  AMSPageRenderMetricsEvent *v7;

  v6 = a3;
  -[AMSPageRenderMetricsPresenter setMetrics:](self, "setMetrics:", a4);
  v7 = objc_alloc_init(AMSPageRenderMetricsEvent);
  -[AMSPageRenderMetricsPresenter setPageRenderEvent:](self, "setPageRenderEvent:", v7);

  -[AMSPageRenderMetricsPresenter setBag:](self, "setBag:", v6);
  return self;
}

- (NSDictionary)dictionaryForPosting
{
  void *v2;
  void *v3;

  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForPosting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)enqueueEvent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[AMSPageRenderMetricsPresenter bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLForKey:", CFSTR("page-render-metrics-enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[AMSPageRenderMetricsPresenter bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsLoggingEvent shouldSampleErrorsWithBag:](AMSMetricsLoggingEvent, "shouldSampleErrorsWithBag:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__AMSPageRenderMetricsPresenter_enqueueEvent__block_invoke;
    v9[3] = &unk_1E253DBD8;
    v9[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v9);

  }
}

void __45__AMSPageRenderMetricsPresenter_enqueueEvent__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageRenderEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEvent:", v2);

}

- (void)endWithActivity:(int64_t)a3 pageMetrics:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResourceRequestEndTime:", v7);
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPageEndTime:", v7);
LABEL_5:

  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("eventType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEventType:", v9);

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pageType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPageType:", v11);

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pageUrl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPageUrl:", v13);

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("placement"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPageId:", v15);

}

- (void)importTimings:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2114;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Importing PageRender timings from JS: %@", buf, 0x20u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forBodyKey:", v16, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)startWithActivity:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResourceRequestStartTime:", v4);
  }
  else
  {
    if (a3)
      return;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPageRequestTime:", v4);
  }

}

- (void)viewDidAppear
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageUserInteractiveTime:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPageRenderMetricsPresenter pageRenderEvent](self, "pageRenderEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageAppearTime:", v3);

}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (AMSPageRenderMetricsEvent)pageRenderEvent
{
  return self->_pageRenderEvent;
}

- (void)setPageRenderEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pageRenderEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRenderEvent, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
