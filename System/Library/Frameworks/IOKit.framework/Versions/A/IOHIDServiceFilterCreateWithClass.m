@implementation IOHIDServiceFilterCreateWithClass

void __IOHIDServiceFilterCreateWithClass_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 72) |= 2u;
  v3 = *(_QWORD *)(v2 + 56);
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(v2 + 56));
    v2 = *(_QWORD *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v2);
}

@end
