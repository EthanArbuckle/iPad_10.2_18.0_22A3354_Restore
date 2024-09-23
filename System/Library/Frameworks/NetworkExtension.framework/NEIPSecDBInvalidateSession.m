@implementation NEIPSecDBInvalidateSession

void __NEIPSecDBInvalidateSession_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  intptr_t v7;
  const __CFArray *v8;
  CFIndex FirstIndexOfValue;
  CFRange v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (!v3)
    goto LABEL_10;
  do
  {
    v4 = *(_QWORD **)v3;
    v5 = *((_QWORD *)v3 + 3);
    v6 = *(_QWORD **)v3;
    if (!v5 || (v7 = dispatch_source_testcancel(*((dispatch_source_t *)v3 + 3)), v6 = v4, v7))
    {
      if (!v6)
        goto LABEL_6;
LABEL_5:
      v6[1] = *((_QWORD *)v3 + 1);
      goto LABEL_6;
    }
    dispatch_source_cancel(v5);
    v6 = *(_QWORD **)v3;
    if (*(_QWORD *)v3)
      goto LABEL_5;
LABEL_6:
    **((_QWORD **)v3 + 1) = v6;
    free(v3);
    v3 = v4;
  }
  while (v4);
  v2 = *(_QWORD *)(a1 + 32);
LABEL_10:
  NEPFKeyClose(*(NSObject **)(v2 + 64));
  v8 = (const __CFArray *)g_IPSecDBSessions;
  v10.length = CFArrayGetCount((CFArrayRef)g_IPSecDBSessions);
  v10.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v8, v10, *(const void **)(a1 + 32));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)g_IPSecDBSessions, FirstIndexOfValue);
}

@end
