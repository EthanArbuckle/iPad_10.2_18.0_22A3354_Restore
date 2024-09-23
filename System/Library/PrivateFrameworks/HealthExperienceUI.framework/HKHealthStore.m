@implementation HKHealthStore

uint64_t __83__HKHealthStore_HAExtensions__mostRecentQuantitySampleOfType_predicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__HKHealthStore_HAExtensions__mostRecentCategorySampleOfType_predicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HKHealthStore_HAExtensions__averageQuantityForType_unit_predicate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "averageQuantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v11);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(*(_QWORD *)(a1 + 40), 0, v11);
  }

}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke(_QWORD *a1)
{
  double v2;
  double v3;
  uint64_t v4;
  id v5;

  if (++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= 2uLL)
  {
    v2 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    if (v2 <= 0.0 || (v3 = *(double *)(*(_QWORD *)(a1[7] + 8) + 24), v3 <= 0.0))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 / (v2 * v2));
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v4;
    (*(void (**)(void))(a1[4] + 16))();

  }
}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_3;
  block[3] = &unk_1E5575658;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "quantity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_5;
  block[3] = &unk_1E5575658;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "quantity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
