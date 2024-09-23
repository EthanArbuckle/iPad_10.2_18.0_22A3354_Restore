@implementation MPCPlaybackEngineEventPayloadFromPayloadJSON

void __MPCPlaybackEngineEventPayloadFromPayloadJSON_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  _coercePayloadFromJSONValue(a3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

@end
