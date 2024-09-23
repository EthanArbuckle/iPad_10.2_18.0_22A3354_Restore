@implementation HKFactorization

void __30___HKFactorization_unitString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "unitString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    if (a3 < 1)
    {
      if ((a3 & 0x8000000000000000) == 0)
        goto LABEL_10;
      v8 = (void *)v5;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("·"));
        v6 = v8;
      }
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v6);
      if (a3 != -1)
        objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("^%ld"), -a3);
      v7 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v8 = (void *)v5;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("·"));
        v6 = v8;
      }
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
      if ((unint64_t)a3 >= 2)
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("^%ld"), a3);
      v7 = *(_QWORD *)(a1 + 48);
    }
    v6 = v8;
    ++*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
  }
LABEL_10:

}

uint64_t __33___HKFactorization_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_multiplyByFactor:exponent:", a2, a3);
}

void __37___HKFactorization__raiseToExponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40) * a3;
  v6 = a2;
  objc_msgSend(v3, "numberWithInteger:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

uint64_t __45___HKFactorization__multiplyByFactorization___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_multiplyByFactor:exponent:", a2, a3);
}

void __24___HKFactorization_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_msgSend(a2, "hash");
  v7 = objc_msgSend(v5, "hash");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v7 ^ v6;
}

void __36___HKFactorization_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

@end
