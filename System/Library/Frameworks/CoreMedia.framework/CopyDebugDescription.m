@implementation CopyDebugDescription

CFIndex __brokeredPlugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFIndex __plugin_CopyDebugDescription_block_invoke_2(_QWORD *a1)
{
  CFIndex result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = CFArrayGetCount(*(CFArrayRef *)(a1[6] + 72));
  result = CFArrayGetCount(*(CFArrayRef *)(a1[6] + 80));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

CFDictionaryRef __endpointCentricPlugin_CopyDebugDescription_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFAllocator *v3;
  CFDictionaryRef result;

  v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreateCopy(v2, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 56) + 80));
  v3 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
  result = CFDictionaryCreateCopy(v3, *(CFDictionaryRef *)(*(_QWORD *)(a1 + 56) + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
