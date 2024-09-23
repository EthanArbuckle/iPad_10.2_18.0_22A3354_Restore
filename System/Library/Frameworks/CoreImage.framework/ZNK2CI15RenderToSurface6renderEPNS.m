@implementation ZNK2CI15RenderToSurface6renderEPNS

unsigned __int16 *___ZNK2CI15RenderToSurface6renderEPNS_5ImageEPNS_7ContextE_block_invoke_2_9(unsigned __int16 *result, uint64_t a2, uint64_t a3, double a4, double a5, float a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;

  if (!a3)
    return CopyYCC444_to_Y_10packed(*((unsigned __int16 **)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a9);
  if (*((_BYTE *)result + 72))
    return (unsigned __int16 *)CopyYCC444_to_CbCr444_10packed(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a9, a4, a5, a6);
  if (*((_BYTE *)result + 73))
    return (unsigned __int16 *)CopyYCC444_to_CbCr422_10packed(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, *((int *)result + 17), a9);
  if (*((_BYTE *)result + 74))
  {
    v9 = *((_DWORD *)result + 17);
    if (v9 >= 0)
      v10 = *((_DWORD *)result + 17);
    else
      v10 = v9 + 1;
    return (unsigned __int16 *)CopyYCC444_to_CbCr_10packed(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, (uint64_t)v10 >> 1, a9);
  }
  return result;
}

_WORD *___ZNK2CI15RenderToSurface6renderEPNS_5ImageEPNS_7ContextE_block_invoke_3_11(_WORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int v7;

  if (!a3)
    return (_WORD *)CopyYCC444_to_Y_half(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a6);
  if (*((_BYTE *)result + 72))
    return (_WORD *)CopyYCC444_to_CbCr444_half(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a6);
  if (*((_BYTE *)result + 73))
    return (_WORD *)CopyYCC444_to_CbCr422_half(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, *((int *)result + 17), a6);
  if (*((_BYTE *)result + 74))
  {
    v6 = *((_DWORD *)result + 17);
    if (v6 >= 0)
      v7 = *((_DWORD *)result + 17);
    else
      v7 = v6 + 1;
    return CopyYCC444_to_CbCr_half(*((_WORD **)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, (uint64_t)v7 >> 1, a6);
  }
  return result;
}

__int16 *___ZNK2CI15RenderToSurface6renderEPNS_5ImageEPNS_7ContextE_block_invoke_4(__int16 *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int v7;

  if (!a3)
    return CopyYCC444_to_Y_16(*((__int16 **)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a6);
  if (*((_BYTE *)result + 72))
    return (__int16 *)CopyYCC444_to_CbCr444_16(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, *((int *)result + 16), *((int *)result + 17), a6);
  if (*((_BYTE *)result + 73))
    return (__int16 *)CopyYCC444_to_CbCr422_16(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, *((int *)result + 17), a6);
  if (*((_BYTE *)result + 74))
  {
    v6 = *((_DWORD *)result + 17);
    if (v6 >= 0)
      v7 = *((_DWORD *)result + 17);
    else
      v7 = v6 + 1;
    return (__int16 *)CopyYCC444_to_CbCr_16(*((_QWORD *)result + 4), *((_QWORD *)result + 5), *((_QWORD *)result + 6), *((_QWORD *)result + 7), a2, (uint64_t)(*((_DWORD *)result + 16) + (*((int *)result + 16) < 0)) >> 1, (uint64_t)v7 >> 1, a6);
  }
  return result;
}

@end
