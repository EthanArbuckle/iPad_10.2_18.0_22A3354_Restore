@implementation DKHistogram

double __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double result;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "countForValueDouble:", v7);
  v9 = v8;
  objc_msgSend(v6, "doubleValue");
  v11 = v10;

  v12 = v9 + v11 * *(double *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v13, v7);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v12 + *(double *)(v14 + 24);
  *(double *)(v14 + 24) = result;
  return result;
}

void __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v5, v8);
    objc_msgSend(v5, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  }

}

@end
