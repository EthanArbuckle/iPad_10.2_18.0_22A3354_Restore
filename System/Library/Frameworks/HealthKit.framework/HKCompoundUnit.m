@implementation HKCompoundUnit

void __77___HKCompoundUnit__computeBaseUnitReductionAndProportionalSize_withCycleSet___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  long double __x;

  __x = 1.0;
  objc_msgSend(a2, "_baseUnitReductionAndProportionalSize:withCycleSet:", &__x, a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(long double *)(*(_QWORD *)(a1[6] + 8) + 24) = pow(__x, (double)a3)
                                                    * *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
  v6 = (void *)a1[5];
  objc_msgSend(v5, "factorizationByRaisingToExponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiplyByFactorization:", v7);

}

void __28___HKCompoundUnit_dimension__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dimension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplyByFactor:exponent:", v5, a3);

}

@end
