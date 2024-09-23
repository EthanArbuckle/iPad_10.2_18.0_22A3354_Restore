@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigAction

+ (id)activityPublisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UniversalRecents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UserActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "atx_publisherFromStartTime:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)intentPublisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "App");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_publisherFromStartTime:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)candidatePublisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "activityPublisherFromStartTime:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMapWithTransform:", &__block_literal_global_57_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "intentPublisherFromStartTime:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flatMapWithTransform:", &__block_literal_global_63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedMergeWithOthers:comparator:", v8, &__block_literal_global_67_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXCandidateAction *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CA5920]);
  objc_msgSend(v4, "userActivityData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithUserActivityData:", v6);

  if (objc_msgSend(v7, "isEligibleForPrediction")
    && (objc_msgSend(v7, "activityType"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    v10 = objc_alloc(MEMORY[0x1E0CF8C20]);
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
    objc_msgSend(v4, "associatedBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = 0;
    v15 = (void *)objc_msgSend(v10, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v7, v13, v14, 0, 0, 0, 0, 0, v21, 0, 0);

    if (v15 && (objc_msgSend(v15, "hasActionTitle") & 1) != 0)
    {
      v16 = -[ATXCandidate initWithBiomeStoreData:]([ATXCandidateAction alloc], "initWithBiomeStoreData:", v15);
      v17 = objc_alloc(MEMORY[0x1E0CF94A8]);
      objc_msgSend(v2, "timestamp");
      v18 = (void *)objc_msgSend(v17, "initWithEventBody:timestamp:", v16);
      objc_msgSend(v3, "addObject:", v18);
      objc_msgSend(v3, "bpsPublisher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "bpsPublisher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v3, "bpsPublisher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

id __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ATXCandidateAction *v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atxAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "hasActionTitle") & 1) != 0)
  {
    +[_ATXActionUtils slotSetsForAction:](_ATXActionUtils, "slotSetsForAction:", v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "parameters");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v5, "copyWithParameterWhitelist:", v10);

          v12 = -[ATXCandidate initWithBiomeStoreData:]([ATXCandidateAction alloc], "initWithBiomeStoreData:", v11);
          v13 = objc_alloc(MEMORY[0x1E0CF94A8]);
          objc_msgSend(v2, "timestamp");
          v14 = (void *)objc_msgSend(v13, "initWithEventBody:timestamp:", v12);
          objc_msgSend(v3, "addObject:", v14);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "bpsPublisher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "bpsPublisher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

@end
