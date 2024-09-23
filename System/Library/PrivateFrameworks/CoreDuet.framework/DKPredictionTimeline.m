@implementation DKPredictionTimeline

void __46___DKPredictionTimeline_predictionUnavailable__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_DKPredictionTimeline initWithValues:forDurations:startingAt:](v1, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v2);
  v4 = (void *)predictionUnavailable_prediction;
  predictionUnavailable_prediction = (uint64_t)v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncWindow setStartDate:](predictionUnavailable_prediction, v6);

}

void __39___DKPredictionTimeline_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "dk_dedup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "dk_dedup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __36___DKPredictionTimeline_description__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  v2 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", CFSTR("HH:mm:ss MM/dd"), 0, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)description_formatter, "setDateFormat:", v3);

}

@end
