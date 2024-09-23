@implementation MPCPlaybackEngineEventPayloadJSONFromPayload

void __MPCPlaybackEngineEventPayloadJSONFromPayload_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  _coerceJSONValueFromValue(a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

@end
