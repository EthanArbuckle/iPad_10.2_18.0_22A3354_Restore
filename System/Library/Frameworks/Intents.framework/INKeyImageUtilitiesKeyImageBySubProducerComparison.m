@implementation INKeyImageUtilitiesKeyImageBySubProducerComparison

uint64_t __INKeyImageUtilitiesKeyImageBySubProducerComparison_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE038E40))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = objc_msgSend(*(id *)(a1 + 32), "_isValidSubProducer:", v3);
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __INKeyImageUtilitiesKeyImageBySubProducerComparison_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareSubProducerOne:subProducerTwo:", a2, a3);
}

@end
