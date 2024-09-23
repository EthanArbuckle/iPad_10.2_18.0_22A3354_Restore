@implementation ICURLAggregatedPerformanceMetrics(MPCPlaybackEngineEventPayload)

- (id)mpc_jsonValue
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("urlMetrics");
  objc_msgSend(a1, "urlMetrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msv_map:", &__block_literal_global_252);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("urlMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEC8A28]);
  objc_msgSend(v3, "msv_map:", &__block_literal_global_249);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURLMetrics:", v5);

  return v6;
}

@end
