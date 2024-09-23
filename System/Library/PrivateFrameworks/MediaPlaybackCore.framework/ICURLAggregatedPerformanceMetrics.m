@implementation ICURLAggregatedPerformanceMetrics

uint64_t __81__ICURLAggregatedPerformanceMetrics_MPCPlaybackEngineEventPayload__mpc_jsonValue__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

id __94__ICURLAggregatedPerformanceMetrics_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC8A40];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDictionaryRepresentation:", v3);

  return v4;
}

@end
