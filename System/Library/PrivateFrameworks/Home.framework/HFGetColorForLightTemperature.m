@implementation HFGetColorForLightTemperature

double __HFGetColorForLightTemperature_block_invoke(_QWORD *a1)
{
  double *v1;
  double result;
  double *v3;
  double *v4;

  v1 = (double *)a1[5];
  if (v1)
  {
    result = *(double *)(*(_QWORD *)(a1[4] + 8) + 32);
    *v1 = result;
  }
  v3 = (double *)a1[6];
  if (v3)
  {
    result = *(double *)(*(_QWORD *)(a1[4] + 8) + 40);
    *v3 = result;
  }
  v4 = (double *)a1[7];
  if (v4)
  {
    result = *(double *)(*(_QWORD *)(a1[4] + 8) + 48);
    *v4 = result;
  }
  return result;
}

@end
