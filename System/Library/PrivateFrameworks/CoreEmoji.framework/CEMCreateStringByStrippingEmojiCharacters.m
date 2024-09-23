@implementation CEMCreateStringByStrippingEmojiCharacters

void __CEMCreateStringByStrippingEmojiCharacters_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v7;
  CFRange v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v8.location = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8.length = a3 - v8.location;
  v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFStringRef *)(a1 + 56), v8);
  CFStringAppend(*(CFMutableStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + a4;
  if (v7)
    CFRelease(v7);
}

@end
