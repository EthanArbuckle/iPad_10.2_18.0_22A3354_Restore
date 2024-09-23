@implementation SOSCircleForEachRetiredPeer

const __CFDictionary *__SOSCircleForEachRetiredPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *result;

  if (!a2)
    return 0;
  result = *(const __CFDictionary **)(a2 + 16);
  if (result)
    return (const __CFDictionary *)(CFDictionaryGetValue(result, CFSTR("RetirementDate")) != 0);
  return result;
}

@end
