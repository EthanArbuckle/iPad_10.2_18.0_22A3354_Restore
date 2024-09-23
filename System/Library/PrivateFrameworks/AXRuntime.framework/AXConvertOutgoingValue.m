@implementation AXConvertOutgoingValue

CFTypeRef __AXConvertOutgoingValue_block_invoke(uint64_t a1, void *a2)
{
  const void *v2;

  v2 = (const void *)_AXCreateAXUIElementWithElement(a2);
  return CFAutorelease(v2);
}

void __AXConvertOutgoingValue_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  AXConvertOutgoingValue(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

void __AXConvertOutgoingValue_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  AXConvertOutgoingValue(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

@end
