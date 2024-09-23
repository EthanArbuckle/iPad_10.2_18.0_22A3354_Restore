@implementation MPCPlaybackEngineEventFlattenPayload

void ___MPCPlaybackEngineEventFlattenPayload_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObject:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _NSIsNSDictionary();
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    _MPCPlaybackEngineEventFlattenPayload(v9, v7, v5);
  }
  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

@end
