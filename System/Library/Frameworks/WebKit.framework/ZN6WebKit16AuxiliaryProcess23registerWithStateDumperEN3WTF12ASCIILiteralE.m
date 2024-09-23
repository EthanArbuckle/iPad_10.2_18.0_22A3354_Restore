@implementation ZN6WebKit16AuxiliaryProcess23registerWithStateDumperEN3WTF12ASCIILiteralE

char *___ZN6WebKit16AuxiliaryProcess23registerWithStateDumperEN3WTF12ASCIILiteralE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  size_t v9;
  char *v10;
  CFTypeRef v11;
  uint64_t v13;
  CFTypeRef cf;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x19AEB9C30]();
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    v6 = 0;
  }
  else
  {
    (*(void (**)(CFTypeRef *__return_ptr, uint64_t))(*(_QWORD *)v4 + 128))(&cf, v4);
    if (objc_msgSend((id)cf, "count")
      && (v13 = 0,
          v7 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", cf, 200, 0, &v13), (v8 = v7) != 0))
    {
      v9 = objc_msgSend(v7, "length") + 200;
      v10 = (char *)malloc_type_malloc(v9, 0x26207753uLL);
      v6 = v10;
      if (v10)
      {
        bzero(v10, v9);
        *(_DWORD *)v6 = 1;
        *((_DWORD *)v6 + 1) = objc_msgSend(v8, "length");
        strlcpy(v6 + 136, *(const char **)(a1 + 40), 0x40uLL);
        memcpy(v6 + 200, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
      }
    }
    else
    {
      v6 = 0;
    }
    v11 = cf;
    cf = 0;
    if (v11)
      CFRelease(v11);
  }
  objc_autoreleasePoolPop(v5);
  return v6;
}

@end
