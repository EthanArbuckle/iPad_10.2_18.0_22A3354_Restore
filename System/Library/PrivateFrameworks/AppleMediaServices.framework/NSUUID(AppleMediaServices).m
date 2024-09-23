@implementation NSUUID(AppleMediaServices)

- (id)ams_base62String
{
  uint64_t v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t i;
  _BYTE v6[24];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v7);
  v1 = 0;
  v2 = v6;
  do
  {
    v3 = *((_DWORD *)v7 + v1);
    for (i = 5; i != -1; --i)
    {
      v2[i] = Base62Chars[v3 % 0x3E];
      v3 /= 0x3Eu;
    }
    ++v1;
    v2 += 6;
  }
  while (v1 != 4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, 24, 4);
}

@end
