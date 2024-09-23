@implementation _ATXNotificationGroupStatelessRandomizingRanker

- (unint64_t)_generateNumSwaps:(id)a3
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[_ATXNotificationGroupStatelessRandomizingRanker _standardUniformDistribution](self, "_standardUniformDistribution");
  v6 = v5;
  if ((unint64_t)objc_msgSend(v4, "count") < 0xA || v6 >= 0.02)
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v6 < 0.08 && v8 > 5;
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

- (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

- (id)randomlySwapGroups:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v4 = a3;
  v5 = -[_ATXNotificationGroupStatelessRandomizingRanker _generateNumSwaps:](self, "_generateNumSwaps:", v4);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    {
      v9 = 0;
      v10 = 1.0;
      v11 = 1.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        v10 = v10 * 0.9;
        v11 = v11 * 0.9;
        ++v9;
      }
      while (v9 < (unint64_t)objc_msgSend(v4, "count") >> 2);
    }
    objc_msgSend(MEMORY[0x1E0CF94E0], "sampleWeightedArray:numToSample:", v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF94E0], "sampleWeightedArray:numToSample:", v8, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v4, "mutableCopy");
    v17 = objc_msgSend(v14, "count");
    v18 = objc_msgSend(v15, "count");
    if (v17 >= v18)
      v19 = v18;
    else
      v19 = v17;
    if (v19)
    {
      v20 = 0;
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntegerValue");
        v25 = v24 + ((unint64_t)objc_msgSend(v4, "count") >> 1);

        objc_msgSend(v4, "objectAtIndexedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:atIndexedSubscript:", v26, v25);

        objc_msgSend(v4, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:atIndexedSubscript:", v27, v22);

        ++v20;
        v28 = objc_msgSend(v14, "count");
        v29 = objc_msgSend(v15, "count");
        if (v28 >= v29)
          v30 = v29;
        else
          v30 = v28;
      }
      while (v30 > v20);
    }

  }
  else
  {
    v16 = v4;
  }

  return v16;
}

- (id)rankNotificationGroups:(id)a3 modeId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "rankNotificationGroups:modeId:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXNotificationGroupStatelessRandomizingRanker randomlySwapGroups:](self, "randomlySwapGroups:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)rankerId
{
  return CFSTR("_ATXNotificationGroupStatelessRandomizingRanker");
}

@end
