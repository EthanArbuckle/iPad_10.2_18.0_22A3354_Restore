@implementation HUCreateColorWheelImage

double __HUCreateColorWheelImage_block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double result;
  double v7;
  float v8;
  double v9;
  double v10;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2 / v3;
  v5 = a2 % v3;
  HUColorWheelCoordinateForPoint((double)(a2 % v3), (double)(a2 / v3));
  v8 = 4.0 / (float)*(unint64_t *)(a1 + 40);
  v9 = (float)(v8 + 1.0);
  v10 = (float)-v8;
  if (v7 <= v9 && v7 >= v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "colorForCoordinate:");
    v12 = (v5 + *(_QWORD *)(a1 + 40) * v4) * *(_QWORD *)(a1 + 88);
    *(_BYTE *)(*(_QWORD *)(a1 + 96) + v12) = (int)(v13 * 255.0);
    *(_BYTE *)(v12 + *(_QWORD *)(a1 + 96) + 1) = (int)(v14 * 255.0);
    result = v15 * 255.0;
    *(_BYTE *)(v12 + *(_QWORD *)(a1 + 96) + 2) = (int)(v15 * 255.0);
    *(_BYTE *)(v12 + *(_QWORD *)(a1 + 96) + 3) = -1;
  }
  return result;
}

@end
