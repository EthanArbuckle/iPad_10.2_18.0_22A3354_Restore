@implementation CFDictionaryCopyCompactDescription

void __CFDictionaryCopyCompactDescription_block_invoke(uint64_t a1, uint64_t a2, const __CFData *cf)
{
  CFTypeID v6;
  __CFString *MutableCopy;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v10;
  unsigned int v11;
  const __CFData *v12;

  if (cf && (v6 = CFGetTypeID(cf), v6 == CFDataGetTypeID()))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("0x"));
    BytePtr = CFDataGetBytePtr(cf);
    Length = CFDataGetLength(cf);
    if (Length >= 1)
    {
      v10 = Length;
      do
      {
        v11 = *BytePtr++;
        CFStringAppendFormat(MutableCopy, 0, CFSTR("%02X"), v11);
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    MutableCopy = 0;
  }
  if (MutableCopy)
    v12 = (const __CFData *)MutableCopy;
  else
    v12 = cf;
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("%@%@:%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, v12);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFSTR(", ");
  if (MutableCopy)
    CFRelease(MutableCopy);
}

@end
