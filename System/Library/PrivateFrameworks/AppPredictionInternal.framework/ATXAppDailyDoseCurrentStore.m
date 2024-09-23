@implementation ATXAppDailyDoseCurrentStore

void *__44___ATXAppDailyDoseCurrentStore_isExpiredAt___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *result;
  double v4;
  BOOL v5;

  v2 = (_QWORD *)a1[4];
  result = (void *)v2[5];
  if ((result || (objc_msgSend(v2, "_readCacheAndExpiration"), (result = *(void **)(a1[4] + 40)) != 0))
    && (result = (void *)objc_msgSend(result, "compare:", a1[5]), result == (void *)1))
  {
    result = (void *)objc_msgSend(*(id *)(a1[4] + 40), "timeIntervalSinceDate:", a1[5]);
    v5 = v4 > 86400.0;
  }
  else
  {
    v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  return result;
}

void __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_getCacheFromFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:", v5 + *(double *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke_2;
  v9[3] = &unk_1E82DACB0;
  v9[4] = v7;
  v10 = *(id *)(a1 + 48);
  dispatch_async(v8, v9);

}

id __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_overwrite");
  return (id)objc_opt_self();
}

uint64_t __56___ATXAppDailyDoseCurrentStore_resetWithDurationMap_on___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXTimeUtil nextStartOfDayAfter:timeZone:](ATXTimeUtil, "nextStartOfDayAfter:timeZone:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 32), "_overwrite");
}

void __47___ATXAppDailyDoseCurrentStore_currentDoseFor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_getCacheFromFile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

@end
