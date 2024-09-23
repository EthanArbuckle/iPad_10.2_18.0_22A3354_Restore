@implementation ZN7CBBOLTS11cappedCurveERN3AAB5CurveE

void **___ZN7CBBOLTS11cappedCurveERN3AAB5CurveE_block_invoke(void **result)
{
  void **v1;
  char *v2;

  v1 = result;
  v2 = (char *)result[5];
  if ((v2[216] & 1) != 0)
  {
    result = (void **)memcpy(result[6], v2 + 112, 0x68uLL);
    *(_BYTE *)(*((_QWORD *)v1[4] + 1) + 24) = 1;
  }
  return result;
}

@end
