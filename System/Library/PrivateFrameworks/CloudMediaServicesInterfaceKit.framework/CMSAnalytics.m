@implementation CMSAnalytics

+ (void)sendContentFailureEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

uint64_t __40__CMSAnalytics_sendContentFailureEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encoded");
}

@end
