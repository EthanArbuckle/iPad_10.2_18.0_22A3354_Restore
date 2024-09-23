@implementation HKBaseBlockCoordinateList

void __108___HKBaseBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;
  double v10;
  id v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  CGAffineTransform v21;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "startXValue");
    v8 = v7 > *(double *)(a1 + 64);
  }
  else
  {
    v8 = 0;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v6, "endXValue");
    LODWORD(v9) = v10 < *(double *)(a1 + 72);
  }
  if (((v8 | v9) & 1) == 0)
  {
    v11 = v6;
    v12 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&v21.c = v12;
    *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 112);
    v13 = v11;
    if (!CGAffineTransformIsIdentity(&v21))
    {
      v14 = *(unsigned __int8 *)(a1 + 128);
      v15 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 80);
      *(_OWORD *)&v21.c = v15;
      *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 112);
      v13 = (void *)objc_msgSend(v11, "copyWithTransform:roundToViewScale:", &v21, v14);

    }
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32);
    v18 = *(_OWORD *)(*(_QWORD *)(a1 + 48) + 16);
    v19 = v17;
    v20 = a3;
    (*(void (**)(uint64_t, void *, __int128 *, id))(v16 + 16))(v16, v13, &v18, v11);

  }
}

uint64_t __59___HKBaseBlockCoordinateList__coordinatesInChartableRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __62___HKBaseBlockCoordinateList__numCoordinatesInChartableRange___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
