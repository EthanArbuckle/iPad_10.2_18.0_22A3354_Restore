@implementation CNObservableResultEvent

BOOL __36___CNObservableResultEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", v2, v3);

  return v4;
}

unint64_t __32___CNObservableResultEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

@end
