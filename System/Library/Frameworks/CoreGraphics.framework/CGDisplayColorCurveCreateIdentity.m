@implementation CGDisplayColorCurveCreateIdentity

int64x2_t __CGDisplayColorCurveCreateIdentity_block_invoke()
{
  char *v0;
  int64x2_t result;

  v0 = (char *)malloc_type_calloc(1uLL, 0x90uLL, 0x10C2040536035A7uLL);
  CGDisplayColorCurveCreateIdentity_curve = (uint64_t)v0;
  if (v0)
  {
    *((_DWORD *)v0 + 1) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((_QWORD *)v0 + 1) = _D0;
    *((_DWORD *)v0 + 16) = 1065353216;
    v0[60] = 1;
    result = vdupq_n_s64(0x7F7FFFFFFF7FFFFFuLL);
    *(int64x2_t *)(v0 + 44) = result;
    *(_DWORD *)v0 = 1;
  }
  return result;
}

@end
