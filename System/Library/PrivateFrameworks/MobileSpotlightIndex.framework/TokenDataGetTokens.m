@implementation TokenDataGetTokens

uint64_t __TokenDataGetTokens_block_invoke(_QWORD *a1, unsigned __int16 a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (char *)v10 - ((4 * a2 + 15) & 0x7FFF0);
  bzero(v4, 4 * a2);
  if (((a2 - 1) & 0x8000) == 0)
  {
    v5 = a1[5];
    v6 = a1[6];
    v7 = 2 * (unsigned __int16)(a2 - 1);
    v8 = v4;
    do
    {
      *v8++ = *(_DWORD *)(v5 + 4 * *(__int16 *)(v6 + v7));
      v7 -= 2;
    }
    while (v7 != -2);
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

@end
