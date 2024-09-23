@implementation MTSampling

- (MTSampling)init
{
  MTSampling *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTSampling;
  v2 = -[MTSampling init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MTSampling setSessions:](v2, "setSessions:", v3);

  }
  return v2;
}

- (BOOL)isSampledInWithMetricsData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("xpSamplingPercentageUsers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("xpSessionDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("xpSamplingForced"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("xpSamplingPercentage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v4;
  else
    v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v7;
  else
    v10 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v5;
  else
    v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v6;
  else
    v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v8;
  else
    v13 = 0;
  v14 = -[MTSampling isSampledInWithEventType:samplingForced:sessionSamplingPercentage:sessionDuration:samplingPercentage:](self, "isSampledInWithEventType:samplingForced:sessionSamplingPercentage:sessionDuration:samplingPercentage:", v9, v10, v11, v12, v13);

  return v14;
}

- (BOOL)isSampledInWithEventType:(id)a3 samplingForced:(id)a4 sessionSamplingPercentage:(id)a5 sessionDuration:(id)a6 samplingPercentage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  BOOL v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20 = 1;
  if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
  {
    if (!v12
      || (v14 ? (v17 = v14) : (v17 = &unk_24C7B81C0),
          (objc_msgSend(v17, "doubleValue"), v15) ? (v19 = v15) : (v19 = &unk_24C7B81C0),
          !-[MTSampling isSampledInWithEventType:sessionSamplingPercentage:sessionDurationMs:](self, "isSampledInWithEventType:sessionSamplingPercentage:sessionDurationMs:", v12, objc_msgSend(v19, "unsignedIntValue"), v18)))
    {
      if (!v16
        || (objc_msgSend(v16, "doubleValue"),
            !-[MTSampling isSampledInWithSamplingPercentage:](self, "isSampledInWithSamplingPercentage:")))
      {
        v20 = 0;
      }
    }
  }

  return v20;
}

- (BOOL)isSampledInWithEventType:(id)a3 sessionSamplingPercentage:(double)a4 sessionDurationMs:(unint64_t)a5
{
  id v8;
  MTSampling *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  double v19;
  void *v20;
  void *v21;
  MTSampling *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  -[MTSampling sessions](v9, "sessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v11);

    if (v13 != -1)
    {
      -[MTSampling sessions](v9, "sessions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v8);

      v11 = 0;
    }
  }
  objc_sync_exit(v9);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "compare:", v11);

    if (v16 == -1)
      goto LABEL_13;
  }
  if (a4 == 0.0)
  {
    v17 = 0;
    goto LABEL_14;
  }
  v18 = -[MTSampling isSampledInWithSamplingPercentage:](v9, "isSampledInWithSamplingPercentage:", a4);
  v17 = v18;
  if (a5 && v18)
  {
    v19 = (double)a5 / 1000.0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateByAddingTimeInterval:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v9;
    objc_sync_enter(v22);
    -[MTSampling sessions](v22, "sessions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[MTSampling sessions](v22, "sessions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v8);

    }
    objc_sync_exit(v22);

    objc_initWeak(&location, v22);
    v26 = (void *)MEMORY[0x24BDBCF40];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __83__MTSampling_isSampledInWithEventType_sessionSamplingPercentage_sessionDurationMs___block_invoke;
    v29[3] = &unk_24C79FED0;
    objc_copyWeak(&v31, &location);
    v30 = v8;
    v27 = (id)objc_msgSend(v26, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, v19);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

LABEL_13:
    v17 = 1;
  }
LABEL_14:

  return v17;
}

void __83__MTSampling_isSampledInWithEventType_sessionSamplingPercentage_sessionDurationMs___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clearSessionWithEventType:", *(_QWORD *)(a1 + 32));

}

- (void)clearSessionWithEventType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MTSampling sessions](self, "sessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v5);

    if (v7 != -1)
    {
      -[MTSampling sessions](self, "sessions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
  }

}

- (BOOL)isSampledInWithSamplingPercentage:(double)a3
{
  return drand48() < a3;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
