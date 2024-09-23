@implementation ATXHeroPredictionsTracker

- (BOOL)didPredictionsChange:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  char v14;

  v3 = a3;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "heroAppPredictionsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "hashedPredictionsForPredictions:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "count");
  if (v10 == objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "containsObject:", v12);

        if ((v13 & 1) == 0)
          break;
        ++v11;
      }
      while (objc_msgSend(v9, "count") > v11);
      v14 = v13 ^ 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)setPredictionsInDefaults:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend((id)objc_opt_class(), "hashedPredictionsForPredictions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "heroAppPredictionsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

+ (id)hashedPredictionsForPredictions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_40);
}

uint64_t __61__ATXHeroPredictionsTracker_hashedPredictionsForPredictions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a2, "hash"));
}

@end
