@implementation AXUIElementConvertOutgoingType

void __AXUIElementConvertOutgoingType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  AXUIElementConvertOutgoingType(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

void __AXUIElementConvertOutgoingType_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXUIElementConvertOutgoingType(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

@end
