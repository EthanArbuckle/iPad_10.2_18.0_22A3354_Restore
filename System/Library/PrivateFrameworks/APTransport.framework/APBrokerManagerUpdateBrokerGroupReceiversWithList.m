@implementation APBrokerManagerUpdateBrokerGroupReceiversWithList

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke(uint64_t a1, void *key, void *value)
{
  const __CFDictionary *v6;

  v6 = *(const __CFDictionary **)(a1 + 32);
  if (!v6 || !CFDictionaryContainsKey(v6, key))
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, value);
}

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 32), a2);
  _APBrokerManagerFireBrokeredReceiverEvent(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184));
}

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
  int v6;
  uint64_t v7;

  v6 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), a2);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
  v7 = 176;
  if (!v6)
    v7 = 168;
  _APBrokerManagerFireBrokeredReceiverEvent(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + v7));
}

@end
