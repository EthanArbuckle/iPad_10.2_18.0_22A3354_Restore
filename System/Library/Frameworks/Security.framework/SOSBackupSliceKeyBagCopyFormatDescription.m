@implementation SOSBackupSliceKeyBagCopyFormatDescription

void __SOSBackupSliceKeyBagCopyFormatDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  uint64_t v4;
  const __CFSet *Count;

  v3 = *(__CFString **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  Count = *(const __CFSet **)(v4 + 24);
  if (Count)
    Count = (const __CFSet *)CFSetGetCount(Count);
  CFStringAppendFormat(v3, 0, CFSTR("<SOSBackupSliceKeyBag@%p %ld %@"), v4, Count, a2);
}

@end
