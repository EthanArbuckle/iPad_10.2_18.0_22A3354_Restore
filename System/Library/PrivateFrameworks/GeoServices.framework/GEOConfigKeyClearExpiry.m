@implementation GEOConfigKeyClearExpiry

void ___GEOConfigKeyClearExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a2;
  _GEOConfigProxy();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configExpiryForOptions:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clearConfigKeyExpiry:", v4);
}

@end
