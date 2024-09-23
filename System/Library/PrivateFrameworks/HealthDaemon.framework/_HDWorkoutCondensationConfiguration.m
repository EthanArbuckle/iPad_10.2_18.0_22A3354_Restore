@implementation _HDWorkoutCondensationConfiguration

+ (_HDWorkoutCondensationConfiguration)configurationWithProfile:(int64_t)a3 minimumSeriesSize:(int64_t)a4 maximumSeriesSize:(int64_t)a5 deletedSampleThreshold:(void *)a6 analyticsAccumulator:(uint64_t)a7 error:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _HDWorkoutCondensationConfiguration *v20;
  id v21;
  id v22;
  id v23;
  _HDWorkoutCondensationConfiguration *v24;
  objc_super v28;

  v10 = a2;
  v11 = a6;
  objc_opt_self();
  HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allSourcesForBundleIdentifier:error:", *MEMORY[0x1E0CB7560], a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allSourcesForBundleIdentifier:error:", *MEMORY[0x1E0CB7588], a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unionSet:", v16);
  if (objc_msgSend(v17, "count"))
  {
    HDDataEntityPredicateForSourceEntitySet(7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "disjunctionWithPredicate:otherPredicate:", v12, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
  }
  v20 = [_HDWorkoutCondensationConfiguration alloc];
  v21 = v10;
  v22 = v12;
  v23 = v11;
  if (v20)
  {
    v28.receiver = v20;
    v28.super_class = (Class)_HDWorkoutCondensationConfiguration;
    v24 = (_HDWorkoutCondensationConfiguration *)objc_msgSendSuper2(&v28, sel_init);
    v20 = v24;
    if (v24)
    {
      objc_storeWeak((id *)&v24->_profile, v21);
      objc_storeStrong((id *)&v20->_predicate, v12);
      v20->_minimumWorkoutDuration = 300.0;
      v20->_minimumSeriesSize = a3;
      v20->_maximumSeriesSize = a4;
      v20->_deletedSampleThreshold = a5;
      objc_storeStrong((id *)&v20->_analyticsAccumulator, a6);
    }
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsAccumulator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
