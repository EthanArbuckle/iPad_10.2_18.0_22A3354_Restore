@implementation NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries

id __NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  FCDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
