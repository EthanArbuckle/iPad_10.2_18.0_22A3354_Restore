@implementation ATXUnifiedActivityTransitionCombiner

- (id)combineTransitions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "scanWithInitial:nextPartialResult:", v4, &__block_literal_global_47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scanWithInitial:nextPartialResult:", v6, &__block_literal_global_89);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterWithIsIncluded:", &__block_literal_global_91);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMapWithTransform:", &__block_literal_global_93);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __59__ATXUnifiedActivityTransitionCombiner_combineTransitions___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "newStateFromTransition:");
}

id __59__ATXUnifiedActivityTransitionCombiner_combineTransitions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D81638];
  v5 = a3;
  objc_msgSend(a2, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tupleWithFirst:second:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__ATXUnifiedActivityTransitionCombiner_combineTransitions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "second");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "first");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "second");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "hasSameTopActivityAndConfidenceAsOther:", v6) ^ 1;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id __59__ATXUnifiedActivityTransitionCombiner_combineTransitions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "first");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "second");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "first");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "second");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timestamp");
      objc_msgSend(v7, "endTransitionWithTimestamp:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v9);
    }
  }
  objc_msgSend(v2, "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v2, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v12);
  }
  objc_msgSend(v3, "bpsPublisher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
