@implementation HDQuantitySampleStatisticsEntity

+ (id)databaseTable
{
  return CFSTR("quantity_sample_statistics");
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_104;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("owner_id");
  +[HDDataEntity defaultForeignKey](HDQuantitySampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)setDiscreteQuantitySampleStatistics:(id)a3 persistentID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v22[0] = CFSTR("owner_id");
  v22[1] = CFSTR("min");
  v22[2] = CFSTR("max");
  v22[3] = CFSTR("most_recent");
  v22[4] = CFSTR("most_recent_date");
  v22[5] = CFSTR("most_recent_duration");
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a5;
  objc_msgSend(v12, "arrayWithObjects:count:", v22, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__HDQuantitySampleStatisticsEntity_setDiscreteQuantitySampleStatistics_persistentID_database_error___block_invoke;
  v19[3] = &unk_1E6CE89A8;
  v20 = v11;
  v21 = v10;
  v15 = v10;
  v16 = v11;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v13, v14, a6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17 != 0;
}

void __100__HDQuantitySampleStatisticsEntity_setDiscreteQuantitySampleStatistics_persistentID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  MEMORY[0x1BCCAB114](a2, CFSTR("owner_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "_hasMinimumQuantity"))
  {
    objc_msgSend(*(id *)(a1 + 40), "minimumQuantity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v15);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("min"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("min"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_hasMaximumQuantity"))
  {
    objc_msgSend(*(id *)(a1 + 40), "maximumQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v15);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("max"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("max"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_hasMostRecentQuantity"))
  {
    objc_msgSend(*(id *)(a1 + 40), "mostRecentQuantity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v15);
    MEMORY[0x1BCCAB0F0](a2, CFSTR("most_recent"));

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("most_recent"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_hasMostRecentQuantityDateInterval"))
  {
    objc_msgSend(*(id *)(a1 + 40), "mostRecentQuantityDateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    MEMORY[0x1BCCAB0F0](a2, CFSTR("most_recent_date"), v11);
    objc_msgSend(*(id *)(a1 + 40), "mostRecentQuantityDateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "duration");
    v14 = v13;

    if (v14 == 0.0)
      MEMORY[0x1BCCAB114](a2, CFSTR("most_recent_duration"), 0);
    else
      MEMORY[0x1BCCAB0F0](a2, CFSTR("most_recent_duration"), v14);
  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("most_recent_date"));
    MEMORY[0x1BCCAB120](a2, CFSTR("most_recent_duration"));
  }

}

@end
