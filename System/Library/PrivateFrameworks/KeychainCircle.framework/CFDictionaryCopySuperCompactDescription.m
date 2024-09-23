@implementation CFDictionaryCopySuperCompactDescription

void __CFDictionaryCopySuperCompactDescription_block_invoke(uint64_t a1, const __CFString *a2, const __CFString *cf)
{
  CFTypeID v6;
  __CFString *MutableCopy;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v10;
  unsigned int v11;
  CFTypeID v12;
  CFIndex v13;
  const __CFAllocator *v14;
  const __CFString *Copy;
  CFTypeID v16;
  const __CFString *v17;
  CFIndex v18;
  unsigned int CharacterAtIndex;
  CFRange v20;
  CFRange v21;

  if (!cf)
    goto LABEL_12;
  v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("0x"));
    BytePtr = CFDataGetBytePtr((CFDataRef)cf);
    Length = CFDataGetLength((CFDataRef)cf);
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
    v20.location = 0;
    v20.length = 5;
    CFStringDelete(MutableCopy, v20);
    goto LABEL_16;
  }
  v12 = CFGetTypeID(cf);
  if (v12 != CFStringGetTypeID())
  {
    v16 = CFGetTypeID(cf);
    if (v16 == CFNumberGetTypeID())
    {
      v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Copy = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@"), cf);
      goto LABEL_14;
    }
LABEL_12:
    MutableCopy = 0;
    goto LABEL_16;
  }
  v13 = CFStringGetLength(cf);
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v13 > 5)
  {
    v21.location = 0;
    v21.length = 6;
    Copy = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], cf, v21);
  }
  else
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], cf);
  }
LABEL_14:
  v17 = Copy;
  v18 = CFStringGetLength(Copy);
  MutableCopy = CFStringCreateMutableCopy(v14, v18, v17);
  if (v17)
    CFRelease(v17);
LABEL_16:
  CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("%c:%@ "), CharacterAtIndex, MutableCopy);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFSTR(", ");
  if (MutableCopy)
    CFRelease(MutableCopy);
}

@end
