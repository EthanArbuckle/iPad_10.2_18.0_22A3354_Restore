@implementation CGSVGDocumentDefsEnumerate

void __CGSVGDocumentDefsEnumerate_block_invoke(uint64_t a1, const char *a2)
{
  CFStringRef v3;

  if (a2[23] < 0)
    a2 = *(const char **)a2;
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(v3);
}

@end
