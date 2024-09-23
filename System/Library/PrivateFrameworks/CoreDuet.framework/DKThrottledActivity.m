@implementation DKThrottledActivity

void __40___DKThrottledActivity_standardInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithStore:namespace:", v4, CFSTR("_DKThrottledActivity standardInstance"));
  v3 = (void *)standardInstance_standardInstance;
  standardInstance_standardInstance = v2;

}

void __41___DKThrottledActivity_activityThrottler__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)activityThrottler_sharedInstances;
  activityThrottler_sharedInstances = v0;

}

void __95___DKThrottledActivity_performNoMoreOftenInMinutesThan_name_queue_activityBlock_throttleBlock___block_invoke(uint64_t a1)
{
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 56), *(void **)(a1 + 64), *(double *)(a1 + 72));
}

@end
