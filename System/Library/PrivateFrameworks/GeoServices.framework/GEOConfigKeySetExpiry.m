@implementation GEOConfigKeySetExpiry

void ___GEOConfigKeySetExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  _GEOConfigProxy();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configExpiryForOptions:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setConfigKeyExpiry:date:osVersion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
