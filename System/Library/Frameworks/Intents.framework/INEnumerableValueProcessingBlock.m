@implementation INEnumerableValueProcessingBlock

uint64_t ___INEnumerableValueProcessingBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0389A8))
    v5 = objc_msgSend(v4, "_intents_enumerateObjectsOfClass:withBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

@end
