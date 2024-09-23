@implementation CopyDebugDescription

void __carEndpoint_CopyDebugDescription_block_invoke(_QWORD *a1)
{
  const void *v2;
  const __CFAllocator *v3;
  size_t v4;

  CFStringAppendFormat(*(CFMutableStringRef *)(*(_QWORD *)(a1[4] + 8) + 24), 0, CFSTR("<APEndpointCarPlay %p>\n"), a1[6]);
  v2 = (const void *)a1[6];
  v3 = CFGetAllocator(v2);
  carEndpoint_copyShowInfoDictionary((uint64_t)v2, v3, (__CFDictionary **)(*(_QWORD *)(a1[5] + 8) + 24));
  ASPrintF();
  v4 = strlen(0);
  if (v4 && *(_BYTE *)(v4 - 1) == 10)
    *(_BYTE *)(v4 - 1) = 0;
  CFStringAppendFormat(*(CFMutableStringRef *)(*(_QWORD *)(a1[4] + 8) + 24), 0, CFSTR("%s"), 0);
  free(0);
}

@end
