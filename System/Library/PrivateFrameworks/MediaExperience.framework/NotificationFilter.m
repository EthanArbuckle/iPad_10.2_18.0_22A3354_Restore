@implementation NotificationFilter

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke(uint64_t a1)
{
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 64), *(const void **)(a1 + 40)))
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 64), *(const void **)(a1 + 40), *(const void **)(a1 + 48));
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  CFRange v3;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 56);
  v3.length = CFArrayGetCount(v2);
  v3.location = 0;
  if (CFArrayGetFirstIndexOfValue(v2, v3, *(const void **)(a1 + 40)) == -1)
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 56), *(const void **)(a1 + 40));
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_3(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 64), *(const void **)(a1 + 40));
}

void __remoteXPCFigRoutingContext_NotificationFilter_block_invoke_4(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFRange v4;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 56);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 56), FirstIndexOfValue);
}

@end
