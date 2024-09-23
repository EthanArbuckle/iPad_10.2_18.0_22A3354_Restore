@implementation HRERankConfidenceController

+ (int64_t)version
{
  return 1;
}

- (id)rankRecommendationsFromSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERankConfidenceController rankRecommendations:](self, "rankRecommendations:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__HRERankConfidenceController_rankRecommendationsFromSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(a3, "rankingConfidenceScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "rankingConfidenceScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)rankRecommendations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_2_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HRERankConfidenceController_rankRecommendations___block_invoke_4;
  v8[3] = &unk_24F217EF8;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

  return v4;
}

id __51__HRERankConfidenceController_rankRecommendations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a2, "sourceTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    __51__HRERankConfidenceController_rankRecommendations___block_invoke_2();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id __51__HRERankConfidenceController_rankRecommendations___block_invoke_2()
{
  if (HRERankConfidenceControllerMaxPercentRankIncrement_block_invoke_na_once_token_376 != -1)
    dispatch_once(&HRERankConfidenceControllerMaxPercentRankIncrement_block_invoke_na_once_token_376, &__block_literal_global_6_2);
  return (id)HRERankConfidenceControllerMaxPercentRankIncrement_block_invoke_na_once_object_376;
}

void __51__HRERankConfidenceController_rankRecommendations___block_invoke_3()
{
  void *v0;

  v0 = (void *)HRERankConfidenceControllerMaxPercentRankIncrement_block_invoke_na_once_object_376;
  HRERankConfidenceControllerMaxPercentRankIncrement_block_invoke_na_once_object_376 = (uint64_t)CFSTR("none");

}

void __51__HRERankConfidenceController_rankRecommendations___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceTemplate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "calculateRankForRecommendations:fromTemplate:", v3, v5);
}

- (void)calculateRankForRecommendations:(id)a3 fromTemplate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[9];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "starterRank");
    v9 = v8;
  }
  else
  {
    v9 = -1.0;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v11)
  {
    v12 = v11;
    v35 = v7;
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v15, "involvedObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "changedInvolvedObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (double)(unint64_t)objc_msgSend(v18, "count");
        v20 = v19 / (double)(unint64_t)objc_msgSend(v16, "count");
        v21 = objc_msgSend(v10, "count");
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2;
        v40[3] = &unk_24F217F60;
        v40[4] = v17;
        v40[5] = v15;
        v40[6] = &__block_literal_global_10_0;
        *(double *)&v40[7] = v20;
        *(double *)&v40[8] = v9;
        v22 = v17;
        v23 = __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2((uint64_t)v40);
        objc_msgSend((id)objc_opt_class(), "_limitRankToValidRange:", v23);
        objc_msgSend(v15, "setRankingConfidenceScore:rankVersion:", objc_msgSend((id)objc_opt_class(), "version"), v24);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v12);
    v25 = (v20 / (double)v21 + -0.3) * 0.5;
    v7 = v35;
  }
  else
  {
    v25 = -0.15;
  }

  if (v7)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = v10;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          v32 = (void *)objc_opt_class();
          objc_msgSend(v31, "rankingConfidenceScore");
          objc_msgSend(v32, "_limitRankToValidRange:", v25 + v33);
          objc_msgSend(v31, "setRankingConfidenceScore:rankVersion:", objc_msgSend((id)objc_opt_class(), "version"), v34);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v28);
    }

  }
}

double __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke(double a1)
{
  return a1 + -0.3;
}

double __76__HRERankConfidenceController_calculateRankForRecommendations_fromTemplate___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = -5.0;
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && objc_msgSend(*(id *)(a1 + 40), "containsMeaningfulChanges"))
  {
    v3 = (*(double (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(a1 + 56));
    v4 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "numberOfEnabledRecommendationsForTemplate") * 0.2;
    v5 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "rankModifier");
    return v4 + v3 + v5 + v6;
  }
  return v2;
}

+ (double)_limitRankToValidRange:(double)a3
{
  return fmax(fmin(a3, 5.0), -5.0);
}

@end
