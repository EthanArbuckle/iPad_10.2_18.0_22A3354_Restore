@implementation NTKMaxLineHeightDeltaForEnumeratableFaceCollection

void __NTKMaxLineHeightDeltaForEnumeratableFaceCollection_block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = NTKHeightForStringFontAndWidth(a2, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 56));
  if (v3 >= v4)
    v4 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
}

@end
