@implementation MTStandardEventHandler

- (id)metricsDataWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTCallerSuppliedFields *v14;
  void *v15;
  _QWORD v17[5];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[MTCallerSuppliedFields initWithPageId:pageType:pageContext:eventData:]([MTCallerSuppliedFields alloc], "initWithPageId:pageType:pageContext:eventData:", v13, v12, v11, v10);

  -[MTEventHandler metricsDataWithCallerSuppliedFields:](self, "metricsDataWithCallerSuppliedFields:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__MTStandardEventHandler_metricsDataWithPageId_pageType_pageContext_eventData___block_invoke;
  v17[3] = &unk_24C7A0880;
  v17[4] = self;
  objc_msgSend(v15, "addPostProcessingBlock:", v17);

  return v15;
}

uint64_t __79__MTStandardEventHandler_metricsDataWithPageId_pageType_pageContext_eventData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "validatePageFieldValueWithMetricsData:", a2);
}

- (void)validatePageFieldValueWithMetricsData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  -[MTObject metricsKit](self, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  v9 = v19;
  if (v19)
  {
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("page"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v19;
      if (!v10)
      {
        v17 = MTConfigurationError(101, CFSTR("No data provided to MTBaseEventDataProvider page method"), v11, v12, v13, v14, v15, v16, v18);
        v9 = v19;
      }
    }
  }

}

@end
