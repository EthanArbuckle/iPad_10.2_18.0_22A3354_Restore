@implementation BLSAlwaysOnPeriodicTimeline

- (BLSAlwaysOnPeriodicTimeline)initWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6
{
  id v11;
  BLSAlwaysOnPeriodicTimeline *v12;
  BLSAlwaysOnPeriodicTimeline *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnPeriodicTimeline;
  v12 = -[BLSAlwaysOnTimeline initWithIdentifier:configure:](&v15, sel_initWithIdentifier_configure_, a5, a6);
  v13 = v12;
  if (v12)
  {
    v12->_periodicInterval = a3;
    objc_storeStrong((id *)&v12->_periodicStart, a4);
  }

  return v13;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSAlwaysOnPeriodicTimeline *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__BLSAlwaysOnPeriodicTimeline_description__block_invoke;
  v10 = &unk_1E621A880;
  v4 = v3;
  v11 = v4;
  v12 = self;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __42__BLSAlwaysOnPeriodicTimeline_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("id"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "bls_shortLoggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("start"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("period"), 4, *(double *)(*(_QWORD *)(a1 + 40) + 24));
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  if (self)
    return +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", a3, a4, *(double *)(self + 24));
  return self;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double periodicInterval;
  unint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  BLSAlwaysOnPeriodicTimeline *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_periodicStart;
  if (v8)
  {
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "presentationTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "laterDate:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    objc_msgSend(v6, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    periodicInterval = self->_periodicInterval;
    if (v13 <= periodicInterval)
    {
      if (objc_msgSend(v12, "compare:", v8) == -1)
      {
        v17 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v29 = v7;
      v15 = 0;
      v16 = self->_periodicInterval;
    }
    else
    {
      v29 = v7;
      v15 = (unint64_t)(v13 / periodicInterval);
      v16 = self->_periodicInterval;
    }
    v18 = +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", v16);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      -[NSDate dateByAddingTimeInterval:](v8, "dateByAddingTimeInterval:", periodicInterval * (double)v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:withRequestedFidelity:](BLSAlwaysOnTimelineUnconfiguredEntry, "entryForPresentationTime:withRequestedFidelity:", v19, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v20);

      v21 = objc_msgSend(v19, "compare:", v12);
      ++v15;

    }
    while (v21 != 1);
    bls_timelines_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[BLSAlwaysOnTimeline identifier](self, "identifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v17, "count");
      NSStringFromBLSUpdateFidelity(v18);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bls_shortLoggingString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_72);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v31 = self;
      v32 = 2114;
      v33 = v27;
      v34 = 1024;
      v35 = v26;
      v36 = 2112;
      v37 = v24;
      v38 = 2048;
      v39 = periodicInterval;
      v40 = 2114;
      v41 = v28;
      v42 = 2112;
      v43 = v25;
      _os_log_debug_impl(&dword_1B0C75000, v22, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(%@) @ %lfs for %{public}@ : %@", buf, 0x44u);

    }
    goto LABEL_14;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

id __80__BLSAlwaysOnPeriodicTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "presentationTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicStart, 0);
}

@end
