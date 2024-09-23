@implementation NSData

void __40__NSData_HMFoundation__shortDescription__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("<>"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_56;
  _MergedGlobals_56 = v0;

}

uint64_t __36__NSData_HMFoundation__hmf_isZeroed__block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a4)
  {
    while (!*a2++)
    {
      if (!--a4)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    if (a5)
      *a5 = 1;
  }
  return result;
}

uint64_t __57__NSData_HMFoundation__hmf_hexadecimalStringWithOptions___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  char v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;

  for (; a4; --a4)
  {
    v5 = *a2++;
    v4 = v5;
    if (v5 < 0xA0)
    {
      v6 = 48;
    }
    else if (*(_BYTE *)(result + 40))
    {
      v6 = 87;
    }
    else
    {
      v6 = 55;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v8 = *(_BYTE **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v8 + 1;
    *v8 = v6 + (v4 >> 4);
    v9 = v4 & 0xF;
    if (v9 < 0xA)
    {
      v10 = 48;
    }
    else if (*(_BYTE *)(result + 40))
    {
      v10 = 87;
    }
    else
    {
      v10 = 55;
    }
    v11 = v10 + v9;
    v12 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v13 = *(_BYTE **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v13 + 1;
    *v13 = v11;
  }
  return result;
}

@end
