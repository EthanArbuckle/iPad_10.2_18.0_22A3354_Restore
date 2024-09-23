@implementation MAPreferencesCopyValue

void ___MAPreferencesCopyValue_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;

  v2 = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), CFSTR("com.apple.MobileAsset"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
