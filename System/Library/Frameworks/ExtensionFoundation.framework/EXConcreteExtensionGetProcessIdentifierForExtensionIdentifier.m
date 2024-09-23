@implementation EXConcreteExtensionGetProcessIdentifierForExtensionIdentifier

const void *__EXConcreteExtensionGetProcessIdentifierForExtensionIdentifier_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const void *result;

  result = CFDictionaryGetValue(theDict, *(const void **)(a1 + 32));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result;
  return result;
}

@end
