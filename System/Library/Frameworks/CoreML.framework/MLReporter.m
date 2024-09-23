@implementation MLReporter

uint64_t __24__MLReporter_logMetric___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
}

+ (id)reporter
{
  if (+[MLReporter reporter]::onceToken != -1)
    dispatch_once(&+[MLReporter reporter]::onceToken, &__block_literal_global_12913);
  return (id)+[MLReporter reporter]::reporter;
}

- (void)logMetric:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  AnalyticsSendEventLazy();

}

void __22__MLReporter_reporter__block_invoke()
{
  MLReporter *v0;
  void *v1;

  v0 = objc_alloc_init(MLReporter);
  v1 = (void *)+[MLReporter reporter]::reporter;
  +[MLReporter reporter]::reporter = (uint64_t)v0;

}

@end
