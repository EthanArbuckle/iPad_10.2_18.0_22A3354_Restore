@implementation SendHandleAuthRequiredCallback

void __SendHandleAuthRequiredCallback_block_invoke(uint64_t a1, void *a2)
{
  int64_t int64;
  CFTypeRef v5;
  void (*v6)(_QWORD, CFTypeRef, int64_t, _QWORD);
  const void *v7;
  CFTypeRef cf;

  cf = 0;
  if (MEMORY[0x193FFCDCC](a2) == MEMORY[0x1E0C81310])
  {
    v5 = 0;
    int64 = 4294950568;
  }
  else
  {
    int64 = xpc_dictionary_get_int64(a2, "AuthorizationResult");
    FigXPCMessageCopyCFString(a2, "AuthorizationString", &cf);
    v5 = cf;
  }
  v6 = *(void (**)(_QWORD, CFTypeRef, int64_t, _QWORD))(a1 + 32);
  if (v6)
  {
    v6(*(_QWORD *)(a1 + 40), v5, int64, *(_QWORD *)(a1 + 48));
    v5 = cf;
  }
  if (v5)
    CFRelease(v5);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
}

@end
