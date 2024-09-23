@implementation ZN2CI16ImageAccumulator3getEb

CIImage *___ZN2CI16ImageAccumulator3getEb_block_invoke(CIImage *result)
{
  CIImage *v1;
  _QWORD *priv;

  v1 = result;
  priv = result[2]._priv;
  if (*((_BYTE *)priv + 96))
  {
    *(_QWORD *)(*((_QWORD *)result[2].super.isa + 1) + 40) = priv[11];
  }
  else
  {
    result = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", *(_QWORD *)priv[10]);
    *(_QWORD *)(*((_QWORD *)v1[2].super.isa + 1) + 40) = result;
    *((_DWORD *)priv + 25) = 1;
  }
  return result;
}

@end
