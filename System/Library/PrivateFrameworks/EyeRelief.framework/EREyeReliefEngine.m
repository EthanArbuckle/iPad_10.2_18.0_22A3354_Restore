@implementation EREyeReliefEngine

- (EREyeReliefEngine)init
{
  return (EREyeReliefEngine *)-[EREyeReliefEngine _initFromUserDefaults:](self, "_initFromUserDefaults:", 1);
}

- (id)_initFromUserDefaults:(BOOL)a3
{
  EREyeReliefEngine *v4;
  uint64_t v5;
  ERAttentionAwarenessClient *attentionAwarenessClient;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  float v9;
  NSUserDefaults *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EREyeReliefEngine;
  v4 = -[EREyeReliefEngine init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    attentionAwarenessClient = v4->_attentionAwarenessClient;
    v4->_attentionAwarenessClient = (ERAttentionAwarenessClient *)v5;

    if (a3)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.EyeRelief"));
      userDefaults = v4->_userDefaults;
      v4->_userDefaults = (NSUserDefaults *)v7;

      -[NSUserDefaults floatForKey:](v4->_userDefaults, "floatForKey:", CFSTR("TooCloseCount"));
    }
    else
    {
      v10 = v4->_userDefaults;
      v4->_userDefaults = 0;

      v9 = 0.0;
    }
    v4->_tooCloseCount = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initializing EyeRelief with too close count of %f"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v11, 0);

    v4->_tooCloseDistanceThreshold = -[ERAttentionAwarenessClient tooCloseDistanceThreshold](v4->_attentionAwarenessClient, "tooCloseDistanceThreshold");
  }
  return v4;
}

- (void)processInterventionOutcome:(int64_t)a3
{
  float v4;
  double v5;
  void *v6;
  float v7;
  void *v8;
  id v9;

  if (a3 == 2)
  {
    -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
    *(float *)&v5 = fmaxf(v4 + -1.0, 0.0);
    -[EREyeReliefEngine setTooCloseCount:](self, "setTooCloseCount:", v5);
    -[EREyeReliefEngine setInterventionType:](self, "setInterventionType:", 0);
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("User moved device back, reduced count to %f"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v8, 0);

    -[EREyeReliefEngine userDefaults](self, "userDefaults");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
    objc_msgSend(v9, "setFloat:forKey:", CFSTR("TooCloseCount"));

  }
}

- (void)processInactivity:(double)a3 forSamplingInterval:(double)a4
{
  float v6;
  float v7;
  void *v8;
  float v9;
  double v10;
  id v11;

  objc_msgSend((id)objc_opt_class(), "_countReductionForInactiveTime:forSamplingInterval:", a3, a4);
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sampling was inactive for %f, will reduce count by %f"), *(_QWORD *)&a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v8, 0);

  -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
  *(float *)&v10 = fmaxf(v9 - v7, 0.0);
  -[EREyeReliefEngine setTooCloseCount:](self, "setTooCloseCount:", v10);
  -[EREyeReliefEngine setInterventionType:](self, "setInterventionType:", 0);
  -[EREyeReliefEngine userDefaults](self, "userDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
  objc_msgSend(v11, "setFloat:forKey:", CFSTR("TooCloseCount"));

}

- (void)takeDistanceSampleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  objc_initWeak(&location, self);
  -[EREyeReliefEngine attentionAwarenessClient](self, "attentionAwarenessClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke;
  v17[3] = &unk_250BBBB20;
  v8 = v4;
  v19 = v8;
  objc_copyWeak(&v20, &location);
  v9 = v5;
  v18 = v9;
  objc_msgSend(v6, "setInterruptHandler:", v17);

  -[EREyeReliefEngine attentionAwarenessClient](self, "attentionAwarenessClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke_2;
  v13[3] = &unk_250BBBB48;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v14 = v12;
  objc_msgSend(v10, "pollWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v1, 0, objc_msgSend(WeakRetained, "interventionType"));

  }
}

void __54__EREyeReliefEngine_takeDistanceSampleWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_processDistanceEvent:", v10);

  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "tooCloseCount");
  objc_msgSend(v6, "setFloat:forKey:", CFSTR("TooCloseCount"));

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = objc_loadWeakRetained(v3);
    (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v10, objc_msgSend(v9, "interventionType"));

  }
}

- (BOOL)invalidateWithError:(id *)a3
{
  void *v4;

  -[EREyeReliefEngine attentionAwarenessClient](self, "attentionAwarenessClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "invalidateWithError:", a3);

  return (char)a3;
}

- (BOOL)cancelWithError:(id *)a3
{
  void *v4;

  -[EREyeReliefEngine attentionAwarenessClient](self, "attentionAwarenessClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "cancelWithError:", a3);

  return (char)a3;
}

- (void)_processDistanceEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  EREyeReliefEngine *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v20 = v4;
  if (!v4)
  {
    -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Distance sample was nil, will not process it. Count is still %f"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v12, 0);

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Processing distance sample"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v6, 0);

  -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
  v8 = v7;
  if (objc_msgSend(v20, "distanceCategory"))
  {
    if (objc_msgSend(v20, "distanceCategory") == 1)
    {
      v10 = v8 + -1.0;
LABEL_11:
      v8 = fmaxf(v10, 0.0);
      goto LABEL_12;
    }
    if (objc_msgSend(v20, "distanceCategory") == 2)
    {
      v10 = v8 - *(float *)&EREyeReliefCountReductionForUnknownDistance;
      goto LABEL_11;
    }
  }
  else if ((float)(v8 + 1.0) <= 4.0)
  {
    v8 = v8 + 1.0;
  }
  else
  {
    v8 = 4.0;
  }
LABEL_12:
  *(float *)&v9 = v8;
  -[EREyeReliefEngine setTooCloseCount:](self, "setTooCloseCount:", v9);
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Too close count: %f"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ERLogging log:withType:](ERLogging, "log:withType:", v15, 0);

  -[EREyeReliefEngine tooCloseCount](self, "tooCloseCount");
  if (v16 >= 4.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shield intervention threshold reached"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ERLogging log:withType:](ERLogging, "log:withType:", v19, 0);

    v17 = self;
    v18 = 1;
  }
  else
  {
    v17 = self;
    v18 = 0;
  }
  -[EREyeReliefEngine setInterventionType:](v17, "setInterventionType:", v18);
LABEL_16:

}

+ (float)_countReductionForInactiveTime:(double)a3 forSamplingInterval:(double)a4
{
  float result;
  float v6;

  result = 0.0;
  if (a3 >= a4)
  {
    v6 = a3 / a4;
    result = floorf(v6);
    if (result > 4.0)
      return 4.0;
  }
  return result;
}

- (int64_t)tooCloseDistanceThreshold
{
  return self->_tooCloseDistanceThreshold;
}

- (void)setTooCloseDistanceThreshold:(int64_t)a3
{
  self->_tooCloseDistanceThreshold = a3;
}

- (ERAttentionAwarenessClient)attentionAwarenessClient
{
  return (ERAttentionAwarenessClient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (float)tooCloseCount
{
  return self->_tooCloseCount;
}

- (void)setTooCloseCount:(float)a3
{
  self->_tooCloseCount = a3;
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void)setInterventionType:(int64_t)a3
{
  self->_interventionType = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
}

@end
