@implementation HKDimension

void __25___HKDimension_reduction__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "canBeReduced"))
  {
    objc_msgSend(v8, "reducedUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_dimensionReduction");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "factorizationByRaisingToExponent:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "multiplyByFactorization:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "multiplyByFactor:exponent:", v8, a3);
  }

}

@end
