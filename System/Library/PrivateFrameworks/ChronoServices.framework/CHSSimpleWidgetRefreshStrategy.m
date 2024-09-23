@implementation CHSSimpleWidgetRefreshStrategy

id __64___CHSSimpleWidgetRefreshStrategy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(const __CFString **)(v2 + 8);
  if (v3)
  {
    v4 = CFSTR("rateLimitIdentifier");
  }
  else
  {
    v3 = CFSTR("default");
    v4 = 0;
  }
  return (id)objc_msgSend(v1, "appendObject:withName:", v3, v4);
}

@end
