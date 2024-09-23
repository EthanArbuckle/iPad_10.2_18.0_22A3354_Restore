@implementation Write420PixelBufferChannelToPGMFile

BOOL __Write420PixelBufferChannelToPGMFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != a3)
    return 1;
  v5 = a5;
  if (a5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    do
    {
      --v5;
      fputc(*(unsigned __int8 *)(a2 + v8), *(FILE **)(a1 + 56));
      v8 += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    while (v5);
  }
  return ferror(*(FILE **)(a1 + 56)) == 0;
}

@end
