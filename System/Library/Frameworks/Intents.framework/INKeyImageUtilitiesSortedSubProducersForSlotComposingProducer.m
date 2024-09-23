@implementation INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer

uint64_t __INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "valueForSlotComposer:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForSlotComposer:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "_compareSubProducerOne:subProducerTwo:", v7, v8);
  return v9;
}

uint64_t __INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForSlotComposer:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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

@end
