@implementation MTPageRenderEventHandler

- (id)metricsDataWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTCallerSuppliedFields *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[MTCallerSuppliedFields initWithPageId:pageType:pageContext:eventData:]([MTCallerSuppliedFields alloc], "initWithPageId:pageType:pageContext:eventData:", v13, v12, v11, v10);

  -[MTEventHandler metricsDataWithCallerSuppliedFields:](self, "metricsDataWithCallerSuppliedFields:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[25];

  v10[24] = *MEMORY[0x24BDAC8D0];
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
    v9.super_class = (Class)MTPageRenderEventHandler;
    -[MTEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("pageRequestTime");
    v10[1] = CFSTR("interstitialPageAppearTime");
    v10[2] = CFSTR("pageAppearTime");
    v10[3] = CFSTR("pageUserInteractiveTime");
    v10[4] = CFSTR("pageEndTime");
    v10[5] = CFSTR("primaryDataRequestStartTime");
    v10[6] = CFSTR("primaryDataResponseStartTime");
    v10[7] = CFSTR("primaryDataResponseEndTime");
    v10[8] = CFSTR("primaryDataParseStartTime");
    v10[9] = CFSTR("primaryDataParseEndTime");
    v10[10] = CFSTR("pageInterruptTime");
    v10[11] = CFSTR("modelConstructionStartTime");
    v10[12] = CFSTR("modelConstructionEndTime");
    v10[13] = CFSTR("modelRenderStartTime");
    v10[14] = CFSTR("modelRenderEndTime");
    v10[15] = CFSTR("resourceRequestStartTime");
    v10[16] = CFSTR("resourceRequestEndTime");
    v10[17] = CFSTR("onScreenResourcesAppearEndTime");
    v10[18] = CFSTR("isAppLaunch");
    v10[19] = CFSTR("isPrimaryDataResponseCached");
    v10[20] = CFSTR("launchCorrelationKey");
    v10[21] = CFSTR("preloadStatus");
    v10[22] = CFSTR("xpSessionDuration");
    v10[23] = CFSTR("xpSamplingPercentageUsers");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 24);
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
  v6.super_class = (Class)MTPageRenderEventHandler;
  -[MTEventHandler eventType](&v6, sel_eventType);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("pageRender");
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
  v7.super_class = (Class)MTPageRenderEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B8298;
  v5 = v3;

  return v5;
}

- (id)xpSessionDuration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpSessionDuration:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpSessionDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __46__MTPageRenderEventHandler_xpSessionDuration___block_invoke;
      v14[3] = &unk_24C7A0330;
      v14[4] = self;
      objc_msgSend(v12, "computeWithConfigSources:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

id __46__MTPageRenderEventHandler_xpSessionDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("performance.sessionDurationPageRender"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)xpSamplingPercentageUsers:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpSamplingPercentageUsers:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpSamplingPercentageUsers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __54__MTPageRenderEventHandler_xpSamplingPercentageUsers___block_invoke;
      v14[3] = &unk_24C7A0330;
      v14[4] = self;
      objc_msgSend(v12, "computeWithConfigSources:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

id __54__MTPageRenderEventHandler_xpSamplingPercentageUsers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("performance.samplingPercentageUsersPageRender"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didCreateMetricsData:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTPageRenderEventHandler;
  v3 = a3;
  -[MTEventHandler didCreateMetricsData:](&v4, sel_didCreateMetricsData_, v3);
  objc_msgSend(v3, "setSamplingEnabled:", 1, v4.receiver, v4.super_class);

}

- (id)metricsDataWithPerfMeasurement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "pageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPageRenderEventHandler metricsDataWithPageId:pageType:pageContext:eventData:](self, "metricsDataWithPageId:pageType:pageContext:eventData:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addFields:", v10, 0);
  return v9;
}

@end
