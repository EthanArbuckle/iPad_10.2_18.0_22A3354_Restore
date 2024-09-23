@implementation DPSubmissionRateLimiter

void __42___DPSubmissionRateLimiter_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  +[_DPSubmissionRateLimiter rateLimitsFromBudgetProperties](_DPSubmissionRateLimiter, "rateLimitsFromBudgetProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLimits:", v4);
  v3 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v2;

}

void __41___DPSubmissionRateLimiter_debit_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;

  objc_msgSend((id)objc_opt_class(), "budgetNameForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v22 = v2;
    objc_msgSend(*(id *)(a1 + 32), "limitDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interval"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chunks_amount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("refill_amount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("limit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("checkpoint"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v14);
      v17 = (unint64_t)v16 / v6;

      v18 = v13 + v11 * v9 * v17;
      objc_msgSend(v14, "dateByAddingTimeInterval:", (double)(v17 * v6));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(_QWORD *)(a1 + 56);
      if (v20 >= v18)
        v20 = v18;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("checkpoint"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("limit"));

    }
    v2 = v22;
  }

}

void __42___DPSubmissionRateLimiter_credit_amount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "budgetNameForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "limitDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("limit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48) + objc_msgSend(v5, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("limit"));

  }
}

@end
