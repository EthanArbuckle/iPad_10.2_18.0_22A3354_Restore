@implementation StringAndWidthCache

void __60___StringAndWidthCache_attributedStringAndSize_forMaxWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double *v14;

  objc_msgSend(a2, "CGSizeValue");
  v9 = v8;
  if (v8 <= *(double *)(a1 + 48))
  {
    v10 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(double **)(a1 + 56);
    if (v14)
    {
      *v14 = v9;
      *((_QWORD *)v14 + 1) = v10;
    }
    *a4 = 1;
  }
}

void __56___StringAndWidthCache_smallestAttributedStringAndSize___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a2, "CGSizeValue");
  v7 = *(_QWORD *)(a1[5] + 8);
  if (v5 <= *(double *)(v7 + 32))
  {
    *(double *)(v7 + 32) = v5;
    *(_QWORD *)(v7 + 40) = v6;
    objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

@end
