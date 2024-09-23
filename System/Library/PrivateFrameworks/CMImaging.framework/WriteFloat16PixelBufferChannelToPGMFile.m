@implementation WriteFloat16PixelBufferChannelToPGMFile

BOOL __WriteFloat16PixelBufferChannelToPGMFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v8;

  if (a5)
  {
    v6 = a5;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    do
    {
      --v6;
      _H0 = *(_WORD *)(a2 + 2 * v8);
      __asm { FCVT            S0, H0 }
      fputc(vcvtms_s32_f32(fmaxf(fminf(_S0 * 255.0, 255.0), 0.0)), *(FILE **)(a1 + 48));
      v8 += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    while (v6);
  }
  return ferror(*(FILE **)(a1 + 48)) == 0;
}

@end
