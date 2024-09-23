@implementation MKPuckAccuracyLayer

id __45___MKPuckAccuracyLayer_setAccuracy_duration___block_invoke(id result, int a2)
{
  double v2;
  uint64_t v3;
  double v4;
  BOOL v5;
  double v6;
  char v7;
  uint64_t v8;
  _BOOL8 v9;
  objc_super v10;

  if (a2)
  {
    v2 = *((double *)result + 5);
    v3 = *((_QWORD *)result + 4);
    v4 = *(double *)(v3 + 56);
    v5 = v2 < v4;
    v6 = vabdd_f64(v2, v4);
    v7 = v5;
    if (v6 < 0.01)
      v7 = 1;
    *(_BYTE *)(v3 + 65) = v7;
    v8 = *((_QWORD *)result + 4);
    if (*(_BYTE *)(v8 + 64))
      v9 = 1;
    else
      v9 = *(unsigned __int8 *)(v8 + 65) != 0;
    v10.receiver = (id)*((_QWORD *)result + 4);
    v10.super_class = (Class)_MKPuckAccuracyLayer;
    return objc_msgSendSuper2(&v10, sel_setHidden_, v9);
  }
  return result;
}

@end
