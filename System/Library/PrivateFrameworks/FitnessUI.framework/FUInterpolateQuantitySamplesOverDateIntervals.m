@implementation FUInterpolateQuantitySamplesOverDateIntervals

void __FUInterpolateQuantitySamplesOverDateIntervals_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = _FUFractionOfSampleInInterval(*(void **)(a1 + 32), a2);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  if (v7 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 48), v7 * *(double *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_quantityByAddingQuantity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v10, a3);
  }
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 1.0)
    *a4 = 1;
}

@end
