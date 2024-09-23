@implementation ZN2CG11DisplayList11createImageEv

double *___ZN2CG11DisplayList11createImageEv_block_invoke_6(double *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  double *v9;
  double v10;

  v8 = *(_QWORD *)(a2 + 16);
  if (v8)
  {
    v9 = result;
    if ((v8 & 0x8000000000000000) != 0)
    {
      result = (double *)CGTaggedColorGetColorSpace(*(_QWORD *)(a2 + 16), a2, a3, a4, a5, a6, a7, a8);
      if (!result)
        return result;
    }
    else
    {
      result = *(double **)(v8 + 24);
      if (!result)
        return result;
    }
    if (*(_DWORD *)(*((_QWORD *)result + 3) + 24) == 1)
    {
      result = (double *)CGColorGetComponents((CGColorRef)v8);
      v10 = result[1];
      if (*result != v10 || v10 != result[2])
        *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v9 + 4) + 8) + 24) = 1;
    }
  }
  return result;
}

@end
