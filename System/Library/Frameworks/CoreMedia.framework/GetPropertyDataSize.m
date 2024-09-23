@implementation GetPropertyDataSize

CFIndex __brokeredPlugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __endpointCentricPlugin_GetPropertyDataSize_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 72));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 4 * result;
  return result;
}

@end
