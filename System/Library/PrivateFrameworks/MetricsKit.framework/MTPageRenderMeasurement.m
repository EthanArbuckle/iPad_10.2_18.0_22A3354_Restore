@implementation MTPageRenderMeasurement

- (void)mark:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  -[MTPageRenderMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));

}

- (void)mark:(id)a3 date:(id)a4
{
  id v6;

  v6 = a3;
  -[MTPageRenderMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));

}

- (MTPageRenderMeasurement)initWithMeasurementTransformer:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  id v14;
  MTPageRenderMeasurement *v15;
  uint64_t v16;
  NSString *pageId;
  uint64_t v18;
  NSString *pageType;
  uint64_t v20;
  NSString *pageContext;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MTPageRenderMeasurement;
  v15 = -[MTPerfBaseMeasurement initWithMeasurementTransformer:eventData:](&v23, sel_initWithMeasurementTransformer_eventData_, a3, a7);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    pageId = v15->_pageId;
    v15->_pageId = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    pageType = v15->_pageType;
    v15->_pageType = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    pageContext = v15->_pageContext;
    v15->_pageContext = (NSString *)v20;

  }
  return v15;
}

- (void)mark:(id)a3 time:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("launchCorrelationKey"));

}

- (void)setPrimaryDataResponseCached:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("isPrimaryDataResponseCached"));

}

- (void)setAppLaunch:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("isAppLaunch"));

}

- (void)setPreloadStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("preloadStatus"));

}

- (void)setXpSessionDuration:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSessionDuration"));

}

- (void)setXpSamplingForced:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingForced"));

}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingPercentageUsers"));

}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)setPageId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
}

@end
